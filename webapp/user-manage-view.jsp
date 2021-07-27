<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<style type="text/css">
</style>
</head>
<body>

	<div class="main-container">
		<!-- header start -->
		<jsp:include page="nav-bar.jsp"></jsp:include>
		<!-- header end -->

		<div class="card m-3">
			<div class="card-header d-flex justify-content-between">
				<h5>Manage User Details</h5>
				<button class="btn btn-success" type="button" data-toggle="modal"
					data-target="#staticBackdrop">New</button>
			</div>

			<div class="card-body">

				<table class="display" id="userTable" style="width:100% ; position: relative;">
					<thead>
						<tr>
							<th >#UID</th>
							<th >User Name</th>
							<th >Address</th>
							<th >Nationality</th>
							<th >NIC</th>
							<th >DOB</th>
							<th >Gender</th>
							<th >Action</th>
						</tr>
					</thead>
					<tbody id="userTableBody">
						<%-- <c:forEach var="user" items="${listUsers}">
										<tr>
											<td><c:out value="${user.userID}" /></td>
											<td><c:out value="${user.userName}" /></td>
											<td><c:out value="${user.address}" /></td>
											<td><c:out value="${user.nationality}" /></td>
											<td><c:out value="${user.nic}" /></td>
											<td><c:out value="${user.dateOfBirth}" /></td>
											<td><c:out value="${user.age}" /></td>
											<td><c:out value="${user.gender}" /></td>
											<td>
											<a class="btn btn-success" href="edit?id=<c:out value='${user.userID}'/>">
											EDIT</a>
												&nbsp;&nbsp;&nbsp;&nbsp; <a
												class="btn btn-danger"
												href="delete?id=<c:out value='${user.userID}' />">REMOVE</a></td>
										</tr>
									</c:forEach> --%>
					</tbody>
				</table>


			</div>
		</div>
		<!-- New User Add Modal -->
		<div class="modal fade" id="staticBackdrop" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Add New User</h5>
						<a type="button" class="close" data-dismiss="modal"
							aria-label="Close"> <span aria-hidden="true">&times;</span>
						</a>
					</div>
					<div class="modal-body">

						<form id="userAddForm">

							<div class="form-group">
								<input class="form-control form-control-sm" type="text"
									placeholder="Full Name" name="username" required="required">
							</div>
							<div class="form-group ">
								<input class="form-control form-control-sm" type="text"
									placeholder="Address" name="address" required="required">
							</div>
							<div class="form-group ">
								<input class="form-control form-control-sm" type="text"
									placeholder="Nationality" name="nationality"
									required="required">
							</div>
							<div class="form-group ">
								<input class="form-control form-control-sm" type="text"
									placeholder="nic" name="nic" required="required" id="userNIC">
							</div>
							<!-- user nic card view -->
							<div id="nic-card-view"></div>

							<!-- card view footer -->
							<div id="user-addbtn-view"></div>

						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
	
	$(document).ready(function() {
		$('#userTable').DataTable();
	} );
	function getAllUsers(){
		
		$('#userTableBody').empty();
		
		 $.ajax({
			 type: "GET",
			 url: 'user/list',
			 async: false,
	         dataType:"json",
	         success:function (response){
				 console.log(response);
				 
				 for(let i in response){
					 let user = response[i];
				 
				 
		      	 let tableRow = "<tr>\n" +
                 "    <td>"+user.userID+"</td>\n" +
                 "    <td>"+user.userName+"</td>\n" +
                 "    <td>"+user.address+"</td>\n" +
                 "    <td>"+user.nationality+"</td>\n" +
                 "    <td>"+user.nic+"</td>\n" +
                 "    <td>"+user.dateOfBirth+"</td>\n" +
                 "    <td>"+user.gender+"</td>\n" +
                 "\n" +
                 "    <td>\n" +
                 "        <a class=\"btn btn-success\" onclick=\"editUser("+user.userID+")\"><i class=\"far fa-edit\"></i></a>\n" +
                 "         <a class=\"btn btn-danger\" onclick=\"deleteUser("+user.userID+")\"><i class=\"far fa-trash-alt\"></i></a>\n" +
                 "    </td>\n" +
                 "</tr>";
                 
		      	$('#userTableBody').append(tableRow);
                 
				 }
			 },
			
			 error:function(error){
				 
			 }
		});
      	
	}
	
	getAllUsers();
	
	function addUserDetsils(){
	
		console.log("clicked..");
		/* let userName = $('#').val(); */
		let formData = $('#userAddForm').serializeArray();
		/* formData.append("dateOfBirth",new Date());
		formData.append("age",);
		formData.append("gender",$('#gender').text()); */
		
		console.log($('#dateOfBirth').text());
		
		formData.push({name: "dateOfBirth",value : $('#dateOfBirth').text()}); 
		formData.push({name: "age", value: $('#age').text()}); 
		formData.push({name: "gender", value: $('#gender').text()}); 
		
		$.ajax({
	        type: "post",
	        url: 'user/insert',
	        data: formData,
	        async: false,
	        success:function (response){
	        	
	        	if(response){
	        		
	        		Swal.fire(
	        				  'Good job!',
	        				  'User Added Success..!',
	        				  'success'
	        				)
	        		$('#userAddForm')[0].reset();
	        		$('#staticBackdrop').modal('hide');
	        		$('#nic-card-view').empty();
	                $('#user-addbtn-view').empty();
	                getAllUsers();
	        		
	        		
	        	}else{
	        		Swal.fire(
	        				  'Oops!',
	        				  'User Added Failed..!',
	        				  'error'
	        				)
	        	}
	        },
	        error:function (error){
	        	alert(error);
	        },
	    });
	}
	
	
	function validationNIC(nicNumber) {
	    var result = false;
	    if (nicNumber.length === 10 && !isNaN(nicNumber.substr(0, 9)) && isNaN(nicNumber.substr(9, 1).toLowerCase()) && ['x', 'v'].includes(nicNumber.substr(9, 1).toLowerCase())) {
	        result = true;
	    } else if (nicNumber.length === 12 && !isNaN(nicNumber)) {
	        result = true;
	    } else {
	        result = false;
	    }
	    return result;
	}
	

	
	$('#userNIC').keyup((event)=>{

	    let userNICNo = $('#userNIC').val();

	    if(validationNIC(userNICNo)){
	        console.log(userNICNo);
	        $.ajax({
	            type: "GET",
	            url: 'user/nic-validation?nic='+userNICNo,
	            async: false,
	            dataType:"json",
	            success:function (response){

	                if(response){
	                   
	                    console.log(response);
	                    $('#nic-card-view').empty();
	                    $('#user-addbtn-view').empty();
	                    var nic_card_view ;
	                    
	                    if(response['gender'] == "Male"){
	                    	
	                    	  nic_card_view = "<div class=\"card mb-3\">\n" +
	                         "    <div class=\"row no-gutters\">\n" +
	                         "        <div class=\"col-md-4 d-flex justify-content-center\">\n" +
	                         "            <img src=\"dist/bin/img/user.png\" alt=\"#\" class=\"m-1\">\n" +
	                         "        </div>\n" +
	                         "        <div class=\"col-md-8\">\n" +
	                         "            <div class=\"card-body text-center\">\n" +
	                         "                <h5 class=\"card-title text-info\">Personal Detail</h5>\n" +
	                         "\n" +
	                         "                <div class=\"row justify-content-around\">\n" +
	                         "                    <p>DOB</p>\n" +
	                         "                    <p class=\"card-text\" id=\"dateOfBirth\" name=\"dateOfBirth\">"+response['year']+"/"+response['month']+"/"+response['day']+"</p>\n" +
	                         "                </div>\n" +
	                         "\n" +
	                         "                <div class=\"row justify-content-around\">\n" +
	                         "                    <p>AGE</p>\n" +
	                         "                    <p class=\"card-text\" id=\"age\" name=\"age\">"+response['age']+"</p>\n" +
	                         "                </div>\n" +
	                         "\n" +
	                         "                <div class=\"row justify-content-around\">\n" +
	                         "                    <p>GENDER</p>\n" +
	                         "                    <p class=\"card-text\" id=\"gender\" name=\"gender\">"+response['gender']+"</p>\n" +
	                         "                </div>\n" +
	                         "\n" +
	                         "            </div>\n" +
	                         "        </div>\n" +
	                         "    </div>\n" +
	                         "</div>";
	                        
	                    }
	                    
	                   if(response['gender'] == "Female"){
	                    	
	                	   nic_card_view = "<div class=\"card mb-3\">\n" +
	                         "    <div class=\"row no-gutters\">\n" +
	                         "        <div class=\"col-md-4 d-flex justify-content-center\">\n" +
	                         "            <img src=\"dist/bin/img/she_user.png\" alt=\"#\" class=\"m-1\">\n" +
	                         "        </div>\n" +
	                         "        <div class=\"col-md-8\">\n" +
	                         "            <div class=\"card-body text-center\">\n" +
	                         "                <h5 class=\"card-title text-info\">Personal Detail</h5>\n" +
	                         "\n" +
	                         "                <div class=\"row justify-content-around\">\n" +
	                         "                    <p>DOB</p>\n" +
	                         "                    <p class=\"card-text\" id=\"dateOfBirth\" name=\"dateOfBirth\">"+response['year']+"/"+response['month']+"/"+response['day']+"</p>\n" +
	                         "                </div>\n" +
	                         "\n" +
	                         "                <div class=\"row justify-content-around\">\n" +
	                         "                    <p>AGE</p>\n" +
	                         "                    <p class=\"card-text\" id=\"age\" name=\"age\">"+response['age']+"</p>\n" +
	                         "                </div>\n" +
	                         "\n" +
	                         "                <div class=\"row justify-content-around\">\n" +
	                         "                    <p>GENDER</p>\n" +
	                         "                    <p class=\"card-text\" id=\"gender\" name=\"gender\">"+response['gender']+"</p>\n" +
	                         "                </div>\n" +
	                         "\n" +
	                         "            </div>\n" +
	                         "        </div>\n" +
	                         "    </div>\n" +
	                         "</div>";
	                    	
	                    } 
	                    
	                    
	                        
	                        let addBtn = "<div class=\"modal-footer\">\n" +
	                        "    <button type=\"button\" class=\"btn btn-primary\" id=\"userAddBtn\" onclick=\"addUserDetsils()\">ADD</button>\n" +
	                        "</div>";


	                $('#nic-card-view').append(nic_card_view);
	                $('#user-addbtn-view').append(addBtn);
	                

	                }else {
	                	/* alert("NIC NOT VALIED..!"); */
	                	
	                }
	                },
	                error:function (error){
	                	alert(error);
	                },
	         });
	                }else{
	               		 console.log("Valide ne");
	               		
	               		$('#nic-card-view').empty();
		                $('#user-addbtn-view').empty();
	                }

	});
	
	
	function deleteUser(userID){
		
		
		Swal.fire({
			  title: 'Do you want to remove user, That userID = '+userID+'?',
			  showCancelButton: true,
			  confirmButtonText: `DELETE`,
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
					 $.ajax({
						 type: "GET",
						 url: 'user/delete?id='+userID,
						 async: false,
				         success:function (response){
							 console.log(response);
								if(response){
									 Swal.fire('User Removed!', '', 'success')
									getAllUsers();
							 	}else{
							 		 Swal.fire('User Not Removed!', '', 'info')
							 	}
							},
						
						 error:function(error){
							 
						 }
					});
			   
			  } else if (result.isDenied) {
			    Swal.fire('Changes are not saved', '', 'info')
			  }
			})
		

		
	}
	
	function editUser(userID){
		
		 $.ajax({
			 type: "GET",
			 url: 'user/edit?id='+userID,
			 async: false,
			 dataType:"json",
	         success:function (response){
				 console.log(response);
					if(response != {}){
						
						alert(JSON.stringify(response));
						
						
				 	}else{
				 		alert("CAN'T EDIT THIS USER...!") 
				 	}
				},
			
			 error:function(error){
				 
			 }
		});
	}
	</script>

</body>
</html>