<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sauna.*"%>
<%@ page import="beans.ReservaLocal"%>
<%@ page import="java.util.List"%>
<%@page import="javax.servlet.http.*;"%>


<%
	HttpSession registro = request.getSession();

	String user = (String) registro.getAttribute("usuario");

	String mensajito = (String) request.getAttribute("mensajito");

	List<ReservaLocal> reservaciones = (List<ReservaLocal>) request.getAttribute("reservas");

	int i = 1;
%>
<!DOCTYPE HTML>

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
		<div class="header">
			<table>
				<tr>
					<%
						if (user != null && user.equals("admin")) {
					%>
					<td><ul class="nav">
							<li><form action="sauna" method="POST">
									<input type="hidden" name="home" value="administrador">
									<input class="po" type="submit" value="ADMINISTRAR">
								</form></li>
						</ul></td>
					<%
						}
					%>
					<td>
						<ul class="nav">
							<li><form action="sauna" method="POST">
									<input type="hidden" name="home" value="home"> <input
										class="po" type="submit" value="HOME">
								</form></li>
						</ul>
					</td>
					<td>
						<div id="header">
							<ul class="nav">
								<li>
									<form method="POST" action="sauna">
										<input type="hidden" name="servicios" value="servicios">
										<input class="po" type="submit" value="SERVICIOS">
									</form> <!--	<form action="sauna" method="get" name="f1" id="f1">
										<input type="hidden" name="enlace" value="servicios">
									</form>
									-->
									<ul id="capa11">
										<li><form method="POST" action="sauna">
												<input type="hidden" name="sauna" value="hospedaje">
												<input class="sub" type="submit" value="HOSPEDAJE">
											</form>
										<li><form method="POST" action="sauna">
												<input type="hidden" name="sauna" value="sauna"> <input
													class="sub" type="submit" value="SAUNA">
											</form></li>
										<li><form method="POST" action="sauna">
												<input type="hidden" name="masajes" value="masajes">
												<input class="sub" type="submit" value="MASAJES">
											</form></li>
										<li><form action="sauna" method="POST">
												<input type="hidden" name="estetica" value="estetica">
												<input class="sub" type="submit" value="ESTETICA">
											</form>
											<ul>
												<li><form action="sauna" method="POST">
														<input type="hidden" name="cabello" value="cabello">
														<input class="sub" type="submit" value="CABELLO">
													</form></li>
												<li><form action="sauna" method="POST">
														<input type="hidden" name="estetica" value="estetica">
														<input class="sub" type="submit" value="MANICURE">
													</form></li>
												<li><form action="sauna" method="POST">
														<input type="hidden" name="estetica" value="estetica">
														<input class="sub" type="submit" value="PEDICURE">
													</form></li>
												<li><form action="sauna" method="POST">
														<input type="hidden" name="estetica" value="estetica">
														<input class="sub" type="submit" value="RESTAURANT">
													</form></li>
											</ul></li>

									</ul>
								</li>
							</ul>
						</div>
					</td>

					<td><img height="75" width="300" src="/spa.jpg" alt=""></td>

					<td>
						<ul class="nav">
							<li>
								<form action="sauna" method="POST">
									<input type="hidden" name="reserva" value="reservaciones">
									<input class="po" type="submit" value="RESERVACIONES">
								</form>

								<ul id="capa1">

									<li><form method="POST" action="sauna">
											<input type="hidden" name="reserva" value="hotel"> <input
												class="sub" type="submit" value="HOTEL">
										</form></li>
									<li><form method="POST" action="sauna">
											<input type="hidden" name="reserva" value="spa"> <input
												class="sub" type="submit" value="SPA">
										</form></li>
								</ul>


							</li>
						</ul>
					</td>
					<td>
						<div>
							<ul class="nav">
								<li>
									<%
										if (user == null) {
									%>
									<form action="sauna" method="POST">
										<input type="hidden" name="reserva" value="contacto">
										<input class="po" type="submit" value="CONTACTO/REGISTRO">
									</form> <%
 	                                } else {
                                    %>
									<form action="sauna" method="POST">
										<input type="hidden" name="reserva" value="cerrar"> <input
											class="po" type="submit" value="CERRAR SESION">
									</form> <%
                                  	}
                                     %>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>

		<div>
			<h1><%=mensajito%></h1>
		</div>
		<form name="listaRLocal" id="listaRLocal" method="post"
			action="deleteevento">
			<table align="center" class="patient">
				<tr>
					<th></th>
					<th>Evento</th>
					<th>Fecha</th>
					<th>N.° Adultos</th>
					<th>N.° Niños</th>
					<th>Adicional</th>
				</tr>
				<%
					for (ReservaLocal a : reservaciones) {
				%>
				<tr>
					<td>Usuario <%=i++%> <input type="checkbox" name="elegidos"
						value="<%=a.getId()%>"></td>
					<td><%=a.getEvento()%></td>
					<td><%=a.getFecha()%></td>
					<td><%=a.getAdultos()%></td>
					<td><%=a.getNiños()%></td>
					<td><%=a.getExtra()%></td>
				</tr>
				<%
					}
				%>
			</table>
			<br>
			<br> <input type="submit" value="Eliminar" id="hgb">
		</form>
	</div>
</body>
</html>