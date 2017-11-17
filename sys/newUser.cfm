<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Baxany.com - Making Life Easier</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script src="../../googleJquery-min.js"></script>
</head>

<body>
<cfinclude template="../shared/AllMenu.cfm">
<div id="main">
<div id="headBanner">
<img src="../../images/banner1.jpg">
</div>
<div id="content">
<cfif #GetUserRoles()# is not 'Administrator' AND #GetUserRoles()# is not 'Alpha' AND #GetUserRoles()# is not 'Sales Rep'>
<h1> Unauthrised Zone </h1>
<cfelse>

<div>
<cfinclude template="../shared/Administrator.cfm">
</div>
<div id="details">

<div id="subtitle">New User</div>
<cfparam name="form.submit" default="">
<cfif isdefined(form.submit)>
<!--- would validate username/password here --->
<cfset form.PWord = #encrypt(form.PWord,"SHA-512")#>
<cfquery>
Insert into users (UserID,PWord,FirstName,LastName,email,Designation,phone,creator)
values(<cfqueryparam value="#form.UserID#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.PWord#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.FirstName#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.LastName#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.email#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.Designation#" cfsqltype="cf_sql_char">,<cfqueryparam value="#form.phone#" cfsqltype="cf_sql_char">,<cfqueryparam value="#getAuthUser()#" cfsqltype="cf_sql_char">)
</cfquery>
<div id="success" align="center"><cfoutput> New User created successfully.<a href="#cgi.SCRIPT_NAME#">Add New User</a></cfoutput></div>
<cfelse>
<cfquery name="designation">
select designationId from designation
where designationId <> 'alpha'
order by designationId
</cfquery>

<cfform name="Form" action="#cgi.SCRIPT_NAME#">
				
                <div class="field">
                  <label for="FirstName">First Name:</label>
                  <cfinput type="text" name="FirstName" id="FirstName" placeholder="Enter First Name"  class="textfield" autocomplete="off" required="yes" message="Enter First Name" autofocus>
               	</div>
                <div class="field">
                  <label for="LastName">Last Name:</label>
                  <cfinput type="text" name="LastName" id="LastName" placeholder="Enter Last Name"  class="textfield" autocomplete="off" required="yes" message="Enter Last Name">
               	</div>
                <div class="field">
                  <label for="UserID">User Id:</label>
                  <cfinput type="text" name="UserID" id="UserID" placeholder="Enter User Id"  class="textfield" autocomplete="off" required="yes" message="Enter User Id">
               	</div>
                <div class="field">
                  <label for="PWord">Password:</label>
                  <cfinput type="password" name="PWord" id="PWord" placeholder="Enter Password"  class="textfield" autocomplete="off" required="yes" message="Enter Password">
               	</div>
                <div class="field">
                  <label for="PWord2">Confirm:</label>
                  <cfinput type="password" name="PWord2" id="PWord2" placeholder="Confirm Password"  class="textfield" autocomplete="off" required="yes" message="Confirm Password">
               	</div>
                <div class="field">
                  <label for="email">Email:</label>
                  <cfinput type="text" name="email" id="email" placeholder="Enter Email"  class="textfield" autocomplete="off" required="yes" message="Enter Email" validate="email">
               	</div>
                             
                <div class="field">
                  <label for="Designation">Designation:</label>  
                   <cfselect name="Designation" id="Designation" tooltip="Brand" required="yes">
                   <cfoutput query="designation">
                   <option value="#designationId#">#designationId#</option>
                   </cfoutput>
                   </cfselect>
              	</div>
				<div class="field">
                  <label for="phone">Phone:</label>
                  <cfinput type="text" name="phone" id="phone" placeholder="Enter Phone Number"  class="textfield" autocomplete="off" required="yes" message="Enter Phone Number" validate="integer">
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
