package com.inexture.ecommerce.dto;

import com.inexture.ecommerce.constant.ProviderEnum;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

    private long userId;
    private String username;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String mobileNumber;
    private String provider =  ProviderEnum.IN_HOUSE.getValue();
}
