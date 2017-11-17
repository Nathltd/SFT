<script>
var age = 11;
function checkAge(){
	age = 15;

}	
	checkAge();
	console.log(age);
</script>


<script>
var x = 10;     // declare x

function foo() {
  x = 20;       // reassign the global x to 20
}

foo()           // call our function

console.log(x); // 20
</script>

<select>
<option value=''></option>
</select>
<cfparam name="staff" default="#arraynew(1)#" type="array">
  
<cfset arrayappend(staff,structnew())>
<cfset position = arraylen(staff)>
<cfset staff[position].Name = firstName>
<cfset staff[position].itemDescription = lastName>
<cfset staff[position].itemQuantity = staffId>
  
  <cfloop from="1" to="#arraylen(staff)#" index="counter">
