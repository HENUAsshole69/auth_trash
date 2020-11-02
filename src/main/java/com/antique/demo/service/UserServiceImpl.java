package com.antique.demo.service;



import com.antique.demo.bean.User;
import com.antique.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public List<User> selectAllUser() {
        return userMapper.selectAllUser();
    }

    @Override
    public User selectUserByUsername(String user_username) {
        return userMapper.selectUserByUsername(user_username);
    }

    @Override
    public List<User> searchByUsername(String UserOrAntiqueName) {
        return userMapper.searchByUsername(UserOrAntiqueName);
    }
}
