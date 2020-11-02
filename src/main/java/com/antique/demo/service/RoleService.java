package com.antique.demo.service;



import com.antique.demo.bean.Role;
import com.antique.demo.bean.User;
import com.antique.demo.mapper.RoleMapper;
import com.antique.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class RoleService  {
    @Autowired
    RoleMapper roleMapper;


    public List<Role> selectAllRole() {
        return roleMapper.selectAllRole();
    }


    public ArrayList<String> selectRoleByUsername(String user_username) {
        return roleMapper.selectRoleByUsername(user_username);
    }


    public void insertRolePermission(String role_username, int user_id, String user_username) {
        roleMapper.insertRolePermission(role_username,user_id,user_username);
    }


    public String[] selectRoleByUserId(int user_id) {
        return roleMapper.selectRoleByUserId(user_id);
    }


    public void deleteRoleByUserId(int user_id) {
        roleMapper.deleteRoleByUserId(user_id);
    }
}
