package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Vene;

@WebServlet("/EtsiPoistaVene")
public class EtsiPoistaVene extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EtsiPoistaVene() {
        super();
        System.out.println("EtsiPoistaVene.EtsiPoistaVene()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("EtsiPoistaVene.doGet()");
		int tunnus = Integer.parseInt(request.getParameter("poista_tunnus"));
		Dao dao = new Dao();
		Vene vene = dao.loytyykoVene(tunnus);
		request.setAttribute("vene", vene);		
		String jsp = "/poistavene.jsp"; 
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("EtsiPoistaVene.doPost()");
	}

}
