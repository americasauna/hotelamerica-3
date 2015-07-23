package ControlerAdmin;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Cliente;
import beans.Empleado;
import sauna.Metodos;
import sauna.PMF;

@SuppressWarnings("serial")
public class AdmEmpleado extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		//controlador
		String accion=req.getParameter("e");
		PersistenceManager pm = PMF.get().getPersistenceManager();
//		Query q = pm.newQuery(Empleado.class);
//		@SuppressWarnings("unchecked")
//		List<Empleado> empleados = (List<Empleado>)q.execute();
//		for (Empleado e : empleados) {
//			System.out.println("empleados "+e);
//		}
		//we are the ones
	
		HttpSession menu=req.getSession();
		
		
		String index=(String)menu.getAttribute("index");
		String idioma= (String)menu.getAttribute("idioma");
		String idiomaEscogi = req.getParameter("idioma");
		System.out.println("Idioma en donde estamos ---->"+idioma);
		System.out.println("Pagina donde estamos--->"+index);
		System.out.println("idiomaEsccogido----->"+idiomaEscogi);
		String direccion = new Metodos().IdiomaAdmin(idiomaEscogi, idioma);
		//VAlor para saber que acciones se realizan con el empleado
		
		System.out.println("valor o  "+accion);
		if(accion==null){
			System.out.println("entra al primero");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"AdmEmpleado.jsp");
			rd.forward(req, resp);
			
			}
		else{
			int accio=Integer.parseInt(accion);
			System.out.println("va al otro");
		if(accio==0){
			RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"RegistroEmpleado.jsp");
			rd.forward(req, resp);
		}else{
			if(accio==1){
				RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"blockemp.jsp");
				rd.forward(req, resp);
			}else{
				if(accio==2){
					RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"BuscarEmpleado.jsp");
					rd.forward(req, resp);
				}else{
					
					if(accio==3){
						RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"BloquearEmpleado.jsp");
						rd.forward(req, resp);
					}else{
						resp.sendRedirect("/adm/empleado");
					}
						
				}
			}
		}}
				//req.setAttribute("listaEmpleados", empleados );
	}
		
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}

}
