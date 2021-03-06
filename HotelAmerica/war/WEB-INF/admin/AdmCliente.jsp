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
    
    PersistenceManager pm = PMF.get().getPersistenceManager();
    Query q = pm.newQuery(Cliente.class);
    List<Cliente> clientes = (List<Cliente>)q.execute();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<link rel="stylesheet" type="text/css" href="/css/stilo.css" media="screen">
<link rel="stylesheet" type="text/css" href="/css/estiloIdioma.css" media="screen">
<script type="text/javascript" src="/js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

.hgb {
	background-color: transparent;
	width: 200px;
	height: 100px;
	font-size: 25;
	color: black;
}

.hgb2 {
	margin: 5% 10% 5% 10%;
	width: 80%;
}
</style>

<title>Admin Cliente</title>
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
	
	<center><div class="hgb2">
	<table class="patient">
	<tr>
	<td><h2>Usuario</h2></td>
	<td><h2>DNI</h2></td>
	<td><h2>Sexo</h2></td>
	<td><h2>Estado</h2></td>
	<tr>
<% for(Cliente c: clientes){%>
<tr>
<td>
<h3><%=c.getLogin()%></h3>
</td>
<td>
<h3><%=c.getDni()%></h3>
</td>

<td>
<h3><%=c.getSexo()%></h3>
</td>
<td>
<h3><%=c.getEstado()%></h3>
</td>
</tr>



<% }%>
</table>

</div></center>
</body>
</html>