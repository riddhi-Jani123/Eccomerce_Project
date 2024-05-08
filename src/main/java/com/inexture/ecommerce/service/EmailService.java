package com.inexture.ecommerce.service;

import jakarta.mail.MessagingException;

import java.io.IOException;

public interface EmailService {
    public void sendSimpleMessage(String to, String text) throws IOException, MessagingException;
}
