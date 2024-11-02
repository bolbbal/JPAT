package service.reply;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.ReplyVo;
import mapper.ReplyDao;
import service.Action;

public class ReplyView implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));
		
		int count = ReplyDao.getInstance().getReplyCount(post_idx);
		List<ReplyVo> list = ReplyDao.getInstance().getReplyList(post_idx);
		
		request.setAttribute("replyCount", count);
		request.setAttribute("replyList", list);

	}

}
