package com.inexture.ecommerce.service.impl;

import com.inexture.ecommerce.service.EmailService;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.io.*;

@Service
public class EmailServiceImpl implements EmailService {


    @Autowired
    private JavaMailSender emailSender;

    @Override
    public void sendSimpleMessage(String to, String firstName) throws IOException, MessagingException {
        MimeMessage messages = emailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(messages, true);
        messageHelper.setTo(to);
        messageHelper.setSubject("Registration Confirmation");
        messageHelper.setText(getMailBodyTemplate(firstName), true);
        emailSender.send(messages);
    }

    public String getMailBodyTemplate(String firstName) throws IOException {
        StringBuilder content = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new FileReader("src/main/webapp/WEB-INF/jsp/welcome.jsp"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.replace("<%= firstName %>", firstName);
                content.append(line).append("\n");
            }
        }
        return content.toString();

    }
}
