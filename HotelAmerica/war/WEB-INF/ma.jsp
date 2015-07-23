<%@page import="sauna.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="beans.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>

<%HttpSession registro=request.getSession(); %>
<%String user= (String)registro.getAttribute("usuario");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/stilo.css" media="screen" >
<link rel="stylesheet" type="text/css" href="css/empleadosestilo.css" media="screen" >
</head>
<body>

<%if(user!=null && user.equals("admin")){ %>
	<input type="button" onclick=" location.href='Administracion.jsp' "
		value="ADMINISTRAR EMPRESA" name="boton" width="100px"  height="120px"/>
	<%}%>

	<center>
		<div class="header">
			<table >
				<tr>
					<%if(user!=null && user.equals("admin")){ %>
							<td><ul class="nav">
							<li><form action="/adm.jsp" method="POST">
							<input type="hidden" name="adm" value="admi">
								<input class="po" type="submit" value="ADMINISTRAR">
								</form></li></ul>
	
					</td><%}%>
				
					<td>
						<ul class="nav">
							<li><form action="/inicio" method="POST">
							<input type="hidden" name="home" value="home">
								<input class="po" type="submit" value="HOME">
								</form></li></ul></td>
					<td>
						<div id="header">
								<ul class="nav">
									<li>
									<form method="POST" action="/servicios" ><input type="hidden" name="servicios" value="servicios">
								<input class="po"type="submit" value="SERVICIOS">
								</form> 
								<!--	<form action="sauna" method="get" name="f1" id="f1">
										<input type="hidden" name="enlace" value="servicios">
									</form>
									-->
									<ul  id="capa11">
												<li><form method="POST" action="/servicios/hospedaje" ><input type="hidden" name="hospedaje" value="hospedaje">
								<input class="sub"type="submit" value="HOSPEDAJE">
								</form>
												<li><form method="POST"action="/servicios/sauna" ><input type="hidden" name="sauna" value="sauna">
								<input class="sub"type="submit" value="SAUNA">
								</form></li>
												<li><form method="POST" action="/servicios/masaje" ><input type="hidden" name="masajes" value="masajes">
								<input class="sub"type="submit" value="MASAJES">
								</form></li>
												<li><form action="/servicios/estetica" method="POST" ><input type="hidden" name="estetica" value="estetica">
								<input class="sub"type="submit" value="ESTETICA">
								</form>
													<ul>
														<li><form action="/servicios/estetica/cabello" method="POST"><input type="hidden" name="cabello" value="cabello">
								<input class="sub"type="submit" value="CABELLO">
								</form></li>
														<li><form action="/servicios/estetica/manicure" method="POST"><input type="hidden" name="manicure" value="manicure">
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
								<form action="/reservacion" method="POST"><input type="hidden" name="reservaciones" value="reservaciones">
								<input class="po"type="submit" value="RESERVACIONES">
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
					
					
					<td><img height="75" width="300" src="../spa.jpg" alt=""></td>
					
					<td>
					<ul class="nav">
								<li>
								<form action="" method="POST">
								<input class="po"type="submit" value="CONTACTENOS">
								</form>
									<ul  id="capa1">
											<li><form method="POST" action="" >
								<input class="sub" type="submit" value="Encuesta">
								</form></li>
											<li><form method="POST" action="/sugerencias.do" >
								<input class="sub" type="submit" value="Sugerencias">
								</form></li>
									</ul>	
									</li>
						</ul>
					</td>
					
					<td>
					<ul class="nav">
								<li>
								<form action="" method="POST">
								<input class="po"type="submit" value="VISITAS/IDIOMAS">
								</form>
									<ul id="capa1">
											<li><form method="POST" action="/visitas.do" >
								<input class="sub"type="submit" value="Visitas">
								</form></li>
											<li><form method="POST" action="#idiomas" >
								<input class="sub" type="submit" value="Idioma">
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
								<form method="POST" action="../login" >
	<input type="hidden" name="ingresar" value="ingresar">
	<input class="po"type="submit" value="INICIAR SESION">
								</form>
								<%}else{%>
								<form action="/1" method="POST"><input type="hidden" name="cerrar" value="cerrar">
								<input class="po" type="submit" value="CERRAR SESION">
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
		<center><div class="divtabla">
		
		<input type="hidden" name="empleado" value="empleado">
		<center><table id="tablamm" border="1px">
	<tr><td><center><h3 class="titu">LORENA</h3></center></td></tr>
	
	<tr>
	<td>
	 
	 Masajista Profesional
	 Masaje descontracturante y relajante. <br>
	 Antiestres. Sedativo.
	 Masaje circulatorio. Drenaje linfático manual.
	 Reflexología
	 Masajes reductores. Tratamientos de estética.
	 - Atención ambos sexos -  
	<BR><BR>
	<center><img src="css/data0/images/lorena.jpg" alt=""></center>
	
	<form method="POST" action="mas">
	<input  type="hidden" name="lorena" value="lorena" >
	<input  class="m"  type="submit" value="SELECCIONAR">
	</form>
	</td>
	</tr>
	<tr><td><center><h3 class="titu">MAGALY</h3></center></td></tr>
	<tr><td> 
	<br>
	<br>
     Masajista Matriculada
	Si tenés ganas de sentirte pleno y experimentar una
	sensación de bienestar total, es el momento de decir
	adiós al estres.Masajes Descontracturantes.Deportivos. 
	Shiatsu.Quiropraxia. Reflexología de manos y pies.
	Solicitar turnos con más de dos horas de anticipación.
	<BR><BR>
	 	<center><img src ="css/data0/images/magaly.jpg" alt="">	</center>
	<form method="POST" action="mas">
	<input  type="hidden" name="magaly" value="magaly" >
	<input  class="m"  type="submit" value="SELECCIONAR">
	</form>
	</td>
	
	<tr><td><center><h3 class="titu">MATIAS </h3></center></td></tr>
	<tr>
	<td>
	<br>
	<br>
	  Masajista Profesional<br> 
	10 años de experiencia<br>
	Masaje Deportivo. Masajes Terapéuticos<br>
	Descontracturantes y Relajantes. Piedras calientas.<br> 
	Sistema español y descartable con bandas.<br>
	Conocimientos de Inglés y Portugués<br>
		- Atención ambos sexos -<br> 
		<br>
	
     <center><img src="css/data0/images/matias.jpg"alt="">	</center>
<form method="POST" action="mas">
	<input  type="hidden" name="matias" value="matias" >
	<input  class="m"  type="submit" value="SELECCIONAR">
	</form>	
	</td>
    </tr>
    <tr><td><center><h3 class="titu">Normi</h3></center></td></tr>
	<tr>
	<td>
	<br>
	<br>
	Masajista Profesional 
	Masajes descontracturantes, relajantes y sedativos. 
	Reflexología.
	Gabinete confortable. Absoluta privacidad.
	Trabajo sola, en mi consultorio propio
	Recomendacion Cahuina de s.....!
	- Atención ambos sexos -
	<br>
	<br>
	<center><img src="css/data0/images/Normi.jpg"alt="">	</center>
	<form method="POST" action="mas">
	<input  type="hidden" name="Normi" value="Normi" >
	<input  class="m"  type="submit" value="SELECCIONAR">
	</form>	
	</td>
	</tr>
	</table></center>
	</div></center>

	<a href="https://www.dropbox.com/sh/mpp7omw5o56u7mm/AAC3l6puwV-zxWZSBjPD--HWa?dl=0">PLAN DE  TRABAJOS</a>
   
   
    <div style="height:25px"></div>
    <div class="line"></div>
    <div id="bottom">
        <div id="b_col1">
            <h1>About</h1>
            <div style="height:10px"></div>
SPA WORLD is the total Family spa resort the runs 24/7 Throughout the year. Open Hour: 24 hour on Poultice room, Sauna, Bade pool and Fitness center
        </div>
        <div id="b_col2">
            <h1>Contact Information</h1>
            <div style="height:20px"></div>
            <div style=" line-height: 25px">
            	13830-A10 Braddock Road,<br>
                Centreville, VA 20121<br>
                Phone:  703-815-8959<br>
				E-mail: info@spaworld.com
            </div>
        </div>
        <div id="b_col3">
            <h1>Quick Navigation</h1>
            <div style="height:15px"></div>
            <table border="0">
              <tr>
                <td style="width: 76px;"><a href="#" class="a_qn">Facilities</a></td>
                <td><a href="#" class="a_qn">Community</a></td>
              </tr>
              <tr>
                <td ><a href="galeria.jsp" class="a_qn">Gallary</a></td>
                <td><a href="#" class="a_qn">About us</a></td>
              </tr>
            </table>
        </div>
        <div id="b_col4">
            <h1>Follow Us</h1>
            <div style="height:15px"></div>
            <ul class="spis_fu">
                <li><img src="imagen/carta.jpg" class=" fu_i" alt="" ><a href="#">Subscribe to Blog</a></li>
                <li><img src="imagen/facebook.jpg" class=" fu_i" alt="" ><a href="https://www.facebook.com/pages/America-Hotel-Sauna-Spa/292260277482762?fref=ts">Be a fan on Facebook</a></li>
                <li><img src="imagen/red.jpg" class=" fu_i" alt="" ><a href="#">RSS Feed</a></li>
	                <li><img src="imagen/twitter.png" class=" fu_i" alt="" ><a href="#">Follow us on Twitter</a></li>
            </ul> 
        </div>
       </div>
       <a href="http://validator.w3.org/check?uri=http%3A%2F%2F4-dot-proyectosaunaspa.appspot.com%2F&charset=%28detect+automatically%29&doctype=Inline&group=0&user-agent=W3C_Validator%2F1.3+http%3A%2F%2Fvalidator.w3.org%2Fservices">
<img src="http://www.w3.org/Icons/valid-html401" alt="Valid HTML 4.01 Transitional" height="31" width="88">
</a>
<a href="https://jigsaw.w3.org/css-validator/validator?uri=http%3A%2F%2F4-dot-proyectosaunaspa.appspot.com%2F&profile=css3&usermedium=all&warning=1&vextwarning=&lang=es">
<img style="border:0;width:88px;height:31px"
            src="http://jigsaw.w3.org/css-validator/images/vcss"
            alt="¡CSS Válido!">
</a>
</body>
</html>