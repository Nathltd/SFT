<cfparam name="form.username" default="">
<cfparam name="form.password" default="">
<cfif isdefined("url.logout")> 
<cflogout>
<cflocation url="dashboard.cfm">
</cfif>
<cfquery name="LoginInfo">
SELECT UserID, Pword, Designation, FirstName, LastName, email, phone
FROM Users
WHERE UserID = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_clob"> AND Pword = <cfqueryparam value="#form.password#" cfsqltype="cf_sql_clob"> 
</cfquery>
<cflogin idletimeout="600">
<cfif GetAuthUser() is "" and not isdefined("form.login")>
<cfinclude template="Authenticate.cfm">
<cfabort>
<cfelse>
<!--- would validate username/password here --->
<!---<cfset form.password = #encrypt(form.password,"SHA-512")#>--->

<!--- If the username and password are correct --->
<cfset comparePword = Compare(LoginInfo.Pword, form.password)>
<cfif LoginInfo.recordCount eq 1 AND LoginInfo.Designation neq 'Inactive' AND comparePword eq 0>
<!--- Remember user’s logged-in status, plus --->
<!--- ContactID and First name, in structure --->
<cfset session.auth = structnew()>
<cfset session.auth.isLoggedIn = "Yes">
<cfset session.auth.firstname = #LoginInfo.FirstName#>
<cfset session.auth.lastname = #LoginInfo.lastname#>
<cfset session.auth.loginTime = #CreateODBCDate(now())#>
<cfset session.auth.Designation = #LoginInfo.Designation#>
<cfset session.auth.UserID = #LoginInfo.UserID#>
<cfset session.auth.Email = #LoginInfo.Email#>
<cfset session.auth.Phone = #LoginInfo.Phone#>
<cfquery datasource="#request.dsn#">
    Update logInfo
    Set
    userId = <cfqueryparam cfsqltype="cf_sql_varchar" value="#LoginInfo.UserID#">
    Where sessionId = <cfqueryparam cfsqltype="cf_sql_varchar" value="#session.URLToken#">
    </cfquery>

<cfoutput>
<cfset loginTime = #session.auth.loginTime#>
</cfoutput>
<cfelse>
    <cfinclude template="LoginErr.cfm">
  <cfabort>
</cfif>
<cfloginuser name="#form.username#" password="#form.password#" roles="#loginInfo.Designation#">
</cfif>
</cflogin>

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


