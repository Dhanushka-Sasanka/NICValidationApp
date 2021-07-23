<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">First</th>
							<th scope="col">Last</th>
							<th scope="col">Handle</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Larry</td>
							<td>the Bird</td>
							<td>@twitter</td>
						</tr>
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
									placeholder="Nationality" name="nationality" required="required">
							</div>
							<div class="form-group ">
								<input class="form-control form-control-sm" type="text"
									placeholder="nic" name="nic" required="required">
							</div>
							
							<div class="form-group ">
								<input class="form-control form-control-sm" type="text"
									placeholder="age" name="age" required="required">
							</div>
							
							<div class="form-group ">
								<input class="form-control form-control-sm" type="date"
									placeholder="dateOfBirth" name="dateOfBirth" required="required">
							</div>
							
							<div class="form-group ">
								<input class="form-control form-control-sm" type="text"
									placeholder="gender" name="gender" required="required">
							</div>
							
							<!-- <div class="card mb-3">
								<div class="row no-gutters">
									<div class="col-md-4 d-flex justify-content-center">
										<img src="dist/bin/img/user.png" alt="#" class="m-1">
									</div>
									<div class="col-md-8">
										<div class="card-body text-center">
											<h5 class="card-title text-info">Personal details</h5>

											<div class="row justify-content-around">
												<p class="">DOB</p>
												<p class="card-text" id="DateOfBirth"  >1995-12-21</p>
											</div>

											<div class="row justify-content-around">
												<p class="">AGE</p>
												<p class="card-text" id="age" >1995-12-21</p>
											</div>
											
											<div class="row justify-content-around">
												<p class="">GENDER</p>
												<p class="card-text" id="gender" >1995-12-21</p>
											</div>

										</div>
									</div>
								</div> 
							</div>-->

							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="userAddBtn">ADD</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	<script type="text/javascript">
	
	
	
	
	
	$('#userAddBtn').click(()=>{
		
		/* let userName = $('#').val(); */
		let formData = $('#userAddForm').serialize();
		
		$.ajax({
	        type: "post",
	        url: 'user/insert',
	        data: formData,
	        async: false,
	        success:function (response){
	        	
	        	if(response){
	        		alert("USER ADDED..!");
	        		$('#userAddForm')[0].reset();
	        		$('#staticBackdrop').modal('hide');
	        		
	        	}else{
	        		alert("USER NOT ADDED..!");
	        	}
	        },
	        error:function (error){
	        	alert(error);
	        },
	    });
	});
	
	</script>

</body>
</html>