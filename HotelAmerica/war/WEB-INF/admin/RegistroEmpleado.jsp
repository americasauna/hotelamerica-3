<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="javax.print.attribute.DocAttribute"%>
<%@page import="com.google.appengine.api.search.Document"%>
<%@page import="sauna.*"%>
<%@page import="beans.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.jdo.Query"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
	HttpSession menu = request.getSession();
	menu.removeAttribute("index");
	menu.setAttribute("index", "index");
	menu.removeAttribute("idioma");
	menu.setAttribute("idioma", "");
	HttpSession registro = request.getSession();
	String user = (String) registro.getAttribute("usuario");
	String us = (String) request.getAttribute("usuario");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/stilo.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="/css/estiloIdioma.css"
	media="screen">
<title>Proyecto</title>
<script type="text/javascript" src="/js/jquery.js"></script>
<style>
.sugerir {
	opacity: 0;
}

.sugerir:target {
	opacity: 1;
}

.idiomas {
	opacity: 0;
}

.idiomas:target {
	opacity: 1;
}
</style>
<script>
	
</script>
<style>
.hgb2 {
	background-color: skyblue;
	width: 70%;
	margin: 5% 15% 15% 5%;
	align: "center";
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



	<div class="hgb2">
		<table>
			<tr>
				<td><br> <br>
				<div align="center">
					<h3>Registro del Empleado</h3>
					<form method="post" action="/agregarEmpleado">
						Nombre: <input type="text" name="nom" id="nom"
							placeholder="Nombre" pattern="^[a-zA-Z]*$" required> <br>
						Apellido: <input type="text" name="ape" id="ape"
							placeholder="Apellido" pattern="^[a-zA-Z]*$" required></input><br>
						Sexo: <select name="sex" required><option selected
								disabled>--Seleccione--</option>
							<option value="Hombre">Hombre</option>
							<option value="Mujer">Mujer</option></select><br> DNI: <input
							type="text" name="dni" id="dni" placeholder="DNI"
							pattern="^[1-9]{8}$" required></input><br> Gmail: <input
							type="text" name="mail" id="mail" placeholder="correo@mail.com"
							pattern="^[a-zA-Z]*[@]{1}[a-z]*[.]{1}[a-z]{3}$" required></input><br>
						Telefono: <input type="text" name="tel" id="tel"
							placeholder="Telefono" required pattern="^[1-9]*"></input><br>
						Fecha de nacimiento: <input type="number" name="fecha1"
							id="fecha1" placeholder="Día" min="1" max="31"
							pattern="^[1-9]{2}$" required></input><input type="number"
							name="fecha2" id="fecha2" required pattern="^[1-9]{2}$"
							placeholder="Mes" min="1" max="12"></input><input type="number"
							name="fecha3" id="fecha3" pattern="^[1-9]{4}$" required
							placeholder="Año" min="1950" max="1997"></input><br>
						Direccion: <input type="text" name="dire" id="dire"
							placeholder="1-31"></input><br> Area: <select name="area"
							id="area" required><option value="Sauna">Sauna
							<option value="Hotel">Hotel
							<option value="Masajes">Masajes
							<option value="Estetica">Estetica
							<option value="Restaurant">Restaurant</select><br> <input
							type="submit" value="Guardar"></input> <input type="reset"
							value="Limpiar"></input>
					</form></div></td>
			</tr>
		</table>
	</div>
</body>
</html>
