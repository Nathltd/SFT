<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Baxany.com - Making Life Easier</title>
</head><link rel="stylesheet" type="text/css" href="../sys/style.css">

<body>
<cfinclude template="../shared/AllMenu.cfm">
<div id="main">
<div id="headBanner">
<img src="../../images/banner1.jpg">
</div>
<div id="content">
<div>
<cfinclude template="../shared/sideMenu.cfm">
</div>
<div id="details">
<cfquery name="logIn" maxrows="1">
select loginTime from logInfo
where userId = '#getAuthUser()#' and hits <> 0
order by loginTime desc 
</cfquery>
<cfquery name="wallet" maxrows="1">
select customerId, amount from wallet
where staffId = '#getAuthUser()#'
order by transactDate desc 
</cfquery>

<cfoutput>
<cfform name="Form" method="POST" action="#cgi.SCRIPT_NAME#">

                <div class="field">
                  <label for="logId">Login Id:</label>
                  <cfinput type="text" name="logId" id="logId" value="#getAuthUser()#" class="textfield" readonly>
               	</div>
                <div class="field">
                  <label for="lastLog">Last Login:</label>
                  <cfinput type="text" name="lastLog" id="lastLog" value="#login.loginTime#" class="textfield" readonly>
               	</div>                
                <div class="field">
                  <label for="wallet">Last Wallet Funded:</label>
                  <cfinput type="text" name="wallet" id="wallet"  value="#wallet.customerId#"  class="textfield" readonly>
               	</div>
                <div class="field">
                  <label for="amount">Last Wallet Funded:</label>
                  <cfinput type="text" name="amount" id="amount"  value="#numberFormat(wallet.amount)#"  class="textfield" readonly>
               	</div>


                </div>
                </cfform>
                </cfoutput>
</div>

</div>
</div>
</body>
</html>
