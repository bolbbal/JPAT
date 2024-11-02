package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.reply.ReplyDelete;
import service.reply.ReplyPasswordCheck;
import service.reply.ReplySave;

@WebServlet("/reply/*")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ReplyController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println(1);
		String action = request.getPathInfo();
		String page = null;
		
		switch(action) {
			
		case "/commentSave.do" :
			new ReplySave().command(request, response);
			break;
			
		case "/deleteTermspro.do" :
			new ReplyPasswordCheck().command(request, response);
			break;
			
		case "/delete.do" :
			new ReplyDelete().command(request, response);
			break;
			
		}
		
	}
}
