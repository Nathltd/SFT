<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Baxany.com - Making Life Easier</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script src="../../googleJquery-min.js"></script>
<script src="../../googleJquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../googleJquery-ui.css">
<script>
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

<div id="subtitle">Credit History</div>
<cfquery name="wallet">
select transactDate, customerId, amount, staffId from wallet
Order by transactDate desc
</cfquery><br>

<table width="90%">
<tr>
<th><div align="left">S/N</div></th><th><div align="left">T/Date</div></th><th><div align="left">Member Email</div></th><th><div align="right">Amount(N)</div></th><th><div align="right">User</div></th>
</tr>
<tbody>
<cfoutput query="wallet">
<cfif IsDefined("rowColor")Is False or rowColor is "FFFFFF"><cfset rowColor="E8E8E8"><cfelse><cfset rowColor="FFFFFF"></cfif>
<tr bgcolor="#rowColor#" onMouseOver="this.bgColor='FFCCCC';" onMouseOut="this.bgColor='#rowColor#';">
<td>#currentRow#</td><td>#dateFormat(transactDate,"dd/mm/yyyy")#</td><td>#customerId#</td><td><div align="right">#numberFormat(amount,",0.00")#</div></td><td><div align="right">#staffId#</div></td>
</tr>
</cfoutput>
</tbody>
</table>


</div>
</div>
<div id="footer"><cfoutput>#request.footer#</cfoutput><span>Powered by &nbsp;<a href="http://www.nathconcept.com">nathconcept.com</a></span></div>
</div>
</body>
</html>
