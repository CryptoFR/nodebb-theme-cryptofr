<!-- IMPORT partials/breadcrumbs.tpl -->
<div data-widget-area="header">
	{{{each widgets.header}}}
	{{widgets.header.html}}
	{{{end}}}
</div>
<div class="row">
	<div class="<!-- IF widgets.sidebar.length -->col-lg-9 col-sm-12<!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length -->">
		<ul class="categories" itemscope itemtype="http://www.schema.org/ItemList">
			{{{each categories}}}
			<!-- IMPORT partials/categories/item.tpl -->
			{{{end}}}
		</ul>
	</div>
	<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 <!-- IF !widgets.sidebar.length -->hidden<!-- ENDIF !widgets.sidebar.length -->">
		{{{each widgets.sidebar}}}
		{{widgets.sidebar.html}}
		{{{end}}}
	</div>
</div>
<div data-widget-area="footer">
	{{{each widgets.footer}}}
	{{widgets.footer.html}}
	{{{end}}}
</div>

<script>
	$.get(RELATIVE_PATH + '/api/', function(data) {
	data.categories.forEach(function(category) {
	    if (category.children.length) {

	    	console.log(category.children);
	    	$("[data-cid='"+category.cid+"'] .subcategories-list").removeClass("hidden");
	    	category.children.forEach(function(subcategory) {
			    if ( subcategory['unread-class'] ) {
        			$("[data-cid='"+subcategory.cid+"'].category-children-item").addClass("unread");
        		}
			});
	    }
	});
});
</script>