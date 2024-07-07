		</div><!-- /.container#content -->
	</main>
	<footer id="footer" class="container footer" style="margin-left: -30px;">
		<div class="copyright">
			<i class="fab fa-creative-commons"></i> 2014 - 2024 - <a target="_blank" href="https://twitter.com/CryptoFR">CryptoFR</a> <span class="hidden-xs">| Framework by <a target="_blank" href="https://community.nodebb.org/">NodeBB</a></span> | <a target="_blank" href="https://cryptofr.com/legal">Mentions Légales</a> 
		</div>
	</footer>
	<!-- IF !isSpider -->
	<div class="topic-search hidden">
		<div class="btn-group">
			<button type="button" class="btn btn-default count"></button>
			<button type="button" class="btn btn-default prev"><i class="fa fa-fw fa-angle-up"></i></button>
			<button type="button" class="btn btn-default next"><i class="fa fa-fw fa-angle-down"></i></button>
		</div>
	</div>

	<div component="toaster/tray" class="alert-window">
		<!-- IMPORT partials/reconnect-alert.tpl -->
	</div>
	{{{ end }}}
	<!-- IMPORT modules/taskbar.tpl -->
	<!-- IMPORT partials/footer/js.tpl -->
</body>
</html>
