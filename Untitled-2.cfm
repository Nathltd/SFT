<script src="googleJquery-min.js"></script>
<script type="text/javascript">
	$(document).ready(function($) {
		$.ajax({
         url:"cfc/bind.cfc?method=getAllStaff&returnFormat=json",
         dataType:"json",
         async: false,
         cache: false,
         dataFilter: function(data) {
            data = JSON.parse(data);
		        data = data.DATA;
           firstName = data.FIRSTNAME;
           lastName = data.LASTNAME;
           staffId = data.STAFFID;
           var options = "";
         for (var i = 0; i < firstName.length; i++) {
             options += "<option value='"+staffId[i]+"'>" + firstName[i] +" " + lastName[i] +" [" + staffId[i] +"] </option>";
         }
           $("#accountOfficer").html(options);
          },
    });
    
    $('#accountOfficer').change(function(e) {
      var officer = $("#accountOfficer").val();
		  $('#customerId').find('option').remove().end();
      $.ajax({
         url:"cfc/bind.cfc?method=getCustomersByStaff&staff="+officer+"&returnFormat=json",
         dataType:"json",
         async: false,
         cache: false,
         dataFilter: function(data) {
            data = JSON.parse(data);
		        data = data.DATA;
           cName = data.CUSTOMERNAME;
           code = data.CODE;
           customerId = data.CUSTOMERID;
           var options = "";
         for (var i = 0; i < code.length; i++) {
             options += "<option value='"+customerId[i]+"'>" + cName[i] +"  [" + code[i] +"] </option>";
         }
           $("#customerId").html(options);
          },
    });
      
    });
    $('#customerId').change(function(e) {
      var officer = $('#customerId').val();
      console.log(officer);
    });
});
</script>
<cfoutput>
<form>

<div class="form-field">

										<label for="accountOfficer">Account Officer <span>*</span></label><br>

										<select id="accountOfficer" name="accountOfficer">
										</select>
									</div>

<select id="customerId">
	</select><br>

</form>
  </cfoutput>