<div align="center">
<cfmenu name="menu" type="horizontal" fontsize="9" font="Segoe UI" childstyle="text-align:left" >
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
</cfmenuitem>


<!--- The Customers menu item has a pop-up menu. --->
<cfmenuitem name="Customers" display="Customers">
<cfmenuitem name="PaymentCustomer" display="Payment">
<cfmenuitem name="NewPaymentCustomer" href="../Payment/Payment.cfm" display="New"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="ListDepositCustomer" href="../Payment/PaymentList.cfm" display="List"/>
</cfmenuitem>
</cfmenuitem>
<!--- The Supplier menu item has a pop-up menu. --->
<cfmenuitem name="Supplier" display="Supplier">
<cfmenuitem name="Expense" display="Expenses">
<cfmenuitem name="Expenses" display="Expenses">
<cfmenuitem name="newExpense" href="../Expenses/expenses.cfm" display="New"/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="ExpenseActivity" href="../Reports/expensesActivity.cfm" display="Activities"/>
</cfmenuitem>
</cfmenuitem>

<!--- The Company menu item has a pop-up menu. --->
<cfmenuitem name="Company" display="Company" >
<cfmenuitem name="Users"  href="../Users/EditPassword.cfm" display="Change Password" />
</cfmenuitem>

<!--- The Banks menu item has a pop-up menu. --->
<cfmenuitem name="Banks"
display="Bank">
<cfmenuitem name="MaintainBanks" display="Bank">
<cfmenuitem name="AccountSearch" href="../Reports/AccountFiscalBalSearch.cfm" display="Cash Flow..."/>
<cfmenuitem divider="true"/>
<cfmenuitem name="AccountStatus" href="../Reports/AccountFiscalBal.cfm" display="Status"/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="Transfer" display="F-Transfer">
<cfmenuitem name="NewCashTransfer" href="../Bank/fundTransfer.cfm" display="New"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="CashTransferList" href="../Bank/fundTransferList.cfm" display="Search..."/>
</cfmenuitem>
</cfmenuitem>

<!--- The Reports menu item has a pop-up menu. --->
<cfmenuitem name="Reports" display="Reports">
<cfmenuitem name="Customer" display="Customer">
<cfmenuitem name="CustomerInvoice" href="../Reports/CustomerInvoice.cfm" display="Invoice"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="Customerpayment" href="../Reports/Customerpayment.cfm" display="Payments"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="CustomerCreditNote" href="../Reports/CustomerCreditNote.cfm" display="Credit Note"/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="BranchReports" href="../Reports/AllBranches.cfm" display="Branches" />
<cfmenuitem divider="true"/>
<cfmenuitem name="AllSales" display="Sales">
<cfmenuitem name="SalesSearch" href="../Reports/SalesSearch.cfm" display="Search..."/>
</cfmenuitem>
</cfmenuitem>
</cfmenu>
</div>