package iuh.tranvanvinh_tuan02;

import jakarta.activation.DataHandler;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import jakarta.mail.util.ByteArrayDataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

@WebServlet("/sendMail")
@MultipartConfig
public class MailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final String USERNAME = "supocup233@gmail.com"; // email thật
    private final String PASSWORD = "wbcb eipi kuto kobo"; // App Password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        Part filePart = request.getPart("file");

        try {
            // 1. Cấu hình SMTP
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            // 2. Tạo Session có xác thực
            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USERNAME, PASSWORD);
                }
            });

            // 3. Tạo message
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject, "UTF-8");

            // 4. Nội dung
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setContent(content, "text/html; charset=UTF-8");

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(textPart);

            // 5. File đính kèm (nếu có)
            if (filePart != null && filePart.getSize() > 0) {
                MimeBodyPart attachPart = new MimeBodyPart();
                String fileName = filePart.getSubmittedFileName();
                InputStream fileContent = filePart.getInputStream();

                String mimeType = getServletContext().getMimeType(fileName);
                if (mimeType == null) mimeType = "application/octet-stream";

                attachPart.setFileName(fileName);
                attachPart.setDataHandler(new DataHandler(new ByteArrayDataSource(fileContent, mimeType)));
                multipart.addBodyPart(attachPart);
            }

            // 6. Gán multipart vào message
            message.setContent(multipart);

            // 7. Gửi mail
            Transport.send(message);

            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<h3> Gửi mail thành công!</h3>");
        } catch (Exception e) {
            throw new ServletException("Lỗi gửi mail: " + e.getMessage(), e);
        }
    }
}
