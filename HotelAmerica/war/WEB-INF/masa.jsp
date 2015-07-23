
<%@page import="javax.print.attribute.DocAttribute"%>
<%@page import="com.google.appengine.api.search.Document"%>
<%@page import="sauna.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="beans.*"%>
<%HttpSession menu=request.getSession(true); %>

<%HttpSession registro=request.getSession(); %>
<%String user= (String)registro.getAttribute("usuario");%>
<%String us=(String) request.getAttribute("usuario");%>

<%boolean flag=false;
if(user!=null && user.equals("admin")){
	flag=true;}%>
<%registro.setAttribute("flag", flag);%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/stilo.css" media="screen" >
<link rel="stylesheet" type="text/css" href="css/masaje.css" media="screen" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SAUNA SPAA MERICA</title>
<script type="text/javascript" src="js/jquery.js"></script>
<body>
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
	<br><br><br>
	<center><div class="masasa">
	<form action="sauna" method="POST">
	<input type="hidden" name="reservamasaje" value="reservamasaje">
	<table id="masatable" border="1px" bordercolor="#ffffff" cellpadding="20px" background="transparent">
	<tr><td><center>TIPO DE MASAJE</center></td><td><center>IMAGEN</center></td></tr>
	
	<tr>
	<td>
	<br>
	<center><h3>MASAJES RELAJANTES</h3></center>
	<br>El masaje relajante es una alternativa para experimentar<br>
	 un estado de paz frente a las presiones de la vida diaria<br>
	  y es una poderosa herramienta antiestres que regala total <br>
	  tranquilidad y descanzo físico y emocional a la paciente,<br>
	   además de sus conocidos efectos a favor de la circulación<br>
	   <br><input class="m" type="submit" value="RESERVAR">	
	</td>
	<td>
	
	<img class="imasa" src="../css/data0/images/m1.jpg" alt="m1" >
	</td>
	</tr>
	<tr>
	<td>
	<center><h3>MASAJES DESCONTRACTURANTES </h3></center>
	<br> Una contractura muscular es una contracción <br>
             persistente e involuntaria del músculo. Un <br>
			 músculo se contrae y se distiende, pero en <br>
			 algunos casos, una zona del vasto muscular no<br>
			 se relaja y sigue contraída.<br>
	 <br><input class="m" type="submit" value="RESERVAR">	
	</td>
	<td>
	<img class="imasa" src="../css/data1/images/d1.jpg" alt="d1">
	</td>
	</tr>
	<tr>
	<td>
	<center><h3>MASAJES CON PIEDRAS CALIENTES </h3></center>
	<br>Puedes elegir entre un masaje relajante o descontracturante <br>
		  y sumarle un masaje con piedras calientes. Este es nuestro <br>
		  servicio premium. El masaje con piedras calientes combina el<br>
		  masaje terapéutico tradicional con la aplicación de piedras <br>
		  calientes sobre la piel.<br>
	<br><input class="m" type="submit" value="RESERVAR">	  
	</td>
	<td>
    <img class="imasa"src="../css/data2/images/p1.jpg" alt="p1" >
	</td>
	</tr>
		<tr>
	<td>
	<center><h3>MASAJE PODAL RELAJANTE </h3></center>
	<br>Al realizar el masaje a las zonas reflejas en los pies <br>
	se produce una activación, por lo que se obtiene una mayor <br>
	irrigación sanguínea, aumentando el transporte de un conjunto <br>
	de sustancias nutritivas, oxígeno, energía, hormonas y anticuerpos<br>
    contribuyendo así a la eliminación de toxinas y estimulando el poder<br>
     curativo propio en el cuerpo.<br>
	<br><input class="m"  type="submit" value="RESERVAR">	  
	</td>
	<td>
    <img class="imasa" src="../css/data2/images/pies.jpg" alt="p1">
	</td>
	
	</tr>
	<tr>
	<td>
	<center><h3>MASAJE SHIATSU </h3></center>
	<br>Originaria de Japón y descendiente de la tradición China,<br>
	el shiatsu es una antigua terapia que basa sus beneficios en <br>
	conseguir la correcta canalización de la energía vital mediante<br>
	 la presión en ciertos puntos clave de nuestro cuerpo,<br>
	  ejercida con los dedos y las palmas de las manos<br>
	<br><input class="m"  type="submit" value="RESERVAR">	  
	</td>
	<td>
    <img class="imasa" src="../css/data2/images/mas.jpg" alt="p1">
	</td>
	
	</tr>
	</table>
	
	</form>
	</div></center>
	
	<br>
	<br>
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
