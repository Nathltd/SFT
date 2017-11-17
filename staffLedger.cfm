<!DOCTYPE html>
<html><head>

		<meta http-equiv="content-type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><cfoutput>#request.title#</cfoutput> - Saving For Tomorrow</title>
        <link rel="shortcut icon" href="images/favicon.png">

        <!-- STYLESHEETS : begin -->
		<link rel="stylesheet" type="text/css" href="library/css/style.css">
        <link rel="stylesheet" type="text/css" href="library/css/skin/default.css">
		<link rel="stylesheet" type="text/css" href="library/css/custom.css">
        <link rel="stylesheet" type="text/css" href="engine1/style.css" />
		<!-- STYLESHEETS : end -->

        <!--[if lte IE 8]>
			<link rel="stylesheet" type="text/css" href="library/css/oldie.css">
			<script src="library/js/respond.min.js" type="text/javascript"></script>
        <![endif]-->
		<script src="library/js/modernizr.custom.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="engine1/jquery.js"></script>
        <style>
										.myPortal {
											font-size:28px;
										}
										#myProgress {
										  position: relative;
										  width: 100%;
										  height: 30px;
										  margin-top: 5px;
										  background-color:#F41E22;
										}
										
										#myBar {
										  position: absolute;
										  width: 0%;
										  height: 100%;
										  background-color: #4CAF50;
										}
										
										#label {
										  text-align: center;
										  line-height: 30px;
										  color: white;
										}
									</style>
                                      
									
									<script>
									function move() {
									  var elem = document.getElementById("myBar");
									  var totalRef = document.getElementById("totalRef").value;   
									  var width = 10;
									  var id = setInterval(frame, 150);
									  function frame() {
										if (width >= totalRef) {
										  clearInterval(id);
										  
										  
										} else {
										  width++; 
										  elem.style.width = width + '%'; 
										  document.getElementById("label").innerHTML = width * 1  + '%';
										  document.getElementById("myDiv").style.backgroundColor = "lightblue";
										}
									  }
									}
									document.addEventListener('DOMContentLoaded', function(){move();}, false);
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
									<h1>Staff Ledger </h1>
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
											<li><a href="newStaff.cfm">New Staff</a></li>
											<li><a href="editstaff.cfm">Edit Staff</a></li>
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
                <cfquery name="details">
									Select CustomerID, Type, Amount AS Qty, PaymentID, PaymentDate, staffId, customerName from vwCustomerFiscalTranstUnion
									Where staffId = '#url.id#' AND Type <> 'O/Balance'
									ORDER BY PaymentDate asc,  CASE
																WHEN type = 'Invoice' THEN 1
																WHEN type = 'Cash' THEN 2
																WHEN type = 'EFT' THEN 3
																WHEN type = 'Cheque' THEN 4
																WHEN type = 'Rebate' THEN 5
																WHEN type = 'Retained' THEN 6
																WHEN type = 'Initial' THEN 7
																WHEN type = 'Deposit' THEN 8
																WHEN type = 'Commission' THEN 9
																WHEN type = 'Withdrawal' THEN 10
																WHEN type = 'Refund' THEN 11
																WHEN type = 'Reimburse' THEN 12 END
								</cfquery>  

              <cfquery name="staff">
                select firstName, lastName from staff
                where staffid = '#details.staffId#'
              </cfquery>
     
             <h2>#staff.firstName# #staff.lastName# [#details.staffId#] History</h2>

						<div class="row">
								
								<cfquery name="TotalQty">
									SELECT Type, SUM(Amount) AS Qty1 FROM vwCustomerFiscalTranstUnion
									Where staffId = '#url.id#'
									GROUP BY Type
								</cfquery>

									<cfquery name="TotalAmt">
										SELECT Type, SUM(Amount) AS Qty1 FROM vwCustomerFiscalTranstUnion
										WHERE staffId = '#url.id#'
										GROUP BY Type
									</cfquery>

									<cfquery dbtype="query" name="QtyOut">
										SELECT  SUM(Qty1) AS Qty
										FROM TotalAmt
										WHERE Type = 'Invoice' or Type = 'Refund' or Type = 'withdrawal' or Type = 'Commission'
									</cfquery>

									<cfquery dbtype="query" name="QtyIn">
										SELECT  SUM(Qty1) AS Qty
										FROM TotalAmt
										WHERE Type = 'O/Balance' or Type = 'Cheque' or Type = 'Cash' or Type = 'EFT' or Type = 'Rebate' or Type = 'Reimburse' or  Type = 'Retained' or  Type = 'Deposit' or  Type = 'Initial'
									</cfquery>

									<cfif QtyIN.recordCount eq 0 AND QtyOUT.recordCount gt 0>
										<cfset QtyIN = 0>
										<cfset #QtyOUT# = #Valuelist(QtyOUT.Qty)#>
										<cfelseif QtyOUT.recordCount eq 0  AND QtyIN.recordCount gt 0>
										<cfset QtyOUT = 0>
										<cfset #QtyIN# = #Valuelist(QtyIN.Qty)#>
										<cfelseif QtyIN.recordCount eq 0 AND QtyOUT.recordCount eq 0>
										<cfset QtyIN = 0>
										<cfset QtyOUT = 0>
										<cfelse>
										<cfset #QtyIN# = #Valuelist(QtyIN.Qty)#>
										<cfset #QtyOUT# = #Valuelist(QtyOUT.Qty)#>
									</cfif>

									<cfset PreviousBal = 0<!---+#QtyIN#-(#QtyOUT#)--->>

									<cfset name="qty2" = #PreviousBal#>
								
                 <table>
									 <tr>
									 <td><strong>Serial</strong></td><td><strong>Date</strong></td><td><strong>Teller No.</strong></td><td><strong>Names</strong></td><td><strong>Type</strong></td><td><strong>Officer</strong></td><td align="right"><strong>Debit</strong></td><td align="right"><strong>Credit</strong></td><td align="right"><strong>Balance</strong></td>
									 </tr>
									 <tr>
									 <td colspan="7"></td><td align="right"><strong>Pre Balance</strong></td>
									 <td align="right"><strong>#numberformat(PreviousBal)#</strong></td>
									 </tr>
									 <cfloop query="details">
									 <tr id="member">
										 
										 <td>#details.CurrentRow#</td>
										 <td>#Dateformat(PaymentDate,"dd/mm/yyyy")#</td>
										 <td>#PaymentID#</td>
										 <td>#customerName# [#CustomerID#]</td>
										 <td>#Type#</td>
										 <td title="Account Officer">#Ucase(staffId)#</td>
										 <td align="right">
										 		<cfif #Type# is "Refund">#numberformat(Qty)#<cfelseif #Type# is "Invoice">#numberformat(Qty)#<cfelseif #Type# is "Commission">#numberformat(Qty)#<cfelseif #Type# is "Withdrawal">#numberformat(Qty)#<cfelse>0</cfif>
										 </td>
										 <td align="right">
										 		<cfif #Type# is "O/Balance">#numberformat(Qty)#<cfelseif #Type# is "Cheque">#numberformat(Qty)#<cfelseif #Type# is "Cash">#numberformat(Qty)#<cfelseif #Type# is "Rebate">#numberformat(Qty)#<cfelseif #Type# is "EFT">#numberformat(Qty)#<cfelseif #Type# is "Reimburse">#numberformat(Qty)#<cfelseif #Type# is
										 		 "Retained">#numberformat(Qty)#<cfelseif #Type# is
										 		 "Deposit">#numberformat(Qty)#<cfelseif #Type# is
										 		 "Initial">#numberformat(Qty)#<cfelse>0</cfif>
										 </td>
									 		<cfset Qty2 = #val(Qty2)#>
												<cfif #Details.Type# is "Refund">
												<cfset qty2 = -(#qty#)+#val(qty2)#>
												<cfelseif #Details.Type# is "Invoice">
												<cfset qty2 = -(#qty#)+#val(qty2)#>
												<cfelseif #Details.Type# is "Commission">
												<cfset qty2 = -(#qty#)+#val(qty2)#>
												<cfelseif #Details.Type# is "Withdrawal">
												<cfset qty2 = -(#qty#)+#val(qty2)#>
												<cfelse>
												<cfset qty2 = (#qty#)+#val(qty2)#>
												</cfif>
										 <td id="balance" align="right">
												<cfset newBalance = #Qty2#>
										 		#numberformat(newBalance)#
										 </td>
									 </tr>
									 </cfloop>
               			<cfquery dbtype="query" name="QtyOut">
											SELECT  SUM(Qty) AS Qty1
											FROM Details
											WHERE Type = 'Invoice' or Type = 'Refund'
										</cfquery>

										<cfquery dbtype="query" name="QtyIn">
											SELECT  SUM(Qty) AS Qty1
											FROM Details
											WHERE Type = 'O/Balance' or Type = 'Cheque' or Type = 'Cash' or Type = 'EFT'  or Type = 'Rebate' or Type = 'Retained' or Type = 'Reimburse' or  Type = 'Deposit' or  Type = 'Initial'
										</cfquery>
                		<tr>
									 <td colspan="5"></td><td>Total</td><td align="right"><strong>#numberformat(QtyOUT.Qty1)#</strong></td><td align="right"><strong>#numberformat(QtyIN.Qty1)#</strong></td><td></td>
									 </tr>
                
                 </table>
                                
								
                                
                            </div>

                                
								
                                
                            </div>

                        </cfoutput>
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
		<script src="library/js/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="library/js/third-party.js" type="text/javascript"></script>
		<script src="library/js/library.js" type="text/javascript"></script>
		<script src="library/js/scripts.js" type="text/javascript"></script>
		<!-- SCRIPTS : end -->

	</body>
</html>