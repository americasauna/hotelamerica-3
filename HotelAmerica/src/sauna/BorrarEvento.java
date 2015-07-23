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

import beans.ReservaLocal;

@SuppressWarnings("serial")
public class BorrarEvento extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String mensaje="Borrado con exito";
		try{
			String[] elegidos = req.getParameterValues("elegidos");
			System.out.println(String.valueOf(elegidos.length+" Eventos"));
			final PersistenceManager pm = PMF.get().getPersistenceManager();
			Query q = pm.newQuery(ReservaLocal.class);
			@SuppressWarnings("unchecked")
			List<ReservaLocal> reservas = (List<ReservaLocal>) q.execute();
			for(ReservaLocal a:reservas){
				for(String b: elegidos){
					if(a.getId()== Long.parseLong(b)){
						System.out.println("eliminado" + a.toString());
						System.out.println(a.getId() + " " + Long.parseLong(b));
						System.out.println(a.getId()==Long.parseLong(b));
						pm.deletePersistent(a);
					}
				}
			}
			@SuppressWarnings("unchecked")
			List<ReservaLocal> reservas2 = (List<ReservaLocal>) q.execute();
			req.setAttribute("reservas", reservas2);
			req.setAttribute("mensajito", mensaje);
			System.out.println(mensaje);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/bbb.jsp");
			rd.forward(req, resp);
		}catch(Exception e){
			System.out.println(e);
		}finally{
		}
	}	
}