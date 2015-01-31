<%@ page import="edu.georgetown.cs450.controller.Database"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
</head>

<%
  //keep track validation errors
  String nameError = null;
  String emailError = null;
  String mobileError = null;

  // keep track post values
  String name = "";
  String email = "";
  String mobile = "";

  if (request.getMethod().equalsIgnoreCase("post")) {

    // keep track post values
    name = request.getParameter("name");
    email = request.getParameter("email");
    mobile = request.getParameter("mobile");

    // validate input
    boolean valid = true;
    if (name == null || name.trim().length() == 0) {
      nameError = "Please enter Name";
      valid = false;
    }

    if (email == null || email.trim().length() == 0) {
      emailError = "Please enter Email Address";
      valid = false;
    } else if (email.indexOf("@") == -1) {
      emailError = "Please enter a valid Email Address";
      valid = false;
    }

    if (mobile == null || mobile.trim().length() == 0) {
      mobileError = "Please enter Mobile Number";
      valid = false;
    }

    // insert data
    if (valid) {
      Database dbConn = new Database();
      dbConn.connect();

      String sql =
          "INSERT INTO customers (name,email,mobile) values(?, ?, ?)";

      PreparedStatement stmt = dbConn.getConn().prepareStatement(sql);

      stmt.setString(1, name);
      stmt.setString(2, email);
      stmt.setString(3, mobile);

      stmt.execute();

      dbConn.disconnect();
%>
<jsp:forward page="/index.jsp" />
<%
  }
  }
%>

<body>
	<div class="container">

		<div class="span10 offset1">
			<div class="row">
				<h3>Create a Customer</h3>
			</div>

			<form class="form-horizontal" action="create.jsp" method="post">
				<div class="form-group <%=nameError != null ? "has-error" : ""%>">
					<label class="col-sm-2 control-label" for="name">Name</label>
					<div class="col-sm-10">
						<input name="name" id="name" class="form-control" type="text"
							placeholder="Name" value="<%=name != null ? name : ""%>">
						<%
						  if (nameError != null) {
						%>
						<span class="help-inline"><%=nameError%></span>
						<%
						  }
						%>
					</div>
				</div>
				<div class="form-group <%=emailError != null ? "has-error" : ""%>">
					<label class="col-sm-2 control-label" for="email">Email
						Address</label>
					<div class="col-sm-10">
						<input name="email" id="email" class="form-control" type="text"
							placeholder="Email Address"
							value="<%=email != null ? email : ""%>">
						<%
						  if (emailError != null) {
						%>
						<span class="help-inline"><%=emailError%></span>
						<%
						  }
						%>
					</div>
				</div>
				<div class="form-group <%=mobileError != null ? "has-error" : ""%>">
					<label class="col-sm-2 control-label" for="mobile">Mobile
						Number</label>
					<div class="col-sm-10">
						<input name="mobile" id="mobile" class="form-control" type="text"
							placeholder="Mobile Number"
							value="<%=mobile != null ? mobile : ""%>">
						<%
						  if (mobileError != null) {
						%>
						<span class="help-inline"><%=mobileError%></span>
						<%
						  }
						%>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success">Create</button>
						<a class="btn" href="index.jsp">Back</a>
					</div>
				</div>
			</form>
		</div>

	</div>
	<!-- /container -->
</body>
</html>
