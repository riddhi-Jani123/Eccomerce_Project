package com.inexture.ecommerce.service.impl;

import com.inexture.ecommerce.constant.Constants;
import com.inexture.ecommerce.service.OTPService;
import com.twilio.Twilio;
import com.twilio.rest.verify.v2.service.Verification;
import com.twilio.rest.verify.v2.service.VerificationCheck;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


@Service
public class OTPServiceImpl implements OTPService {

    @Value("${twilio.account.sid}")
    private String accountSid;

    @Value("${twilio.auth.token}")
    private String authToken;

    @Value("${twilio.service.id}")
    private String twilioServiceId;

    @PostConstruct
    public void init() {
        Twilio.init(accountSid, authToken);
    }

    public String generateOTP(String phoneNo){
        Verification verification = Verification.creator(twilioServiceId, "+91"+phoneNo, Constants.SMS).create();
        return verification.getStatus();
    }

    public String validateOTP(String phoneNo, String code){
        VerificationCheck verificationCheck = VerificationCheck.creator(
                        twilioServiceId)
                .setTo("+91"+phoneNo)
                .setCode(code)
                .create();
        return verificationCheck.getStatus();
    }

}
