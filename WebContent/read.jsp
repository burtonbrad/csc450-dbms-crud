<%@ page import="edu.georgetown.cs450.controller.Database"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%
  String id = null;
  String name = "";
  String email = "";
  String mobile = "";
  
  if (request.getParameter("id") != null) {
    id = request.getParameter("id");
    
    Database dbConn = new Database();
    dbConn.connect();
    PreparedStatement stmt =
        dbConn.getConn()
            .prepareCall("SELECT * FROM customers where id = ?");
    stmt.setString(1, id);
    ResultSet rs = stmt.executeQuery();
    if (rs.next()) {
      name = rs.getString("name");
      email = rs.getString("email");
      mobile = rs.getString("mobile");
    }
    rs.close();
    stmt.close();
    dbConn.disconnect();
    
  } else {
    
    %>
    <jsp:forward page="/index.jsp" />
    <%
    
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">

		<div class="span10 offset1">
			<div class="row">
				<h3>Read a Customer</h3>
			</div>

			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label">Name</label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<%=name%>
						</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Email Address</label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<%=email%>
						</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Mobile Number</label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<%=mobile%>
						</p>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<a class="btn" href="index.jsp">Back</a>
					</div>
				</div>


			</div>
		</div>

	</div>
	<!-- /container -->
</body>
</html>