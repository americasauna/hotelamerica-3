package sauna;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Cliente;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class GmailServlet extends HttpServlet {
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
 throws IOException, ServletException {
	 
	 UserService us = UserServiceFactory.getUserService();
	 User user = us.getCurrentUser();
 	
	 if(user == null){
		 resp.sendRedirect(us.createLoginURL(req.getRequestURI()));
 	}else{
 		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query q= pm.newQuery(Cliente.class);
		@SuppressWarnings("unchecked")
		List<Cliente> list= (List<Cliente>) q.execute();
		for (Cliente c : list) {
			if(user.getEmail().equals(c.getGmail())){
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/usuario?login="+c.getLogin()+"&password="+c.getPassword());
				rd.forward(req, resp);
			}
		} 
		
		 
 	}
 }
 public void doPost(HttpServletRequest req, HttpServletResponse resp)
 throws IOException, ServletException {
	 doGet(req, resp);
 }
}