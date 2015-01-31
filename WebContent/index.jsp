<%@ page import="edu.georgetown.cs450.controller.Database"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<h3>JSP CRUD Grid</h3>
		</div>
		<div class="row">

			<p>
				<a href="create.jsp" class="btn btn-success">Create</a>
			</p>

			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Name</th>
						<th>Email Address</th>
						<th>Mobile Number</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					  Database dbConn = new Database();
					  dbConn.connect();

					  Statement stmt = dbConn.getConn().createStatement();
					  ResultSet rs =
					      stmt.executeQuery("SELECT * FROM customers ORDER BY id DESC");

					  while (rs.next()) {

					    out.println("<tr>");
					    out.println("<td>" + rs.getString("name") + "</td>");
					    out.println("<td>" + rs.getString("email") + "</td>");
					    out.println("<td>" + rs.getString("mobile") + "</td>");
					    out.println("<td>");
					    out.println("<a href=\"read.jsp?id=" + rs.getString("id") + "\" class=\"btn btn-default\">Read</a>");
					    out.println("<a href=\"update.jsp?id=" + rs.getString("id") + "\" class=\"btn btn-success\">Update</a>");
					    out.println("<a href=\"delete.jsp?id=" + rs.getString("id") + "\" class=\"btn btn-danger\">Delete</a>");
					    out.println("</td>");
					    out.println("</tr>");

					  }

					  dbConn.disconnect();
					%>
				</tbody>
			</table>
		</div>
	</div>
	<!-- /container -->
</body>
</html>
