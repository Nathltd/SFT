<script src="googleJquery-min.js"></script>
<cfparam name="form.username" default="">
<cfparam name="form.password" default="">
<cfif isdefined("url.logout")> 
<cflogout>
<cflocation url="../index/index.cfm">
</cfif>
<cflogin idletimeout="2000">
<cfif GetAuthUser() is "" and not isdefined("form.login")>
<cfinclude template="Authenticate.cfm">
<cfabort>
<cfelse>
<!--- would validate username/password here --->
<cfset form.password = #encrypt(form.password,"SHA-512")#>
<cfquery name="LoginInfo">
SELECT UserID, Pword, Designation, FirstName, LastName
FROM Users
WHERE UserID = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_clob"> AND Pword = <cfqueryparam value="#form.password#" cfsqltype="cf_sql_clob"> 
</cfquery>
<!--- If the username and password are correct --->
<cfset comparePword = Compare(LoginInfo.Pword, form.password)>
<cfif LoginInfo.recordCount eq 1 AND LoginInfo.Designation neq 'Inactive' AND comparePword eq 0>
<!--- Remember user’s logged-in status, plus --->
<!--- ContactID and First name, in structure --->
<cfset session.auth = structnew()>
<cfset session.auth.isLoggedIn = "Yes">
<cfset session.auth.firstname = #LoginInfo.FirstName#>
<cfset session.auth.loginTime = #CreateODBCDate(now())#>
<cfset session.auth.Designation = #LoginInfo.Designation#>
<cfset session.auth.UserID = #LoginInfo.UserID#>
<cfquery datasource="#request.dsn#">
    Update logInfo
    Set
    userId = <cfqueryparam cfsqltype="cf_sql_varchar" value="#LoginInfo.UserID#">
    Where sessionId = <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.URLToken#">
    </cfquery>

<cfoutput>
<cfset loginTime = #session.auth.loginTime#>
<cfset clsDateSubscribe = #request.clsDateSubscribe#>
<cfset type = "d">
<cfset subscriptionDays = #datediff(type,loginTime,clsDateSubscribe)#>
<cfif #subscriptionDays# lt 1><br>
<cfif #session.auth.Designation# is "Alpha">
<script>
alert('Subscription Remaining #subscriptionDays# days');
</script>
<cfelse>
<h2>Subscription Expired!</h2><br>
Please Contact System Administrator.
<cfabort>
</cfif>
<cfelseif #subscriptionDays# lt 14>
<script>
alert('Subscription Remaining #subscriptionDays# days');
</script>
</cfif>
</cfoutput>
<cfelse>
    <cfinclude template="../index/LoginErr.cfm">
  <cfabort>
</cfif>
<cfloginuser name="#form.username#" password="#form.password#" roles="#loginInfo.Designation#">
</cfif>
</cflogin>
<!--- GetAuthUser() returns the empty string if not logged in --->
<cfif GetAuthUser() is not "">
  <!-- end #header -->

<!---<div class="logged">&nbsp;You are Logged in as <cfoutput><strong> #GetAuthUser()# </strong>[#GetUserRoles()#]</cfoutput> | <a href="#" id="linkd">Profile</a> | <a href="?logout" id="linkd">Log Out</a></div>--->
</cfif>

<!--- To control Closing Time for this Application (not Applicable to Administrators) --->

<cfset info = GetTimeZoneInfo()> 

<cfset currentHour = #hour(Now())# + #info.utcHourOffset#+1>
<cfif currentHour gte 24>
<cfset currentHour = #currentHour# - 24>
</cfif>

<cfif #GetUserRoles()# is not 'Administrator' AND #GetUserRoles()# is not 'Alpha'>
<cfif currentHour lt 8 OR currentHour gt 19>
<cfinclude template="noServer.cfm">
<cfabort>
</cfif>
</cfif>