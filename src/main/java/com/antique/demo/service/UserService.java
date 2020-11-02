package com.antique.demo.service;



import com.antique.demo.bean.User;
import com.antique.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class UserService  {
    final
    UserMapper userMapper;

    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }


    public List<User> selectAllUser() {
        return userMapper.selectAllUser();
    }


    public User selectUserByUsername(String user_username) {
        return userMapper.selectUserByUsername(user_username);
    }


    public List<User> searchByUsername(String UserOrAntiqueName) {
        return userMapper.searchByUsername(UserOrAntiqueName);
    }
}
