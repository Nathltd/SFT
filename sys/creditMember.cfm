<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Baxany.com - Making Life Easier</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
<cfinclude template="../shared/AllMenu.cfm">
<div id="main">
<div id="headBanner">
<img src="../../images/banner1.jpg">
</div>
<div id="content">
<div>
<cfinclude template="../shared/sidemenu.cfm">
</div>
<div id="details">

<div id="subtitle">Credit Member's Account</div>
<cfparam name="form.submit" default="">
<cfparam name="form.credit" default="">
<cfif isdefined(form.credit)>
<cfoutput>
<cfquery>
Insert into wallet (customerId,amount,staffId)
values(<cfqueryparam value="#form.email#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.amount#" cfsqltype="cf_sql_char">,<cfqueryparam value="#getAuthUser()#" cfsqltype="cf_sql_char">)
</cfquery>

<br>
<br>

<div id="success" align="center">Member's Account Credited successfully with N#numberformat(form.amount)#. <a href="#cgi.SCRIPT_NAME#"> Credit Another Account</a></div>
</cfoutput>
<cfelseif isdefined(form.submit)>
<cfquery name="member">
select firstname, lastname from customer
where email = '#form.email#'
</cfquery>
<cfoutput>
<cfform name="Form" method="POST" action="#cgi.SCRIPT_NAME#">

                <div class="field">
                  <label for="email">Member's Email:</label>
                  <cfinput type="text" name="email" id="email" value="#form.email#" class="textfield" readonly>
               	</div>
                <div class="field">
                  <label for="name">Member's Name:</label>
                  <cfinput type="text" name="name" id="name" value="#member.firstname# #member.lastname#" class="textfield" required="yes" message="Member's Account does not exist" readonly>
               	</div>
                
                <div class="field">
                  <label for="amount">Credit Amount:</label>
                  <cfinput type="text" name="amount" id="amount"  value="#form.amount#"  class="textfield" readonly>
               	</div>
                
                <div class="button">
                  <a href="#cgi.SCRIPT_NAME#"><cfinput type="button" class="btn" value="Cancel" name="cancel" /></a>

                </div>
                
                <div class="button">
                  <cfinput type="submit" class="btn" value="Credit" name="credit" id="credit" />

                </div>
                </cfform>
                </cfoutput>
<cfelse>


<cfform name="Form" action="#cgi.SCRIPT_NAME#">

                <div class="field">
                  <label for="email">Enter Member's Email:</label>
                  <cfinput type="text" name="email" id="email" placeholder="Enter Member's Email"  class="textfield" autocomplete="off" required="yes" message="Enter Valid Email" validate="email">
               	</div>
                
                <div class="field">
                  <label for="amount">Enter Amount:</label>
                  <cfinput type="text" name="amount" id="amount" placeholder="Enter Amount to be credited"  class="textfield" autocomplete="off" required="yes" message="Enter Amount" validate="integer">
               	</div>                
                <div class="button">
                  <cfinput type="submit" class="btn" value="Submit" name="Submit" />

                </div>
                </cfform>
                </cfif>
</div>
</div>
<div id="footer"><cfoutput>#request.footer#</cfoutput><span>Powered by &nbsp;<a href="http://www.nathconcept.com">nathconcept.com</a></span></div>
</div>
</body>
</html>
