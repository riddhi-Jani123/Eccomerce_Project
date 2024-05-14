package com.inexture.ecommerce.service.impl;

import com.inexture.ecommerce.dto.UserDTO;
import com.inexture.ecommerce.model.User;
import com.inexture.ecommerce.repository.UserRepository;
import com.inexture.ecommerce.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static com.inexture.ecommerce.config.SecurityConfig.encode;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    public UserDTO addUser(UserDTO userDTO){
            userDTO.setPassword(encode(userDTO.getPassword()));
            User user = userRepository.save(convertToEntity(userDTO));
            userDTO.setUserId(user.getUserId());
            return userDTO;
    }

    @Override
    public UserDTO getByUserId(long id) {
        Optional<User> user = userRepository.findById(id);
        return user.map(this::convertToDTO).orElse(null);
    }

    @Override
    public List<UserDTO> getAllUser() {
        List<User> userList = userRepository.findAll();
        return userList.stream().map(this::convertToDTO).collect(Collectors.toList());
    }

    public User getByEmail(String email){
        return userRepository.findByEmail(email);
    }

    public User getByUsername(String username){
        return userRepository.findByUsername(username);
    }

    public User getByEmailAndPassword(String email, String password){
        return userRepository.findByEmailAndPassword(email, encode(password));
    }

    @Override
    public UserDTO updateUser(UserDTO userDTO, long id) {
        userDTO.setUserId(id);
        User user = userRepository.save(convertToEntity(userDTO));
        return userDTO;
    }

    @Override
    public void deleteUser(long id) {
        userRepository.deleteById(id);
    }

    private UserDTO convertToDTO(User user) {
        UserDTO userDTO = new UserDTO();
        BeanUtils.copyProperties(user, userDTO);
        return userDTO;
    }

    private User convertToEntity(UserDTO userDTO) {
        User user = new User();
        BeanUtils.copyProperties(userDTO, user);
        return user;
    }

}
