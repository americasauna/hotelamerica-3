package ControlerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class EmpleadoServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		System.out.println("Nos vamos a registro Empleado");
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/admin/RegistroEmpleado.jsp");
		rd.forward(req,resp);
}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
	}
}