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


@WebServlet("/ListaaVeneet")
public class ListaaVeneet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListaaVeneet() {
        super();
        System.out.println("ListaaVeneet.ListaaVeneet()");
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("ListaaVeneet.doGet()");
		Dao dao = new Dao();
		ArrayList<Vene> veneet = dao.listaaKaikki();
		request.setAttribute("veneet", veneet);		
		String jsp = "/listaaveneet.jsp"; 
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("ListaaVeneet.doPost()");
	}

}
