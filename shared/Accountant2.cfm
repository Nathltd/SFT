<div align="center">
<cfmenu name="menu" type="horizontal" childstyle="text-align:left" >
<cfmenuitem name="Home"
href="../index/index.cfm" display="Home"/>
<!--- The Products menu item has a pop-up menu. --->
<cfmenuitem name="Products" display="Products">
<cfmenuitem name="ListProduct" href="../Products/Productslist.cfm" display="Inventory List"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="ListCategory" href="../products/CategoryList.cfm" display="Category List"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="ListOpeningBalance" href="../OpeningBalance/OpeningBalanceList.cfm" display="O/B List"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="viewAdjustments" href="../Adjustments/AdjView.cfm" display="Inventory Adj. List"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="ProductActivities" href="../Reports/ProductActivity.cfm" display="Product Activities"/>
</cfmenuitem>

<!--- The Customers menu item has a pop-up menu. --->
<cfmenuitem name="Customers" display="Customers">
<cfmenuitem name="ListCustomer" href="../Customers/Customerslist.cfm" display="Customers' List"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="ListDepositCustomer" href="../Payment/PaymentList.cfm" display="Payment List"/>
</cfmenuitem>
<!--- The Supplier menu item has a pop-up menu. --->
<cfmenuitem name="Supplier" display="Supplier">
<cfmenuitem name="ListSupplier" href="../Vendors/Vendorslist.cfm" display="Suppliers' List"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="ExpenseActivity" href="../Reports/expensesActivity.cfm" display="Expenditures"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="ExpenseAccountList" href="../Expenses/expenseAcctList.cfm" display="Expense Accounts"/>
</cfmenuitem>
<!--- The Company menu item has a pop-up menu. --->
<cfmenuitem name="Company" display="Company">
<cfmenuitem name="ClosingDate" href="../Company/ClosingDate.cfm" display="Closing Date"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="Password" href="../Users/EditPassword.cfm" display="Change Password"/>
</cfmenuitem>

<!--- The Banks menu item has a pop-up menu. --->
<cfmenuitem name="Banks" display="Bank">
<cfmenuitem name="AccountStatus" href="../Reports/AccountFiscalBal.cfm" display="Status"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="AccountSearch" href="../Reports/AccountFiscalBalSearch.cfm" display="Cash Flow..."/>
<cfmenuitem divider="true"/>
<cfmenuitem name="CashTransferList" href="../Bank/fundTransferList.cfm" display="Transfer Search..."/>
</cfmenuitem>

<!--- The Reports menu item has a pop-up menu. --->
<cfmenuitem name="Reports" display="Reports">
<cfmenuitem name="Financials" display="Financials">
<cfmenuitem name="Marketers" href="../Reports/MarketersReport.cfm" display="Sales Chart"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="Expenditure" href="../Reports/Expenditure.cfm" display="Monthly Expend."/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="Customer" display="Customer">
<cfmenuitem name="CustomerInvoice" href="../Reports/CustomerInvoice.cfm" display="Invoice"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="debtorsBalance" href="../Reports/CustomerFiscalBal_Debtors.cfm" display="Debtors"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="creditorsBalance" href="../Reports/CustomerFiscalBal_Creditors.cfm" display="Creditors"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="FiscalBalance" href="../Reports/CustomerFiscalBal.cfm" display="Balance"/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="SupplierID" display="Supplier">
<cfmenuitem name="SupplierInvoice" href="../Reports/SupplierInvoice.cfm" display="Invoice"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="balID" display="Balance">
<cfmenuitem name="SupplierFiscalBalance" href="../Reports/SupplierFiscalBal.cfm" display="Suppliers"/>
<cfmenuitem divider="true"/>
<cfmenuitem name="SupplierFiscalBalVen" href="../Reports/SupplierFiscalBalVen.cfm" display="Vendors"/>
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="PurchaseValue" href="../Reports/purchaseAnalysis.cfm" display="Invoice Valuation" />
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="BranchReports" display="Stock">
<cfmenuitem name="BranchReportcur" href="../Reports/AllBranches.cfm" display="Current" />
<cfmenuitem divider="true"/>
<cfmenuitem name="BranchReportpre" href="../Reports/inventoryStatusSearch.cfm" display="Previous" />
</cfmenuitem>
<cfmenuitem divider="true"/>
<cfmenuitem name="AllSales" display="Sales">
<cfmenuitem name="SalesSearch" href="../Reports/SalesSearch.cfm" display="Search..."/>
<cfmenuitem divider="true"/>
<cfmenuitem name="CashPayment" href="../Reports/AllSalesCashByDate.cfm" display="Cash Payments" />
</cfmenuitem>
</cfmenuitem>
</cfmenu>
</div>