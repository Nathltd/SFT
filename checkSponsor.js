$(document).ready(function(){
	$('#stockCheck').hide();
	$('#sponsorId').blur(function(event) {
		$.ajax({type: "get", url: "cfc/bind.cfc",
			data: {
			method: "sponsor",
			returnFormat: "json",
			sponsorId:$('#sponsorId').val()
					},
			async: false,
		    cache: false,
		    dataType: 'json',
			dataFilter: function(data) {
			downLiners = parseInt(data);			
			}
			});
		 $.ajax({type: "get", url: "cfc/bind.cfc",
			data: {
			method: "sponsorName",
			returnFormat: "json",
			sponsorId:$('#sponsorId').val()
					},
			async: false,
		    cache: false,
		    dataType: 'json',
			dataFilter: function(data) {
			sponsorId = data;			
			}
			});
			
		if(downLiners >= 6){
				
				$('#stockCheck').show();
				$('#msg').text('This Sponsor is not Eligible!');
				$('#submit').attr('disabled',true);
				}
		else if(sponsorId == 0){
				
				$('#stockCheck').show();
				$('#msg').text('Invalid Sponsor!');
				$('#submit').attr('disabled',true);
				}
		else{		
				$('#stockCheck').show();
				$('#msg').text(sponsorId);
				$('#submit').attr('disabled',false);
				}
				});
						});
		$('#sponsorId').click(function(event) {
			
			$('#stockCheck').hide();
			
		});