package sauna;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.Chat;

@SuppressWarnings("serial")
public class GuardarChat extends HttpServlet {
	

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
		String name = req.getParameter("name");
		String msj = req.getParameter("msj");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Chat ch = new Chat(name, msj);
		pm.makePersistent(ch);
		pm.close();
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/Chats.jsp?name="+name);
		rd.forward(req, resp);
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req, resp);
	}
}