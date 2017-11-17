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

<div id="subtitle">Members List</div>
<cfquery name="members">
select email, firstname, lastName, state, phone, status, dateCreated from customer
Order by firstname
</cfquery><br>

<table width="100%">
<tr>
<th><div align="left">S/N</div></th><th><div align="left">Member Email</div></th><th><div align="left">Phone</div></th><th><div align="left">State</div></th><th><div align="left">Status</div></th><th><div align="left">Reg. Date</div></th>
</tr>
<tbody>
<cfoutput query="members">
<cfif IsDefined("rowColor")Is False or rowColor is "FFFFFF"><cfset rowColor="E8E8E8"><cfelse><cfset rowColor="FFFFFF"></cfif>
<tr bgcolor="#rowColor#" onMouseOver="this.bgColor='FFCCCC';" onMouseOut="this.bgColor='#rowColor#';">
<td>#currentRow#</td><td><div align="left" title="#firstname#&nbsp;#lastName#">#email#</div></td><td><div align="left">#phone#</div></td><td><div align="left">#state#</div></td><td><div align="left">#status#</div></td><td>#dateFormat(dateCreated,"dd/mm/yyyy")#</td>
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
