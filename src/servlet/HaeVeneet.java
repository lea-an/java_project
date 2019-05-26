package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Vene;


@WebServlet("/HaeVeneet")
public class HaeVeneet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HaeVeneet() {
        super();
        System.out.println("HaeVeneet.HaeVeneet()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("HaeVeneet.doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("HaeVeneet.doPost()");
		String hakusana = request.getParameter("hakusana");
		if(hakusana.isEmpty()) {
			response.sendRedirect("haeveneet.jsp?ilmohaku=Anna hakusana");
			return;
		}
		Dao dao = new Dao();
		ArrayList<Vene> veneet = dao.listaaKaikki(hakusana);
		request.setAttribute("veneet", veneet);		
		String jsp = "/haeveneet.jsp"; 
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
		
	}

}
