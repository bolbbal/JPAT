package service.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.UserVo;
import mapper.UserDao;
import service.Action;
import util.SecurityPassword;

public class UserInsert implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		UserVo vo = new UserVo();
		
		vo.setUserId(request.getParameter("id"));
		
		String pw = request.getParameter("password");
		String newPassword = SecurityPassword.encording(pw);
		vo.setUserPw(newPassword);
		
		vo.setUserNickname(request.getParameter("nickname"));
		vo.setUserEmail(request.getParameter("email"));
		
		UserDao.getInstance().insertUser(vo);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", "新規登録が完了しました");
		
		Gson gson = new Gson();
		
		String json = gson.toJson(map);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(json.toString());
	}

}
