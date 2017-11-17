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

<div id="subtitle">Inventory List</div>
<cfquery name="inventory">
select productId,brandId,qty,amt,total
from vwInventoryValue
Order by brandId
</cfquery>
<cfquery name="inValue" dbtype="query">
select SUM(total) AS total1 from inventory
</cfquery><br>

<table width="90%" cellspacing="0" cellpadding="2">
<tr>
<th><div align="left">S/N</div></th><th><div align="left">Brand</div></th><th><div align="left">Product</div></th><th><div align="right">Available</div></th><th><div align="right">Amount (N)</div></th><th><div align="right">Value (N)</div></th>
</tr>
<tbody>
<cfoutput query="inventory">
<cfif IsDefined("rowColor")Is False or rowColor is "FFFFFF"><cfset rowColor="E8E8E8"><cfelse><cfset rowColor="FFFFFF"></cfif>
<tr bgcolor="#rowColor#" onMouseOver="this.bgColor='FFCCCC';" onMouseOut="this.bgColor='#rowColor#';">
<td>#currentRow#</td><td><div align="left">#brandId#</div></td><td><div align="left">#productId#</div></td><td><div align="right">#numberformat(qty)#</div></td><td><div align="right">#numberformat(amt,",0.00")#</div></td><td><div align="right">#numberformat(total,",0.00")#</div></td>
</tr>
</cfoutput>
<cfoutput>
<tr>
<td colspan="5" align="right"><strong>Inventory Value:</strong></td><td align="right"><strong>#numberformat(inValue.total1,",0.00")#</strong></td>
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
