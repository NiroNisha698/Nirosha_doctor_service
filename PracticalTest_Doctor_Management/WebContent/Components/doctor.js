$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});



//SAVE ============================================ 
$(document).on("click", "#btnSave", function(event) { 
	// Clear alerts---------------------
							 $("#alertSuccess").text("");
							$("#alertSuccess").hide();
							 $("#alertError").text("");
							 $("#alertError").hide();
							 

// Form validation------------------- 
var status = validateDoctorForm();
if (status != true) 
{ 
	$("#alertError").text(status);
	$("#alertError").show(); 
	return; 
	}		


//If valid------------------------ 
var type = ($("#hidDIDSave").val() == "") ? "POST" : "PUT"; 

$.ajax( 
		{  
	url : "DoctorAPI",  
	type : type,  
	data : $("#formDoctor").serialize(),  
	dataType : "text",  
	complete : function(response, status) 
	{   
		onDoctorSaveComplete(response.responseText, status);
		} 
});

});




//save response
function onDoctorSaveComplete(response, status) 
{  
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response); 

if (resultSet.status.trim() == "success")  
{    
	$("#alertSuccess").text("Successfully saved.");
	$("#alertSuccess").show();
	
	$("#divDoctorGrid").html(resultSet.data);   
	} else if (resultSet.status.trim() == "error")  
	{   
		$("#alertError").text(resultSet.data);    
		$("#alertError").show();
		} 
	

} else if (status == "error")  
{   
	$("#alertError").text("Error while saving.");   
	$("#alertError").show();  
	} else  
	{   
		$("#alertError").text("Unknown error while saving..");   
		$("#alertError").show();
		} 


$("#hidDIDSave").val("");  
$("#formDoctor")[0].reset(); 

}




//UPDATE========================================== 
$(document).on("click",".btnUpdate",function(event) {
			$("#hidDIDSave").val($(this).closest("tr").find('#hidDIDUpdate').val());
			$("#Name").val($(this).closest("tr").find('td:eq(0)').text());
			$("#Specialization").val($(this).closest("tr").find('td:eq(1)').text());
			$("#NIC").val($(this).closest("tr").find('td:eq(2)').text());
			$("#Mobile").val($(this).closest("tr").find('td:eq(3)').text());
			$("#Email").val($(this).closest("tr").find('td:eq(4)').text());
			$("#DoctorFee").val($(this).closest("tr").find('td:eq(5)').text());
		}); 




//Remove(request algorithm)=========================================
$(document).on("click", ".btnRemove", function(event)
		{  
	$.ajax(  
			{   
				url : "DoctorAPI",   
				type : "DELETE",   
				data : "DID=" + $(this).data("did"),   
				dataType : "text",   
				complete : function(response, status)   
				{    
					onDoctorDeleteComplete(response.responseText, status);   
					}  
			}); 
});




//delete response algorithm
function onDoctorDeleteComplete(response, status) 
{  
	if (status == "success")
	{   
		var resultSet = JSON.parse(response); 

if (resultSet.status.trim() == "success")   
{    
	$("#alertSuccess").text("Successfully deleted.");    
	$("#alertSuccess").show(); 

 $("#divDoctorGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error")   
 {    
	 $("#alertError").text(resultSet.data);    
	 $("#alertError").show();   
	 } 

} else if (status == "error")  
{   
	$("#alertError").text("Error while deleting.");   
	$("#alertError").show(); 
	} else  
	{   
		$("#alertError").text("Unknown error while deleting..");   
		$("#alertError").show();  
		} 
	}





//CLIENTMODEL========================================================================= 
function validateDoctorForm() {  
	// Name 
	if ($("#Name").val().trim() == "") 
	{
		return "Insert Doctor Name.";
		}
	 
	 // Specialization 
	if ($("#Specialization").val().trim() == "")
	{ 
		return "Insert Doctor Specialization."; 
		}
	 
	// Doctor NIC Number-------------------------------  
	if ($("#NIC").val().trim() == "") 
	{   
		return "Insert NIC number.";  
		} 
	
	
	 
	// Doctor Mobile Number-------------------------------  
	if ($("#Mobile").val().trim() == "") 
	{   
		return "Insert Mobile number.";  
		} 
	
	
	// Doctor Email ID------------------------  
	if ($("#Email").val().trim() == "") 
	{   
		return "Insert Email ID.";
		} 
	
	
	
	// Doctor Fee------------------------  
	if ($("#DoctorFee").val().trim() == "") 
	{   
		return "Insert Doctor Fee";
		} 
	
	
	 // is numerical value  
	var tmpDoctorFee = $("#DoctorFee").val().trim();  
	if (!$.isNumeric(tmpDoctorFee))  
	{   
		return "Insert a numerical value for Doctor Fee."; 
		} 
	 
	 // convert to decimal price  
	$("#DoctorFee").val(parseFloat(tmpDoctorFee).toFixed(2)); 
	 
	 
	 
	 
	return true; 
	
} 





