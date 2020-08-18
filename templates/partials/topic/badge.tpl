{{{each posts.user.selectedGroups}}}
<!-- IF posts.user.selectedGroups.slug -->
<a href="{config.relative_path}/groups/{posts.user.selectedGroups.slug}" class="group-label-wrapper {posts.user.selectedGroups.slug}">
	<small class="label group-label inline-block" style="color:{posts.user.selectedGroups.textColor};background-color: {posts.user.selectedGroups.labelColor};"><!-- IF posts.user.selectedGroups.icon --><i class="fa {posts.user.selectedGroups.icon}"></i> <!-- ENDIF posts.user.selectedGroups.icon -->{posts.user.selectedGroups.userTitle}</small>
	<span class="small-icon hidden">
		<img class="badge-icon" src="{config.relative_path}/assets/images/badges/{posts.user.selectedGroups.slug}.svg">
	</span>
</a>
<!-- ENDIF posts.user.selectedGroups.slug -->
{{{end}}}