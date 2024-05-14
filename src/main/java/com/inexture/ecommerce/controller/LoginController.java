package com.inexture.ecommerce.controller;

import com.inexture.ecommerce.dto.UserDTO;
import com.inexture.ecommerce.model.User;
import com.inexture.ecommerce.service.EmailService;
import com.inexture.ecommerce.service.impl.UserServiceImpl;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/profile")
    public String profile(){
        return "profile";
    }


    @GetMapping("/register")
    public String register(){
        return "register";
    }

    @GetMapping("/password")
    public String password(){
        return "setPassword";
    }

    @PostMapping("/loginUser")
    public ResponseEntity<?> loginUser(@ModelAttribute UserDTO userDTO, HttpServletRequest httpServletRequest){
        User user = userService.getByEmailAndPassword(userDTO.getEmail(), userDTO.getPassword());
        if (user != null) {
            HttpSession session = httpServletRequest.getSession();
            session.setAttribute("user", user);
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.badRequest().body("{\"errorMessage\": \"Please enter correct email and password\"}");
    }

//    @PostMapping("/loginUser")
//    public String loginUser(@ModelAttribute UserDTO userDTO, Model model){
//        User user = userService.getByEmailAndPassword(userDTO.getEmail(), userDTO.getPassword());
//        if (user != null) {
//            return ("index");
//        }else {
//            String error = "Please enter correct email and password";
//            model.addAttribute("errorMessage", error);
//            return "error";
//        }
//    }

    @PostMapping("/registerUser")
    public String registerUser(@ModelAttribute UserDTO userDTO, Model model, HttpServletRequest httpServletRequest){
        User user = userService.getByEmail(userDTO.getEmail());
        if (user!=null) {
            model.addAttribute("emailAlreadyExist","email already exist");
            return "register";
        }
        user = userService.getByUsername(userDTO.getUsername());
        if (user!=null) {
            model.addAttribute("userNameAlreadyExist","username already exist");
            return "register";
        }
        userService.addUser(userDTO);
        try {
            emailService.sendSimpleMessage(userDTO.getEmail(), userDTO.getFirstName());
        } catch (IOException | MessagingException e) {
            throw new RuntimeException(e);
        }
        httpServletRequest.getSession().setAttribute("user",userDTO);
        return "index";

    }

    @PostMapping("/setPassword")
    public String setPassword(@RequestParam("password") String password, HttpServletRequest httpServletRequest) {
        UserDTO userDTO = (UserDTO) httpServletRequest.getSession().getAttribute("user");
        userDTO.setPassword(password);
        userService.addUser(userDTO);
        return "index";
    }

    @GetMapping("/signout")
    public String signout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "index";
    }
}
