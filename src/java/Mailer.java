import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;    


// Variables name : to , sub , msg

public class Mailer {  
    public static void send(String to, String sub, String msg) {  
        try {
            Properties p = new Properties();
            p.put("mail.smtp.auth", "true");
            p.put("mail.debug", "true");
            p.put("mail.smtp.port", "465");
            p.put("mail.smtp.host", "smtp.gmail.com"); // Update to Gmail SMTP server
            p.put("mail.smtp.socketFactory.port", "465");
            p.put("mail.smtp.ssl.protocols", "TLSv1.2");
            p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            p.put("mail.smtp.socketFactory.fallback", "false");

            Session ses = Session.getInstance(p, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("devanshgoyal334@gmail.com", "cwxm fmvd zloj pwhe"); // Insert your password here
                }
            });

            ses.setDebug(true);
            Message message = new MimeMessage(ses);

            InternetAddress addressFrom = new InternetAddress("devanshgoyal334@gmail.com");
            message.setFrom(addressFrom);

            InternetAddress addressTo = new InternetAddress(to);
            message.setRecipient(Message.RecipientType.TO, addressTo);

            message.setSubject(sub);
            message.setContent(msg, "text/html");

            Transport.send(message);
            System.out.println("Mail sent successfully!");
        } catch (MessagingException e) {
            System.out.println(e.getMessage());
                    
        }
    }

   
}
    