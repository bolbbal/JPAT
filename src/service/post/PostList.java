package service.post;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.PostVo;
import mapper.PostDao;
import service.Action;
import util.Criteria;
import util.PageVo;

public class PostList implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		
		int pageNum = 1;
		int amount = 15;
		
		Criteria cri = new Criteria(pageNum, amount);
	
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
//		boolean isSearch = false;
		String keyword = "";
		String query = "";
		String type = "";
		
		if(request.getParameter("type")!=null && !request.getParameter("keyword").equals("")) {
			
//			isSearch = true;
			type = request.getParameter("type");
			keyword = request.getParameter("keyword");
			
			query = type + " like '%" + keyword + "%'";
			
		}
		
//		HttpSession session = null;
//		
//		if(isSearch) {
//			session = request.getSession();
//			
//		}
		
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		cri.setType(type);
		cri.setKeyword(keyword);
		
		List<PostVo> list = null;
		
		list = PostDao.getInstance().getPostList(cri, query);
		
		int count = PostDao.getInstance().getPostCount(query);
		
		PageVo pvo = new PageVo(cri, count);
		
		request.setAttribute("list", list);
		request.setAttribute("page", pvo);
		request.setAttribute("count", count);
	}

}
