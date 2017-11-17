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
<cfinclude template="../shared/sidemenu.cfm">
</div>
<div id="details">

<div id="subtitle">Quick Voucher</div>
<cfparam name="form.submit" default="">
<cfparam name="form.credit" default="">
<cfif isdefined(form.credit)>
<cfoutput>

<cfset form.pin = #encrypt(form.pin,"SHA-512")#>
<cfquery>
Insert into quickVouchers (customerId,voucherId,voucherSerial,productId,userId)
values(<cfqueryparam value="#form.email#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.pin#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.serial#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.productId#" cfsqltype="cf_sql_char">,<cfqueryparam value="#getAuthUser()#" cfsqltype="cf_sql_char">)
</cfquery>

<br>

<div id="success">Voucher Pin Added to Customer. <a href="#cgi.SCRIPT_NAME#"> Send a Quick-Voucher</a></div>
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
                  <cfinput type="text" name="email" id="email" value="#form.email#" class="textfield" readonly required="yes">
               	</div>
                <div class="field">
                  <label for="name">Member's Name:</label>
                  <cfinput type="text" name="name" id="name" value="#member.firstname# #member.lastname#" class="textfield" required="yes" message="Member's Account does not exist" readonly>
               	</div>
                
                <div class="field">
                  <label for="productId">Item Type:</label>
                  <cfinput type="text" name="productId" id="productId"  value="#form.productId#"  class="textfield" readonly required="yes">
               	</div>
                <div class="field">
                  <label for="pin">Pin:</label>
                  <cfinput type="text" name="pin" id="pin"  value="#form.pin#"  class="textfield" readonly required="yes">
               	</div>
                <div class="field">
                  <label for="serial">Serial:</label>
                  <cfinput type="text" name="serial" id="serial"  value="#form.serial#"  class="textfield" readonly>
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
                  <input type="email" name="email" id="email" placeholder="Enter Member's Email"  class="textfield" autocomplete="off" required>
               	</div>
                <div class="field">
                  <label for="brandId">Select Network:</label>  
                   <cfselect name="brandId" id="brandId" bind="cfc:#request.cfc#cfc.bind.getAbrand()" display="brandId" value="brandId" bindonload="yes">
                   </cfselect>
              	</div>
                
                <div class="field">
                  <label for="productId">Select Denomination:</label>  
                   <cfselect name="productId" id="productId" bind="cfc:#request.cfc#cfc.bind.getADenom({brandId})" display="productID" value="productID" bindonload="yes">
                   </cfselect>
              	</div>
                <div class="field">
                  <label for="pin">Enter Pin:</label>
                  <input type="text" name="pin" id="pin" placeholder="Enter Pin Number"  class="textfield" autocomplete="off" required>
               	</div> 
                <div class="field">
                  <label for="serial">Enter Serial:</label>
                  <input type="text" name="serial" id="serial" placeholder="Enter Serial"  class="textfield" autocomplete="off">
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
