console.log("aaaaaaaaaaaaaaaaaaaaaaaa")
console.log("aaaaaaaaaaaaaaaaaaaaaaaa")
console.log("aaaaaaaaaaaaaaaaaaaaaaaa")
console.log("aaaaaaaaaaaaaaaaaaaaaaaa")
console.log("aaaaaaaaaaaaaaaaaaaaaaaa")

$("#building_id").hide(); // second dropdown is disable while first dropdown is empty
$("#battery_id").hide();
$("#customer_id").change(function(){
  	var project = $(this).val();
  	if(project == ''){
  		$("#building_id").hide();
  	}else{
  		$("#building_id").show();
  	}
  	$.ajax({
	    url: "/interventions/find_buildings",
	    method: "GET",  
	    dataType: "json",
	    data: {customer_id: $("#customer_id option:selected").val()},
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (data) {
	      	$("#building_id").empty();
	      	$("#building_id").append('<option>building_id</option>');
	      	for(var i = 0; i < data.length; i++){
	      		$("#building_id").append('<option value="' + data[i]["id"] + '">' +data[i]["id"] + '</option>');
	      	}
	    }
  	});
});


$("#battery_id").hide(); // second dropdown is disable while first dropdown is empty
$("#building_id").change(function(){
  	var project = $(this).val();
  	if(project == ''){
  		$("#battery_id").hide();
  	}else{
  		$("#battery_id").show();
  	}
  	$.ajax({
	    url: "/interventions/find_buildings",
	    method: "GET",  
	    dataType: "json",
	    data: {customer_id: $("#customer_id option:selected").val()},
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (data) {
	      	$("#battery_id").empty();
	      	$("#battery_id").append('<option>battery_id</option>');
	      	for(var i = 0; i < data.length; i++){
	      		$("#battery_id").append('<option value="' + data[i]["id"] + '">' +data[i]["id"] + '</option>');
	      	}
	    }
  	});
});