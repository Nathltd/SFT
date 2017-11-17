<div align="center">
<cfmenu name="menu" type="horizontal"  childstyle="text-align:left" >
<cfmenuitem name="Home" href="../index/index.cfm" display="Home"/>

<!--- The Products menu item has a pop-up menu. --->
<cfmenuitem name="Products" display="Products">
<cfmenuitem name="Product" display="Product">
<cfmenuitem name="ListProduct" href="../Products/Productslist.cfm" display="List"/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="Category" display="Category">
<cfmenuitem name="ListCategory" href="../products/CategoryList.cfm" display="List"/>
</cfmenuitem>
</cfmenuitem>

<!--- The Customers menu item has a pop-up menu. --->
<cfmenuitem name="Customers" display="Customers">
<cfmenuitem name="Sales" display="Invoice" href="../sales/invoice.cfm" />
<cfmenuitem divider="true"/>
<cfmenuitem name="salesModify" display="Modify" href="../sales/updateInvoice2.cfm" />
<cfmenuitem divider="true"/>
<cfmenuitem name="ListCustomer" href="../Customers/Customerslist.cfm" display="List"/>
</cfmenuitem>
<!--- The Supplier menu item has a pop-up menu. --->
<cfmenuitem name="Supplier" display="Supplier"/>
<!--- The Company menu item has a pop-up menu. --->
<cfmenuitem name="Company" display="Company">
<cfmenuitem name="Users"  href="../Users/EditPassword.cfm" display="Change Password">
</cfmenuitem>
</cfmenuitem>

<!--- The Banks menu item has a pop-up menu. --->
<cfmenuitem name="Banks" display="Bank" />

<!--- The Reports menu item has a pop-up menu. --->
<cfmenuitem name="Reports" display="Reports">
<cfmenuitem name="CustomerInvoice" href="../Reports/CustomerInvoice.cfm" display="Invoice"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="SalesValue" href="../Reports/salesAnalysis.cfm" display="Invoice Valuation" />
</cfmenuitem>
</cfmenu>
</div>