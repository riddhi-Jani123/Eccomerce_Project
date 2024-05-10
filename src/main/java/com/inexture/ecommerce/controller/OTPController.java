package com.inexture.ecommerce.controller;

import com.inexture.ecommerce.service.OTPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class OTPController {

    @Autowired
    public OTPService otpService;

    @GetMapping("/generateOTP")
    public String generateOTP(@RequestParam String phoneNo){
        return otpService.generateOTP(phoneNo);
    }

    @PostMapping("/validateOTP")
    public String validateOTP(@RequestParam String phoneNo,@RequestParam String otp){
        return otpService.validateOTP(phoneNo, otp);
    }


}
