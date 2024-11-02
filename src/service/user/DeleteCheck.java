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

public class DeleteCheck implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		String newPassword = SecurityPassword.encording(pw);
		
		UserVo vo = UserDao.getInstance().login(id, newPassword);
		
		Map<String, String> map = new HashMap<String, String>();
		
		if(vo != null) {

			map.put("result", "success");
			
		} else {
			
			map.put("result", "fail");
		
		}
		
		Gson gson = new Gson();
		
		String json = gson.toJson(map);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(json.toString());
	}

}
