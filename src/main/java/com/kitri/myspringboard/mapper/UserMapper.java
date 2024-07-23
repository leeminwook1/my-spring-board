package com.kitri.myspringboard.mapper;

import com.kitri.myspringboard.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

@Mapper
public interface UserMapper {
    @Insert("INSERT INTO users (username, password, enabled) VALUES (#{username}, #{password}, #{enabled})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertUser(User user);

    @Insert("INSERT INTO authorities (user_id, authority) VALUES (#{userId}, #{authority})")
    void insertAuthority(Long userId, String authority);
}
