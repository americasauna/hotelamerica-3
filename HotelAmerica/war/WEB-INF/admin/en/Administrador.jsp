<%@page import="sauna.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%HttpSession menu=request.getSession();%>
<%menu.removeAttribute("index"); %>
<%menu.setAttribute("index", "Administrador");%>
<%menu.removeAttribute("idioma");%>
<%menu.setAttribute("idioma", "en");%>

<%HttpSession registro=request.getSession(); %>
<%String user= (String)registro.getAttribute("usuario");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/stilo.css" media="screen">
<link rel="stylesheet" type="text/css" href="/css/estiloIdioma.css" media="screen">
<script type="text/javascript" src="/js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
								</form></li>
						</ul>
					</td>

					<td>
						<ul class="nav">
							<li><form action="/adm/servicios" method="POST">
									<input class="po" type="submit" value="<%out.print("ADMINISTRACION\n SERVICIOS");%>">
								</form></li>
						</ul>
					</td>
     				
     				<td><img height="75" width="300" src="/spa.jpg" alt=""></td>
     				
					<td>
						<ul class="nav">
							<li><form action="/adm/cliente" method="POST">
									<input class="po" type="submit" value="<%out.print("ADMINISTRACION\n CLIENTE");%>">
								</form></li>
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



</body>
</html>