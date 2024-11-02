package service.post;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import mapper.PostDao;
import service.Action;

public class SingerImgUpdate implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String savepath = "/upload";
		ServletContext context = request.getServletContext();
		String path = context.getRealPath(savepath);
		
		Part imgurl = request.getPart("singer_img");
		String imgName = imgurl.getSubmittedFileName();
		
		if(imgName != null && !imgName.isEmpty()) {
			String realPath = imgName.substring(0, imgName.lastIndexOf("."));
			String ext = imgName.substring(imgName.lastIndexOf("."));
			String uuid = UUID.randomUUID().toString();
			
			imgName = realPath + "_" + uuid + ext;
			
			imgurl.write(path + File.separator + imgName);
		} 
		
		int singer_idx = Integer.parseInt(request.getParameter("singer_idx"));
		
		PostDao.getInstance().updateSingerImg(imgName, singer_idx);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("msg", "success");
		
		Gson gson = new Gson();
		
		String json = gson.toJson(map);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(json.toString());
	}

}
