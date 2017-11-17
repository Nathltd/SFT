<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Baxany.com - Making Life Easier</title>
<link rel="stylesheet" type="text/css" href="Apps/sys/style.css">
</head>

<body>
<div align="center">
<cfinclude template="../shared/allMenu.cfm">
<div id="Content">
<h4>Invoice Posting </h4>
<div id="RightColumn">
<cfif #GetUserRoles()# is not 'Administrator' AND #GetUserRoles()# is not 'Alpha' AND #GetUserRoles()# is not 'Sales Rep'>
<h1> Unauthrised Zone </h1>
<cfelse>
<cfset access = hash(#session.URLToken#,'SHA-512')>
<cfparam name="url.post" default="">
<cfparam name="form.Amount" default="">
<cfif url.post is #access#>

<cfset form.newDate = #dateformat(session.myDate,"dd/mm/yyyy")#>

<cftransaction>

<cfquery name="data" maxrows="1">
select logId from vouchersLog
order by logId desc
</cfquery>

<cfset InvNumber =ValueList(data.logId)>

<cfif #session.logId# eq #invNumber#>
<cfset #session.logId# = #session.logId#+1>
<cfset #session.logId# = #ToString(session.logId)#>
</cfif>

<cfquery>
INSERT INTO vouchersLog
(logId,logDate,userId)
VALUES (<cfqueryparam cfsqltype="cf_sql_clob" maxlength="8" value="#session.logId#">,<cfqueryparam value="#dateformat(now(),"dd/mm/yyyy")#" cfsqltype="cf_sql_timestamp">,<cfqueryparam value="#GetAuthUser()#" cfsqltype="cf_sql_clob">
</cfquery>

<cfloop from="1" to="#arraylen(session.myInvoice)#" index="counter">
<cfquery>
INSERT INTO vouchers
(voucherId, voucherSerial, productid, logId)
VALUES (<cfqueryparam value="#session.myInvoice[variables.counter].voucherId#" cfsqltype="cf_sql_clob">,  <cfqueryparam value="#session.myInvoice[variables.counter].voucherSerial#" cfsqltype="cf_sql_clob">,
<cfqueryparam value="#session.myInvoice[variables.counter].productid#" cfsqltype="cf_sql_clob">, <cfqueryparam value="#session.logId#" cfsqltype="cf_sql_clob">)
</cfquery>
</cfloop>
</cftransaction>
<cfoutput>
<cfset url.cfgridkey = #session.SalesID#>

<div> <a href="#"> New Vouchers </a>  |  <a href="#">Print</a>&nbsp;</div>

 Voucher Log No. <strong>#session.logId#</strong> have been posted successfully<br>

<table> 
<tr>
  <td><div>User:</div></td>
  <td><strong> #GetAuthUser()#</strong></td>
  <td><div ></div></td>
  <td></td>
  <td></td>
  <td><div >Log No:</div></td>
  <td><strong> #session.logId#</strong></td>
  
  <td><div>Invoice Date:</div></td><td><strong>#dateformat(now(),"dd/mm/yyyy")#</strong></td>
</tr>
<tr>
  <td> </td>
</tr>
<tr>
<td height="29"> </td>
<td> </td>
<td> </td>
<td> </td>
<td> </td>
</tr>
<tr>
<td > <strong>Description</strong></td>
<td colspan="5"> <strong>Voucher Pin</strong></td>
<td> <strong>Voucher Serial</strong></td>
<td> <strong>Status</strong></td>
</tr>

<cfloop from="1" to="#arraylen(session.myInvoice)#" index="counter">
<cfif IsDefined("rowColor")Is False or rowColor is "DDDDDD"><cfset rowColor="EEEEEE"><cfelse><cfset rowColor="DDDDDD"></cfif>
<tr bgcolor="#rowColor#" onMouseOver="this.bgColor='FFCCCC';" onMouseOut="this.bgColor='#rowColor#';">
<td> #session.myInvoice[variables.counter].productid# </td>
<td colspan="5"> #session.myInvoice[variables.counter].voucherId# </td>
<td> #session.myInvoice[variables.counter].voucherSerial# </td>
<td> Available</td>
</tr>
</cfloop>
</table>
</cfoutput>

<cfelse>

<cfparam name="session.myInvoice" default="#arraynew(1)#" type="array">
<cfparam name="session.voucherId" default="">
<cfparam name="session.voucherSerial" default="">
<cfparam name="session.productid" default="">
<cfparam name="session.logId" default="">
<cfparam name="url.reset" default="">
  

<cfif isdefined("AddInvoice") >
<cfif form.Discount eq ''>
<cfset form.Discount = 0>
</cfif>
<cfset arrayappend(session.myinvoice,structnew())>
<cfset position = arraylen(session.myinvoice)>
<cfset session.myInvoice[position].productid = #form.productid#>
<cfset session.myInvoice[position].voucherId = #form.voucherId#>
<cfset session.myInvoice[position].voucherSerial = #form.voucherSerial#>
<cfset session.logId = #form.logId#>

<!--- Remove items from invoice list --->
<cfelseif isdefined("url.id") >
<cfset #ArrayDeleteAt(#session.myInvoice#,#url.id#)#>

<cfelse>
<cfset arrayclear(#session.myInvoice#)>
<cfset structdelete(session, 'logId')>
</cfif>


<cfoutput>


<cfform action="#cgi.SCRIPT_NAME#" name="form" format="html" id="form" enctype="application/x-www-form-urlencoded">

<div>
  
  <table width="90%" bgcolor="##E6F2FF" border="0" cellpadding="3" cellspacing="0" bordercolor="999999">
    <tr align="center" bgcolor="##E9E9E9">
        <td align="center" width="25%"> <strong>Item</strong></td>
        <td  width="27%"> <strong>Voucher Pin</strong></td>
        <td align="center"  width="7%"> <strong>Serial No.</strong></td>
        <td align="center" width="5%">&nbsp;</td>
    </tr>
<div id="stockCheck" align="center">
<h5 id="msg"> </h5>
<button name="ok" id="ok">Ok</button>
</div>
    <tr>    
    #session.myInvoice[variables.counter].voucherId#
#session.myInvoice[variables.counter].voucherSerial#
#session.myInvoice[variables.counter].productid#
    <td><cfinput name="productid" id="productid" type="text" title="Description"></td>
    <td> <cfinput type="text" name="voucherId" id="voucherId" validate="integer" tabindex="9" required="yes" message="Enter quantity Voucher Pin" style="text-align:right; width:100%" autosuggest="no"> </td>
    <td> <cfinput type="text" name="voucherSerial" id="voucherSerial" tabindex="9" style="text-align:right; width:100%" autosuggest="no"> </td>
    <td align="center" valign="bottom"> <div align="right"> <cfinput type="submit" name="AddInvoice" id="AddInvoice" value="Add" tabindex="11"></div></td>
    </tr>
<cfloop from="1" to="#arraylen(session.myInvoice)#" index="counter">
<cfif IsDefined("rowColor")Is False or rowColor is "D5D5FF"><cfset rowColor="FFFFFF"><cfelse><cfset rowColor="D5D5FF"></cfif>
<tr bgcolor="#rowColor#" onMouseOver="this.bgColor='FFCCCC';" onMouseOut="this.bgColor='#rowColor#';" >
<td >&nbsp; #session.myInvoice[variables.counter].productid# </td>
<td > #session.myInvoice[variables.counter].voucherId# </td>
<td > <div align="right">#session.myInvoice[variables.counter].voucherSerial# </div></td>
<td> <div align="right" title="Remove this Item"><a href="#cgi.SCRIPT_NAME#?id=#counter#"><font color="##FF0000"><strong>X</strong></font></a>&nbsp; </div></td>
</tr>
</cfloop>

</cfform>

<cfform action="#cgi.SCRIPT_NAME#?post=#access#" name="form2" format="html" id="form2" enctype="application/x-www-form-urlencoded">

<tr>
 <td colspan="7" >
  </td>
</tr>
    <tr bgcolor="##4AA5FF">


<td colspan="1" align="right"><a href="#cgi.SCRIPT_NAME#?reset=1"><font color="##FF0000"><strong>Reset</strong></font></a><cfinput name="post" id="post" type="submit" value="Post"></td>
</tr>
</cfform>

</table>
</div>


<cfif url.reset is "1">
<cfset arrayclear(#session.myInvoice#)>
<cfset structdelete(session, 'logId')>
</cfif>

</cfoutput>

</cfif>
</cfif>
</div>
<div id="footer"><a href="http://www.nathconcept.com"><cfoutput>#request.footer#</cfoutput></a></div>
</div>
</div>
</body>
