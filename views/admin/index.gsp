<html>

<head>
<meta name='layout' content='adminLayout' />
<title><g:message code='spring.security.ui.register.title' /></title>
	<style type="text/css">
		.mapTooltip {
			position:fixed;
			background-color : #fff;
			moz-opacity:0.80;
			opacity: 0.80;
			filter:alpha(opacity=80);
			border-radius:4px;
			padding : 10px;
			z-index: 1000;
			max-width: 200px;
			display:none;
			color:#232323;
		}
		
		
.map {
			margin-right:228px;
			overflow:hidden;
			position:relative;
			background-color:#ccc;
			border-radius:5px;
		}
		
		.zoomIn, .zoomOut {
			background-color:#dbdbdb;
			border:1px solid #cfcfcf;
			color:#161616;
			width:16px;
			height:18px;
			line-height: 18px;
			text-align:center;
			border-radius:3px;
			cursor:pointer;
			position:absolute;
			top : 10px;
			font-weight:bold;
			left : 10px;
			
			-webkit-user-select: none; 
			-khtml-user-select: none;
			-moz-user-select: none; 
			user-select: none; 
		}
		
		.zoomOut {
			top:35px;
		}
</style>


     
	<script src="${resource(dir: 'js/admin', file: 'raphael-min.js')}" charset="utf-8" ></script>
	<script src="${resource(dir: 'js/admin', file: 'jquery.mapael.js')}" charset="utf-8" ></script>
	<script src="${resource(dir: 'js/admin', file:'world_countries.js')}" charset="utf-8" ></script>
	<script src="${resource(dir: 'js/admin', file: 'world.js')}" charset="utf-8"></script>
    <script src="${resource(dir: 'js/admin', file:'main-gsap.js')}"></script>
	<script src="${resource(dir: 'js/admin', file:'resizeable.js')}"></script>
	<script src="${resource(dir: 'js/admin', file:'neon-chat.js')}"></script>
	<script src="${resource(dir: 'js/admin', file:'neon-custom.js')}"></script>
</head>

<body>

	<div class="main-content">



		<div class="row">
			<div class="col-sm-12">
				<div class="well">
					<h1>
						<g:formatDate format="MMMM dd, yyyy" date="${today}" />
					</h1>
					<h3>
						Welcome to the platform <strong>${admin.firstName} ${admin.lastName }</strong>
						
					</h3>

				</div>
			</div>
		</div>


		<div class="row">

			<div class="col-sm-9">


				<div class="container">


					<div class="world">

						<div class="map"></div>

					</div>

				</div>



			</div>

			<div class="col-sm-3">



				<div class="tile-stats tile-red">
					<div class="icon">
						<i class="entypo-users"></i>
					</div>
					<div class="num" data-start="0" data-end="${usersNb}" data-postfix=""
						data-duration="1000" data-delay="0">0</div>

					<h3>Utilisateurs enregistrés</h3>
					<p> Sur la plateforme.</p>
				</div>


                  	<div class="tile-stats tile-green ">
					<div class="icon">
						<i class="entypo-rss"></i>
					</div>
					<div class="num" data-start="0" data-end="${productsNb }" data-postfix=""
						data-duration="1000" data-delay="1800">0</div>

					<h3>Produits ajoutés</h3>
					<p>Au plateforme.</p>
				</div>
				
				
				<div class="tile-stats tile-aqua">
					<div class="icon">
						<i class="entypo-chart-bar"></i>
					</div>
					<div class="num" data-start="0" data-end="${logInUsers }" data-postfix=""
						data-duration="1000" data-delay="3600">0</div>

					<h3>Utilisateurs connectés</h3>
					<p> Actuellement sur la plateforme.</p>
				</div>



				
			
			
			</div>
		</div>
	</div>




	





</body>

<script type="text/javascript">
	jQuery(document).ready(function($) {
		$('.pie').sparkline('html', {
			type : 'pie',
			borderWidth : 0,
			sliceColors : [ '#3d4554', '#ee4749', '#00b19d' ]
		});

		$(".chart").sparkline([ 1, 2, 3, 1 ], {
			type : 'pie',
			barColor : '#485671',
			height : '110px',
			barWidth : 10,
			barSpacing : 2
		});

		var map = $("#map");

		map.vectorMap({
			map : 'europe_merc_en',
			zoomMin : '3',
			backgroundColor : '#00a651',
			focusOn : {
				x : 0.5,
				y : 0.8,
				scale : 3
			}
		});

		// Rickshaw
		var seriesData = [ [], [] ];

		var random = new Rickshaw.Fixtures.RandomData(50);

		for (var i = 0; i < 90; i++) {
			random.addData(seriesData);
		}

		var graph = new Rickshaw.Graph({
			element : document.getElementById("rickshaw-chart-demo-2"),
			height : 217,
			renderer : 'area',
			stroke : false,
			preserve : true,
			series : [ {
				color : '#359ade',
				data : seriesData[0],
				name : 'Page Views'
			}, {
				color : '#73c8ff',
				data : seriesData[1],
				name : 'Unique Users'
			}, {
				color : '#e0f2ff',
				data : seriesData[1],
				name : 'Bounce Rate'
			} ]
		});

		graph.render();

		var hoverDetail = new Rickshaw.Graph.HoverDetail({
			graph : graph,
			xFormatter : function(x) {
				return new Date(x * 1000).toString();
			}
		});

		var legend = new Rickshaw.Graph.Legend({
			graph : graph,
			element : document.getElementById('rickshaw-legend')
		});

		var highlighter = new Rickshaw.Graph.Behavior.Series.Highlight({
			graph : graph,
			legend : legend
		});

		setInterval(function() {
			random.removeData(seriesData);
			random.addData(seriesData);
			graph.update();

		}, 500);

	});
</script>



</html>