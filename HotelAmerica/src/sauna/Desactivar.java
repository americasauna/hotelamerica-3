package sauna;

import java.io.IOException;
import java.util.List;

import javax.jdo.Query;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import beans.Cliente;

import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
public class Desactivar extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		

		String op = req.getParameter("radio");
		String pass = req.getParameter("pass");
		
		System.out.println("Password que llega--->"+pass);
		
		
		
		
		if(op==null || op.equals(null)){
			System.out.println("Suling tontaaaa");
			resp.sendRedirect("/RDesactivar");
		}else{
		System.out.println("¿Se leyó ono leyó?--->"+op);	
		boolean aux=false;
		if (op.equals("yes")) {
			HttpSession registro = req.getSession();
			Key id = (Key) registro.getAttribute("id");

			PersistenceManager pm = PMF.get().getPersistenceManager();
			Query q = pm.newQuery(Cliente.class);
			// q.setFilter("Key==KeyParam");
			// q.declareParameters("String KeyParam");
			
			
			@SuppressWarnings("unchecked")
			List<Cliente> listaClientes = (List<Cliente>) q.execute();
			for (Cliente c : listaClientes) {

				if (c.getKey().equals(id) && c.getPassword().equals(pass)){
					// metodo para desactivar
					c.setEstado("desactivo");
					System.out.println(c.getEstado());
					registro.invalidate();
					getServletContext().setAttribute("clave", "desactivado");
					resp.sendRedirect("inicio");
					aux=true;
				}
			}
			
			if(aux==false){
				registro.setAttribute("incorrecto", aux);
				System.out.println("¿correcto o incorrecto?--->" +registro.getAttribute("incorrecto"));
				resp.sendRedirect("/RDesactivar");
			}
		}
		}

	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}
}
