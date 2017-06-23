<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
</head>
<body>

<!-- -----------------------------------slider ------------------------------------------		 -->
	<div id="slides" class="carousel slide" data-ride="carousel" >

		<ol class="carousel-indicators">
			<li data-target="#slides" data-slide-to="0" class="active"></li>
			<li data-target="#slides" data-slide-to="1"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">


			<div class="item active  js-video widescreen"
				data-cycle-youtube-autostart=true>
			<iframe id="video" 
					src="https://www.youtube.com/embed/h2_6bfVc9lo?autoplay=1&controls=0&disablekb=1&enablejsapi=1&rel=0&showinfo=0&color=white&theme=light&loop=1"
					frameborder="0" allowfullscreen>		
					</iframe>
						<div id="playYoutube"></div>	

			</div>
			
			<div class="item ">
			
			  <g:img dir="images" file="slide2.jpg" class="img-responsive" />
				<div class="itemTitle animated fadeInLeft">Lorem Ipsum</div>
				<div class="itemText animated1 swing">Le Lorem Ipsum est du faux</div>
				<button type="button" class=" itemButton">Join Us</button>
				
			</div>
		</div>

		<!-- Controls -->

		<a class="left carousel-control carouselCustom" href="#slides"
			role="button" data-slide="prev" id="play-button"> <span
			class="glyphicon glyphicon-chevron-left carouselControleBackground"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>

		</a> <a class="right carousel-control carouselCustom" href="#slides"
			role="button" data-slide="next" id="pause-button"> <span
			class="glyphicon glyphicon-chevron-right carouselControleBackground"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
		<div id="carouselButtons">
			<button id="playButton" type="button" class="btn btn-default btn-xs">
				<span class="glyphicon glyphicon-play"></span>
			</button>
			<button id="pauseButton" type="button" class="btn btn-default btn-xs">
				<span class="glyphicon glyphicon-pause"></span>
			</button>
		</div>
		
	</div>
	<%--    --------------------------------------how to do row-----------------------------------%>
<div class="container-fluid " >
	<div class=" howToDo" ><h1>how to join us ?  </h1> </div>
		
			<div class="container-fluid step ">
			   
				<div class=" col-md-4 col-md-offset-2">
					<div class="item_wrap1" >
						<g:img dir="images" file="step1.jpg" class="stepImage  img-responsive" />
					</div>
					
				</div>
				<div class=" col-md-4 stepDesc">
					<h2>
						<span
							style=" font-size: 1.25em; line-height: 1.6em;">1
						</span>.create your account
					</h2>
					<p>Le Lorem Ipsum est simplement du faux texte employé dans la
						composition et la mise en page avant impression.</p>
					<g:submitButton name="create" value="create" class="createButton" />

				</div>
				
		</div>
         <hr>
         	<div class="container-fluid step ">
			   
				<div class=" col-md-4 col-md-offset-2">
					<div class="item_wrap1" >
						<g:img dir="images" file="step2.jpg " class="stepImage  img-responsive"  />
					</div>
					
				</div>
				<div class=" col-md-4 stepDesc">
					<h3>
						<span
							style=" font-size: 1.25em; line-height: 1.6em;">2
						</span>.create your account
					</h3>
					<p>Le Lorem Ipsum est simplement du faux texte employé dans la
						composition et la mise en page avant impression.</p>
<%--					<g:submitButton name="create" value="create" class="createButton" />--%>

				</div>
				
		</div>
         <hr>
         	<div class="container-fluid step ">
			   
				<div class=" col-md-4 col-md-offset-2">
					<div class="item_wrap1" >
						<g:img dir="images" file="step3.jpg " class="stepImage  img-responsive"  />
					</div>
					
				</div>
				<div class=" col-md-4 stepDesc">
					<h3>
						<span
							style=" font-size: 1.25em; line-height: 1.6em;">3
						</span>.create your account
					</h3>
					<p>Le Lorem Ipsum est simplement du faux texte employé dans la
						composition et la mise en page avant impression.</p>
<%--					<g:submitButton name="create" value="create" class="createButton" />--%>

				</div>
				
		</div>
         
       
</div>
	<%--    -------------------------------About WMEB row -------------------------------------- --%>
		<g:img dir="images" file="border.jpg" style="margin-top:20px; width:100%;" />
		<div class=" container-fluid"  style="background-color: #ebebeb;">
			<div class=" col-md-6   col-lg-6 col-sm-6 col-xs-12">

				<span class="col-md-12   col-lg-12 col-sm-12 col-xs-12 WmebInNumberstitle">WMEB in Numbers</span>
				<div class=" container-fluid">
					<div class="col-md-4  col-lg-4 col-sm-4 col-xs-6  p2">
						<h1 id="affiliatesAmount" class="h00  m0">${usersAmount}</h1>
						<p class=" bold  m0">Affiliates</p>
					</div>
				<div class="col-md-4  col-lg-4 col-sm-4 col-xs-6  p2">
						<h1 id="productsAmount" class="h00  m0">${productsAmount }</h1>
						<p class=" bold  m0">Products</p>
					</div>
					<div class="col-md-4  col-lg-4 col-sm-4 col-xs-6  p2">
						<h1 id="shopsAmount" class="h00 1 m0">${shopsAmount} </h1>
						<p class=" bold  m0">Shops</p>
					</div>

				</div>
			</div>
			<div class="col-md-6  col-lg-4 col-sm-6 col-xs-12">
				<span class="WmebInNumberstitle">WMEB slogan</span><br />
				<div class="footer-description ">
					<p>
						Le Lorem Ipsum est simplement du faux texte employé dans la
						composition <br /> et la mise en page avant impression.Le Lorem
						Ipsum est le faux texte standard <br />
					</p>
				</div>

			</div>
		</div>

	<script>
		$(function() {
			$('#slides').carousel({
				interval : 8000,
				pause : "false"

			});

			$("#playYoutube").click(function() {
				player.unMute();
				$(this).hide();

			});

			$('#slides').on('slid.bs.carousel', function() {
				player.pauseVideo();
			})

			$('#playButton').click(function() {
				$('#slides').carousel('cycle');
			});
			$('#pauseButton').click(function() {
				$('#slides').carousel('pause');
			});

			var currentNumber1 = $('#affiliatesAmount').text();
			var currentNumber2 = $('#productsAmount').text();
			var currentNumber3 = $('#shopsAmount').text();
			$({
				someValue : 1
			}).animate(
					{
						someValue : currentNumber1
					},
					{
						duration : 3000,
						easing : 'swing', // can be anything
						step : function() { // called on every step
							// Update the element's text with rounded-up value:
							$('#affiliatesAmount').text(
									commaSeparateNumber(Math
											.round(this.someValue)));
						}
					});

			$({
				someValue : 1
			}).animate(
					{
						someValue : currentNumber2
					},
					{
						duration : 3000,
						easing : 'swing', // can be anything
						step : function() { // called on every step
							// Update the element's text with rounded-up value:
							$('#productsAmount').text(
									commaSeparateNumber(Math
											.round(this.someValue)));
						}
					});
			$({
				someValue : 1
			}).animate(
					{
						someValue : currentNumber3
					},
					{
						duration : 3000,
						easing : 'swing', // can be anything
						step : function() { // called on every step
							// Update the element's text with rounded-up value:
							$('#shopsAmount').text(
									commaSeparateNumber(Math
											.round(this.someValue)));
						}
					});
			function commaSeparateNumber(val) {
				while (/(\d+)(\d{3})/.test(val.toString())) {
					val = val.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g,
							"$1,");
				}
				return val;
			}
		});
	</script>
</body>
</html>
