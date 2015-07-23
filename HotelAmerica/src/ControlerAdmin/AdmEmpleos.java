package ControlerAdmin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sauna.Metodos;

@SuppressWarnings("serial")
public class AdmEmpleos extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
	
		//controlador
		//WE ARE THE ONES
		
		HttpSession menu=req.getSession();
		String index=(String)menu.getAttribute("index");
		String idioma= (String)menu.getAttribute("idioma");
		String idiomaEscogi = req.getParameter("idioma");
		System.out.println("Idioma en donde estamos ---->"+idioma);
		System.out.println("Pagina donde estamos--->"+index);
		System.out.println("idiomaEsccogido----->"+idiomaEscogi);
				
		String direccion = new Metodos().IdiomaAdmin(idiomaEscogi, idioma);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"AdmEmpleos.jsp");
		rd.forward(req, resp);	
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}

}
