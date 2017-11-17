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

<div id="subtitle">Product List</div>
<cfquery name="products">
select productId,brandId,productValue,status,creator,dateCreated
from products
Order by brandId,productId
</cfquery><br>

<table width="100%" cellspacing="0" cellpadding="5">
<tr>
<th><div align="left">S/N</div></th><th><div align="left">Brand</div></th><th><div align="left">Product</div></th><th><div align="right">Value (N)</div></th><th><div align="left">Status</div></th><th><div align="left">Creator</div></th><th><div align="left" title="Date of Creation">Date</div></th>
</tr>
<tbody>
<cfoutput query="products">
<cfif IsDefined("rowColor")Is False or rowColor is "FFFFFF"><cfset rowColor="E8E8E8"><cfelse><cfset rowColor="FFFFFF"></cfif>
<tr bgcolor="#rowColor#" onMouseOver="this.bgColor='FFCCCC';" onMouseOut="this.bgColor='#rowColor#';">
<td>#currentRow#</td><td><div align="left">#productId#</div></td><td><div align="left">#brandId#</div></td><td><div align="right">#numberformat(productValue,",0.00")#</div></td><td><div align="left">#status#</div></td><td><div align="left">#creator#</div></td><td>#dateFormat(dateCreated,"dd/mm/yyyy")#</td>
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
