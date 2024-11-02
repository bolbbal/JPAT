package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.user.DeleteCheck;
import service.user.IDCheck;
import service.user.Login;
import service.user.Logout;
import service.user.MyPageCheck;
import service.user.NicknameCheck;
import service.user.SendEmail;
import service.user.UserDelete;
import service.user.UserImgPreview;
import service.user.UserInsert;
import service.user.UserUpdate;

@WebServlet("/users/*")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*2, 
		maxFileSize = 1024*1024*20, 
		maxRequestSize = 1024*1024*100 
)
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public UserController() {
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
		
		String action = request.getPathInfo();
		String page = null;
		
		switch (action) {
		case "/login.do" :
			page = "/user/login.jsp";
			break;
		
		case "/loginpro.do" :
			new Login().command(request, response);
			break;
			
		case "/logout.do" :
			new Logout().command(request, response);
			return;
			
		case "/signup.do" :
			page = "/user/signup.jsp";
			break;
			
		case "/idCheck.do" :
			new IDCheck().command(request, response);
			break;
			
		case "/nicknameCheck.do" :
			new NicknameCheck().command(request, response);
			break;
			
		case "/emailCheck.do" :
			new NicknameCheck().command(request, response);
			break;
			
		case "/sendEmail.do" :
			new SendEmail().command(request, response);
			break;
			
		case "/access.do" :
			new UserInsert().command(request, response);
			break;
			
		case "/myPageTerms.do" :
			page = "/user/myPageTerms.jsp";
			break;
			
		case "/myPageTermspro.do" :
			new MyPageCheck().command(request, response);
			break;
			
		case "/myPage.do" :
			page = "/user/myPage.jsp";
			break;
			
		case "/imgPreview.do" :
			new UserImgPreview().command(request, response);
			break;
			
		case "/userUpdate.do" :
			new UserUpdate().command(request, response);
			break;
			
		case "/deleteCheck.do" :
			new DeleteCheck().command(request, response);
			break;
			
		case "/delete.do" :
			new UserDelete().command(request, response);
			break;
		}
		
		if(page != null) {
			request.getRequestDispatcher(page).forward(request, response);
		}
	}	
}
