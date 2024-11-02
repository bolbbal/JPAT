package service.user;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import service.Action;

public class UserImgPreview implements Action {
	
	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String savepath = "/upload";
		
		ServletContext context = request.getServletContext();
		
		String path = context.getRealPath(savepath);
		
		Part imgurl = request.getPart("userImg");
		String imgName = imgurl.getSubmittedFileName();
		
		if(imgName != null && !imgName.isEmpty()) {
			String realPath = imgName.substring(0, imgName.lastIndexOf("."));
			String ext = imgName.substring(imgName.lastIndexOf("."));
			String uuid = UUID.randomUUID().toString();
			
			imgName = realPath + "_" + uuid + ext;
			
			try {
                imgurl.write(path + File.separator + imgName);
            } catch (IOException e) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "파일 업로드 중 오류가 발생했습니다.");
                return;
            }
		}
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print("{\"imageUrl\": \"/upload/" + imgName + "\"}");
        out.flush();
	}
}
