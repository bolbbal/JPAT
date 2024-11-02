package util;

import java.security.MessageDigest;

public class SecurityPassword {
	
	public static String encording(String pw) {
		
		String newPassword = "";
		
		try {
			
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
			md.update(pw.getBytes());
			
			byte[] encodeData = md.digest();
			
			for(int i = 0; i < encodeData.length; i++) {
				
				newPassword += Integer.toHexString(encodeData[i]&0xFF);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return newPassword;
	}
}
