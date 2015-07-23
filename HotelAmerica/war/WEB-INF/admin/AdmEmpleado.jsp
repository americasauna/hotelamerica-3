<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="javax.print.attribute.DocAttribute"%>
<%@page import="com.google.appengine.api.search.Document"%>
<%@page import="sauna.*"%>
<%@page import="beans.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.jdo.Query"%>
<%@page import="javax.jdo.PersistenceManager"%>
    <%
    System.out.println("llega al jsp");
    String mensajito = (String) request.getAttribute("mensajito");
	int i=0;
    PersistenceManager pm = PMF.get().getPersistenceManager();
    Query q = pm.newQuery(Empleado.class);
    List<Empleado> empleado = (List<Empleado>)q.execute();
    System.out.println("pasa la lista");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/stilo.css" media="screen">
<link rel="stylesheet" type="text/css" href="/css/estiloIdioma.css" media="screen">
<script type="text/javascript" src="/js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
.patient table {
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 20px;
	margin: 45px;
	width: 280px;
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

.hgb {
	background-color: transparent;
	width: 200px;
	height: 100px;
	font-size: 25;
	color: black;
}
.hgb2{
    margin:5% 10% 5% 10%;
    width:80%;
}
</style>
</head>
<body>


<center>
		<div class="header">
			<table >
				<tr>

					<td><ul class="nav">
							<li><form action="/inicio" method="POST">
									<input class="po" type="submit" value="<% out.print("HOTEL\n AMERICA");%>">
								</form></li>
						</ul></td>

					<td>
						<ul class="nav">
							<li><form action="/adm/empleado" method="POST">
									<input class="po" type="submit" value="<%out.print("ADMINISTRACION\n EMPLEADO");%>">
								</form>
								<ul  id="capa11">
												<li><form method="POST" action="/adm/empleado?e=0" >
								<input class="sub"type="submit" value="REGISTRAR">
								</form>
												<li><form method="POST"action="/adm/empleado?e=1" >
								<input class="sub"type="submit" value="BORRAR">
								</form></li>
												<li><form method="POST" action="/adm/empleado?e=2" >
								<input class="sub"type="submit" value="BUSCAR">
								</form></li>
												<li><form action="/adm/empleado?e=3" method="POST" >
								<input class="sub"type="submit" value="BLOQUEAR">
								</form></li></ul>
								</li>
						</ul>
					</td>

					<td>
						<ul class="nav">
							<li><form action="/adm/servicios" method="POST">
									<input class="po" type="submit" value="<%out.print("ADMINISTRACION\n SERVICIOS");%>">
								</form>
								<ul  id="capa11">
												<li><form method="POST" action="/adm/servicios?e=0" >
								<input class="sub"type="submit" value="REGISTRAR">
								</form>
												<li><form method="POST"action="/adm/servicios?e=1" >
								<input class="sub"type="submit" value="BORRAR">
								</form></li></ul>
								</li>
						</ul>
					</td>
     				
     				<td><img height="75" width="300" src="/spa.jpg" alt=""></td>
     				
					<td>
						<ul class="nav">
							<li><form action="/adm/cliente" method="POST">
									<input class="po" type="submit" value="<%out.print("ADMINISTRACION\n CLIENTE");%>">
								</form>
								<ul  id="capa11">
												<li><form method="POST" action="/adm/cliente?e=0" >
								<input class="sub"type="submit" value="BLOQUEAR">
								</form>
												<li><form method="POST"action="/adm/cliente?e=1" >
								<input class="sub"type="submit" value="BORRAR">
								</form></li>
								<li><form method="POST"action="/adm/cliente?e=2" >
								<input class="sub" type="submit" value="ACTIVAR">
								</form></li>
								<li><form method="POST"action="/adm/cliente?e=3" >
								<input class="sub"type="submit" value="BUSCAR">
								</form></li>
								</ul>
								</li>
						</ul>
					</td>
							
					<td>
						<ul class="nav">
							<li><form action="/adm/tcn" method="POST">
									<input class="po" type="submit" value="<%out.print("ADMINISTRACION\n TCN");%>">
								</form></li>
						</ul>
					</td>
					
					<td>
						<ul class="nav">
							<li><form action="/adm/empleos" method="POST">
									<input class="po" type="submit" value="<%out.print("ADMINISTRACION\n EMPLEOS");%>">
								</form></li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</center>
<div align="center" class="hgb2">
		<div>
		<%if(mensajito!=null){%>
		<h1><%=mensajito %></h1>
		<%} %>
			
			
		</div>
		<h1>Lista de empleados</h1>
		<form name="listaRLocal" id="listaRLocal" method="post"
			action="/borrarEmpleado">
			<table class="patient">
				<tr>
					<th>Nombre</th>
					<th>DNI</th>
					<th>Sexo</th>
					<th>Area</th>
					<th>Sueldo</th>
					<th>Estado</th>
				</tr>
				<%
					for (Empleado a : empleado) {
				%>
				<tr>
					<td><%=a.getName()%></td>
					<td><%=a.getDni()%></td>
					<td><%=a.getSexo()%></td>
					<td><%=a.getArea()%></td>
					<td><%=a.getSueldo()%></td>
					<td><%=a.getActividad()%></td>
				</tr>
				<%
					}
				%>
			</table>
			<br> <br>
			<% if(empleado.size()<=0){
				request.setAttribute("mensajito","No hay usuarios registrados");%>
			<a href="/adm/empleado?e=0">Registe un empleado primero :O</a>
			<%} %>
		</form>
	</div>


</body>
</html>