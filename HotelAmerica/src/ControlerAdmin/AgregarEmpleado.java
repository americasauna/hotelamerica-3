package ControlerAdmin;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import sauna.PMF;
import beans.Empleado;

@SuppressWarnings("serial")
public class AgregarEmpleado extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String name = req.getParameter("nom");
		String apellido = req.getParameter("ape");
		String sexo = req.getParameter("sex");
		String dni = req.getParameter("dni");
		String gmail = req.getParameter("mail");
		String telefono = req.getParameter("tel");
		String nacimiento = req.getParameter("fecha1") + "/"
				+ req.getParameter("fecha2") + "/" + req.getParameter("fecha3");
		;
		String direccion = req.getParameter("dire");
		String area = req.getParameter("area");
		String sueldo = "0";
		if (area.equals("Sauna")) {
			sueldo = "1";
		} else if (area.equals("Hotel")) {
			sueldo = "2";
		} else if (area.equals("Masajes")) {
			sueldo = "3";
		} else if (area.equals("Estetica")) {
			sueldo = "4";
		} else if (area.equals("Restaurant")) {
			sueldo = "5";
		}
		Empleado emp= new Empleado(name, apellido, sexo, dni, gmail, telefono, nacimiento, direccion, area, sueldo);
	
		System.out.println(emp.toString());
		System.out.print(req.getLocalName() +" "+ emp.getName());
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.makePersistent(emp);
			req.setAttribute("mensajito", "Se registro Correctamente");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/adm/empleado");
			rd.forward(req,resp);
		} catch (Exception e) {
			System.out.print(e);
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
		
	}
}
