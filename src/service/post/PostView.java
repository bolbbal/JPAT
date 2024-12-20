package service.post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mapper.PostDao;
import service.Action;

public class PostView implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));
		
		PostDao.getInstance().UpdateViewcount(post_idx);
		
		List<Object> list = PostDao.getInstance().getPostSelect(post_idx);
		
		request.setAttribute("list", list);
	}

}
