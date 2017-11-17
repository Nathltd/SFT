
<cfif #GetUserRoles()# is "Administrator">
<cfinclude template="../shared/Administrator.cfm">
<cfelseif #GetUserRoles()# is "Alpha">
<cfinclude template="../shared/Alpha.cfm">
<cfelseif #GetUserRoles()# is "User">
<cfinclude template="../shared/User.cfm">
<cfelse>
</cfif>
