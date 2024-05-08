package com.inexture.ecommerce.repository;

import com.inexture.ecommerce.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User,Long> {

    @Query("SELECT u FROM User u WHERE u.email = :email")
    public User getUserByEmail(@Param("email") String email);

    @Query("SELECT u FROM User u WHERE u.email = :email and u.password = :password")
    public User getUserByEmailAndPassword(@Param("email") String email, @Param("password") String password);
}
