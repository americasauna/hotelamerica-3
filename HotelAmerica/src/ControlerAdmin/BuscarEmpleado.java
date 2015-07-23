package ControlerAdmin;

import java.io.IOException;
import java.util.*;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sauna.PMF;
import beans.Empleado;

@SuppressWarnings("serial")
public class BuscarEmpleado extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		
		final PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q = pm.newQuery(Empleado.class);
		List<Empleado> empleados = (List<Empleado>) q.execute();
		
		String buscado = req.getParameter("buscado");
		System.out.println(buscado);
		if(buscado!=null&&buscado!=""){
			for (Empleado e : empleados) {
				if(e.getDni().equals(buscado)){
					req.setAttribute("mensajito", "ENCONTRADO");
					req.setAttribute("enco", e);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/admin/BuscarEmpleado.jsp");
					rd.forward(req, resp);	
				}
			}
			req.setAttribute("mensajito", "NO ENCONTRADO");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/admin/BuscarEmpleado.jsp");
			rd.forward(req, resp);
			
		}
		else{
			if(buscado==null||buscado==""){
			req.setAttribute("mensajito", "NO VALIDO");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/admin/BuscarEmpleado.jsp");
			rd.forward(req, resp);
		}
			}
		
	}
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}
}