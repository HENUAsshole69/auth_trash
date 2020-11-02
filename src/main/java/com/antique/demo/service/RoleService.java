package com.antique.demo.service;


import com.antique.demo.bean.Role;
import com.antique.demo.bean.User;

import java.util.ArrayList;
import java.util.List;

public interface RoleService {
    List<Role> selectAllRole();
    ArrayList<String> selectRoleByUsername(String user_username);
    void insertRolePermission(String role_username,int user_id,String user_username);
    String[] selectRoleByUserId(int user_id);
    void deleteRoleByUserId(int user_id);
}
