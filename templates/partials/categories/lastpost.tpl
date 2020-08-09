<div class="card" style="border-color: {../bgColor}">
	{{{each ./posts}}}
	<!-- IF @first -->
	<div component="category/posts" class="last-post" data-timestamp="{../timestamp}">
		<p class="permalink-wrapper">
			<a class="permalink category-link" href="{config.relative_path}/topic/{../topic.slug}<!-- IF ../index -->/{../index}<!-- ENDIF ../index -->">
				{../topic.title}
			</a>
		</p>
		<p class="hidden-xs user-wrapper">
			<a class="timeago hidden-xs" title="{../timestampISO}" href="{config.relative_path}/topic/{../topic.slug}<!-- IF ../index -->/{../index}<!-- ENDIF ../index -->"></a>
			par
			{buildAvatar(posts.user, "sm", true)}
			<a class="user" href="user/{../user.userslug}">
				{../user.username}
			</a>
		</p>
	</div>
	<!-- ENDIF @first -->
	{{{end}}}

	<!-- IF !../posts.length -->
	<div component="category/posts">
		<div class="post-content">
			[[category:no_new_posts]]
		</div>
	</div>
	<!-- ENDIF !../posts.length -->
</div>
