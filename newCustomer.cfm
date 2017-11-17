<!DOCTYPE html>
<html>
	<head>

		<meta http-equiv="content-type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><cfoutput>#request.title#</cfoutput> - Saving For Tomorrow</title>
        <link rel="shortcut icon" href="images/favicon.png">

        <!-- STYLESHEETS : begin -->
		<link rel="stylesheet" type="text/css" href="library/css/style.css">
        <link rel="stylesheet" type="text/css" href="library/css/skin/default.css">
		<link rel="stylesheet" type="text/css" href="library/css/custom.css">
        <link rel="stylesheet" type="text/css" href="engine1/style.css" />
        <link rel="stylesheet" href="library/css/jquery-ui.css">
		<!-- STYLESHEETS : end -->

        <!--[if lte IE 8]>
			<link rel="stylesheet" type="text/css" href="library/css/oldie.css">
			<script src="library/js/respond.min.js" type="text/javascript"></script>
        <![endif]-->
		<script src="../library/js/modernizr.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="engine1/jquery.js"></script>
        
		<script src="googleJquery-min.js"></script>
		<link href="googleJquery-ui.css" rel="stylesheet" type="text/css">
		<script src="googleJquery-ui.min.js"></script>
		<script>
			$( function() {
			$( "#openDate" ).datepicker({dateFormat: "dd/mm/yy"});
				} );
		</script>

	</head>
	<body class="m-fixed-header">
    <cfinclude template="Validator.cfm">

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
                                        	<a href="?logout=ok">Log Out</a>
                                        </li>
									</ul>
								</nav>
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
									<h1>Customer Registration</h1>
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
											<li><a href="index.html">Home</a></li>
											<li><a href="newStaff.cfm">Register New Staff</a></li>
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
                    <cfoutput>
                    
                    <cfif isdefined('form.submit')>
                    <cfparam name="errorCaught" default="">
                    <cftry>
                    <cfquery name="InsertProduct">
											INSERT INTO Customers (Address, customerEmail,CustomerID,customerPhone,OpeningBalance,Creator, dateUpdated, opendate, gender, accountOfficer,CustomerName,code,savingsPlan)
											VALUES (<cfqueryparam value="#form.Address#" cfsqltype="cf_sql_char">, <cfqueryparam value="#form.email#" cfsqltype="cf_sql_char">,<cfqueryparam value="#trim(form.customerId)#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.phone#" cfsqltype="cf_sql_char">, <cfqueryparam value="#trim(form.openingBalance)#" cfsqltype="cf_sql_double">,<cfqueryparam value="#GetAuthUser()#" cfsqltype="cf_sql_char">,<cfqueryparam value="#lsDateFormat(CreateODBCDate(form.opendate), "dd/mm/yyyy")#" cfsqltype="cf_sql_date">,<cfqueryparam value="#lsDateFormat(CreateODBCDate(form.opendate), "dd/mm/yyyy")#" cfsqltype="cf_sql_date">,<cfqueryparam value="#form.gender#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.accountofficer#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.CustomerName#" cfsqltype="cf_sql_char">,'SFT-#left(createUUID(),6)#-#form.customerID#',<cfqueryparam value="#form.plan#" cfsqltype="CF_SQL_FLOAT">
											) 
										</cfquery>
                   <cfcatch type="Database"> 
                        <h1>Database Error</h1> 
                        <cfoutput> 
                        <ul> 
                            <li><b>Message:</b> #cfcatch.Message# </li>
                            <li><b>Native error code:</b> #cfcatch.NativeErrorCode# </li>
                            <li><b>SQLState:</b> #cfcatch.SQLState# </li>
                            <li><b>Detail:</b> #cfcatch.Detail# </li>
                            </ul> 
                        </cfoutput> 
                        <cfset errorCaught = "Database"> 
                    </cfcatch> 
                    <cfcatch type="Any"> 
						<cfoutput> 
                            <hr> 
                            <h1>Other Error: #cfcatch.Type#</h1> 
                            <ul> 
                                <li><b>Message:</b> #cfcatch.Message# </li>
                                <li><b>Detail:</b> #cfcatch.Detail# </li>
                            </ul> 
                        </cfoutput> 
                        <cfset errorCaught = "General Exception"> 
                    </cfcatch>

                    </cftry>
                    
                    <cfif #errorCaught# is not "">
                        <cfabort>
                    </cfif>
    
    
                    <div id="formResult">
                    <h2>Congrats! <strong>#form.customerName#</strong><br>
                    have been registered successfully</h2>
                    </div>
                    <cfelse>

						<h2>Registration Form (Staff Use Only)</h2>

						<!-- CONTACT FORM : begin -->
						<cfform class="default-form" action="#cgi.SCRIPT_NAME#" method="post">
							

							<!-- FORM VALIDATION ERROR MESSAGE : begin -->
							<p class="c-alert-message m-warning m-validation-error" style="display: none;"><i class="ico fa fa-exclamation-circle"></i>Please fill in all required (*) fields.</p>
							<!-- FORM VALIDATION ERROR MESSAGE : end -->

							<!-- SENDING REQUEST ERROR MESSAGE : begin -->
							<p class="c-alert-message m-warning m-request-error" style="display: none;"><i class="ico fa fa-exclamation-circle"></i>There was a connection problem. Try again later.</p>
							<!-- SENDING REQUEST ERROR MESSAGE : end -->

							<div class="row">
								
								<div class="col-sm-8">

									<hr>
                                    <h3><strong>Personal Info</strong></h3>
                                    <hr>
									<div class="form-field">
									<cfquery name="id">
										select top 1 customerid
										from customers
										order by customerid desc
									</cfquery>
									<cfset newId = #id.customerid# + 1>
										<label for="customerId">Customer Id <span>*</span></label>
                    <input name="customerId" id="customerId" class="m-required" value="#newId#" required readonly>
									</div>
									
									<div class="form-field">
										<label for="customerName">Full Name <span>*</span></label>
										<input name="customerName" id="customerName" class="m-required" required autocomplete="off">
									</div>
									<!-- SUBJECT FIELD : end -->
                                    <!-- SUBJECT FIELD : begin -->
									<div class="form-field">
										<label for="Address">Address </label>
										<textarea name="Address" id="Address" class="m-required" required></textarea>
									</div>
									
									<div class="form-field">
										<label for="gender">Gender <span>*</span></label>
										<select id="gender" name="gender" class="m-required" required>
											<option value="Female">Female</option>
											<option value="Male">Male</option>  	
										</select>
									</div>
									
									<div class="form-field">
									<cfquery name="plan">
										select planName, planId from savingsPlan
										order by planId
									</cfquery>
										<label for="plan">Savings Plan <span>*</span></label>
										<select id="plan" name="plan">
										<cfloop query="plan">
											<option value="#Trim(planId)#">#planName# [#planId#]
											</option>
										  </cfloop>
										</select>
									</div>
									
									<div class="form-field">
									<cfquery name="officer">
										select firstname, staffid from staff
										order by firstname
									</cfquery>
										<label for="accountOfficer">Account Officer <span>*</span></label>
										<select id="accountOfficer" name="accountOfficer" required>
											<option value="">Select Account Officer</option>
										<cfloop query="officer">
											<option value="#Trim(staffid)#">#firstname# [#staffId#]
											</option>
										  </cfloop>
										</select>
									</div>
									
									<div class="form-field">
										<label for="openDate">Payment Date <span>*</span></label>
										<input name="openDate" id="openDate" class="m-required" placeholder="#lsDateFormat(CreateODBCDate(now()), "dd/mm/yyyy")#" readonly required autocomplete="off">
									</div>
                  <div class="form-field">
										<label for="phone">Phone <span>*</span></label>
                    <input name="phone" id="phone" class="m-required" autocomplete="off" pattern="[0-9]{11}" required>
									</div>
                                    
                  <div class="form-field">
									  <label for="email">Email </label>
										<input name="email" id="email" type="email" autocomplete="off" class="m-required">
									</div>
                 
                  <div class="form-field">
										<label for="openingBalance">Opening Balance <span>*</span></label>
										<input name="openingBalance" id="openingBalance" autocomplete="off" value="0" required  class="m-required" readonly>
									</div>								
                  
                  <div class="form-field">
									  <input type="checkbox" name="agree" class="m-required" id="agree" required>
                                      <span id="iAgree">I agree with term & conditions</span>
									</div>

									<!-- SUBMIT BUTTON : begin -->
									<div class="form-field">
										<button class="submit-btn c-button" name="submit" id="submit" type="submit">Register</button>
									<!-- SUBMIT BUTTON : end -->

								</div>
							</div>
                            </div>

						</cfform>
						<!-- CONTACT FORM : end -->
					</cfif>
					</div>
                    </cfoutput>
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
		
		
		<!-- SCRIPTS : end -->

	</body>
</html>