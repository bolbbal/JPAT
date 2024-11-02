package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.post.*;
import service.reply.ReplyView;


@WebServlet("/posts/*")
@MultipartConfig(
		fileSizeThreshold = 1024*1024*2, 
		maxFileSize = 1024*1024*20, 
		maxRequestSize = 1024*1024*100 
)
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PostController() {
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
		System.out.println(action);
		String page = null;
		int post_idx = 0;
		
		switch(action) {
		
		case "/list.do" :
			new PostList().command(request, response);
			page = "/post/post.jsp";
			break;
			
		case "/view.do" :
			new PostView().command(request, response);
			new ReplyView().command(request, response);
			page = "/post/postView.jsp";
			break;
		
		case "/write.do" :
			page = "/post/postWrite.jsp";
			break;
			
		case "/writepro.do" :
			new PostInsert().command(request, response);
			page = null;
			response.sendRedirect("/posts/list.do");
			break;
			
		case "/modifyTerms.do" : 
			post_idx = Integer.parseInt(request.getParameter("post_idx"));
			request.setAttribute("post_idx", post_idx);
			page = "/post/postModifyTerms.jsp";
			break;
			
		case "/modifyTermspro.do" :
		case "/deleteTermspro.do" :
			new PostPasswordCheck().command(request, response);
			break;
			
		case "/modify.do" :
			new PostModify().command(request, response);
			page = "/post/postModify.jsp";
			break;
			
		case "/modifypro.do" :
			new PostUpdate().command(request, response);
			page = null;
			response.sendRedirect("/posts/list.do");
			break;
			
		case "/delete.do" :
			new PostDelete().command(request, response);
			break;
			
		case "/best.do" :
			new BestPost().command(request, response);
			page = "/post/bestPost.jsp";
			break;
			
		case "/suggest.do" :
			new PostSuggestList().command(request, response);
			page = "/post/postSuggestList.jsp";
			break;
			
		case "/like.do" :
			new LikeButton().command(request, response);
			break;
			
		case "/hate.do" :
			new HateButton().command(request, response);
			break;
			
		case "/singer.do" :
			new SingerSuggestList().command(request, response);
			page = "/post/singerList.jsp";
			break;
			
		case "/singerImgPreview.do" :
			new SingerImgPreview().command(request, response);
			break;
		
		case "/singerImgUpdate.do" :
			new SingerImgUpdate().command(request, response);
			break;
		}
		
		if(page != null) {
			request.getRequestDispatcher(page).forward(request, response);
		}

	}
}
