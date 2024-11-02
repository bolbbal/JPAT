package service.post;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PostVo;
import mapper.PostDao;
import service.Action;
import util.Criteria;
import util.PageVo;

public class BestPost implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		Criteria cri = new Criteria();
		
		int pageNum = 1;
		int amount = 15;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String type = "";
		String keyword = "";
		String query = "";
		
		if(request.getParameter("type")!=null && !request.getParameter("keyword").equals("")) {
			type = request.getParameter("type");
			keyword = request.getParameter("keyword");
			
			query = type + " like '%" + keyword + "%'";
		}
		
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		cri.setType(type);
		cri.setKeyword(keyword);
		
		List<PostVo> list = PostDao.getInstance().getPupularPostList(cri, query);
		
		int count = PostDao.getInstance().getPopularPostCount(query);
		
		PageVo pvo = new PageVo(cri, count);
		
		request.setAttribute("list", list);
		request.setAttribute("page", pvo);
		request.setAttribute("count", count);
	}

}
