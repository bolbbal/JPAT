package service.post;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mapper.PostDao;
import service.Action;
import util.SecurityPassword;

public class PostPasswordCheck implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));
		
		String password = request.getParameter("password");
		String newPassword = SecurityPassword.encording(password);
		
		String result = PostDao.getInstance().CheckPostPassword(newPassword, post_idx);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("result", result);
		
		Gson gson = new Gson();
		
		String json = gson.toJson(map);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(json.toString());

	}

}
