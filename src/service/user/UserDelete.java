package service.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import mapper.UserDao;
import service.Action;

public class UserDelete implements Action {
	
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
		
		String result = UserDao.getInstance().deleteUser(userIdx);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("result", result);
		
		Gson gson = new Gson();
		
		String json = gson.toJson(map);
		
		response.setCharacterEncoding("utf-8");
		
		response.getWriter().write(json.toString());
		HttpSession session = request.getSession(false);
		
		session.invalidate();
	}
}
