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
			<script src="googleJquery-min.js"></script>
<link href="googleJquery-ui.css" rel="stylesheet" type="text/css">
<script src="googleJquery-ui.min.js"></script>
			<script>
$( function() {
    $( "#openDate" ).datepicker({dateFormat: "dd/mm/yy"});
  } );
</script>

	</head>
	<cfoutput>
	<body class="m-fixed-header">
    <cfinclude template="Validator.cfm">
    <cfparam name="form.Update" default="">
										<cfparam name="form.CustomerID" default="">
										<cfparam name="form.CustomerID2" default="">
										<cfparam name="form.search" default="">

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
									<a href="index.html"><img src="images/#request.companyLogo#" data-hires="images/logo.2x.png" alt="Saving For Tomorrow"></a>
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
									<h1>Customer Update</h1>
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
											<li><a href="editCustomer.cfm">Edit Customer</a></li>
											<li><a href="searchCustomer.cfm">Search Customer</a></li>
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
                 
                  <cfif isdefined (#form.update#)>
                  
                  <cfparam name="errorCaught" default="">
                    <cftry>
									<cfquery>
										UPDATE Customers
										SET
										Address = <cfqueryparam value="#form.Address#" cfsqltype="cf_sql_char">,
										customerEmail = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_char">,
										CustomerID = <cfqueryparam value="#trim(form.customerId)#" cfsqltype="CF_SQL_INTEGER">,
										CustomerName = <cfqueryparam value="#trim(form.CustomerName)#" cfsqltype="cf_sql_char">,
										status = <cfqueryparam value="#trim(form.status)#" cfsqltype="cf_sql_char">,
										customerPhone = <cfqueryparam value="#form.phone#" cfsqltype="cf_sql_char">,
										OpeningBalance = <cfqueryparam value="#trim(form.openingBalance)#" cfsqltype="cf_sql_double">,
										Creator = <cfqueryparam value="#GetAuthUser()#" cfsqltype="cf_sql_char">,
										dateUpdated = <cfqueryparam value="#lsDateFormat(CreateODBCDate(now()), "dd/mm/yyyy")#" cfsqltype="cf_sql_date">,
										opendate = <cfqueryparam value="#lsDateFormat(CreateODBCDate(form.opendate), "dd/mm/yyyy")#" cfsqltype="cf_sql_date">,
										gender = <cfqueryparam value="#form.gender#" cfsqltype="cf_sql_char">,
										accountOfficer = <cfqueryparam value="#form.accountofficer#" cfsqltype="cf_sql_char">,
										savingsPlan = <cfqueryparam value="#form.plan#" cfsqltype="CF_SQL_FLOAT">
										WHERE CustomerID=#form.CustomerID2#
									</cfquery>
                   <cfcatch type="Database"> 
                        <h1>Database Error</h1> 
                        
                        <ul> 
                            <li><b>Message:</b> #cfcatch.Message# </li>
                            <li><b>Native error code:</b> #cfcatch.NativeErrorCode# </li>
                            <li><b>SQLState:</b> #cfcatch.SQLState# </li>
                            <li><b>Detail:</b> #cfcatch.Detail# </li>
                            </ul> 
                      
                        <cfset errorCaught = "Database"> 
                    </cfcatch> 
                    <cfcatch type="Any"> 
						
                            <hr> 
                            <h1>Other Error: #cfcatch.Type#</h1> 
                            <ul> 
                                <li><b>Message:</b> #cfcatch.Message# </li>
                                <li><b>Detail:</b> #cfcatch.Detail# </li>
                            </ul> 
                       
                        <cfset errorCaught = "General Exception"> 
                    </cfcatch>

                    </cftry>
                    
                    <cfif #errorCaught# is not "">
                        <cfabort>
                    </cfif>
    
    
                    <div id="formResult">
                    <h2>Congrats! <strong>#form.customerName2# [#form.customerCode#]</strong><br>
                    have been Updated successfully</h2>
                    </div>
						

            <cfelseif isdefined (form.search)>
							<cfquery name="getCustomer" datasource="#request.dsn#">
							SELECT Address, customerEmail,CustomerID,customerPhone,OpeningBalance,Creator, dateUpdated, opendate, gender, accountOfficer,CustomerName,code,status,savingsPlan
							FROM Customers
							WHERE CustomerID = <cfqueryparam value="#form.CustomerID#" cfsqltype="cf_sql_clob"> 
							</cfquery>

							<cfquery name="status">
								select statusId from status
								</cfquery>
						<div>

						<h2>Update Form (Staff Use Only)</h2>

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
										<label for="customerId">Customer Id <span>*</span></label>
                    <cfinput name="customerId" id="customerId" class="m-required" value="#getCustomer.customerId#" required readonly>
                    <cfinput name="customerId2" id="customerId2" type="hidden" value="#Trim(getCustomer.customerId)#">
									</div>
									
									<div class="form-field">
										<label for="customerName">Full Name <span>*</span></label>
										<cfinput name="customerName" id="customerName" class="m-required" required autocomplete="off" value="#getCustomer.CustomerName#">
										<cfinput name="customerName2" id="customerName2" type="hidden" value="#getCustomer.CustomerName#">
										<cfinput name="customerCode" id="customerCode" type="hidden" value="#getCustomer.code#">
									</div>
									<!-- SUBJECT FIELD : end -->
                                    <!-- SUBJECT FIELD : begin -->
									<div class="form-field">
										<label for="Address">Address </label>
										<cftextarea name="Address" id="Address" class="m-required"  value="#getCustomer.Address#"></cftextarea>
									</div>
									
									<div class="form-field">
									<cfquery name="gender">
										select gender from gender
									</cfquery>
										<label for="gender">Gender <span>*</span></label>
										<select id="gender" name="gender" class="m-required" required>
											<cfloop query="gender">
												<option value="#Trim(gender)#" <cfif gender.gender is getCustomer.gender>
													selected </cfif>>#gender#
												</option>
	  									</cfloop>	
										</select>
									</div>
									
									<div class="form-field">
										<cfquery name="officer">
											select firstname, staffid from staff
											order by firstname
										</cfquery>
										<label for="phone">Account Officer <span>*</span></label>
										<cfselect id="accountOfficer" name="accountOfficer"  class="m-required">
										<cfloop query="officer">
											<option value="#Trim(staffid)#" <cfif officer.staffid is getCustomer.accountOfficer>
											selected </cfif>>#firstname# [#staffId#]
											</option>
										</cfloop>
										</cfselect>
									</div>
									
									<div class="form-field">
									<cfquery name="plan">
										select planName, planId from savingsPlan
										order by planId
									</cfquery>
										<label for="plan">Savings Plan <span>*</span></label>
										<select id="plan" name="plan">
										<cfloop query="plan">
											<option value="#Trim(planId)#" <cfif plan.planId is getCustomer.savingsPlan> selected </cfif>>#planName# [#planId#]
											</option>
										  </cfloop>
										</select>
									</div>
									
									<div class="form-field">
										<label for="openDate">Registration Date <span>*</span></label>
										<cfinput name="openDate" id="openDate" class="m-required" value="#lsDateFormat(CreateODBCDate(getCustomer.opendate), "dd/mm/yyyy")#">
									</div>
                  <div class="form-field">
										<label for="phone">Phone </label>
                    <cfinput name="phone" id="phone" class="m-required" autocomplete="off" value="#getCustomer.customerPhone#" maxlength="11" pattern="\d*">
									</div>
                                    
                  <div class="form-field">
									  <label for="email">Email </label>
										<cfinput name="email" id="email" type="email" autocomplete="off" class="m-required" value="#getCustomer.customerEmail#">
									</div>
                
                  <div class="form-field">
										<label for="openingBalance">Opening Balance <span>*</span></label>
										<cfinput name="openingBalance" id="openingBalance" autocomplete="off" value="#getCustomer.OpeningBalance#" required  class="m-required">
									</div>
                 
                 	<div class="form-field">
									<cfquery name="status">
										select statusId from status
									</cfquery>
										<label for="status">Status <span>*</span></label>
										<select id="status" name="status" class="m-required" required>
											<cfloop query="status">
												<option value="#Trim(statusid)#" <cfif status.statusid is getCustomer.status>
													selected </cfif>>#statusid#
												</option>
	  									</cfloop>	
										</select>
									</div>							
                  
                  <div class="form-field">
									  <input type="checkbox" name="agree" class="m-required" id="agree" required>
                                      <span id="iAgree">I agree this info is correct.</span>
									</div>

									<!-- SUBMIT BUTTON : begin -->
									<div class="form-field">
										<button type="submit" name="update" id="update" value="Update" class="submit-btn c-button">Update</button>
									<!-- SUBMIT BUTTON : end -->

								</div>
							</div>
                            </div>

						</cfform>
						<!-- CONTACT FORM : end -->
					<cfelse>

					<div class="row">
					<div class="col-sm-8">
					<cfform action="#cgi.SCRIPT_NAME#" enctype="multipart/form-data"  class="default-form">
					<div class="form-field">
						<label for="CustomerID">Customer Id<span>*</span></label>

						<input name="CustomerID" id="CustomerID" autocomplete="off" placeholder="Enter Customer Id" required class="m-required">
					</div>
					
					<div class="form-field">
										<button type="submit" name="Search" value="Search"  class="submit-btn c-button">Search</button>
									<!-- SUBMIT BUTTON : end -->
					</div>
					</cfform>
					</div>
					</div>
						</cfif>
			    
						</div>
						</div>

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
									<p>#request.footer# | <a href="#">Terms &amp; Condtions</a> | <a href="#">Customer Complain &amp; Resolution Process</a></p>
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
        
		
		<!-- SCRIPTS : end -->

	</body>
	</cfoutput>
</html>