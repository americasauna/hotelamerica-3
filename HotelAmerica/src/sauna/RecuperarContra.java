package sauna;

import java.io.IOException;

import java.util.List;
import java.util.Properties;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

@SuppressWarnings("serial")
public class RecuperarContra extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp)
           throws ServletException, IOException {
	   
	   String usuario = req.getParameter("usuario");
       String dni = req.getParameter("dni");
       String telefono = req.getParameter("telefono");
       String email = req.getParameter("email");
      
       Properties props = new Properties();
       Session session = Session.getDefaultInstance(props, null);
      
   		int  i=0;

		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(Cliente.class);
		@SuppressWarnings("unchecked")
		List<Cliente> clientes = (List<Cliente>) q.execute();
       

       try {
           for (Cliente x : clientes) {
        	   System.out.println("ingresado-->"+usuario);
        	   System.out.println("ingresado-->"+dni);
        	   System.out.println("ingresado-->"+telefono);
        	   System.out.println("ingresado-->"+email);
        	   System.out.println("USUARIO-->"+x.getLogin()+"  DNI:--->"+x.getDni()+ "  TELEFONO--->"+x.getTelefono() +"  EMAIL-->"+x.getGmail());
        	   
   			if (x.getLogin().equals(usuario) && x.getTelefono().equals(telefono) && x.getDni().equals(dni) && x.getGmail().equals(email)) {
   				System.out.println("bien ahi ahora a enviar al correo");
   				String password = x.getPassword();
   				String name =x.getName();
   				String msgBodyEmail = "Srs. "+name + "su contraseña es: " + password;
   				Message msg = new MimeMessage(session);
   				msg.setFrom(new InternetAddress("saunaspamerica@gmail.com", " Hotel America "));
   				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email, usuario));
   				msg.setSubject("prueba");
   				msg.setText(msgBodyEmail);
   				Transport.send(msg);
   				
   				
   				RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/confirmCont.jsp");
   				rd.forward(req, resp);
   				
   				
//   			out.println("<h2>Su contrase�a a sido enviada a su correo satisfactoriamente");
   				
   			i++;
   				
   			}
   		}
   		if (i == 0) {
//   			out.println("<h2>El RUC no esta registrado."
//   					+ " Porfavor ingrese uno correcto</h2>");
//   			out.println("<meta http-equiv='Refresh' content='2;url=/es/admin/listaClinicas.jsp'>");
   		}else{
//   			out.println("<meta http-equiv='Refresh' content='2;url=/es/admin/listaClinicas.jsp'>");
   		}

       } catch (Exception e) {
           resp.setContentType("text/plain");
           resp.getWriter().println("HUBO FALLO.");
           throw new RuntimeException(e);
       }

//       resp.setContentType("text/plain");
//       resp.getWriter().println( "SE ENVIO EL EMAIL CORRECTAMENTE.");
   }
   
   protected void doGet(HttpServletRequest req, HttpServletResponse resp)
           throws ServletException, IOException {
	   doPost(req, resp);
   }
}