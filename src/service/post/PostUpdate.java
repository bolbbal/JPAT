package service.post;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import domain.PostSuggestVo;
import domain.PostVo;
import domain.SingerVo;
import mapper.PostDao;
import service.Action;

public class PostUpdate implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
				
		String savepath = "/upload";
		
		ServletContext context = request.getServletContext();
		
		String path = context.getRealPath(savepath);
		
		Part imgurl = request.getPart("imgurl");
		String imgName = imgurl.getSubmittedFileName();
		
		int post_idx = Integer.parseInt(request.getParameter("post_idx"));
		String img = PostDao.getInstance().PostImgCheck(post_idx);
		
		if(!img.equals("") && !img.isEmpty()) {
			File deleteFile = new File(path + File.separator + img);
			if(deleteFile.exists()) {
				deleteFile.delete();
			}
		}
		
		if(imgName != null && !imgName.isEmpty()) {
			String realPath = imgName.substring(0, imgName.lastIndexOf("."));
			String ext = imgName.substring(imgName.lastIndexOf("."));
			String uuid = UUID.randomUUID().toString();
			
			imgName = realPath + "_" + uuid + ext;
			
			imgurl.write(path + File.separator + imgName);
		}
		
		PostVo postVo = new PostVo();
		PostSuggestVo suggestVo = null;
		
		postVo.setPost_idx(Integer.parseInt(request.getParameter("post_idx")));
		postVo.setPost_type_idx(Integer.parseInt(request.getParameter("post_type_idx")));
		postVo.setNickname(request.getParameter("nickname"));
		postVo.setPassword(request.getParameter("password"));
		postVo.setTitle(request.getParameter("title"));
		postVo.setContents(request.getParameter("contents"));
		postVo.setImgurl(imgName);
		
		if(postVo.getPost_type_idx() == 1) {
			PostDao.getInstance().PostUpdate(postVo);
		}
		
		if(Integer.parseInt(request.getParameter("post_type_idx")) == 2) {
			
			suggestVo = new PostSuggestVo();
			
			suggestVo.setPost_idx(Integer.parseInt(request.getParameter("post_idx")));
			suggestVo.setSinger(request.getParameter("singer").toUpperCase());	
			suggestVo.setMusic(request.getParameter("music").toUpperCase());
			suggestVo.setYoutube_url(request.getParameter("youtube_url"));
			suggestVo.setThumnail(request.getParameter("thumnail"));
			suggestVo.setLyrics(request.getParameter("lyrics"));
			
			SingerVo singerVo = PostDao.getInstance().checkSingerRelation(post_idx); //이름, singer_idx
			
			if(singerVo.getSinger().equals(suggestVo.getSinger())) {
				PostDao.getInstance().PostUpdate(postVo, suggestVo);
			} else if(!singerVo.getSinger().equals(suggestVo.getSinger())) {
				
				PostDao.getInstance().minusSingerSuggestCount(singerVo.getSinger_idx());
				PostDao.getInstance().checkSingerInfo(postVo, singerVo, suggestVo);
				
			}
		}
		
		
	}

}
