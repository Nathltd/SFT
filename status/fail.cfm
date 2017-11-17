<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Baxany.com - Making Life Easier</title>
<link rel="stylesheet" type="text/css" href="../sys/style.css">
</head>

<body>
<div id="main">
<div id="headBanner">
<img src="../../images/banner1.jpg">
</div>
<div id="content">

<div id="details">

<div id="subtitle">Transaction Status</div>
<br>
<cfif not isdefined('session.phone')>
<span id="success"> Invalid Transaction</span>
<a href="../../instantpay.cfm">Try Again</a>
<cfelse>
<div><img src="../../images/failure.jpg"></div>
<cfoutput>
	<div class="field">
	<label for="email">Status:</label>  
	<Span class="textfield" id="email">Failed</Span>
    </div>
    <div class="field">
	<label for="email">Your Email:</label>  
	<Span class="textfield" id="email">#session.email#</Span>
    </div>
    <div class="field">
	<label for="phone">Your Phone:</label>  
	<Span class="textfield" id="phone">#session.phone#</Span>
    </div>
    <div class="field">
	<label for="brandId">Network:</label>  
	<Span class="textfield" id="brandId">#session.brandId#</Span>
    </div>
    <div class="field">
	<label for="productId">Item:</label>  
	<Span class="textfield" id="productId">#session.productId#</Span>
    </div>
    <div class="field">
	<label for="pValue">Naira Value:</label>  
	<Span class="textfield" id="pValue">#session.pValue#</Span>
    </div>
    <div class="field">
	<label for="pDate">Purchase Date:</label>  
	<Span class="textfield" id="pDate">#dateFormat(now(),"dd/mm/yyyy")#</Span>
    </div>
    </cfoutput>
    <cfmail to="#session.email#" from="sales@baxany.com(Baxany.com)" subject="Mail From Baxany.com" server="127.0.0.1" bcc="sales@baxany.com">
    
    Your Purchase of #session.productId# Voucher From Baxany.com:
    = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
    
    Status: Failed
    Transaction Date: #dateFormat(now(),"dd/mm/yyyy")#
    Id: #session.email#
    Phone: #session.phone#
    Network: #session.brandId#
    Product: #session.productId#
    Value (N): #session.pValue#
    
    Thanks for your patronage.
    
    <a href="http://www.baxany.com">Baxany.com</a>
    
    </cfmail>
    
    <cfset structdelete(session, 'productId')>
	<cfset structdelete(session, 'pValue')>
	<cfset structdelete(session, 'brandId')>
	<cfset structdelete(session, 'email')>
	<cfset structdelete(session, 'phone')>
</cfif>

</div>
</div>
<div id="footer"><cfoutput>#request.footer#</cfoutput><span>Powered by &nbsp;<a href="http://www.nathconcept.com">nathconcept.com</a></span></div>
</div>
</body>
</html>
