package com.inexture.ecommerce.service;

public interface OTPService {
    String generateOTP(String phoneNo);
    String validateOTP(String phoneNo, String code);
}
