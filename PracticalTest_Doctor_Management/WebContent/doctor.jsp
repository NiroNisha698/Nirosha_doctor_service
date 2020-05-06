<%@page import="model.Doctor" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doctor Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/doctor.js"></script>
</head>

<body>

<div class="container" style="background-color: #bca9ff  ">
		<div class="row">
			<div class="col" >
			
			<h1 align="center"><b>Doctor Management - HealthCare System</b></h1>
			<br>
			<br>
			
			<p class="text-success" align="center"><b> IT18123814- Nirosha S. </b></p>
			
				
				<form id="formDoctor" name="formDoctor" method="post" action="doctor.jsp">
				<div style="background-color: #a8ebff;" class=box1>
					Name: <input id="Name" name="Name" type="text" placeholder="Dr. Name" class="form-control form-control-sm">
					<br> 
					Specialization:<input id="Specialization" name="Specialization" type="text" class="form-control form-control-sm">
					<br> 
					NIC:<input id="NIC" name="NIC" type="text" placeholder="123456789X"  class="form-control form-control-sm">
					<br> 
					
					Mobile: <input id="Mobile" name="Mobile" type="next" placeholder="07XXXXXXXX"  class="form-control form-control-sm">
					<br> 
					
					Email: <input id="Email" name="Email" type="text" placeholder="Email@email.com" class="form-control form-control-sm">
					<br>
					
					Doctor Fee: <input id="DoctorFee" name="DoctorFee" type="text" class="form-control form-control-sm">
					<br>
					</div>
					
					<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
					<input type="hidden" id="hidDIDSave" name="hidDIDSave" value="">
					
					
				</form>
				
				<br>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				
				
				<br>
				
				<div id="divDoctorGrid" style="background-color: #ecffa8" align="center" >
				<br>
				<%
					Doctor doctorObj = new Doctor();
					out.print(doctorObj.readDoctor());
				%>
				<br>
				</div>

<br>

			</div>
		</div>



	</div>

</body>
</html>