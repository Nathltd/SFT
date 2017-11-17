<cfcomponent>

<!--- Get Sponsor's Eligibility --->
<cffunction name="sponsor" access="remote" returnType="string" hint="Get Sponsor's Eligibility">
<cfargument name="sponsorId" type="string">
<!--- Define variables --->
<cfset var data="">
<!--- Get data --->
<cfquery name="data">
SELECT Count(upline2) AS Counts
FROM referrals
WHERE upline2 ='#ARGUMENTS.sponsorId#' AND upline2 <>'New Heaven'
</cfquery>
<cfset checkValue =ValueList(data.Counts)>
<!--- And return it --->
<cfreturn checkValue>
</cffunction>

<!--- Validate Sponsor --->
<cffunction name="sponsorName" access="remote" returntype="string" hint="Validate Sponsor">
<cfargument name="sponsorId" type="string">
<!--- Define variables --->
<cfset var data="">
<!--- Get data --->
<cfquery name="data">
SELECT firstName, lastName
FROM membership
WHERE userId ='#ARGUMENTS.sponsorId#'
</cfquery>
<cfif #data.recordCount# eq 0>
<cfset myarray = ArrayNew(1)>
	<cfset myarray[1]= 0> 
 <cfelse>
<cfloop query="data"> 
    <cfset myarray[1]=LastName> 
    <cfset myarray[2]=FirstName> 
</cfloop>
</cfif>
<cfset myarray = arrayToList(myarray, " ")>

<!--- And return it --->
<cfreturn myarray>
</cffunction>

<!---<!--- Validate UserId --->
<cffunction name="User" access="remote" returntype="string" hint="Validate User ID">
<cfargument name="userId" type="string">
<!--- Define variables --->
<cfset var data="">
<!--- Get data --->
<cfquery name="data">
SELECT userid
FROM membership
WHERE userId ='#ARGUMENTS.sponsorId#'
</cfquery>

<cfset data  = #data.recordCount#>


<!--- And return it --->
<cfreturn data>
</cffunction>--->


</cfcomponent>