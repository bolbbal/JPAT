package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.main.MainService;

@WebServlet(urlPatterns = {"", "/"})
@MultipartConfig(
		fileSizeThreshold = 1024*1024*2, 
		maxFileSize = 1024*1024*20, 
		maxRequestSize = 1024*1024*100 
)
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
		
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		new MainService().command(request, response);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
