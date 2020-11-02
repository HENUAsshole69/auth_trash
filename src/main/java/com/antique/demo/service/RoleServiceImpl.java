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
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleMapper roleMapper;

    @Override
    public List<Role> selectAllRole() {
        return roleMapper.selectAllRole();
    }

    @Override
    public ArrayList<String> selectRoleByUsername(String user_username) {
        return roleMapper.selectRoleByUsername(user_username);
    }

    @Override
    public void insertRolePermission(String role_username, int user_id, String user_username) {
        roleMapper.insertRolePermission(role_username,user_id,user_username);
    }

    @Override
    public String[] selectRoleByUserId(int user_id) {
        return roleMapper.selectRoleByUserId(user_id);
    }

    @Override
    public void deleteRoleByUserId(int user_id) {
        roleMapper.deleteRoleByUserId(user_id);
    }
}
