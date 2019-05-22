<?php echo $footer_new; ?>
<script type="text/javascript"><!--
$(function(){$(".display").css("display","none");btnhtml='<div class="list" onclick="display(\'list\');"></div><div class="grid" onclick="display(\'grid\');"></div>';$(".display").replaceWith(btnhtml);$("div .list").bind("click",btndisplay);$("div .grid").bind("click",btndisplay);btndisplay()}); function btndisplay(){"list"==$.totalStorage("display")?($("div .list").addClass("list-active"),$("div .grid").removeClass("grid-active")):($("div .grid").addClass("grid-active"),$("div .list").removeClass("list-active"))};
//--></script>
<div id="footer">
	<!--noindex-->
	<div id="powered">
		© ООО "АБИР-Плюс" 2015. Все права защищены.
	</div>
	<div id="trademark">
		Цены, указанные на сайте, не являются публичной офертой!<br />
		Все названия продуктов являются зарегистрированными торговыми марками соответствующих фирм.
	</div>
	<a rel="nofollow" href="http://robokassa.ru/ru/" onclick="return !window.open(this.href)"><img id="robokassa" src="catalog/view/theme/default/image/main/robokassa.png" alt="robokassa" /></a>
	<div id="footerCountBox">
		<div id="footerCountIns">
			<div id="counters">
				<!--LiveInternet logo-->
				<a rel="nofollow" href="//www.liveinternet.ru/click" onclick="return !window.open(this.href)">
					<img src="//counter.yadro.ru/logo?18.2" alt="LiveInternet" title="LiveInternet: показано число просмотров за 24 часа, посетителей за 24 часа и за сегодня" id="live" />
				</a>
				<!--/LiveInternet-->
				<!-- Yandex.Metrika informer -->
				<a rel="nofollow" href="https://metrika.yandex.ru/stat/?id=29009075&amp;from=informer" onclick="return !window.open(this.href)">
					<img src="//bs.yandex.ru/informer/29009075/3_0_666666FF_666666FF_1_pageviews" alt="Яндекс.Метрика" title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" style="width:88px;height:31px;border:0" onclick="try{Ya.Metrika.informer({i:this,id:29009075,lang:'ru'});return false}catch(e){}" />
				</a>
				<!-- /Yandex.Metrika informer -->
			</div>
		</div>
	</div>
	<!--/noindex-->
</div>
</div>
</body>
</html>