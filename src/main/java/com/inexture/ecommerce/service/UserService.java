package com.inexture.ecommerce.service;

import com.inexture.ecommerce.dto.UserDTO;

import java.util.List;

public interface UserService  {

    UserDTO addUser(UserDTO userDTO);
    UserDTO getByUserId(long id);
    List<UserDTO> getAllUser();
    UserDTO updateUser(UserDTO userDTO, long id);
    void deleteUser(long id);

}
