<!doctype html>
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
<script>
$( function() {
    $( "#openDate" ).datepicker({dateFormat: "dd/mm/yy"});
  } );
</script>
</head>


<body class="m-fixed-header">
<cfinclude template="Validator.cfm">


<div align="center">
<div id="Content">
<h4>Customer Modification</h4>
<div id="RightColumn">

<cfif #GetUserRoles()# is  'Cashier'>
<h1> Unauthrised Zone </h1>
<cfelseif #GetUserRoles()# is  'Accountant'>
<h1> Unauthrised Zone </h1>
<cfelseif #GetUserRoles()# is  'Sales Rep'>
<h1> Unauthrised Zone </h1>
<cfelse>

<cfparam name="form.Update" default="">
<cfparam name="form.CustomerID" default="">
<cfparam name="form.CustomerID2" default="">
<cfparam name="form.search" default="">

<cfquery name="getBranch" datasource="#request.dsn#">
SELECT CustomerID
FROM Customers
ORDER BY CustomerID ASC
</cfquery>

<cfif isdefined (#form.update#)>

<cftransaction>
<cfquery>
UPDATE Customers
SET
Address = <cfqueryparam value="#form.Address#" cfsqltype="cf_sql_char">,
customerEmail = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_char">,
CustomerID = <cfqueryparam value="#trim(form.customerId)#" cfsqltype="cf_sql_char">,
CustomerName = <cfqueryparam value="#trim(form.CustomerName)#" cfsqltype="cf_sql_char">,
customerPhone = <cfqueryparam value="#form.phone#" cfsqltype="cf_sql_char">,
OpeningBalance = <cfqueryparam value="#trim(form.openingBalance)#" cfsqltype="cf_sql_double">,
Creator = <cfqueryparam value="#GetAuthUser()#" cfsqltype="cf_sql_char">,
dateUpdated = <cfqueryparam value="#lsDateFormat(CreateODBCDate(now()), "dd/mm/yyyy")#" cfsqltype="cf_sql_date">,
opendate = <cfqueryparam value="#lsDateFormat(CreateODBCDate(form.opendate), "dd/mm/yyyy")#" cfsqltype="cf_sql_date">,
gender = <cfqueryparam value="#form.gender#" cfsqltype="cf_sql_char">,
accountOfficer = <cfqueryparam value="#form.accountofficer#" cfsqltype="cf_sql_char">
WHERE CustomerID='#form.CustomerID2#'
	</cfquery>
</cftransaction>

<p>
 <cfoutput>#form.CustomerID2# Has been updated. Click <a href="#cgi.SCRIPT_NAME#">here to update</a> another Customer</cfoutput>
</p>

<cfelseif isdefined (#form.search#)>
<cfquery name="getCustomer" datasource="#request.dsn#">
SELECT Address, customerEmail,CustomerID,customerPhone,OpeningBalance,Creator, dateUpdated, opendate, gender, accountOfficer,CustomerName
FROM Customers
WHERE CustomerID = <cfqueryparam value="#form.CustomerID#" cfsqltype="cf_sql_clob"> 
</cfquery>

<cfquery name="status">
  select statusId from status
  </cfquery>
<div>

<cfform class="default-form" action="#cgi.SCRIPT_NAME#" method="POST">
<table cellpadding="5">
<tr>
<td><div align="right">Customer Id:</div></td>
<td><div align="left">
  <cfinput type="text" name="customerId" id="customerId" value="#getCustomer.customerId#" required="yes" message="Enter Customer Name" autocomplete="off">
  <cfinput name="customerId2" id="customerId2" type="hidden" value="#Trim(getCustomer.customerId)#">
</td>
</tr>
<tr>
<td ><div align="right">Customer Name:</div></td>
<td><div align="left">
  <cfinput type="text" name="customerName" id="customerName" style="width:100%" autocomplete="off"  value="#getCustomer.customerName#">
</div></td>
</tr>
<tr>
<td height="24" valign="top"><div align="right">Address:</div></td>
<td><div align="left">
  <cftextarea name="Address" rows="2" id="Address" style="width:100%"  value="#getCustomer.address#"></cftextarea>
</div></td>
</tr>
<tr>
<cfquery name="officer">
	select firstname, staffid from staff
	order by firstname
</cfquery>
<td height="24"><div align="right">Account Officer:</div></td>
<td><div align="left">

  <select id="accountOfficer" name="accountOfficer" style="width:100%">
  <cfoutput query="officer">
      <option value="#Trim(firstname)#" <cfif officer.firstname is getCustomer.accountOfficer>
    selected </cfif>>#firstname#
        </option>
	  </cfoutput> 	
  </select>
</div></td>
</tr>
<tr>
<td height="24"><div align="right">Phone:</div></td>
<td><div align="left">
  <cfinput type="text" name="phone" validate="integer" id="phone" style="width:100%" autocomplete="off"  value="#getCustomer.CustomerPhone#">
</div></td>
</tr>
<tr>
<td height="24"><div align="right">Email:</div></td>
<td><div align="left">
  <cfinput type="text" name="email" id="email" style="width:100%" autocomplete="off"  value="#getCustomer.customerEmail#">
</div></td>
</tr>
<tr>
<td height="24"><div align="right">Opening Date:</div></td>
<td><div align="left">
  <cfinput name="openDate" id="openDate" required="yes"  value="#lsDateFormat(CreateODBCDate(getCustomer.opendate), "dd/mm/yyyy")#" message="Enter Opening Date">
</div></td>
</tr>
<tr>
<td height="24"><div align="right">Opening Balance:</div></td>
<td><div align="left">
  <cfinput type="text" name="openingBalance" validate="integer" id="openingBalance" style="width:100%;text-align:right" required="yes" autocomplete="off"  value="#getCustomer.OpeningBalance#">
</div></td>
</tr>
<tr>
<td height="24"><div align="right">Gender:</div></td>
<td><div align="left">
   <cfquery name="gender">
	select gender from gender
	order by gender
</cfquery>
  <select id="gender" name="gender" style="width:100%">
  <cfoutput query="gender">
      <option value="#Trim(gender)#" <cfif gender.gender is getCustomer.gender>
    selected </cfif>>#gender#
        </option>
	  </cfoutput>  	
  </select>
</div></td>
</tr>
<tr>
<td></td>
<td height="26" align="right"><div align="right">
  <cfinput type="submit" name="update" id="update" value="Update">
</div></td>
</tr>
</table>
</cfform>
</div>
<cfelse>
<div>
<div align="center">
<cfform class="default-form" action="#cgi.SCRIPT_NAME#" method="POST">
<div class="form-field">
						<label for="CustomerID">Customer Id<span>*</span></label>

						<input name="CustomerID" id="CustomerID" autocomplete="off" value="0" required class="m-required">
					</div>

    <button type="submit" name="Search" value="Search"  class="submit-btn c-button">Search</button>

    </div>
  </cfform>
	</div>
  </div>
</cfif>
</cfif>

</div>
</div>
</div>
</body>
</html>