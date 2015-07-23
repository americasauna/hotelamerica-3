<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="javax.print.attribute.DocAttribute"%>
<%@page import="com.google.appengine.api.search.Document"%>
<%@page import="sauna.*"%>
<%@page import="beans.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="javax.jdo.Query"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="java.text.SimpleDateFormat" %>

<%HttpSession menu=request.getSession();%>
<%menu.removeAttribute("index");%>
<%menu.setAttribute("index", "cambiarPassword");%>
<%menu.removeAttribute("idioma");%>
<%menu.setAttribute("idioma", "");%>


<%HttpSession registro=request.getSession(); %>
<%String user= (String)registro.getAttribute("usuario");%>
<%String us=(String) request.getAttribute("usuario");
System.out.println("registro----"+user);
System.out.println("request-------"+us);

%>
<%boolean flag=false;
if(user!=null && user.equals("admin")){
	flag=true;}%>
<%registro.setAttribute("flag", flag);%>

<html>
<head>
<link rel=stylesheet href="css/estiloCuenta.css" type="text/css" media=screen>
<link rel="stylesheet" type="text/css" href="/css/stilo.css" media="screen" >
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>

<script>
$(function(){
  $(".accordion-titulo").click(function(e){
           
        e.preventDefault();
    
        var contenido=$(this).next(".accordion-content");

        if(contenido.css("display")=="none"){ //open        
          contenido.slideDown(250);         
          $(this).addClass("open");
        }
        else{ //close       
          contenido.slideUp(250);
          $(this).removeClass("open");  
        }

      });
});

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
								<form action="/reservacion" method="POST"><input type="hidden" name="reservaciones" value="reservaciones">
								<input class="po"type="submit" value="RESERVACIONES">
								</form>
									
									
										
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
								<ul id="capa1">
											<li><form method="POST" action="" >
								<input class="sub"type="submit" value="Configurar Cuenta">
								</form></li>
											<li><form method="POST" action="RDesactivar" >
								<input class="sub" type="submit" value="Desactivar Cuenta">
								</form></li>
									</ul>
								<%} %>
								</li>
								
							</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</center>

<div id="container-main">

<h1>Configuración de Cuenta</h1>

    <div class="accordion-container">
    
        <a href="" class="accordion-titulo">Editar Usuario<span class="toggle-icon"></span></a>
        <div class="accordion-content">
  <form method="post"action="/configurar" class="campos">
          Usuario:<input id="b_reset"type="text" name="usuario" value="<%=user%>"><br><br>
                 <input id="b_submit" type="submit" value="Guardar Cambios" class="boton">
        </form>
      
                 
</div>
        
    </div>
    
    <div class="accordion-container">
        <a href="#" class="accordion-titulo">Cambiar Contraseña<span class="toggle-icon"></span></a>
        <div class="accordion-content">

  <form method="post"action="/configurar" class="campos">
          Contraseña Actual:<input id="b_reset" type="password" name="password"><br><br>
          Nueva Contraseña :<input  id="b_reset" type="password" name="contraseña"><br><br>
          Confirmar Contraseña :<input id="b_reset" type="password" name="contraseña2"><br><br>  
          <%String m=(String)getServletContext().getAttribute("menso");
          System.out.println("menso  "+m);
          if(m!=null && m.equals("menso")) {%>
          <h3>Las contraseñas no coinciden</h3><%} %>   
 <input id="b_submit" type="submit" value="Guardar Cambios" class="boton">
        </form>
      
                    </div>

    </div>

</div>

</body>
</html>