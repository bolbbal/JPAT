package mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import domain.UserVo;
import util.DBManager;

public class UserDao {
	
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
	
	private static UserDao instance = new UserDao();
	private UserDao() {}
	
	public static UserDao getInstance() {
		return instance;
	}
	
	public UserVo getUserID(String id) {
		
		String sql = "select * from users where user_id like ?";
		
		UserVo vo = null;
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new UserVo();
				
				vo.setUserId(rs.getNString("user_id"));
				vo.setUserPw(rs.getNString("user_pw"));
				vo.setUserNickname(rs.getNString("user_nickname"));
				vo.setUserEmail(rs.getNString("user_email"));
				vo.setUserIdx(rs.getInt("user_idx"));
				vo.setUserImg(rs.getNString("user_img"));
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return vo;
		
	}
	
	public String getUserNickname(String nickname) {
		
		String sql = "select * from users where user_nickname = ?";
		
		String result = "";
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, nickname);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = "impossible";
			} else {
				result = "possible";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
		
	}
	
	public String getUserEmail(String userEmail) {
		
		String sql = "select * from users where user_email like ?";
		
		String result = "";
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, userEmail);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = "impossible";
			} else {
				result = "possible";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
		
	}
	
	public void insertUser(UserVo vo) {
		
		String sql = "insert into users (user_idx, user_id, user_pw, user_nickname, user_email) values (users_seq.nextval, ?, ?, ?, ?)";
		
		try {
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setNString(1, vo.getUserId());
			pstmt.setNString(2, vo.getUserPw());
			pstmt.setNString(3, vo.getUserNickname());
			pstmt.setNString(4, vo.getUserEmail());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public UserVo login(String id, String pw) {
		
		String sql = "select * from users where user_id like ? and user_pw like ?";
		
		UserVo vo = null;
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setNString(1, id);
			pstmt.setNString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				vo = new UserVo();
				
				vo.setUserEmail(rs.getNString("user_email"));
				vo.setUserImg(rs.getNString("user_img"));
				vo.setUserIdx(rs.getInt("user_idx"));
				vo.setUserNickname(rs.getNString("user_nickname"));
				vo.setUserId(rs.getNString("user_id"));
				vo.setUserPw(rs.getNString("user_pw"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return vo;
	}
	
	public void updateUser(UserVo vo) {
		
		String sql = "update users set user_nickname = ?, user_img = ?, user_pw = ? where user_idx = ?";
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, vo.getUserNickname());
			pstmt.setNString(2, vo.getUserImg());
			pstmt.setNString(3, vo.getUserPw());
			pstmt.setInt(4, vo.getUserIdx());
			
			pstmt.executeUpdate();
			
			updatePostInfo(vo.getUserNickname(), vo.getUserPw(), vo.getUserIdx());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void updatePostInfo(String nickname, String password, int userIdx) {
		
		String sql = "update post set nickname = ?, password = ? where user_idx = ?";
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setNString(1, nickname);
			pstmt.setNString(2, password);
			pstmt.setInt(3, userIdx);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	public String deleteUser(int userIdx) {
		
		String sql = "delete from users where user_idx = ?";
		
		String result = "fail";
		
		try {
			
			conn = DBManager.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userIdx);
			
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
