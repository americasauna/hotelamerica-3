package sauna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class Admin extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		HttpSession menu=req.getSession();
		String index=(String)menu.getAttribute("index");
		String idioma= (String)menu.getAttribute("idioma");
		String idiomaEscogi = req.getParameter("idioma");
		System.out.println("Idioma en donde estamos ---->"+idioma);
		System.out.println("Pagina donde estamos--->"+index);
		System.out.println("idiomaEsccogido----->"+idiomaEscogi);
		
		String direccion = new Metodos().Idioma(idiomaEscogi, idioma);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"/admin/Administrador.jsp");
		rd.forward(req, resp);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req,resp);
	}
	
}
