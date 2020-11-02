package com.antique.demo.mapper;





import com.antique.demo.bean.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;


@Mapper
public interface RoleMapper {
    List<Role> selectAllRole();
    ArrayList<String> selectRoleByUsername(String user_username);
    void insertRolePermission(String role_username,int user_id,String user_username);
    String[] selectRoleByUserId(int user_id);
    void deleteRoleByUserId(int user_id);
}
