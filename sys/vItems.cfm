<cfset itemsArray = ArrayNew(1) />
 
<cfquery name="qryItems" maxrows="10">
    Select productId from products
     where productId like <cfqueryparam value="%#URL.term#%" cfsqltype="cf_sql_varchar">
     order by productId
</cfquery>
 
<cfloop query="qryItems">
    <cfset itemStruct = StructNew() />
    <cfset itemStruct["label"] = productId />     
    <cfset ArrayAppend(itemsArray,itemStruct) />
</cfloop>
 
<cfoutput>
#serializeJSON(itemsArray)#
</cfoutput>
