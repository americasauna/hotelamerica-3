package ControlerAdmin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.Key;

import beans.Cliente;
import sauna.Metodos;
import sauna.PMF;

@SuppressWarnings("serial")
public class AdmCliente extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		//controlador
			
		String accion=req.getParameter("e");
		System.out.println("accion del empleado  "+ accion);
		String[] borrarClientes = req.getParameterValues("borrarClientes");
		String[] bloquearClientes = req.getParameterValues("bloquearClientes");
		String[] activarClientes = req.getParameterValues("activarClientes");
		String buscarpor = req.getParameter("buscarpor");
		String buscar = req.getParameter("buscar");
	
		HttpSession menu=req.getSession();
		
		
		String index=(String)menu.getAttribute("index");
		String idioma= (String)menu.getAttribute("idioma");
		String idiomaEscogi = req.getParameter("idioma");
		System.out.println("Idioma en donde estamos ---->"+idioma);
		System.out.println("Pagina donde estamos--->"+index);
		System.out.println("idiomaEsccogido----->"+idiomaEscogi);
		String direccion = new Metodos().IdiomaAdmin(idiomaEscogi, idioma);
		//VAlor para saber que acciones se realizan con el empleado
		
	

		if(borrarClientes!=null){
			for (String x : borrarClientes) {
				System.out.println(" christiann arregla.."+x);
			}
			
			
			for(String a:borrarClientes){
				final PersistenceManager pm = PMF.get().getPersistenceManager();
				Query q = pm.newQuery(Cliente.class);
				@SuppressWarnings("unchecked")
				List<Cliente> emp = (List<Cliente>) q.execute();
				System.out.println(" Strings:::: " +a);
				for(Cliente b: emp){
					System.out.println(" Strings:::: " +a);
					if(a.equals(b.getGmail())){
						System.out.println("eliminado ----> " + b.toString());
						pm.deletePersistent(b);
					}
				}
//				for (int i = 0; i < borrarClientes.length; i++) {
//					
//				}
				pm.close();
			}
//			@SuppressWarnings("unchecked")
//			List<Cliente> emp2 = (List<Cliente>) q.execute();
//			getServletContext().removeAttribute("clientes");
//			getServletContext().setAttribute("clientes", emp2);
			
		}
		if (bloquearClientes != null) {

			final PersistenceManager pm = PMF.get().getPersistenceManager();
			Query q = pm.newQuery(Cliente.class);
			@SuppressWarnings("unchecked")
			List<Cliente> emp = (List<Cliente>) q.execute();
			for (Cliente a : emp) {
				for (String b : bloquearClientes) {
					if (a.getGmail().equals(b)) {
						System.out.println("bñoquear ----> " + a.toString());
						a.bloquear();
					}
				}
			}
			pm.close();
		}
		if (activarClientes != null) {

			final PersistenceManager pm = PMF.get().getPersistenceManager();
			Query q = pm.newQuery(Cliente.class);
			@SuppressWarnings("unchecked")
			List<Cliente> emp = (List<Cliente>) q.execute();
			for (Cliente a : emp) {
				for (String b : bloquearClientes) {
					if (a.getGmail().equals(b)) {
						System.out.println("bñoquear ----> " + a.toString());
						a.activar();
					}
				}
			}
			pm.close();
		}
		
		
		if (buscarpor!=null && buscar!=null) {
			
			System.out.println("Buscar por---- "+buscarpor);
			System.out.println("Buscar ---- "+buscarpor);
			
			final PersistenceManager pm = PMF.get().getPersistenceManager();
			Query q = pm.newQuery(Cliente.class);
			
			@SuppressWarnings("unchecked")
			List<Cliente> todos = (List<Cliente>) q.execute();
			ArrayList<Cliente> aux = new ArrayList<Cliente>();
			
			for (Cliente cliente : todos) {
				if(buscarpor.equals("1")){
					System.out.println(" Es 1");
					if(buscar.equals(cliente.getLogin())){
						System.out.println("igualess-- "+ cliente);
						aux.add(cliente);
					}
					
				}	
				if(buscarpor.equals("2")){
					System.out.println(" Es 1");
					if(buscar.equals(cliente.getName())){
						System.out.println("igualess-- "+ cliente);
						aux.add(cliente);
					}
					
				}
				if(buscarpor.equals("3")){
					System.out.println(" Es 1");
					if(buscar.equals(cliente.getApellido())){
						System.out.println("igualess-- "+ cliente);
						aux.add(cliente);
					}
					
				}
				if(buscarpor.equals("4")){
					System.out.println(" Es 1");
					if(buscar.equals(cliente.getDni())){
						System.out.println("igualess-- "+ cliente);
						aux.add(cliente);
					}
					
				}
				if(buscarpor.equals("5")){
					System.out.println(" Es 1");
					if(buscar.equals(cliente.getGmail())){
						System.out.println("igualess-- "+ cliente);
						aux.add(cliente);
					}
					
				}
			}
			req.setAttribute("listaencontrada", aux);
			
			pm.close();
		}
		
	
		
		
		
		System.out.println("valor o  "+accion);
		if(accion==null ){
			if( buscarpor!=null && buscar!=null){
				RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"ResultBusqueda.jsp");
				rd.forward(req, resp);
			}else{
				System.out.println("entra al primero");
				RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"AdmCliente.jsp");
				rd.forward(req, resp);
				
			}
			
			}
		else {
			int accio=Integer.parseInt(accion);
			System.out.println("va al otro");
		if(accio==0){
			RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"BloquearCliente.jsp");
			rd.forward(req, resp);
		}else{
			if(accio==1){
				RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"BorrarCliente.jsp");
				rd.forward(req, resp);
			}else{
				if(accio==2){
					RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"ActivarCliente.jsp");
					rd.forward(req, resp);
				}else{
					if(accio==3){
						RequestDispatcher rd = getServletContext().getRequestDispatcher(direccion+"BuscarCliente.jsp");
						rd.forward(req, resp);
					}
					
				
			resp.sendRedirect("/adm/cliente");
			}}
			
	}}
		//req.setAttribute("listaEmpleados", empleados );	
		
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}

}
