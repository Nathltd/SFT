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
$(document).ready(function() {
	
	$('#productId').autocomplete({
    	source: "vItems.cfm",
        minLength: 2});
	$('#addItem').click(function(evt) {
		var vPins = $('#vPin').val();
		if(vPins == ''){
			alert('Enter Pin Number');
		}
		else{
			addItem(document.getElementById('productId'), document.getElementById('vPin'), document.getElementById('vSerial'), evt);
			console.log(arrItem);
		}
		});
});

</script>
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

<div id="subtitle">Post New Voucher Pins</div>
<br>

<div>
<cfset access = hash(#session.URLToken#,'SHA-512')>
<cfparam name="session.logg" default="#arraynew(1)#" type="array">
<cfparam name="session.logId" default="">
<cfparam name="url.post" default="">
<cfif url.post is #access#>

<cftransaction>

<cfquery name="data" maxrows="1">
select logId from vouchersLog
order by logId desc
</cfquery>
<cfset logId =ValueList(data.logId)>

<cfif #session.logId# eq #logId#>
<cfset #session.logId# = #session.logId#+1>
<cfset #session.logId# = #ToString(session.logId)#>
</cfif>
<cfquery>
INSERT INTO vouchersLog
(logId,Creator)
VALUES (<cfqueryparam cfsqltype="cf_sql_clob" maxlength="8" value="#session.logId#">,'#GetAuthUser()#')
</cfquery>
<cfloop from="1" to="#arraylen(session.logg)#" index="counter">
<cfquery>
INSERT INTO vouchers
(voucherId, voucherSerial, productId, logId)
VALUES (<cfqueryparam value="#session.logg[variables.counter].vPin#" cfsqltype="cf_sql_char">,  <cfqueryparam value="#session.logg[variables.counter].vSerial#" cfsqltype="cf_sql_char">,
<cfqueryparam value="#session.logg[variables.counter].productId#" cfsqltype="cf_sql_char">, <cfqueryparam cfsqltype="cf_sql_clob" maxlength="8" value="#session.logId#">)
</cfquery>
</cfloop>
</cftransaction>
<cfset structdelete(session, 'logg')>
<br>
<h3>Vouchers Posted Successfully. <a href="postPins.cfm">Post another batch</a>.</h3>
<cfelse>

<cfquery name="vPins">
select productId from products
order by productId
</cfquery>


<cfif isdefined("form.addItem")>
<cfset arrayappend(session.logg,structnew())>
<cfset position = arraylen(session.logg)>
<cfset session.logg[position].productId = #form.productId#>
<cfset session.logg[position].vPin = #form.vPin#>
<cfset session.logg[position].vSerial = #form.vSerial#>
<cfset session.logId = #form.logId#>
<!--- Remove items from invoice list --->
<cfelseif isdefined("url.id") >
<cfset #ArrayDeleteAt(#session.logg#,#url.id#)#>
</cfif>
<cfoutput>
<cfform action="#cgi.SCRIPT_NAME#" name="form" format="html" id="form" enctype="application/x-www-form-urlencoded">
<label for="logId">Batch Id:</label>
          <cfinput name="logId" id="logId" type="text" required class="textfield" autocomplete="off" bind="cfc:#request.cfc#cfc.bind.invLog()" bindonload="yes">


<table border="0">
<thead>
<td>Voucher Type</td><td>Voucher Pin</td><td>Voucher Serial</td><td></td>
</thead>
<tr valign="bottom">
    
    <td><select name="productId" id="productId">
		<cfloop query="vPins">
		<option value="#productId#">#productId#</option>
        </cfloop>
        </select></td><td><input name="vPin" type="number" required class="textfield" id="vPin" placeholder="1234567890" autocomplete="off"></td><td><input name="vSerial" type="number" required class="textfield" id="vSerial" placeholder="1234567890" autocomplete="off"></td><td><input name="addItem" id="addItem" type="submit" value="Add" class="btn"></td>
	</cfform>
        </tr>
        <cfloop from="1" to="#arraylen(session.logg)#" index="counter">
        <cfif IsDefined("rowColor")Is False or rowColor is "D5D5FF"><cfset rowColor="FFFFFF"><cfelse><cfset rowColor="D5D5FF"></cfif>
<tr bgcolor="#rowColor#" onMouseOver="this.bgColor='FFCCCC';" onMouseOut="this.bgColor='#rowColor#';" >
        <td>#session.logg[variables.counter].productId#</td><td>#session.logg[variables.counter].vPin#</td><td>#session.logg[variables.counter].vSerial#</td><td><div align="center" title="Remove this Item"><a href="#cgi.SCRIPT_NAME#?id=#counter#"><font color="##FF0000"><strong>X</strong></font></a>&nbsp; </div></td>
        </tr>
        </cfloop>
        <tr>
        <cfform action="#cgi.SCRIPT_NAME#?post=#access#" name="form2" id="form2" enctype="application/x-www-form-urlencoded">
        <td></td><td></td><td></td><td><cfinput type="submit" name="submit" id="submit" value="Post" class="btn"></td>
        </cfform>
        </tr>
        </table>
        </cfoutput>
        </cfif>
</div>


</div>
</div>
<div id="footer"><cfoutput>#request.footer#</cfoutput><span>Powered by &nbsp;<a href="http://www.nathconcept.com">nathconcept.com</a></span></div>
</div>
</body>
</html>
