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
    ArrayList<Cliente> clientes = (ArrayList<Cliente>)request.getAttribute("listaencontrada");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/stilo.css" media="screen">
<link rel="stylesheet" type="text/css" href="/css/estiloIdioma.css" media="screen">
<script type="text/javascript" src="/js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Buscar Cliente</title>
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
	<div style="margin-left: 12%;">
	<form action="/adm/cliente" method="post">
	<img src="http://www.usableyaccesible.com/textosalternativosaccesibles/images/buscar.png" alt="Buscar">
	<h1>Busquedas por ...</h1>
	<div style="margin-left: 50%;">
	<select name="buscarpor">
	<option value="1">Usuario</option>
	<option value="2">Nombre</option>
	<option value="3">Apellido</option>
	<option value="4">dni</option>
	<option value="5">Email</option>
	
	</select>
	<input type="text"  name="buscar" style="border:0px black; width: 150px; height: 27px;" placeholder ="Buscar Clientes..." maxlength="56" >
	<input type="submit" value="Buscar" style="height: 27px; ">
	</div>
	</form>
	</div>
	<br><br><br>
	<center><div>
	<%if(clientes.size()!=0){%>
	<table>
	<tr>
	<td><h2>Usuario</h2></td>
	<td><h2>Nombre</h2></td>
	<td><h2>Sexo</h2></td>
	<td><h2>DNI</h2></td>
	<td><h2>Correo</h2></td>
	<td><h2>Telefono</h2></td>
	<td><h2>Fecha de Nac.</h2></td>
	<td><h2>Direccion</h2></td>
	<td><h2>Estado</h2></td>
	<tr>
<% for(Cliente c: clientes){%>
<tr>
<td>
<h3><%=c.getLogin()%></h3>
</td>
<td>
<h3><%=c.getName()%></h3>
</td>
<td>
<h3><%=c.getSexo()%></h3>
</td>
<td>
<h3><%=c.getDni()%></h3>
</td>
<td>
<h3><%=c.getGmail()%></h3>
</td>
<td>
<h3><%=c.getTelefono()%></h3>
</td>
<td>
<h3><%=c.getNacimiento()%></h3>
</td>
<td>
<h3><%=c.getDireccion()%></h3>
</td>
<td>
<h3><%=c.getEstado()%></h3>
</td>
</tr>



<% }%>
</table>
<%}else{ %>
<h2>No se encontraron resultados.</h2>
<%} %>
</div></center>

</body>
</html>