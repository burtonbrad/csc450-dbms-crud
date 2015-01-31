<%@ page import="edu.georgetown.cs450.controller.Database"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%
  String id = null;

  if (request.getParameter("id") != null) {
    id = request.getParameter("id");
  } else {
    
    %>
    <jsp:forward page="/index.jsp" />
    <%
    
  }

  if (request.getMethod().equalsIgnoreCase("post")) {

      Database dbConn = new Database();
      dbConn.connect();
      PreparedStatement stmt =
          dbConn.getConn()
              .prepareCall("DELETE FROM customers where id = ?");
      stmt.setString(1, id);
      stmt.execute();
      stmt.close();
      dbConn.disconnect();
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
				<h3>Delete a Customer</h3>
			</div>

			<form class="form-horizontal" action="delete.jsp" method="post">
				<input type="hidden" name="id" value="<%=id%>" />
				<div class="alert alert-danger">Are you sure to delete ?</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-danger">Yes</button>
					<a class="btn" href="index.jsp">No</a>
				</div>
			</form>
		</div>

	</div>
	<!-- /container -->
</body>
</html>