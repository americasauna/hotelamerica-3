package ControlerAdmin;
import sauna.*;
import beans.*;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class BloquearEmpleado extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String mensaje="Borrado con exito";
		String operacion= req.getParameter("op");
		try{
			if(req.getParameterValues("elegidos")==null){
				final PersistenceManager pm = PMF.get().getPersistenceManager();
				Query q = pm.newQuery(Empleado.class);
				List<Empleado> emp2 = (List<Empleado>) q.execute();
				req.setAttribute("empleados", emp2);
				mensaje="Debe seleccionar una opcion";
				req.setAttribute("mensajito", mensaje);
				System.out.println(mensaje);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/admin/BloquearEmpleado.jsp");
				rd.forward(req, resp);
			}
			
			String[] elegidos = req.getParameterValues("elegidos");
			System.out.println(elegidos.length);
			final PersistenceManager pm = PMF.get().getPersistenceManager();
			Query q = pm.newQuery(Empleado.class);
			List<Empleado> emp = (List<Empleado>) q.execute();
			for(Empleado a:emp){
				for(String b: elegidos){
					if(a.getId()== Long.parseLong(b)){
						if(operacion.equals("bloquear")){
							a.setActividad(false);
							mensaje="Bloqueo se completo con exito";
						}else if(operacion.equals("activar")){
							a.setActividad(true);
							mensaje="Activacion se realizo con exito";
						}
					}
				}
			}
			List<Empleado> emp2 = (List<Empleado>) q.execute();
			req.setAttribute("empleados", emp2);
			req.setAttribute("mensajito", mensaje);
			System.out.println(mensaje);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/adm/empleado?e=3");
			rd.forward(req, resp);
		}catch(Exception e){
			System.out.println(e);
		}finally{
			System.out.println("Christian yellow");
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}
}
