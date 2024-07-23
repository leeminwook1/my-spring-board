package com.kitri.myspringboard.mapper.service;

import com.kitri.myspringboard.domain.User;
import com.kitri.myspringboard.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    public UserMapper userMapper;

    public void save(User user) {

        if (!user.getPassword().equals(user.getPasswordConfirm())) throw new RuntimeException("비밀번호가 일치하지 않습니다");
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        user.setEnabled(true);
        userMapper.insertUser(user);
        userMapper.insertAuthority(user.getId(), "ROLE_USER");
    }
}