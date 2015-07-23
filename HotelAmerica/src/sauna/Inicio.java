package sauna;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Cliente;

@SuppressWarnings("serial")
public class Inicio extends HttpServlet {
	@SuppressWarnings("unused")
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		//quiza codigo para saber si esta logeado o no
		//4 variantes
		//DESACTIVADO-LOGEADO-NOLOGEADOA-CERRADOSESION-CAMBIARCONTRASEÑA-bloqueado
		String opcionDesactivar = req.getParameter("radio");
		//desactivado
		String clave =(String) getServletContext().getAttribute("clave");
		System.out.println("lo que paso en el servlet context--->"+clave);
		
//		if(clave.equals("desactivado")){
//			
//		}


				
		//PARA SABER todas las variantees del idioma:
		HttpSession menu=req.getSession();
		String index=(String)menu.getAttribute("index");
		String idioma= (String)menu.getAttribute("idioma");
		String idiomaEscogi=req.getParameter("idioma");
		System.out.println("Idioma en donde estamos ---->"+idioma);
		System.out.println("Pagina donde estamos--->"+index);
		
		System.out.println("idiomaEsccogido----->"+idiomaEscogi);
		
		
		//cuando se invalida la sesions
		if(idioma==null && idiomaEscogi==null && index==null){
			System.out.println("sddddd");
			resp.sendRedirect("/index.jsp");
		}
		else{
			index+=".jsp";
			System.out.println(index);
			//idioma
			if(idiomaEscogi!=null){
				if(idiomaEscogi.equals("ing")){
					idiomaEscogi="/en/";
				}else {
					if(idiomaEscogi.equals("esp"))
						idiomaEscogi="/";
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF"+idiomaEscogi+"index.jsp");
				rd.forward(req, resp);	
			}else{
				//Es cuando no traduce sol odirecciona
				if(idioma.equals("")) {
					System.out.println("porsiacaso");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
					rd.forward(req, resp);
				}
				else{
					if(idioma.equals("en")){
						RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/en/index.jsp");
						rd.forward(req, resp);
					}		
				}

			}
		}
	}
		
	
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req,resp);
	}
	
}