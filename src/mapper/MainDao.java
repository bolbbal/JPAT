package mapper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import domain.*;
import util.DBManager;

public class MainDao {
	
	private static MainDao instance = new MainDao();
	private MainDao() {}
	
	public static MainDao getInstance() {
		return instance;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	protected void close() {
		try {
			
			if(rs!=null) {
				rs.close();
			}
			
			if(pstmt!=null) {
				pstmt.close();
			}
			
			if(conn!=null) {
				conn.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<PostWithSuggestVo> getPoplarPost() {
		
		String sql = "SELECT * " +
	             "FROM (" +
	             "    SELECT p.post_idx, p.post_type_idx, p.title, p.contents, p.regdate, p.modifydate, " +
	             "    p.imgurl, p.user_idx, p.nickname, p.viewcount, p.likecount, " +
	             "    ps.youtube_url, ps.thumnail, ps.music, ps.singer, ps.lyrics, " +
	             "    (p.likecount * 2 + p.viewcount) AS weighted_score " +
	             "    FROM post p " +
	             "    LEFT JOIN post_suggest ps ON p.post_idx = ps.post_idx " +
	             "    ORDER BY weighted_score DESC" +
	             ") " +
	             "WHERE ROWNUM <= 5";
		
		List<PostWithSuggestVo> list = new ArrayList<PostWithSuggestVo>();
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				PostVo postVo = new PostVo();
				
				postVo.setPost_idx(rs.getInt("post_idx"));
				postVo.setPost_type_idx(rs.getInt("post_type_idx"));
				String title = rs.getNString("title");
				if(title.length() > 8) {
					postVo.setTitle(title.substring(0,8) + "...");
				} else {
					postVo.setTitle(title);
				}
				String contents = rs.getNString("contents");
				if(contents.length() > 15) {
					postVo.setContents(contents.substring(0,15) + "...");
				} else {
					postVo.setContents(contents);
				}
				
				postVo.setRegdate(rs.getNString("regdate").substring(0,10));
				if(rs.getNString("modifydate") != null) {
					postVo.setModifydate(rs.getNString("modifydate").substring(0,10));					
				}
				postVo.setImgurl(rs.getNString("imgurl"));
				postVo.setUser_idx(rs.getInt("user_idx"));
				postVo.setNickname(rs.getNString("nickname"));
				postVo.setViewcount(rs.getInt("viewcount"));
				postVo.setLikecount(rs.getInt("likecount"));
				
				PostSuggestVo suggestVo = new PostSuggestVo();
				
				suggestVo.setThumnail(rs.getNString("thumnail"));
				suggestVo.setMusic(rs.getNString("music"));
				suggestVo.setSinger(rs.getNString("singer"));
				String lyrics = rs.getNString("lyrics");
				
			    if (lyrics != null) {
			        // <br> 태그를 기준으로 문자열 분리
			        String[] parts = lyrics.split("<br>");
			        
			        // 세 번째 <br> 까지의 내용을 결합
			        StringBuilder combinedLyrics = new StringBuilder();
			        for (int i = 0; i < Math.min(parts.length, 3); i++) {
			            combinedLyrics.append(parts[i]);
			            if (i < 2) { // 마지막 항목이 아닐 때만 <br> 추가
			                combinedLyrics.append("<br>");
			            }
			        }
			        
			        if (parts.length > 3) {
			            combinedLyrics.append("...");
			        }
			        
			        // 결합된 내용을 suggestVo에 저장
			        suggestVo.setLyrics(combinedLyrics.toString());
			    }
				
			    PostWithSuggestVo vo = new PostWithSuggestVo();
			    
			    vo.setPost(postVo);
			    vo.setSuggest(suggestVo);
			    
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public List<PostWithSuggestVo> getRecentlyPost() {
		
		String sql = "select * from post p left outer join post_suggest ps on p.post_idx = ps.post_idx where p.post_idx = (select max(p.post_idx) from post p left outer JOIN post_suggest ps ON p.post_idx = ps.post_idx) or p.post_idx = (select max(p.post_idx) from post p left outer JOIN post_suggest ps ON p.post_idx = ps.post_idx where p.post_idx < (select max(post_idx) from post)) order by p.post_idx desc";
		
		List<PostWithSuggestVo> list = new ArrayList<PostWithSuggestVo>();
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PostVo postVo = new PostVo();
				
				postVo.setPost_idx(rs.getInt("post_idx"));
				postVo.setPost_type_idx(rs.getInt("post_type_idx"));
				String title = rs.getNString("title");
				if(title.length() > 8) {
					postVo.setTitle(title.substring(0,8) + "...");
				} else {
					postVo.setTitle(title);
				}
				String contents = rs.getNString("contents");
				if(contents.length() > 15) {
					postVo.setContents(contents.substring(0,15) + "...");
				} else {
					postVo.setContents(contents);
				}
				postVo.setRegdate(rs.getNString("regdate").substring(0,10));
				if(rs.getNString("modifydate") != null) {
					postVo.setModifydate(rs.getNString("modifydate").substring(0,10));					
				}
				postVo.setImgurl(rs.getNString("imgurl"));
				postVo.setUser_idx(rs.getInt("user_idx"));
				postVo.setNickname(rs.getNString("nickname"));
				postVo.setViewcount(rs.getInt("viewcount"));
				postVo.setLikecount(rs.getInt("likecount"));
				
				PostSuggestVo suggestVo = new PostSuggestVo();
				
				suggestVo.setThumnail(rs.getNString("thumnail"));
				suggestVo.setMusic(rs.getNString("music"));
				suggestVo.setSinger(rs.getNString("singer"));
				String lyrics = rs.getNString("lyrics");
				
			    if (lyrics != null) {
			        // <br> 태그를 기준으로 문자열 분리
			        String[] parts = lyrics.split("<br>");
			        
			        // 세 번째 <br> 까지의 내용을 결합
			        StringBuilder combinedLyrics = new StringBuilder();
			        for (int i = 0; i < Math.min(parts.length, 3); i++) {
			            combinedLyrics.append(parts[i]);
			            if (i < 2) { // 마지막 항목이 아닐 때만 <br> 추가
			                combinedLyrics.append("<br>");
			            }
			        }
			        
			        if (parts.length > 3) {
			            combinedLyrics.append("...");
			        }
			        
			        // 결합된 내용을 suggestVo에 저장
			        suggestVo.setLyrics(combinedLyrics.toString());
			    }
				
			    PostWithSuggestVo vo = new PostWithSuggestVo();
			    
			    vo.setPost(postVo);
			    vo.setSuggest(suggestVo);
			    
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public List<SingerVo> getPopularSinger() {
		
		String sql = "SELECT *\r\n" + 
				"FROM (\r\n" + 
				"    SELECT /*+ index_desc (singer singer_pk) */ *\r\n" + 
				"    FROM singer\r\n" + 
				"    ORDER BY suggest_count DESC\r\n" + 
				")\r\n" + 
				"WHERE ROWNUM <= 3";
		
		List<SingerVo> list = new ArrayList<SingerVo>();
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SingerVo vo = new SingerVo();
				
				vo.setSinger_idx(rs.getInt("singer_idx"));
				vo.setSinger(rs.getNString("singer"));
				vo.setSinger_img(rs.getNString("singer_img"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
}
