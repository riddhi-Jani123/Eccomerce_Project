package com.inexture.ecommerce.config;

import com.inexture.ecommerce.dto.UserDTO;
import com.inexture.ecommerce.repository.UserRepository;
import com.inexture.ecommerce.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    UserRepository userRepo;

    @Autowired
    UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        String redirectUrl = null;
        if(authentication.getPrincipal() instanceof DefaultOAuth2User) {
            DefaultOAuth2User  userDetails = (DefaultOAuth2User ) authentication.getPrincipal();
            String email = userDetails.getAttribute("email") !=null?userDetails.getAttribute("email"):userDetails.getAttribute("login")+"@gmail.com" ;
            if(userRepo.getUserByEmail(email) == null) {
                UserDTO user = new UserDTO();
                user.setEmail(email);
                user.setFirstName(userDetails.getAttribute("given_name"));
                user.setLastName(userDetails.getAttribute("family_name"));
                user.setPassword(passwordEncoder().encode("test"));
                user.setMobileNumber("1234");
                user.setUsername(userDetails.getAttribute("name"));
                user.setProvider(((OAuth2AuthenticationToken) authentication).getAuthorizedClientRegistrationId());
                userService.addUser(user);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("user ","user");

            }
        }  redirectUrl = "/index";
        new DefaultRedirectStrategy().sendRedirect(request, response, redirectUrl);
    }


    @Bean(name="passwordEncoder")
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
