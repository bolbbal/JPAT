package service.reply;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import domain.ReplyVo;
import domain.UserVo;
import mapper.PostDao;
import mapper.ReplyDao;
import service.Action;
import util.SecurityPassword;

public class ReplySave implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));
		System.out.println(post_idx);
		
		String comments = request.getParameter("comment").replace("\r\n", "<br>");
		
		ReplyVo vo = new ReplyVo();
		
		vo.setPostIdx(post_idx);
		
		vo.setComments(comments);
		
		HttpSession session = request.getSession(false);
		UserVo userVo = (UserVo) session.getAttribute("user");
		
		if(userVo != null) {
			ReplyDao.getInstance().insertReply(vo, userVo);
		} else {
			String nickname = request.getParameter("nickname");
			String password = request.getParameter("password");
			String newPassword = SecurityPassword.encording(password);
			vo.setNickname(nickname);
			vo.setReply_password(newPassword);
			ReplyDao.getInstance().insertReply(vo);
		}
		
		PostDao.getInstance().UpdateReplycount(post_idx);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "success");
		
		Gson gson = new Gson();
		
		String json = gson.toJson(map);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(json.toString());
	}

}
