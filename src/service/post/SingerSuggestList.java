package service.post;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PostWithSuggestVo;
import domain.SingerVo;
import mapper.PostDao;
import service.Action;
import util.Criteria;
import util.PageVo;

public class SingerSuggestList implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int pageNum = 1;
		int amount = 5;
		
		Criteria cri = new Criteria(pageNum, amount);
				
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		
		String type = "";
		String keyword = "";
		String query = "";
		
		if(request.getParameter("type")!=null && !request.getParameter("keyword").equals("")) {
			type = request.getParameter("type");
			keyword = request.getParameter("keyword").toUpperCase();
			
			query = type + " like '%" + keyword + "%'";
		}
		
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		cri.setType(type);
		cri.setKeyword(keyword);
		
		List<SingerVo> list = PostDao.getInstance().getSingerSuggestList(cri);
		
		int count = PostDao.getInstance().getSingerSuggestCount();
		
		PageVo pvo = new PageVo(cri, count);
		
		request.setAttribute("list", list);
		request.setAttribute("page", pvo);
		request.setAttribute("count", count);

	}

}
