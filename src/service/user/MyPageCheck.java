package service.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import domain.UserVo;
import service.Action;
import util.SecurityPassword;

public class MyPageCheck implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String pw = request.getParameter("password");
		String newPassword = SecurityPassword.encording(pw);

		HttpSession session = request.getSession(false);
		
		Map<String, String> map = new HashMap<String, String>();
		
		Gson gson = new Gson();
		
		if(session != null) {
			UserVo sessionVo = (UserVo) session.getAttribute("user");
			
			if(newPassword.equals(sessionVo.getUserPw())) {
				map.put("result", "success");
			} else if(!newPassword.equals(sessionVo.getUserPw())) {
				map.put("result", "no");
			}
			
		}
		
		String json = gson.toJson(map);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(json.toString());

	}

}
