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
<cfif #GetUserRoles()# is not 'Administrator' AND #GetUserRoles()# is not 'Alpha'>
<h1> Unauthrised Zone </h1>
<cfelse>
<div>
<cfinclude template="../shared/sideMenu.cfm">
</div>
<div id="details">

<div id="subtitle">New Item</div>
<cfparam name="form.submit" default="">
<cfif isdefined(form.submit)>
<cfquery>
Insert into products (brandId,productid,productValue,creator)
values(<cfqueryparam value="#form.brandId#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.productId#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.proValue#" cfsqltype="cf_sql_integer">,<cfqueryparam value="#getAuthUser()#" cfsqltype="cf_sql_char">)
</cfquery>
<div id="success" align="center"><cfoutput> New Item created successfully.<a href="#cgi.SCRIPT_NAME#">Add new Item</a></cfoutput></div>
<cfelse>
<cfquery name="brand">
select brandId from brands
order by brandId
</cfquery>
<cfform name="Form" action="#cgi.SCRIPT_NAME#">
				
                <div class="field">
                  <label for="brandId">Brand:</label>  
                   <cfselect name="brandId" id="brandId" label="brand" tooltip="Brand" required="yes" message="Choose a Brand" autofocus>
                   <cfoutput query="brand">
                   <option value="#brandId#">#brandId#</option>
                   </cfoutput>
                   </cfselect>
              	</div>
				<div class="field">
                  <label for="productId">Item Name:</label>
                  <cfinput type="text" name="productId" id="productId" placeholder="Enter Item name, e.g MTN 200"  class="textfield" autocomplete="off" required="yes" message="Enter Item name">
               	</div>
                <div class="field">
                  <label for="proValue">Value:</label>
                  <cfinput type="text"  name="proValue" id="proValue" class="textfield" validate="integer" autocomplete="off" message="Enter valid Number" required="yes" placeholder="12345">
              	</div>
                
                <div class="button">
                  <cfinput type="submit" class="btn" value="Submit" name="Submit" />

                </div>
                </cfform>
                </cfif>
</div>
</cfif>
</div>
<div id="footer"><cfoutput>#request.footer#</cfoutput><span>Powered by &nbsp;<a href="http://www.nathconcept.com">nathconcept.com</a></span></div>
</div>
</body>
</html>
