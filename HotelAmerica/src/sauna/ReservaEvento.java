package sauna;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
//import javax.jdo.annotations.Persistent;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import beans.ReservaLocal;

public class ReservaEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String fecha = req.getParameter("fecha1");
		String adultos = req.getParameter("nadultos");
		String niños = req.getParameter("nni�os");
		String evento = req.getParameter("evento");
		String extra = req.getParameter("extras");
		ReservaLocal reserva = new ReservaLocal(fecha, adultos, niños, evento,extra);
		String mensaje = "Su Reserva se Realizo con Exito, Pronto Recibira una Llamada De Confirmacion";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		if (validar(reserva)) {
			try {
				pm.makePersistent(reserva);
				System.out.println(true);
			} catch (Exception e) {
				System.out.print(e);
			}
		} else {
			mensaje = "Lo sentimos, al parecer lleno mal el formulario";
			System.out.println(false);
		}
		System.out.println(validar(reserva));
		try {
			Query q = pm.newQuery(ReservaLocal.class);
			@SuppressWarnings("unchecked")
			List<ReservaLocal> reservado = (List<ReservaLocal>) q.execute();
			req.setAttribute("reservas", reservado);
			req.setAttribute("mensajito", mensaje);
			System.out.println(mensaje);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/bbb.jsp");
			rd.forward(req, resp);
		} catch (Exception a) {
		}
	}

	public boolean validar(ReservaLocal a) {
		return (a.getFecha()
				.matches("[2][0][1][5-6][/][0-1][1-9][/][0-3][0-9]")
				&& a.getAdultos().matches("[1-9][1-9]?") 
				&& a.getNiños().matches("[0-9][1-9]?")
				);
	}
}