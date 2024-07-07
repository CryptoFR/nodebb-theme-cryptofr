'use strict';

var striptags = require.main.require('striptags');
var meta = require.main.require('./src/meta');
var user = require.main.require('./src/user');
var posts = require.main.require('./src/posts');
var db = require.main.require('./src/database');
var socket = require.main.require('./src/socket.io/plugins');

socket.cryptofrv2 = {};
socket.cryptofrv2.saveTheme = async function(socket, data, callback) {
	if (socket.uid === 0) {
		return;
	}
	await db.setObjectField(`user:${socket.uid}`, 'theme', data.theme);
	socket.emit('plugins.cryptofrv2.themeSaved', { theme: data.theme });
};
const meta = require.main.require('./src/meta');

const controllers = require('./lib/controllers');

const library = module.exports;

library.getUserFields = async function (data) {
	data.whitelist = [...data.whitelist, 'theme'];
	return data;
}


library.init = function(params, callback) {
	var app = params.router;
	var middleware = params.middleware;

	app.get('/admin/plugins/persona', middleware.admin.buildHeader, renderAdmin);
	app.get('/api/admin/plugins/persona', renderAdmin);

	const votePost = function (req, res) {
		var toPid = req.body.toPid,
		  isUpvote = JSON.parse(req.body.isUpvote),
		  uid = req.user ? req.user.uid : 0;
		const fn = isUpvote ? 'upvote' : 'unvote';
		posts[fn](toPid, uid, function (err, result) {
		  res.json({ error: err && err.message, result: result });
		});
	  };
	
	const downvotePost = function (req, res) {
		var toPid = req.body.toPid,
		  isDownvote = JSON.parse(req.body.isDownvote),
		  uid = req.user ? req.user.uid : 0;
		const fn = isDownvote ? 'downvote' : 'unvote';
		posts[fn](toPid, uid, function (err, result) {
		  res.json({ error: err && err.message, result: result });
		});
	  };

	console.log('registering routes');

	app.post('/cryptofrv2/vote', votePost);
	app.post('/cryptofrv2/downvote', downvotePost);

	callback();
library.init = async function (params) {
	const { router, middleware } = params;
	const routeHelpers = require.main.require('./src/routes/helpers');
	routeHelpers.setupAdminPageRoute(router, '/admin/plugins/persona', [], controllers.renderAdminPage);

	routeHelpers.setupPageRoute(router, '/user/:userslug/theme', [
		middleware.exposeUid,
		middleware.ensureLoggedIn,
		middleware.canViewUsers,
		middleware.checkAccountPermissions,
	], controllers.renderThemeSettings);
};

library.addAdminNavigation = async function (header) {
	header.plugins.push({
		route: '/plugins/persona',
		icon: 'fa-paint-brush',
		name: 'Persona Theme',
	});
	return header;
};

library.addProfileItem = async (data) => {
	data.links.push({
		id: 'theme',
		route: 'theme',
		icon: 'fa-paint-brush',
		name: '[[themes/persona:settings.title]]',
		visibility: {
			self: true,
			other: false,
			moderator: false,
			globalMod: false,
			admin: false,
		},
	});

	return data;
};

library.defineWidgetAreas = async function (areas) {
	const locations = ['header', 'sidebar', 'footer'];
	const templates = [
		'categories.tpl', 'category.tpl', 'topic.tpl', 'users.tpl',
		'unread.tpl', 'recent.tpl', 'popular.tpl', 'top.tpl', 'tags.tpl', 'tag.tpl',
		'login.tpl', 'register.tpl',
	];
	function capitalizeFirst(str) {
		return str.charAt(0).toUpperCase() + str.slice(1);
	}
	templates.forEach((template) => {
		locations.forEach((location) => {
			areas.push({
				name: `${capitalizeFirst(template.split('.')[0])} ${capitalizeFirst(location)}`,
				template: template,
				location: location,
			});
		});
	});

	areas = areas.concat([
		{
			name: 'Main post header',
			template: 'topic.tpl',
			location: 'mainpost-header',
		},
		{
			name: 'Main post footer',
			template: 'topic.tpl',
			location: 'mainpost-footer',
		},
		{
			name: 'Account Header',
			template: 'account/profile.tpl',
			location: 'header',
		},
	]);
	return areas;
};

library.getThemeConfig = function(config, callback) {
	meta.settings.get('persona', function(err, settings) {
		config.hideSubCategories = settings.hideSubCategories === 'on';
		config.hideCategoryLastPost = settings.hideCategoryLastPost === 'on';
		config.enableQuickReply = settings.enableQuickReply === 'on';
		callback(null, config);
	});
};

function renderAdmin(req, res, next) {
	res.render('admin/plugins/persona', {});
}

library.addUserToTopic = function(data, callback) {
	if (data.req.user) {
		user.getUserData(data.req.user.uid, function(err, userdata) {
			if (err) {
				return callback(err);
			}

			data.templateData.loggedInUser = userdata;
			callback(null, data);
		});
	} else {
		data.templateData.loggedInUser =  {
			uid: 0,
			username: '[[global:guest]]',
			picture: user.getDefaultAvatar(),
			'icon:text': '?',
			'icon:bgColor': '#aaa',
		};
		callback(null, data);
	}
};

library.getCategoryHook = async function(data) {
	const topics = data.topics;
	const uid = data.uid;
	const promises = topics.map(async (topic) => {
		const hasVoted = await posts.hasVoted(topic.mainPid, uid);
		return {
			...topic,
			upvoted: hasVoted.upvoted,
			downvoted: hasVoted.downvoted,
			enableVoting: uid !== 0 && data.uid !== topic.uid
		}
	});
	data.topics = await Promise.all(promises);
	return data;
}

module.exports = library;
library.getThemeConfig = async function (config) {
	const settings = await meta.settings.get('persona');
	config.hideSubCategories = settings.hideSubCategories === 'on';
	config.hideCategoryLastPost = settings.hideCategoryLastPost === 'on';
	config.enableQuickReply = settings.enableQuickReply === 'on';
	return config;
};


