<li component="categories/category" data-cid="{../cid}" data-numRecentReplies="1" class="row clearfix">
	<meta itemprop="name" content="{../name}">

	<div class="content col-xs-8 <!-- IF config.hideCategoryLastPost -->col-md-10 col-sm-12<!-- ELSE -->col-md-6 col-sm-9<!-- ENDIF config.hideCategoryLastPost -->">
		<div class="icon hidden-xs pull-left" style="{function.generateCategoryBackground}">
			<i class="fad fab {../icon}"></i>
		</div>

		<h2 class="title">
			<i class="visible-xs-inline-block d-sm-none fad {../icon}"></i> <!-- IMPORT partials/categories/link.tpl -->
		</h2>
		<div>
			<!-- IF ../descriptionParsed -->
			<div class="description">
				{../descriptionParsed}
			</div>
			<!-- ENDIF ../descriptionParsed -->
			<!-- IF !config.hideSubCategories -->
			{function.generateChildrenCategories}
			<!-- ENDIF !config.hideSubCategories -->
		</div>
	</div>

	<!-- IF !../link -->
	<div class="col-md-1 hidden-sm hidden-xs stats">
		<span class="{../unread-class} human-readable-number" title="{../totalTopicCount}">{../totalTopicCount}</span><br />
		<small>[[global:topics]]</small>
	</div>
	<div class="col-md-1 hidden-sm hidden-xs stats">
		<span class="{../unread-class} human-readable-number" title="{../totalPostCount}">{../totalPostCount}</span><br />
		<small>[[global:posts]]</small>
	</div>
	<!-- IF !config.hideCategoryLastPost -->
	<div class="col-md-4 col-sm-3 col-xs-4 teaser {../unread-class}" component="topic/teaser">
		<!-- IMPORT partials/categories/lastpost.tpl -->
		<span class="visible-xs pull-right">
			<!-- IF ../teaser.timestampISO -->
			<!-- <a class="permalink" href="{../teaser.url}">
				<small class="timeago" title="{../teaser.timestampISO}"></small>
			</a> -->
			<!-- ENDIF ../teaser.timestampISO -->
		</span>
	</div>
	<!-- ENDIF !config.hideCategoryLastPost -->
	<!-- ENDIF !../link -->
</li>
