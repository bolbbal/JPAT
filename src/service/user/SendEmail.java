package service.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.Action;

public class SendEmail implements Action {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		
		String host = "smtp.naver.com";
		String user = "cyw9007@naver.com";
		String password = "royalwook123";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		StringBuffer temp = new StringBuffer();
		
		Random rmd = new Random();
		
		String to_email = email;
		
		for(int i = 0; i < 6; i++) {
			temp.append(rmd.nextInt(10));
		}
		
		String authenticationKey = temp.toString();
		
		Session session = Session.getDefaultInstance(props, new Authenticator() {
		
			protected PasswordAuthentication getPasswordAuthentication() {
				
				return new PasswordAuthentication(user, password);
			}
		});
		System.out.println(temp);
		try {
			MimeMessage msg = new MimeMessage(session);
			
			msg.setFrom(new InternetAddress(user, "JPAT"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
			msg.setSubject("JPAT에서 보낸 메일입니다.");
			msg.setText("인증번호 : " + temp);
			
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("authenticationKey", authenticationKey);
		
		Gson gson = new Gson();
		String json = gson.toJson(map);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(json.toString());

	}

}
