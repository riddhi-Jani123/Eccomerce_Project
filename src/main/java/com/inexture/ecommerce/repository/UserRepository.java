package com.inexture.ecommerce.repository;

import com.inexture.ecommerce.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User,Long> {

    User findByEmail(@Param("email") String email);

    User findByEmailAndPassword(@Param("email") String email, @Param("password") String password);
}
