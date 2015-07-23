<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sauna.*"%>
<%@ page import="java.util.List"%>
<%@page import="javax.servlet.http.*;"%>

<%
	HttpSession registro = request.getSession();
%>
<%
	String user = (String) registro.getAttribute("usuario");
%>
<%
	String mensajito = (String) request.getAttribute("mensajito");
%>
<%
	List<Queja> quejas = (List<Queja>) request.getAttribute("quejas");
%>
<%
	int i = 1;
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/stilo.css"
	media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Proyecto</title>
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
.patient table {
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 20px;
	margin: 45px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
}

.patient th {
	font-size: 15px;
	font-weight: normal;
	padding: 8px;
	background: #b9c9fe;
	border-top: 4px solid #aabcfe;
	border-bottom: 1px solid #fff;
	color: #039;
}

.patient td {
	padding: 8px;
	background: #e8edff;
	border-bottom: 1px solid #fff;
	color: #669;
	border-top: 1px solid transparent;
}

.patient tr:hover td {
	background: #d0dafd;
	color: #339;
}

#hgb {
	background: #b9c9fe;
	width: 200px;
	height: 100px;
	font-size: 25;
	color: black;
}
</style>
</head>
<body>
	<div align="center">
		<div>
			<h1><%=mensajito%></h1>
		</div>
			<table align="center" class="patient">
				<tr>
					<th></th>
					<th>Queja</th>
					<th>Empleado Reportado</th>
				</tr>
				<%
					for (Queja a : quejas) {
				%>
				<tr>
					<td>Usuario <%=i++%></td>
					<td><%=a.getQueja()%></td>
					<td><%if(a.getNempleado()!=null) a.getNempleado();%></td>
				</tr>
				<%
					}
				%>
			</table>
			<br> <br> 
	
	</div>
</body>
</html>