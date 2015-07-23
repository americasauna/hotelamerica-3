<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="beans.*"%>
<%@page import="java.util.*"%>
<%
	
	String mensajito = (String) request.getAttribute("mensajito");
	Empleado empleado = (Empleado) request.getAttribute("enco");
  System.out.println("mensaje-----"+mensajito);
  System.out.println("empleado-----"+empleado);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/stilo.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="/css/estiloIdioma.css"
	media="screen">
<title>Buscar Empleado</title>
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
</head>
<body>

	<center>
		<div class="header">
			<table>
				<tr>

					<td><ul class="nav">
							<li><form action="/inicio" method="POST">
									<input class="po" type="submit"
										value="<% out.print("HOTEL\n AMERICA");%>">
								</form></li>
						</ul></td>

					<td>
						<ul class="nav">
							<li><form action="/adm/empleado" method="POST">
									<input class="po" type="submit"
										value="<%out.print("ADMINISTRACION\n EMPLEADO");%>">
								</form>
								<ul id="capa11">
									<li><form method="POST" action="/adm/empleado?e=0">
											<input class="sub" type="submit" value="REGISTRAR">
										</form>
									<li><form method="POST" action="/adm/empleado?e=1">
											<input class="sub" type="submit" value="BORRAR">
										</form></li>
									<li><form method="POST" action="/adm/empleado?e=2">
											<input class="sub" type="submit" value="BUSCAR">
										</form></li>
									<li><form action="/adm/empleado?e=3" method="POST">
											<input class="sub" type="submit" value="BLOQUEAR">
										</form></li>
								</ul></li>
						</ul>
					</td>

					<td>
						<ul class="nav">
							<li><form action="/adm/servicios" method="POST">
									<input class="po" type="submit"
										value="<%out.print("ADMINISTRACION\n SERVICIOS");%>">
								</form>
								<ul id="capa11">
									<li><form method="POST" action="/adm/servicios?e=0">
											<input class="sub" type="submit" value="REGISTRAR">
										</form>
									<li><form method="POST" action="/adm/servicios?e=1">
											<input class="sub" type="submit" value="BORRAR">
										</form></li>
								</ul></li>
						</ul>
					</td>

					<td><img height="75" width="300" src="/spa.jpg" alt=""></td>

					<td>
						<ul class="nav">
							<li><form action="/adm/cliente" method="POST">
									<input class="po" type="submit"
										value="<%out.print("ADMINISTRACION\n CLIENTE");%>">
								</form>
								<ul id="capa11">
									<li><form method="POST" action="/adm/cliente?e=0">
											<input class="sub" type="submit" value="BLOQUEAR">
										</form>
									<li><form method="POST" action="/adm/cliente?e=1">
											<input class="sub" type="submit" value="BORRAR">
										</form></li>
									<li><form method="POST" action="/adm/cliente?e=2">
											<input class="sub" type="submit" value="ACTIVAR">
										</form></li>
									<li><form method="POST" action="/adm/cliente?e=3">
											<input class="sub" type="submit" value="BUSCAR">
										</form></li>
								</ul></li>
						</ul>
					</td>

					<td>
						<ul class="nav">
							<li><form action="/adm/tcn" method="POST">
									<input class="po" type="submit"
										value="<%out.print("ADMINISTRACION\n TCN");%>">
								</form></li>
						</ul>
					</td>

					<td>
						<ul class="nav">
							<li><form action="/adm/empleos" method="POST">
									<input class="po" type="submit"
										value="<%out.print("ADMINISTRACION\n EMPLEOS");%>">
								</form></li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</center>


	<center><form name="listaRLocal" id="listaRLocal" method="post"
		action="/busquedaempleado">
		
		<h2>Ingrese el DNI del empleado a buscar:</h2><br>
		<input type="text" name="buscado">
		<br>
		<input type="submit" value="BUSCAR">
		</form></center>
		<% if(mensajito!=null) {%>
		<div align="center" class="hgb2">
		<%System.out.println("paso el if "); %>
		<%if(mensajito.equals("ENCONTRADO")&&!empleado.equals(null)) {%>
		<%System.out.println("pasa el encontrado  "); %>
		<%System.out.println("elempleado " +empleado.getName()); %>
		       <table class="patient">
				<tr>
				<td> NOMBRE</td>
				<td><%=empleado.getName() %></td>
				</tr>
				
				<tr>
				<td> APELLIDO</td>
				<td><%=empleado.getApellido() %></td>
				</tr>
				
				<tr>
				<td> DNI</td>
				<td><%=empleado.getDni() %></td>
				</tr>
				
				<tr>
				<td> GENERO: </td>
				<td><%=empleado.getSexo()%></td>
				</tr>
				
				<tr>
				<td> NACIMIENTO</td>
				<td><%=empleado.getNacimiento() %></td>
				</tr>
				
				<tr>
				<td> RUBRO</td>
				<td><%=empleado.getArea() %></td>
				</tr>
				
				<tr>
				<td>  ESTADO </td>
				<td><%=empleado.getActividad() %></td>
				</tr>
				

			</table>
		<%} 
		else{if(mensajito.equals("NO ENCONTRADO")){%>
			<h1> El Empleado no existe</h1>
		<%} else{
		if(mensajito.equals("NO VALIDO"))%>
		<h1>Ingrese un DNI Válido</h1>
		<%} %>
		</div>
		<%} }%>

				<br> <br>
			</form>
		</div>
</body>
</html>