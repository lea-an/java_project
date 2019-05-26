package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;


@WebServlet("/TutkiKirjaudu")
public class TutkiKirjaudu extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TutkiKirjaudu() {
        super();
        System.out.println("TutkiKirjaudu.TutkiKirjaudu()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("TutkiKirjaudu.doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("TutkiKirjaudu.doPost()");
		String pwd = request.getParameter("pwd");
		String uid = request.getParameter("uid");
		Dao dao = new Dao();
		String nimi = dao.login(uid, pwd);
		if(nimi!=null){
			HttpSession session = request.getSession(true);
			session.setAttribute("kayttaja", nimi);
			response.sendRedirect("haeveneet.jsp");
		}else{
			response.sendRedirect("index.jsp?login=0");
		}
	}

}
