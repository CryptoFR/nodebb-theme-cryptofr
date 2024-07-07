<!-- IMPORT partials/breadcrumbs.tpl -->
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>
<div class="row">
	<div class="{{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">
		{{{ if pagination.pages.length }}}
		<div><!-- IMPORT partials/category/selector-dropdown-left.tpl --></div>
		{{{ else }}}
		<h1 class="categories-title">[[pages:categories]]</h1>
		{{{ end }}}
		<ul class="categories" itemscope itemtype="http://www.schema.org/ItemList">
			{{{ each categories }}}
			<!-- IMPORT partials/categories/item.tpl -->
			{{{ end }}}
		</ul>
		<!-- IMPORT partials/paginator.tpl -->
	</div>
	<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
		{{{ each widgets.sidebar }}}
		{{widgets.sidebar.html}}
		{{{ end }}}
	</div>
</div>
<div data-widget-area="footer">
	{{{ each widgets.footer }}}
	{{widgets.footer.html}}
	{{{ end }}}
</div>

<script>
	$.get(RELATIVE_PATH + '/api/', function(data) {
	data.categories.forEach(function(category) {
	    if (category.children.length) {
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