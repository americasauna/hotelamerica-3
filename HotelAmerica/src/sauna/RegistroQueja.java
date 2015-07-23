package sauna;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistroQueja extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String asunto = req.getParameter("reason");
		String nempleado = req.getParameter("empleado");
		Queja queja= new Queja(asunto,nempleado);
		String mensaje = "Su queja sera evaluada y se tomaran las medidas respectivas";
		final PersistenceManager pm = PMF.get().getPersistenceManager();
			try{
				pm.makePersistent(queja);
				System.out.println("sadasd");
				
				System.out.println("sadasd222");
				Query q = pm.newQuery(Queja.class);
				@SuppressWarnings("unchecked")
				List<Queja> quejas = (List<Queja>) q.execute();
				req.setAttribute("quejas", quejas);
				req.setAttribute("mensajito", mensaje);
				System.out.println("aquiii");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/ccc.jsp");
				rd.forward(req, resp);
				System.out.println("aquiii wessssss");
				
			}catch(Exception e){
				mensaje = "Lo sentimos, al parecer lleno mal el formulario";
				System.out.println(e);
			}
			
		
	}

}