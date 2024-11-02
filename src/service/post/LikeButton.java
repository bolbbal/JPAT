package service.post;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.PostVo;
import mapper.PostDao;
import service.Action;

public class LikeButton implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));
		
		PostDao.getInstance().UpdateLikecount(post_idx);
		
		int likecount = PostDao.getInstance().selectLikecount(post_idx);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("likecount", likecount);
		
		Gson gson = new Gson();
		
		String json = gson.toJson(map);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(json.toString());
	}

}
