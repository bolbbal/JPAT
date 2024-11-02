package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/footer/about.do")
public class FooterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public FooterController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	request.getRequestDispatcher("/footer/about.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

//	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		
//		
//		String action = request.getServletPath();
//		String page = null;
//		
//		switch(action) {
//		
//		case "/about.do" :
//			page = "/footer/about.jsp";
//			break;
//		}
//		System.out.println(action);
//		System.out.println(page);
//		if(page != null) {
//			request.getRequestDispatcher(page).forward(request, response);
//		}
//	}

}
