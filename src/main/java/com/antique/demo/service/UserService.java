package com.antique.demo.service;


import com.antique.demo.bean.User;

import java.util.List;

public interface UserService {
    List<User> selectAllUser();
    User selectUserByUsername(String user_username);
    List<User> searchByUsername(String UserOrAntiqueName);
}
