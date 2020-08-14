		</div><!-- /.container#content -->
	</main>
	<footer id="footer" class="container footer" style="margin-left: -30px;">
		<div class="copyright">
			Creative Commons (CC) 2014 - 2020 - <a target="_blank" href="https://twitter.com/CryptoFR">CryptoFR</a> | Framework by <a target="_blank" href="https://community.nodebb.org/">NodeBB</a> | <a target="_blank" href="https://cryptofr.com/legal">Mentions Légales</a> 
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
		<div id="reconnect-alert" class="alert alert-dismissable alert-warning clearfix hide" component="toaster/toast">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<p>[[global:reconnecting-message, {config.siteTitle}]]</p>
		</div>
	</div>
	<!-- ENDIF !isSpider -->


	<script defer src="{relative_path}/assets/nodebb.min.js?{config.cache-buster}"></script>

	{{{each scripts}}}
	<script defer type="text/javascript" src="{scripts.src}"></script>
	{{{end}}}

	<script>
		window.addEventListener('DOMContentLoaded', function () {
			require(['forum/footer']);

			<!-- IF useCustomJS -->
			{{customJS}}
			<!-- ENDIF useCustomJS -->
		});
	</script>

	<div class="hide">
	<!-- IMPORT 500-embed.tpl -->
	</div>
</body>
</html>
