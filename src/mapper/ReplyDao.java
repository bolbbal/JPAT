package mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import domain.ReplyVo;
import domain.UserVo;
import util.DBManager;

public class ReplyDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	protected void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static ReplyDao instance = new ReplyDao();

	private ReplyDao() {}

	public static ReplyDao getInstance() {
		return instance;
	}
	
	public void insertReply(ReplyVo vo) {
		
		String sql = "insert into reply (reply_idx, post_idx, nickname, reply_password, comments) values (reply_seq.nextval, ?, ?, ?, ?)";
		
		try {
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getPostIdx());
			pstmt.setNString(2, vo.getNickname());
			pstmt.setNString(3, vo.getReply_password());
			pstmt.setNString(4, vo.getComments());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void insertReply(ReplyVo replyVo, UserVo userVo) {
		
		String sql = "insert into reply (reply_idx, post_idx, nickname, reply_password, comments, user_idx) values (reply_seq.nextval, ?, ?, ?, ?, ?)";
		
		try {
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyVo.getPostIdx());
			pstmt.setNString(2, userVo.getUserNickname());
			pstmt.setNString(3, userVo.getUserPw());
			pstmt.setNString(4, replyVo.getComments());
			pstmt.setInt(5, userVo.getUserIdx());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public int getReplyCount(int post_idx) {
		
		String sql = "select count(*) as count from reply where post_idx = ?";
		
		int count = 0;
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, post_idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt("count");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return count;
	}
	
	public List<ReplyVo> getReplyList(int post_idx) {
		
		String sql = "select /*+ index_desc reply (reply_pk)*/ * from reply where post_idx = ?";
		
		List<ReplyVo> list = new ArrayList<ReplyVo>();
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ReplyVo vo = new ReplyVo();
				
				vo.setNickname(rs.getNString("nickname"));
				vo.setReply_password(rs.getNString("reply_password"));
				vo.setComments(rs.getNString("comments"));
				vo.setRegdate(rs.getNString("regdate").substring(0,10));
				if(rs.getNString("modifydate") != null) {
					vo.setModifydate(rs.getNString("modifydate").substring(0,10));
				}
				vo.setReplyIdx(rs.getInt("reply_idx"));
				int userIdx = rs.getInt("user_idx");
				if(!rs.wasNull()) {
					vo.setUser_idx(userIdx);
				} else {
					vo.setUser_idx(-1);
				}
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
		
	}
	
	public String CheckPostPassword(String password, int reply_idx) {
		
		String sql = "select * from reply where reply_idx = ?";
		
		String result = "";
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply_idx);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				if(password.equals(rs.getNString("reply_password"))) {
					result = "success";
				} else {
					result = "fail";
				}
				
			} else {
				result = "fail";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	public String deleteReply(int reply_idx) {
		
		String sql = "delete from reply where reply_idx = ?";
		
		String result = "";
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reply_idx);
			
			pstmt.executeUpdate();
			
			result = "success";
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
		
	}
}
