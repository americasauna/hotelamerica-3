<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="javax.print.attribute.DocAttribute"%><jsp:declaration></jsp:declaration>
<%@page import="com.google.appengine.api.search.Document"%>
<%@page import="sauna.*"%>
<%@page import="beans.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.jdo.Query"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="java.text.SimpleDateFormat" %>

<%HttpSession menu=request.getSession(true);%>
<%menu.removeAttribute("index");%>
<%menu.setAttribute("index", "index");%>
<%menu.removeAttribute("idioma");%>
<%menu.setAttribute("idioma", "");%>


<%HttpSession registro=request.getSession(); %>
<%String user= (String)registro.getAttribute("usuario");%>
<%String us=(String) request.getAttribute("usuario");
if(user==null){
	response.sendRedirect("/login");}
%>

<%boolean flag=false;
if(user!=null && user.equals("admin")){
	flag=true;}%>
<%registro.setAttribute("flag", flag);%>



<%PersistenceManager pm = PMF.get().getPersistenceManager();
Query q = pm.newQuery(Visitas.class);
Visitas vistas=null;
List<Visitas> visitas = (List<Visitas>) q.execute();
if(visitas.isEmpty()){
	vistas = new Visitas();
	pm.makePersistent(vistas);
}else{
	visitas.get(0).addVisita();
}%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/stilo.css" media="screen" >
<link rel="stylesheet" type="text/css" href="/css/estiloIdioma.css" media="screen" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Proyecto</title>
<script type="text/javascript" src="/js/jquery.js"></script>
	<style>
	.sugerir{
		opacity:0;
	}
	.sugerir:target{
		opacity:1;
	}
	.idiomas{
		opacity:0;
	}
	.idiomas:target{
		opacity:1;
	}
</style>
<script> 
 
</script> 

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
								<input class="po" type="submit" value="ADMINISTRAR">
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
								<input class="po"type="submit" value="SERVICIOS">
								</form> 
								<!--	<form action="sauna" method="get" name="f1" id="f1">
										<input type="hidden" name="enlace" value="servicios">
									</form>
									-->
									<ul  id="capa11">
												<li><form method="POST" action="servicios/hospedaje" ><input type="hidden" name="hospedaje" value="hospedaje">
								<input class="sub"type="submit" value="HOSPEDAJE">
								</form>
												<li><form method="POST"action="servicios/sauna" ><input type="hidden" name="sauna" value="sauna">
								<input class="sub"type="submit" value="SAUNA">
								</form></li>
												<li><form method="POST" action="servicios/masaje" ><input type="hidden" name="masajes" value="masajes">
								<input class="sub"type="submit" value="MASAJES">
								</form></li>
												<li><form action="servicios/estetica" method="POST" ><input type="hidden" name="estetica" value="estetica">
								<input class="sub"type="submit" value="ESTETICA">
								</form>
													<ul>
														<li><form action="servicios/estetica/cabello" method="POST"><input type="hidden" name="cabello" value="cabello">
								<input class="sub"type="submit" value="CABELLO">
								</form></li>
														<li><form action="servcios/estetica/manicure" method="POST"><input type="hidden" name="manicure" value="manicure">
								<input class="sub"type="submit" value="MANICURE">
								</form></li>
														<li><form action="servicios/estetica/pedicure" method="POST" ><input type="hidden" name="pedicure" value="pedicure">
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
							
					<td><img height="75" width="300" src="/spa.jpg" alt=""></td>
					
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
								<form method="POST" action="/login" >
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
	<a href="docs.google.com/forms/d/1QZWXrdGKXTrHQmPm9O5ObF6YszQzLyuxJt8QbKX3wX8/viewform"></a>
	<DIV>
	<a href="/eventoregistro"></a>
	</DIV>
	
	<div id="idiomas" class="idiomas">
	<div>
		<a href="" title="Cerrar" class="cerrar">X</a>
		<div id="sugerir">
		<form action="/inicio" method="post" name="formuIdiomas">	
		<div id="titulo"><H2>Escoje el idioma</H2></div>
		<div class="selectt">
		<select name="idioma" id="idioma" class="selecttt">
				    <option>--Seleccione--</option>
					<option value="esp">Español</option>
					<option value="ing">Ingles</option>
		</select> 
		</div> <br>
		<input  type = "submit" value="TRADUCIR" id="submitt" ><br>
		</form>
	</div>
	</div>
	</div>
	
<h2>Reservacion</h2>
<div Style="width: 550px;">
<form action="" method="post">
<h4>Seleccione su cupon:</h4>
<br>
<input type="checkbox" name="servicio" value="masajes">Cupon de Masaje:  <br>
<div style="margin-left: 30px;">

<input type="checkbox" name="tipoMasaje" value="elegir">Elegir al ingresar<br>
<input type="checkbox" name="tipoMasaje" value="elegir">Masajes Relajantesr<br>
<input type="checkbox" name="tipoMasaje" value="elegir">Masajes Descontracturantes<br>
<input type="checkbox" name="tipoMasaje" value="elegir">Masaje con piedras calientes<br>
</div>
<br><br>
<input type="checkbox" name="servicio" value="sauna">Cupon de Sauna: <br>
<div style="margin-left: 30px;">
<input type="checkbox" name="tipoSauna" value="elegir">Elegir al ingresar<br>
<input type="checkbox" name="tipoSauna" value="elegir">UNA CAMARA SECA<br>
<input type="checkbox" name="tipoSauna" value="elegir">DOS CAMARAS A VAPOR<br>
<input type="checkbox" name="tipoSauna" value="elegir">DOS HIDROMASAJES<br>
<input type="checkbox" name="tipoSauna" value="elegir">PISCINA TEMPERADA<br>
<input type="checkbox" name="tipoSauna" value="elegir">DUCHA ESPAÑOLA<br>
<input type="checkbox" name="tipoSauna" value="elegir">SALA DE MASAJES<br> 
</div>
<br><br>
<input type="checkbox" name="servicio" value="estetica"  id="check" onchange="habilitar(this.checked);">Cupon de Estetica: <br>
<div style="margin-left: 30px;" id="segundo">
<input type="checkbox" name="tipoSauna" value="elegir" id="segundo">Elegir al ingresar<br>
<input type="checkbox" name="tipoSauna" value="elegir" id="segundo">Cabello<br>
<input type="checkbox" name="tipoSauna" value="elegir" id="segundo">Manicure<br>
<input type="checkbox" name="tipoSauna" value="elegir" id="segundo">Pedicure<br>
<input type="checkbox" name="tipoSauna" value="elegir" id="segundo">Tintes<br>
</div>
<br><br>
<input type="submit" value="Reservar">
</form>

</div>

<script>
		function habilitar(value)
		{
			if(value==true)
			{
				// habilitamos
				document.getElementById("segundo").disabled=false;
			}else if(value==false){
				// deshabilitamos
				document.getElementById("segundo").disabled=true;
			}
		}
	</script>
</body>
</html>