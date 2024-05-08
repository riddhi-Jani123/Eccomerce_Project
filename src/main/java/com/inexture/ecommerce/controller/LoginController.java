package com.inexture.ecommerce.controller;

import com.inexture.ecommerce.dto.UserDTO;
import com.inexture.ecommerce.model.User;
import com.inexture.ecommerce.service.EmailService;
import com.inexture.ecommerce.service.UserServiceImpl;
import jakarta.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    private EmailService emailService;

    @Autowired
    UserServiceImpl userService;

    @GetMapping(value = {"/","/index"})
    public String home(){
        return "index";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/loginUser")
    public String loginUser(@RequestParam("email") String email,@RequestParam("password") String password, Model model){
        User user = userService.getByEmailAndPassword(email, password);
        if (user != null) {
            return ("index");
        }
        model.addAttribute("errorMessage", "Please enter correct email and password");
        return "login";
    }

    @PostMapping("/registerUser")
    public String registerUser(@ModelAttribute UserDTO userDTO, Model model){
        User user = userService.getByEmail(userDTO.getEmail());
        if (user == null ) {
            userService.addUser(userDTO);
            try {
                emailService.sendSimpleMessage(userDTO.getEmail(), userDTO.getFirstName());
            } catch (IOException | MessagingException e) {
                throw new RuntimeException(e);
            }
            return "index";
        }
        model.addAttribute("userAlreadyExist","User already exist");
        return "login";
    }
}
