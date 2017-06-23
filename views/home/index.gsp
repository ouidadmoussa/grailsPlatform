<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<link rel="stylesheet" type="text/css" 
	href="${resource(dir: 'css', file: 'scrollAnimation.css')}" >

	
</head>
<body>

<!-- -----------------------------------slider ------------------------------------------		 -->
	<div id="slides" class="carousel slide" data-ride="carousel" >


		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">


			<div class="item active  js-video widescreen" 
				data-cycle-youtube-autostart=true>

              <div id="video"></div>
            
	         <div id="playYoutube"></div>	
			</div>
        </div>
	</div>
	<%--    --------------------------------------how to do row-----------------------------------%>
<div class=" howToDo" >How To Join     </div>
<div class="container-fluid " style="background-color: #f8f8f8; border-bottom: 3px solid #ebebeb;">
	
		
			<div class="container-fluid step " >
			   
				<div class=" col-md-4 col-md-offset-2 col-sm-6 col-xs-12 " >
					<div class="item_wrap1 animation-element bounce-up" >
						<g:img dir="images" file="imgStep1.png" class=" subject img-responsive" />
					</div>
					
				</div>
				<div class=" col-md-4 col-sm-6 col-xs-12  stepDesc">
					<h2>
						<span
							style=" font-size: 1.25em; line-height: 1.6em;">1
						</span>.create your account
					</h2>
					<p>Le Lorem Ipsum est simplement du faux texte employé dans la
						composition et la mise en page avant impression.</p>
					<g:link name="create" value="create" 
					class="btn createButton pull-right"  role="button"
					controller="register" action="index">Create</g:link>

				</div>
				
		</div>
         <hr>
         	<div class="container-fluid step ">
			   <div class=" col-md-4 col-md-offset-2 col-sm-6 col-xs-12  stepDesc">
					<h2>
						<span
							style=" font-size: 1.25em; line-height: 1.6em;">2
						</span>.create your account
					</h2>
					<p>Le Lorem Ipsum est simplement du faux texte employé dans la
						composition et la mise en page avant impression.</p>
<%--					<g:submitButton name="create" value="create" class="createButton" />--%>

				</div>
				<div class=" col-md-4 col-sm-6 col-xs-12 ">
					<div class="item_wrap1 animation-element bounce-up" >
						<g:img dir="images" file="step2.jpg " class=" subject stepImage  img-responsive"  />
					</div>
					
				</div>
				
				
		</div>
         <hr>
         	<div class="container-fluid step ">
			   
				<div class=" col-md-4 col-md-offset-2 col-sm-6 col-xs-12 ">
					<div class="item_wrap1 animation-element  animation-element bounce-up" >
						<g:img dir="images" file="step3.jpg " class="subject stepImage  img-responsive"  />
					</div>
					
				</div>
				<div class=" col-md-4 col-sm-6 col-xs-12 stepDesc">
						<h2>
						<span
							style=" font-size: 1.25em; line-height: 1.6em;">2
						</span>.create your account
					</h2>
					<p>Le Lorem Ipsum est simplement du faux texte employé dans la
						composition et la mise en page avant impression.</p>

				</div>
				
		</div>
         </div>
         
         
         
<%--         -----------------------upcoming event------------------------------%>

            <div class="container-fluid">
               <div class="row">
               <g:if test="${upcomingEvent}">
                <div class=" col-md-3  col-md-offset-1  col-sm-4   col-sm-offset-1   ">
              
                <div class="animation-element slide-left">
            <g:img dir="uploadedMedia/events" file="${upcomingEvent.picture}" 
            class="upComingEventPoster img-circle"/>
            
             </div>
           
                </div>
                 <div class=" col-md-8 col-sm-7 upComingEventDesc">
                 <h3>Welcome to the upcoming event</h3>
                 <p>${upcomingEvent.description}</p>
                 <g:link name="view" value="view" id="${upcomingEvent.id}"
					class="btn viewButton"  role="button" 
					controller="event" action="eventView">View</g:link>
                 </div>
                   </g:if>
               </div>
            
            
            </div>
         
         
         
<%--         -------------------------------about-------------------------%>
         <div class=" container-fluid backImage">
         <div class="row " >
			 
            

				
					<div class=" container-fluid">
			<div class=" col-md-12   col-lg-12 col-sm-12 col-xs-12 slognContainer" >
                   <div class=" footer-description " style="text-align: center;">
					<p>
						Le Lorem Ipsum est simplement du faux texte employé dans la
						composition et la mise en page avant impression.Le Lorem
						Ipsum est le faux texte standard
					</p>
				</div>
			
				<div class=" container-fluid">
					<div class="col-md-2 col-md-offset-3 col-lg-2 col-sm-3 col-sm-offset-2 col-xs-4  p2">
						<h1 id="affiliatesAmount" class="h00  m0">${usersAmount}</h1>
						<p class=" bold  m0">Affiliates</p>
					</div>
				<div class="col-md-2  col-lg-2 col-sm-3 col-xs-4  p2">
						<h1 id="productsAmount" class="h00  m0">${productsAmount }</h1>
						<p class=" bold  m0">Products</p>
					</div>
					<div class="col-md-2  col-lg-2 col-sm-3 col-xs-4  p2">
						<h1 id="shopsAmount" class="h00 1 m0">${shopsAmount} </h1>
						<p class=" bold  m0">Shops</p>
					</div>

				</div>
			</div>
		</div>
					
				</div>
			</div>
    
		
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.videoBG.js')}"></script>
<script src="${resource(dir: 'js', file: 'script.js')}"></script>

	<script>
	$(document).ready(function() {
	$("#playYoutube").click(function() {
		$(this).hide();
		$("video").prop("muted",false)
	});

	$("#video").click(function() {
		$("#playYoutube").show();
		$("video").prop("muted",true)
	});
	});
		$(function() {
			
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
		var $animation_elements = $('.animation-element');
		var $window = $(window);

		function check_if_in_view() {
		  var window_height = $window.height();
		  var window_top_position = $window.scrollTop();
		  var window_bottom_position = (window_top_position + window_height);

		  $.each($animation_elements, function() {
		    var $element = $(this);
		    var element_height = $element.outerHeight();
		    var element_top_position = $element.offset().top;
		    var element_bottom_position = (element_top_position + element_height);

		    //check to see if this current container is within viewport
		    if ((element_bottom_position >= window_top_position) &&
		      (element_top_position <= window_bottom_position)) {
		      $element.addClass('in-view');
		    } else {
		      $element.removeClass('in-view');
		    }
		  });
		}

		$window.on('scroll resize', check_if_in_view);
		$window.trigger('scroll');
	</script>
</body>
</html>
