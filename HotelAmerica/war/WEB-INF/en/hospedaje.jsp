<%@page import="sauna.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>

<%HttpSession menu=request.getSession();%>
<%menu.removeAttribute("index"); %>
<%menu.setAttribute("index", "hospedaje");%>
<%menu.removeAttribute("idioma"); %>
<%menu.setAttribute("idioma", "en"); %>

<%HttpSession registro=request.getSession(); %>
<%String user= (String)registro.getAttribute("usuario");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Servicios-Hotel</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/stilo.css"
	media="screen">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="/css/estiloIdioma.css" media="screen" >
<script type="text/javascript" src="../js/mostrar.js"></script>
</head>
<body>

	<center>
		<div class="header">
			<table >
				<tr>
					<%if(user!=null && user.equals("admin")){ %>
							<td><ul class="nav">
							<li><form action="/adm.jsp" method="POST">
							<input type="hidden" name="adm" value="admi">
								<input class="po" type="submit" value="MANAGE">
								</form></li></ul>
	
					</td><%}%>
				
					<td>
						<ul class="nav">
							<li><form action="/inicio" method="POST">
							<input type="hidden" name="home" value="home">
								<input class="po" type="submit" value="HOME">
								</form></li></ul>
					</td>
					
					<td>
						<div id="header">
								<ul class="nav">
									<li>
									<form method="POST" action="/servicios" ><input type="hidden" name="servicios" value="servicios">
								<input class="po"type="submit" value="SERVICES">
								</form> 
								<!--	<form action="sauna" method="get" name="f1" id="f1">
										<input type="hidden" name="enlace" value="servicios">
									</form>
									-->
									<ul  id="capa11">
												<li><form method="POST" action="/servicios/hospedaje" ><input type="hidden" name="hospedaje" value="hospedaje">
								<input class="sub"type="submit" value="LODGING">
								</form>
												<li><form method="POST"action="/servicios/sauna" ><input type="hidden" name="sauna" value="sauna">
								<input class="sub"type="submit" value="SAUNA">
								</form></li>
												<li><form method="POST" action="/servicios/masaje" ><input type="hidden" name="masajes" value="masajes">
								<input class="sub"type="submit" value="MASSAGE">
								</form></li>
												<li><form action="/servicios/estetica" method="POST" ><input type="hidden" name="estetica" value="estetica">
								<input class="sub"type="submit" value="BEAUTY">
								</form>
													<ul>
														<li><form action="/servicios/estetica/cabello" method="POST"><input type="hidden" name="cabello" value="cabello">
								<input class="sub"type="submit" value="HAIR">
								</form></li>
														<li><form action="/servcios/estetica/manicure" method="POST"><input type="hidden" name="manicure" value="manicure">
								<input class="sub"type="submit" value="MANICURE">
								</form></li>
														<li><form action="/servicios/estetica/pedicure" method="POST" ><input type="hidden" name="pedicure" value="pedicure">
								<input class="sub"type="submit" value="PEDICURE">
								</form></li>
														
													</ul></li>
											<li><form action="/servicios/restaurant" method="POST"><input type="hidden" name="restaurant" value="restaurant">
								<input class="sub"type="submit" value="RESTAURANT">
								</form></li>
											</ul></li>
								</ul>
						</div></td>
     
					<td>
						<ul class="nav">
								<li>
								<form action="" method="POST"><input type="hidden" name="reservaciones" value="reservaciones">
								<input class="po"type="submit" value="RESERVATIONS">
								</form>
									
									<ul  id="capa1">
											
											<li><form method="POST" action="/reservacion/hotel" ><input type="hidden" name="hotel" value="hotel">
								<input class="sub"type="submit" value="HOTEL">
								</form></li>
											<li><form method="POST" action="/reservacion/spa" ><input type="hidden" name="spa" value="spa">
								<input class="sub" type="submit" value="SPA">
								</form></li>
									</ul>
									
										
									</li>
							</ul></td>
							
					<td><img height="75" width="300" src="/spa.jpg" alt=""></td>
					
					<td>
					<ul class="nav">
								<li>
								<form action="" method="POST">
								<input class="po"type="submit" value="CONTACT US">
								</form>
									<ul  id="capa1">
											<li><form method="POST" action="/encuesta" >
								<input class="sub" type="submit" value="POLL">
								</form></li>
											<li><form method="POST" action="/sugerencias.do" >
								<input class="sub" type="submit" value="SUGGESTIONS">
								</form></li>
									</ul>	
									</li>
						</ul>
					</td>
					<td>
					<ul class="nav">
								<li>
								<form action="" method="POST">
								<input class="po"type="submit" value="VISITS / LANGUAGES">
								</form>
									<ul id="capa1">
											<li><form method="POST" action="/visitas.do" >
								<input class="sub"type="submit" value="VISITS">
								</form></li>
											<li><form method="POST" action="#idiomas" >
								<input class="sub" type="submit" value="LANGUAGE">
								</form></li>
									</ul>	
									</li>
						</ul>
					</td>
				
					<td>
						<div >
							<ul class="nav">
								<li>
								<%if(user==null){ %>
								<form method="POST" action="/login" >
	<input type="hidden" name="ingresar" value="ingresar">
	<input class="po"type="submit" value="LOG IN">
								</form>
								<%}else{%>
								<form action="/1" method="POST"><input type="hidden" name="cerrar" value="cerrar">
								<input class="po" type="submit" value="LOG OUT">
								</form>
								<%} %>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</center>	
	
	
	<div id="idiomas" class="idiomas">
	<div>
		<a href="" title="Cerrar" class="cerrar">X</a>
		<div id="sugerir">
		<form action="/servicios/hospedaje" method="post" name="formuIdiomas">	
		<div id="titulo"><H2>Choose the language</H2></div>
		<div class="selectt">
		<select name="idioma" id="idioma" class="selecttt">
				    <option>--select--</option>
					<option value="esp">Spanish</option>
					<option value="ing">English</option>
		</select> 
		</div> <br>
		<input  type = "submit" value="TRANSLATE" id="submitt" ><br>
		</form>
	</div>
	</div>
	</div>
	

		
	
	<center>
		<br>
		<br>
		<br>
		<table width="80%">
			<tr>
				<td>
					<h2>Single Room</h2>
				</td>
			</tr>
			<tr>
				<td>
					<p>A comfortable room for the night includes
