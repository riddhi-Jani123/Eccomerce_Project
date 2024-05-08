package com.inexture.ecommerce.controller;

import com.inexture.ecommerce.dto.UserDTO;
import com.inexture.ecommerce.model.User;
import com.inexture.ecommerce.repository.UserRepository;
import com.inexture.ecommerce.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    UserServiceImpl userService;

    @Autowired
    UserRepository userRepository;

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
        User user = userRepository.getUserByEmailAndPassword(email, password);
        if (user != null) {
            return ("index");
        }
        model.addAttribute("errorMessage", "Please enter correct email and password");
        return "login";
    }

    @PostMapping("/registerUser")
    public String registerUser(@ModelAttribute UserDTO userDTO){
        userService.addUser(userDTO);
        return "index";
    }
}
