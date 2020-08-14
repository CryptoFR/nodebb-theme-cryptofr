{{{each posts.user.selectedGroups}}}
<!-- IF posts.user.selectedGroups.slug -->
<a href="{config.relative_path}/groups/{posts.user.selectedGroups.slug}">
	<small class="label group-label inline-block" style="color:{posts.user.selectedGroups.textColor};background-color: {posts.user.selectedGroups.labelColor};"><!-- IF posts.user.selectedGroups.icon --><i class="fa {posts.user.selectedGroups.icon}"></i> <!-- ENDIF posts.user.selectedGroups.icon -->{posts.user.selectedGroups.userTitle}</small>
	<img src="{config.relative_path}/plugins/nodebb-plugin-blog-comments-cryptofr/img/badges/{posts.user.selectedGroups.slug}.svg">
</a>
<!-- ENDIF posts.user.selectedGroups.slug -->
{{{end}}}