package cn.yzw.myblog.utils;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailUtil {

    private static Properties properties;


    static {
        properties = new Properties();
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.host","smtp.qq.com");
        properties.put("mail.smyp.port","587");
        properties.put("mail.user","1293500705@qq.com");
        properties.put("mail.password","ekwimixxfplshjgf");
    }

    public static  void sendMail(String context,String title,String reqq) throws Exception {
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                String username = properties.getProperty("mail.user");
                String password = properties.getProperty("mail.password");
                return new PasswordAuthentication(username,password);
            }
        };

        Session mailSession = Session.getInstance(properties,authenticator);

        MimeMessage message = new MimeMessage(mailSession);

        InternetAddress from = new InternetAddress(properties.getProperty("mail.user"));
        message.setFrom(from);

        InternetAddress to = new InternetAddress(reqq);
        message.setRecipient(Message.RecipientType.TO,to);

        message.setSubject(title);
        message.setContent(context,"text/html;charset=UTF-8");

        Transport.send(message);
    }
}
