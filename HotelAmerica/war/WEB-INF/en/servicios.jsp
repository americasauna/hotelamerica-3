<%@page import="sauna.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>

<%HttpSession registro=request.getSession(); %>
<%String user= (String)registro.getAttribute("usuario");%>

<%HttpSession menu=request.getSession();%>
<%menu.removeAttribute("index"); %>
<%menu.setAttribute("index", "servicios");%>
<%menu.removeAttribute("idioma"); %>
<%menu.setAttribute("idioma", "en"); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Servicios</title>
<link rel="stylesheet" type="text/css" href="../css/estiloservicios.css" media="screen" >
<link rel="stylesheet" type="text/css" href="../css/stilo.css" media="screen" >
<link rel="stylesheet" type="text/css" href="/css/estiloIdioma.css" media="screen" >

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery_min.js"></script>
<script type="text/javascript" src="js/slimbox2.js"></script>
<link rel="stylesheet" href="css/slimbox2.css" type="text/css" media="screen">
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
		<form action="/servicios" method="post" name="formuIdiomas">	
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
	

	<div>
	<h1 id="titulo">Services</h1>
	<hr>
	<h3>AMERICA Sauna & Spa offers the following services:</h3>
	</div>
	<br>	
	<center>
	<div id="conteiner">
	<table id="serv" cellspacing="50">
	<tr>
		<th><a href="imgServicios/habitaciones.jpg" rel="lightbox"><img class="img" src="../imgServicios/habitaciones.jpg" alt="" ></a>
		</th>
		<td id="des">
			<h3><a href="/servicios/hospedaje">Lodging</a></h3><br><h4 class="des">Feel the comfort of a warm home. <br> We have different types of rooms adaptable to ncesidades.</h4>
		</td>
	</tr>
	<tr>
		<th><a href="../imgServicios/Sauna.jpg" rel="lightbox"><img class="img" src="../imgServicios/Sauna.jpg" alt="" ></a>
		</th>
		<td class="des">
			<h3><a href="">Sauna</a></h3><br><h4 class="des">A perfect place to relax after much stress. <br> We Sauna baths according to your preference.</h4>
		</td>
	</tr>
	<tr>
		<th><a href="../imgServicios/masaje-pareja.jpg" rel="lightbox"><img class="img" src="../imgServicios/masaje-pareja.jpg" alt="" ></a>
		</th>
		<td class="des">
			<h3><a href="">Massage</a></h3><br><h4 class="des">Men love to wonder. This is the seed of science. "<br> And what better than a pleasant massages given by our expert staff.</h4>
		</td>
	</tr>
	<tr>
		<th><a href="../imgServicios/estetica1.jpg" rel="lightbox"><img class="img" src="../imgServicios/estetica1.jpg" alt="" ></a>
		</th>
		<td class="des">
			<h3><a href="">Aesthetics</a></h3><br><h4 class="des">Be the center of attention of the meeting with your unique style. <br> Your image will be in charge of the best stylists in the city./h4>
		</td>
	</tr>
	<tr>
		<th><a href="../imgServicios/restaurant.jpg" rel="lightbox"><img class="img" src="../imgServicios/restaurant.jpg" alt="" ></a>
		</th>
		<td class="des">
			<h3><a href="index.html">Restaurant</a></h3><br><h4 class="des">Enjoy your meal like us to cook. <br> We have a dining room, plus a restaurant and cafeteria.</h4>
		</td>
	</tr>
	</table>
	</div>
	</center>
</body>
</html>