<!DOCTYPE html>
<html>
	<head>

		<meta http-equiv="content-type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><cfoutput>#request.title#</cfoutput> - Saving For Tomorrow</title>
        <link rel="shortcut icon" href="images/favicon.png">

        <!-- STYLESHEETS : begin -->
		<link rel="stylesheet" type="text/css" href="../library/css/style.css">
        <link rel="stylesheet" type="text/css" href="../library/css/skin/default.css">
		<link rel="stylesheet" type="text/css" href="../library/css/custom.css">
        <link rel="stylesheet" type="text/css" href="../engine1/style.css" />
        <link rel="stylesheet" href="../library/css/jquery-ui.css">
		<!-- STYLESHEETS : end -->

        <!--[if lte IE 8]>
			<link rel="stylesheet" type="text/css" href="library/css/oldie.css">
			<script src="library/js/respond.min.js" type="text/javascript"></script>
        <![endif]-->
		<script src="../library/js/modernizr.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="engine1/jquery.js"></script>
        <script type="text/javascript">
			$(document).ready(function(){
				$('#submit').click(function(event) {
					var pw1 = $('#pWord').val();
					var pw2 = $('#confirmpWord').val();
			
			// check for a value in both fields.
			if (pw1 != pw2) {
			alert ("Please verify your password");
			return false;
			  }
			  if (pw1 == '' || pw2 == '') {
			alert('Please enter your password twice.');
			return false;
			}
			});
			});
			</script>

	</head>
	<body class="m-fixed-header">

		<!-- WRAPPER : begin -->
		<div id="wrapper">

			<!-- HEADER : begin -->
			<header id="header">
				<div class="header-inner">
					<div class="container">

						<!-- HEADER BRANDING : begin -->
						<div class="header-branding">
							<div class="branding-inner">

								<!-- BRANDING LOGO : begin -->
								<div class="brading-logo">
									<a href="index.html"><img src="images/<cfoutput>#request.companyLogo#</cfoutput>" data-hires="images/logo.2x.png" alt="Saving For Tomorrow"></a>
								</div>
								<!-- BRANDING LOGO : end -->

								<!-- BRANDING INFO : begin -->
								<div class="brading-info">
									<strong></strong><br>
									<em>Making life easier</em>
								</div>
								<!-- BRANDING INFO : end -->

							</div>
						</div>
						<!-- HEADER BRANDING : end -->

						<!-- NAVIGATION TOGGLE : begin -->
						<button class="header-navigation-toggle" type="button"><i class="fa fa-bars"></i></button>
						<!-- NAVIGATION TOGGLE : end -->

						<!-- HEADER NAVIGATION : begin -->
						<div class="header-navigation">
							<div class="navigation-inner">

								<!-- HEADER MENU : begin -->
								<nav class="header-menu">
									<ul>
										<li>
											<a href="dashboard.cfm">Home</a>
										</li>
                    <li>
											<a href="customers.cfm">Customers</a>
										</li>
										<li>
                    	<a href="newCustomer.cfm">Register</a>
                    </li>
                    <li>
											<a href="payment.cfm">Deposits</a>	
										</li>
										<li>
											<a href="withdrawals.cfm">Withdrawals</a>
										</li>
                    <li>
                    	<a href="reports.cfm">Reports</a>
                    </li>
                    <li>
                    	<a href="?logout=ok">Log Out</a>
                    </li>
									</ul>
								</nav>
								<!-- HEADER MENU : end -->

								<!-- HEADER SEARCH : begin -->
								<div class="header-search">
									<form action="#">
										<input class="search-input" type="text" placeholder="Search for...">
										<button class="search-submit" type="submit"><i class="fa fa-chevron-right"></i></button>
									</form>
									<button class="search-toggle" type="button"><i class="fa fa-search"></i></button>
								</div>
								<!-- HEADER SEARCH : end -->

							</div>
						</div>
						<!-- HEADER NAVIGATION : end -->

					</div>
				</div>
			</header>
			<!-- HEADER : end -->

			<!-- CORE : begin -->
			<div id="core">

				<!-- PAGE TITLE : begin -->
				<div id="page-title" class="m-parallax">

					<!-- PAGE TITLE TOP : begin -->
					<div class="page-title-top">
						<div class="page-title-top-inner">

							<!-- PAGE TITLE TEXT : begin -->
							<div class="page-title-text">
								<div class="container">
									<h1>Customers Portal</h1>
								</div>
							</div>
							<!-- PAGE TITLE TEXT : end -->

						</div>
					</div>
					<!-- PAGE TITLE TOP : end -->

					<!-- PAGE TITLE BOTTOM : begin -->
					<div class="page-title-bottom">
						<div class="container">
							<div class="page-title-bottom-inner">
								<div class="page-title-bottom-inner2">

									<!-- PAGE TITLE BREADCRUMBS : begin -->
									<div class="page-title-breadcrumbs">
										<ul>
											<li><a href="#">Home</a></li>
										</ul>
									</div>
									<!-- PAGE TITLE BREADCRUMBS : end -->

								</div>
							</div>
						</div>
					</div>
					<!-- PAGE TITLE BOTTOM : end -->

				</div>
				<!-- PAGE TITLE : end -->

				<div class="container">

					<!-- PAGE CONTENT : begin -->
					<div id="page-content">

						<h3>Log in </h3>

						<!-- CONTACT FORM : begin -->
						<cfform class="default-form" method="post">

							<div class="row">
								
								<div class="col-sm-8">

									<!-- SUBJECT FIELD : begin -->
									<div class="form-field">
										<label for="username">User Id <span>*</span></label>
										<cfinput id="username" name="username" class="m-required" autocomplete="off" tabindex="1" placeholder="cAse sEnSitive" autofocus>
									</div>
									<!-- SUBJECT FIELD : end -->

									<!-- MESSAGE FIELD : begin -->
									<div class="form-field">
										<label for="passWord">Password <span>*</span></label>
										<cfinput id="passWord" name="passWord" class="m-required" type="password" autocomplete="off" tabindex="2" placeholder="cAse sEnSitive" >
									</div>
									<!-- MESSAGE FIELD : end -->

									<!-- SUBMIT BUTTON : begin -->
									<div class="form-field">
										<button class="submit-btn c-button" name="login" id="login" type="submit">Login</button>

									</div>
									<!-- SUBMIT BUTTON : end -->

								</div>
							</div>

						</cfform>
						<!-- CONTACT FORM : end -->

					</div>
					<!-- PAGE CONTENT : end -->

				</div>

			</div>
			<!-- CORE : end -->

			<!-- FOOTER : begin -->
			<div id="footer" class="m-parallax">

				<!-- FOOTER TOP : begin -->

				<!-- FOOTER TOP : end -->

				<!-- FOOTER INNER : begin -->
				<div class="footer-inner">
					<div class="container">

						<!-- BOTTOM PANEL : begin -->
						<div id="bottom-panel">
							<div class="row">
								<div class="col-md-4">

									<!-- TEXT WIDGET : begin -->
									<div class="widget text-widget">
										<div class="widget-inner">
											<h3 class="widget-title">About <strong>SFT Savings</strong></h3>
											<div class="widget-content">

												<p><strong>SFT Savings</strong>
												 is a registered Company in Nigeria, dedicated to providing financial services  to Nigerians. The company was established since 2015 and has been in operation since then. </p>

											</div>
										</div>
									</div>
									<!-- TEXT WIDGET : end -->

									<hr class="c-divider hidden-lg hidden-md">

								</div>
								<div class="col-md-4">

									<!-- TEXT WIDGET (CONTACT) : begin -->
									<div class="widget text-widget">
										<div class="widget-inner">
											<h3 class="widget-title">Quick <strong>Contact</strong></h3>
											<div class="widget-content">

												
												<p><strong>SFT Savings</strong><br>
												Lagos.</p>

											</div>
										</div>
									</div>
									<!-- TEXT WIDGET (CONTACT) : end -->

									<hr class="c-divider hidden-lg hidden-md">

								</div>
								<div class="col-md-4">

									<!-- SUBSCRIBE WIDGET : begin -->
									<div class="widget subscribe-widget">
										<div class="widget-inner">
											<h3 class="widget-title">Join Our <strong>Newsletter</strong></h3>
											<div class="widget-content">

												<p>Be the first to know when new services are available @ <strong>SFT Savings</strong></p>

												<form class="subscribe-widget-form" action="http://volovar.us8.list-manage.com/subscribe/post-json?u=76a50c9454ec8ab78914d1bf2&amp;id=49e892f53d&amp;c=?" method="get">

													<!-- VALIDATION ERROR MESSAGE : begin -->
													<p style="display: none;" class="c-alert-message m-warning m-validation-error"><i class="ico fa fa-exclamation-circle"></i>Email address is required.</p>
													<!-- VALIDATION ERROR MESSAGE : end -->

													<!-- SENDING REQUEST ERROR MESSAGE : begin -->
													<p style="display: none;" class="c-alert-message m-warning m-request-error"><i class="ico fa fa-exclamation-circle"></i>There was a connection problem. Try again later.</p>
													<!-- SENDING REQUEST ERROR MESSAGE : end -->

													<!-- SUCCESS MESSAGE : begin -->
													<p style="display: none;" class="c-alert-message m-success"><i class="ico fa fa-check-circle"></i><strong>Sent successfully.</strong></p>
													<!-- SUCCESS MESSAGE : end -->

													<div class="input-box">
														<input class="email-input m-required m-email" name="EMAIL" type="text" placeholder="Your email address here" title="Your email address here">
														<button class="submit-btn" type="submit" title="Subscribe"><i class="fa fa-chevron-right"></i></button>
													</div>

												</form>

											</div>
										</div>
									</div>
									<!-- SUBSCRIBE WIDGET : end -->

								</div>
							</div>
						</div>
						<!-- BOTTOM PANEL : end -->

						<div class="row">
							<div class="col-md-6 col-md-push-6">

								<!-- FOOTER MENU : begin -->
								<nav class="footer-menu">
									<ul>
										<li>Developed by <a href="http://www.nathconcept.com">Nathconcept</a></li>
										
									</ul>
								</nav>
								<!-- FOOTER MENU : end -->

							</div>
							<div class="col-md-6 col-md-pull-6">

								<!-- FOOTER TEXT : begin -->
								<div class="footer-text">
									<p><cfoutput>#request.footer#</cfoutput> | <a href="#">Terms &amp; Condtions</a> | <a href="#">Customer Complain &amp; Resolution Process</a></p>
								</div>
								<!-- FOOTER TEXT : end -->

							</div>
						</div>

					</div>
				</div>
				<!-- FOOTER INNER : end -->

			</div>
			<!-- FOOTER : end -->

		</div>
		<!-- WRAPPER : END -->

		<!-- SCRIPTS : begin -->
		<script src="../library/js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="../library/js/third-party.js" type="text/javascript"></script>
		<script src="../library/js/library.js" type="text/javascript"></script>
        <script src="../library/js/jquery-ui.js"></script>
        <script src="checkSponsor.js"></script>
		<!-- SCRIPTS : end -->

	</body>
</html>