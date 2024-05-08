package com.inexture.ecommerce.service;

import com.inexture.ecommerce.dto.UserDTO;
import com.inexture.ecommerce.model.User;
import com.inexture.ecommerce.repository.UserRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    public UserDTO addUser(UserDTO userDTO){
        User user = userRepository.getUserByEmail(userDTO.getEmail());
        if (user == null){
            userDTO.setPassword(passwordEncoder().encode(userDTO.getPassword()));
            user = userRepository.save(convertToEntity(userDTO));
            userDTO.setUserId(user.getUserId());
        }
        return updateUser(userDTO, user.getUserId());
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

    @Override
    public UserDTO updateUser(UserDTO userDTO, long id) {
        userDTO.setUserId(id);
        userRepository.save(convertToEntity(userDTO));
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

    @Bean(name="encoder")
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
