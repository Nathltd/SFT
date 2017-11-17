<div align="center">
<cfmenu name="menu" type="horizontal" childstyle="text-align:left" >
<cfmenuitem name="Home"
href="../index/index.cfm" display="Home"/>
<!--- The Products menu item has a pop-up menu. --->
<cfmenuitem name="Products" display="Products">
<cfmenuitem name="Product" display="Product">
<cfmenuitem name="ListProduct" href="../Products/Productslist.cfm" display="List"/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="Category" display="Category">
<cfmenuitem name="ListCategory" href="../products/CategoryList.cfm" display="List"/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="Transfers" display="Transfers">
<cfmenuitem name="NewTransfer" href="../Transfers/newTransfer.cfm" display="New"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="ListTransfer" href="../Reports/TransferSearch.cfm" display="List"/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="ProductActivities" href="../Reports/ProductActivity.cfm" display="Activities"/>
</cfmenuitem>


<!--- The Customers menu item has a pop-up menu. --->
<cfmenuitem name="Customers" display="Customers">
</cfmenuitem>
<!--- The Supplier menu item has a pop-up menu. --->
<cfmenuitem name="Supplier" display="Supplier">
</cfmenuitem>

<!--- The Company menu item has a pop-up menu. --->
<cfmenuitem name="Company" display="Company" >
<cfmenuitem name="Users"  href="../Users/EditPassword.cfm" display="Change Password" />
</cfmenuitem>

<!--- The Banks menu item has a pop-up menu. --->
<cfmenuitem name="Banks" display="Bank">
</cfmenuitem>

<!--- The Reports menu item has a pop-up menu. --->
<cfmenuitem name="Reports" display="Reports">
<cfmenuitem name="Customer" display="Customer">
<cfmenuitem name="CustomerInvoice" href="../Reports/CustomerInvoice.cfm" display="Invoice"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="CustomerCreditNote" href="../Reports/CustomerCreditNote.cfm" display="Credit Note"/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="BranchReports" display="Stock">
<cfmenuitem name="BranchReportcur" href="../Reports/AllBranches.cfm" display="Current" />
<cfmenuitem divider="true"/>
<cfmenuitem name="BranchReportpre" href="../Reports/inventoryStatusSearch.cfm" display="Previous" />
</cfmenuitem>
</cfmenuitem>
</cfmenu>
</div>