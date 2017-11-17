

<script type="text/javascript">
$(document).ready(function(){
	$('#menu li ul').css({
    display: "none",
    left: "auto"
  });
  $('#menu li').click(function() {
    $(this)
      .find('ul')
      .toggle('slow')
  });
});
</script>
<ul id="menu">
	<li><span>Manage Members</span>
    <ul>
        <li><a href="../sys/newUser.cfm">New User</a></li>
        <li><a href="../sys/memberList.cfm">Members List</a></li>
        <li><a href="../sys/creditMember.cfm">Credit a Member</a></li>
        <li><a href="../sys/creditHistory.cfm">Credit History</a> </li>
        <li><a href="#">Online Payments</a></li>
    </ul>
    </li>
    <li><span>Create Items</span>
    <ul>
        <li><a href="#">Create Brand</a></li>
        <li><a href="../sys/newItem.cfm">Create Item</a></li>
        <li><a href="../sys/postPins.cfm">Post Vouchers</a></li>
    </ul>
    </li>
    <li><span>Manage Items</span>
    <ul>
        <li><a href="../sys/productList.cfm">Items List</a></li>
        <li><a href="../sys/voucherList.cfm">Inventory List</a> </li>
        <li><a href="#">Sold Vouchers</a></li>
    </ul>
    </li>
    <li><span>Manage Profile</span>
    <ul>
        <li><a href="#">Account Details</a></li>
        <li><a href="#">Update Details</a> </li>
        <li><a href="#">Change Password</a></li>
    </ul>
    </li>
</ul>