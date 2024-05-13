package com.inexture.ecommerce.config;

import com.inexture.ecommerce.constant.Constants;
import com.inexture.ecommerce.dto.UserDTO;
import com.inexture.ecommerce.model.User;
import com.inexture.ecommerce.repository.UserRepository;
import com.inexture.ecommerce.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
                                        Authentication authentication) throws IOException {

        String redirectUrl = null;
        if(authentication.getPrincipal() instanceof DefaultOAuth2User userDetails) {
            String email = userDetails.getAttribute(Constants.EMAIL);
            User user = userRepo.findByEmail(email);
            if(userRepo.findByEmail(email) == null) {
                UserDTO userDTO = new UserDTO();
                userDTO.setEmail(email);
                userDTO.setFirstName(userDetails.getAttribute(Constants.GIVEN_NAME));
                userDTO.setLastName(userDetails.getAttribute(Constants.FAMILY_NAME));
                userDTO.setUsername(userDetails.getAttribute(Constants.NAME));
                userDTO.setProvider(((OAuth2AuthenticationToken) authentication).getAuthorizedClientRegistrationId());
                request.getSession().setAttribute("user",userDTO);
                redirectUrl = "/password";
            }
            else {
                request.getSession().setAttribute("user",user);
                redirectUrl = "/index";
            }
        }
        new DefaultRedirectStrategy().sendRedirect(request, response, redirectUrl);
    }

}
