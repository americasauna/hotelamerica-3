<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%HttpSession menu=request.getSession();%>
<%menu.removeAttribute("index"); %>
<%menu.setAttribute("index", "sauna");%>
<%menu.removeAttribute("idioma"); %>
<%menu.setAttribute("idioma", "en"); %>

<%HttpSession registro=request.getSession(); %>
<%String user= (String)registro.getAttribute("usuario");%>
<html>
<head>
<title>Sauna</title>
<link rel="stylesheet" type="text/css" href="../css/stilo.css" media="screen" >
<link rel="stylesheet" type="text/css" href="../css/estiloservicios.css" media="screen" >
<link rel="stylesheet" type="text/css" href="../css/estiloIdioma.css" media="screen" >

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/jquery_min.js"></script>
<script type="text/javascript" src="../js/slimbox2.js"></script>
<link rel="stylesheet" href="../css/slimbox2.css" type="text/css" media="screen">
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
		<form action="/servicios/sauna" method="post" name="formuIdiomas">	
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
	<h1 id="titulo">Sauna</h1>
	<hr>
	<p>Sauna & Spa Hotel AMERICA offers sauna services:</p>
	</div>
	<br>	
	<center>
	<div id="conteiner">
	<table id="serv" cellspacing="50">
	<tr>
		<td class="des">
			<h3>A DRY CAMERA</h3><br><h4 class="des">Reduce heat through perspiration, advisable to take cold showers between each entry into the chambers and rest at intervals.</h4>
			<form action="" method="get">
				<input type="submit" value="Reservar">
			</form>
		</td>
		<th><a href="http://www.saunahostalmonterrey.com/img/banners/barp1.jpg" rel="lightbox"><img class="img" src="http://www.saunahostalmonterrey.com/img/banners/barp1.jpg" alt="" ></a>
		</th>
	</tr>
	<tr>
		<td class="des">
			<h3>Temperatures of 70 ∞ to 80 ∞ C steam dilates skin pores favoring perspiration and eliminate toxins, accelerates blood circulation and relaxes the muscles we use different kinds of herbs eucalyptus, peppermint, chamomile.</h4>
			<form action="" method="get">
				<input type="submit" value="Reservar">
			</form>
		</td>
		<th><a href="http://www.saunahostalmonterrey.com/img/banners/barp2.jpg" rel="lightbox"><img class="img" src="http://www.saunahostalmonterrey.com/img/banners/barp2.jpg" alt="" ></a>
		</th>
	</tr>
	<tr>
		<td class="des">
			<h3>Two whirlpools</h3><br><h4 class="des">With powerful water injections producir√°n a massage, especially back and feet.</h4>
			<form action="" method="get">
				<input type="submit" value="Reservar">
			</form>
		</td>
		<th><a href="http://www.saunahostalmonterrey.com/img/banners/barp3.jpg" rel="lightbox"><img class="img" src="http://www.saunahostalmonterrey.com/img/banners/barp3.jpg" alt="" ></a>
		</th>
		
	</tr>
	<tr>
		<td class="des">
			<h3>heated swimming pool</h3><br><h4 class="des">With effect of running water and a waterfall that gives you the feeling of being with nature.</h4>
			<form action="" method="get">
				<input type="submit" value="Reservar">
			</form>
		</td>
		<th><a href="http://www.saunahostalmonterrey.com/img/banners/barp4.jpg" rel="lightbox"><img class="img" src="http://www.saunahostalmonterrey.com/img/banners/barp4.jpg" alt="" ></a>
		</th>
		
	</tr>
	<tr>
		<td class="des">
			<h3>Spanish SHOWER</h3><br><h4 class="des">Water jets, excellent cold snap intervals between Turkish baths.</h4>
			<form action="" method="get">
				<input type="submit" value="Reservar">
			</form>
		</td>
		<th><a href="http://www.saunahostalmonterrey.com/img/banners/barp5.jpg" rel="lightbox"><img class="img" src="http://www.saunahostalmonterrey.com/img/banners/barp5.jpg" alt="" ></a>
		</th>
		
	</tr>
	<tr>
		<td class="des">
			<h3>MASSAGE ROOM</h3><br><h4 class="des">Large rooms with background music. </h4>
			<form action="" method="get">
				<input type="submit" value="Reservar">
			</form>
		</td>
		<th><a href="http://www.saunahostalmonterrey.com/img/banners/barp6.jpg" rel="lightbox"><img class="img" src="http://www.saunahostalmonterrey.com/img/banners/barp6.jpg" alt="" ></a>
		</th>
		
	</tr>
	</table>
	</div>
	</center>
</body>
</html>