basic services:</p>
					<ul>
						<li>Internet</li>
						<li>TV</li>
					</ul>
				</td>
			</tr>
		</table>
		<table width="80%">
			<tr>
				<td width="33%"></td>
				<td width="33%"><img src="../imagen/sroom.jpg" height="350"
					width="500" alt="">
				<form action="" method="get">
						<input type="submit" value="reserve">
					</form></td>
				<td width="33%"></td>
			</tr>
		</table>

		<br>
		<br>
		<br>
		<table width="80%">
			<tr>
				<td>
					<h2>Double Room</h2>
				</td>
			</tr>
			<tr>
				<td>
					<p>A very comfortable room with a bed for two person: </p>
					<ul>
						<li>Internet</li>
						<li>Room service</li>
						<li>Laundry Services</li>
						<li>TV with cable</li>
					</ul>
				</td>
			</tr>
		</table>
		<table width="80%">
			<tr>
				<td width="33%"></td>
				<td width="33%"><img src="../imagen/droom.jpg" height="350"
					width="500" alt="">
				<form action="">
						<input type="submit" value="Reserve">
					</form></td>
				<td width="33%"></td>
			</tr>
		</table>

		<br>
		<br>
		<br>
		<table width="80%">
			<tr>
				<td>
					<h2>Twin Room</h2>
				</td>
			</tr>
			<tr>
				<td>
					<p>A room with 2 beds:</p>
					<ul>
						<li>Internet</li>
						<li>Room service</li>
						<li>Laundry Services</li>
						<li>TV with cable</li>
					</ul>
				</td>
			</tr>
		</table>
		<table width="80%">
			<tr>
				<td width="33%"></td>
				<td width="33%"><img src="../imagen/troom.jpg" height="350"
					width="500" alt="">
				<form action="">
						<input type="submit" value="Reserve">
					</form></td>
				<td width="33%"></td>
			</tr>
		</table>

		<br>
		<br>
		<br>
		<table width="80%">
			<tr>
				<td>
					<h2>Suite Room</h2>
				</td>
			</tr>
			<tr>
				<td>
					<p>A premium room for the night:</p>
					<ul>
						<li>Internet</li>
						<li>LCD TV / Cable / USB connection with cable</li>
						<li>heating</li>
						<li>Room service 24 hours a day</li>
						<li>SLaundry services</li>
					</ul>
				</td>
			</tr>
		</table>
		<table width="80%">
			<tr>
				<td width="33%"></td>
				<td width="33%"><img src="../imagen/suroom.jpg" height="350"
					width="500" alt="">
				<form action="">
						<input type="submit" value="Reserve">
					</form></td>
				<td width="33%"></td>
			</tr>
		</table>
	</center>
</body>
</html>