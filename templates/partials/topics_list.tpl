<ul component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">
	<meta itemprop="itemListOrder" content="descending">
	{{{each topics}}}
	<li component="category/topic" class="row clearfix category-item {function.generateTopicClass} <!-- IF topics.pinned -->pinned-topic<!-- ENDIF topics.pinned -->" <!-- IMPORT partials/data/category.tpl -->>
		<meta itemprop="name" content="{function.stripTags, title}">

		<div class="col-md-1 col-xs-2 stats stats-votes">
			<span class="voting <!-- IF topics.pinned -->hide<!-- ENDIF topics.pinned -->" title="{topics.votes}">
				<a href="#" class="upvote <!-- IF topics.upvoted -->upvoted<!-- ENDIF topics.upvoted --> <!-- IF !topics.enableVoting -->vote-disabled<!-- ENDIF !topics.enableVoting -->" data-main-pid="{topics.mainPid}">
					<i class="fad fa-angle-up"></i>
				</a>

				<span data-votes-count>{topics.votes}</span>

				<a href="#" class="downvote <!-- IF topics.downvoted -->downvoted<!-- ENDIF topics.downvoted --> <!-- IF !topics.enableVoting -->vote-disabled<!-- ENDIF !topics.enableVoting -->"  data-main-pid="{topics.mainPid}">
					<i class="fad fa-angle-down"></i>
				</a>
			</span>
			<span class="pinned <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->" title="{topics.votes}"><i class="fad fa-thumbtack"></i></span>
		</div>

		<div class="col-md-6 col-sm-9 col-xs-6 content">
			<div class="avatar pull-left">
				<!-- IF showSelect -->
				<div class="select" component="topic/select">
					<!-- IF topics.thumb -->
					<img src="{topics.thumb}" class="user-img not-responsive" />
					<!-- ELSE -->
					{buildAvatar(topics.user, "46", true, "not-responsive")}
					<!-- ENDIF topics.thumb -->
					<i class="fad fa-check"></i>
				</div>
				<!-- ENDIF showSelect -->

				<!-- IF !showSelect -->
				<a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->" class="pull-left">
					<!-- IF topics.thumb -->
					<img src="{topics.thumb}" class="user-img not-responsive" />
					<!-- ELSE -->
					{buildAvatar(topics.user, "46", true, "not-responsive")}
					<!-- ENDIF topics.thumb -->
				</a>
				<!-- ENDIF !showSelect -->
			</div>

			<h2 component="topic/header" class="title">
				<i component="topic/pinned" class="<!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->" title="[[topic:pinned]]"></i>
				<i component="topic/locked" class="fad locked-icon fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->" title="[[topic:locked]]"></i>
				<i component="topic/moved" class="fad moved-icon fa-arrow-alt-circle-right <!-- IF !topics.oldCid -->hide<!-- ENDIF !topics.oldCid -->" title="[[topic:moved]]"></i>
				{{{each icons}}}@value{{{end}}}

				<!-- IF !topics.noAnchor -->
				<a href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" class="topic-title" itemprop="url">{topics.title}</a><br />
				<!-- ELSE -->
				<span class="topic-title">{topics.title}</span><br />
				<!-- ENDIF !topics.noAnchor -->

				<!-- IF !template.category -->
				<small>
					<a href="{config.relative_path}/category/{topics.category.slug}"><span class="fa-stack fa-lg" style="{function.generateCategoryBackground, topics.category}"><i style="color:{topics.category.color};" class="fa {topics.category.icon} fa-stack-1x"></i></span> {topics.category.name}</a> &bull;
				</small>
				<!-- ENDIF !template.category -->

				<!-- IF topics.tags.length -->
				<span class="tag-list hidden-xs">
					{{{each topics.tags}}}
					<a href="{config.relative_path}/tags/{topics.tags.valueEscaped}"><span class="tag" style="<!-- IF topics.tags.color -->color: {topics.tags.color};<!-- ENDIF topics.tags.color --><!-- IF topics.tags.bgColor -->background-color: {topics.tags.bgColor};<!-- ENDIF topics.tags.bgColor -->">{topics.tags.valueEscaped}</span></a>
					{{{end}}}
					<small>&bull;</small>
				</span>
				<!-- ENDIF topics.tags.length -->

				<small class="hidden-xs"><span class="timeago" title="{topics.timestampISO}"></span> &bull; <a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->">{topics.user.username}</a></small>
			</h2>
		</div>

		<!-- <div class="mobile-stat col-xs-2 visible-xs text-right">
			<span class="human-readable-number">{topics.postcount}</span> <a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}"><i class="fa fa-arrow-circle-right"></i></a>
		</div> -->

		<div class="col-md-1 hidden-sm hidden-xs stats stats-postcount">
			<span class="stats-viewcount">
				<i class="fad fa-eye"></i>
				<span class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</span>
			</span>
			<span class="postcount">
				<i class="fad fa-comment-alt"></i>
				<span class="human-readable-number" title="{topics.postcount}">{topics.postcount}</span>
			</span>
		</div>

		<div class="col-md-4 col-sm-3 teaser col-xs-4" component="topic/teaser">
			<div class="card" style="border-color: {topics.category.bgColor}">
				<!-- IF topics.unreplied -->
				<p>
					[[category:no_replies]]
				</p>
				<!-- ELSE -->
				<!-- IF topics.teaser.pid -->
				<div class="teaser-wrapper">
					<p class="permalink-wrapper hidden-xs">
						<a class="permalink category-link content" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
							{topics.teaser.content}
						</a>
					</p>
					<p class="user-wrapper">
						<a class="timeago" title="{topics.teaser.timestampISO}" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}"></a>
						par
						<span class="username">
							{buildAvatar(topics.teaser.user, "24", true, "not-responsive")}
							<a class="user" href="user/{topics.teaser.user.userslug}">
								{topics.teaser.user.username}
							</a>
						</span>
					</p>
				</div>
				<!-- ENDIF topics.teaser.pid -->
				<!-- ENDIF topics.unreplied -->
			</div>
		</div>
	</li>
	{{{end}}}
</ul>
