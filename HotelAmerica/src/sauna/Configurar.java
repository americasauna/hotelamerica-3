package sauna;

import java.io.IOException;
import java.util.List;

import javax.jdo.Query;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Cliente;

@SuppressWarnings("serial")
public class Configurar extends HttpServlet {

	@SuppressWarnings("unused")
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		HttpSession registro=req.getSession();
		String antiguoUser=(String)registro.getAttribute("usuario");
		String nuevoUser= req.getParameter("usuario");
		String password= req.getParameter("password");
		String nuevoCont= req.getParameter("contraseña");
		String nuevoCont2= req.getParameter("contraseña2");
		
		
		
		//buscamos el usuario y lo reemplazamos
		System.out.println("antiguo user "+antiguoUser);
		if(nuevoUser!=null){
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Query q= pm.newQuery(Cliente.class);
			@SuppressWarnings("unchecked")
			List<Cliente> listaClientes = (List<Cliente>) q.execute();
			Cliente aux=null;
			
			for (Cliente c : listaClientes) {
				if(antiguoUser.equals(c.getLogin())){
					
					aux=new Cliente(c.getName(), c.getApellido(), c.getTelefono(), c.getDni(), c.getGmail()
							, c.getSexo(), c.getDireccion(), c.getNacimiento(), c.getLogin(), c.getPassword());
					aux.setLogin(nuevoUser);
					pm.deletePersistent(c);
					
					registro.removeAttribute("usuario");
					registro.setAttribute("usuario", nuevoUser);
					System.out.println("OJALAAA LO GUARDE");
					
					System.out.println("olo borro");
					
				}
			}
			pm.makePersistent(aux);
			//System.out.println("despues de l if"+aux.getLogin());
			resp.sendRedirect("/configurarCuenta");
		}
		else{
			System.out.println("antiguo pasword "+  password );
			System.out.println("NuevoCONT --->"+nuevoCont);
			System.out.println("NuevoCONT2 --->"+nuevoCont2);
			if(password!=null){
				PersistenceManager pm = PMF.get().getPersistenceManager();
				Query q= pm.newQuery(Cliente.class);
				@SuppressWarnings("unchecked")
				List<Cliente> listaClientes = (List<Cliente>) q.execute();
				Cliente aux;
				System.out.println("estaos dentro del if");
				for (Cliente c : listaClientes) {
					if(password.equals(c.getPassword())){
						System.out.println("yo le di");
						if(nuevoCont.equals(nuevoCont2)){
							 System.out.println("amiga tengo el corazon herido");
							aux=new Cliente(c.getName(), c.getApellido(), c.getTelefono(), c.getDni(), c.getGmail()
									, c.getSexo(), c.getDireccion(), c.getNacimiento(), c.getLogin(), c.getPassword());
							pm.deletePersistent(c);
							aux.setPassword(nuevoCont);
							System.out.println("que lo borre ahora");
							pm.makePersistent(aux);
						}
						else{
							getServletContext().setAttribute("menso","menso");
							
						}	
					}
					else{
						getServletContext().setAttribute("menso","mensa");
					}
				}
				resp.sendRedirect("/configurarCuenta");
			}
		}
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req,resp);
	}

}
