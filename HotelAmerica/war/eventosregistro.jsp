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


<!DOCTYPE HTML>

<html>
<head>
<link rel="stylesheet" type="text/css" href="css/stilo.css"
	media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Proyecto</title>
<script type="text/javascript" src="js/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="a/jquery.datetimepicker.css" />
<script src="a/jquery.js"></script>
<script src="a/jquery.datetimepicker.js"></script>
<script>
	jQuery(function() {
		jQuery('#date_timepicker_start').datetimepicker(
				{
					format : 'Y/m/d',
					onShow : function(ct) {
						this
								.setOptions({
									maxDate : jQuery('#date_timepicker_end')
											.val() ? jQuery(
											'#date_timepicker_end').val()
											: false
								})
					},
					timepicker : false
				});
		jQuery('#date_timepicker_end').datetimepicker(
				{
					format : 'Y/m/d',
					onShow : function(ct) {
						this
								.setOptions({
									minDate : jQuery('#date_timepicker_start')
											.val() ? jQuery(
											'#date_timepicker_start').val()
											: false
								})
					},
					timepicker : false
				});
	});
</script>
<style type="text/css">
.patient table {
	width: 200%;
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 20px;
}

.patient th {
    width:100%;
	font-size: 15px;
	background: #b9c9fe;
	color: #039;
}

.patient td {
    width:100%;
	background: #e8edff;
	color: #669;
}

.patient tr:hover td {
	background: #d0dafd;
	color: #339;
}
#hgb {
	background: #039;
	width: 81px;
	height: 48px;
	font-size: 25;
	color: black;;
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
	
	<table class="patient">
		<tr>
			<th>
				<h1>
					Bienvenido a nuestro servicio de reserva de "Sala de Eventos"<br>Complete
					Correctamente el formulario para proceder
				</h1>
			</th>
		</tr>
		<tr>
			<td colspan="3">
			    <div align="center">
			    <br><br>
				<form method="post" action="reservalocal" >
					Fecha: <input placeholder="Year/Month/Day" name="fecha1"
						type="text" id="date_timepicker_start" required />
					N.° Adultos: <input placeholder="Adultos" name="nadultos"
						type="number" id="nadultos" min="0" max="50" required />
					N.° Adultos: <input placeholder="Niños" name="nniños"
						type="number" id="date_timepicker_start" min="0" max="50" required />
					<br><br>
					Tipo de evento: <input placeholder="Evento" name="evento"
						type="text" id="evento" required />
					<br><br>
					Servicios Adicionales Requeridos: (Optional)
					<br>
					<textarea name="extras" id="extras" rows="8" cols="50" placeholder="Suministre la mayor cantidad de datos posibles -Buffet en particular -Grupo de Música -Seguridad extra"></textarea>
					<br><br>
					<input type="submit" value="Enviar" id="hgb">
					<br><br>
					<input type="reset" value="Limpiar" id="hgb">
				</form>
				<br><br><br>
				</div>
			</td>
		</tr>
	</table>
    
    </div>
</body>
</html>