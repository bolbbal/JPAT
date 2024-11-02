package service.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.batch.Main;

import domain.*;
import mapper.MainDao;
import service.Action;

public class MainService implements Action {
	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		List<PostWithSuggestVo> popularList = MainDao.getInstance().getPoplarPost();
		List<PostWithSuggestVo> newList = MainDao.getInstance().getRecentlyPost();
		List<SingerVo> singerList = MainDao.getInstance().getPopularSinger();
		
		request.setAttribute("popularList", popularList);
		request.setAttribute("newList", newList);
		request.setAttribute("singerList", singerList);
	}
}
