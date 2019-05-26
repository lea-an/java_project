package servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Vene;


@WebServlet("/MuutaVene")
public class MuutaVene extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MuutaVene() {
        super();
        System.out.println("MuutaVene.MuutaVene()");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("MuutaVene.doGet()");
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("MuutaVene.doPost()");
		int tunnus = Integer.parseInt(request.getParameter("tunnus"));
		String nimi = request.getParameter("nimi");
		String merkkimalli = request.getParameter("merkkimalli");
		double pituus = Double.parseDouble(request.getParameter("pituus"));
		double leveys = Double.parseDouble(request.getParameter("leveys"));
		int hinta = Integer.parseInt(request.getParameter("hinta"));
		Vene vene = new Vene(tunnus, hinta, nimi, merkkimalli, pituus, leveys);
		Dao dao = new Dao();
		dao.muutaVene(vene, tunnus);
		response.sendRedirect("ListaaVeneet");
	}

}
