package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;


@WebServlet("/PoistaVene")
public class PoistaVene extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PoistaVene() {
        super();
        System.out.println("PoistaVene.PoistaVene()");
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("PoistaVene.doGet()");
		int tunnus = Integer.parseInt(request.getParameter("tunnus"));
		Dao dao = new Dao();
		if(dao.poistaVene(tunnus)){
			response.sendRedirect("haeveneet.jsp?ilmo=1");
		}else {
			response.sendRedirect("haeveneet.jsp?ilmo=0");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("PoistaVene.doPost()");
	}

}
