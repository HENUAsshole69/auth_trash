package com.antique.demo.controller;

import com.alibaba.fastjson.JSON;
import com.antique.demo.bean.Role;
import com.antique.demo.bean.User;
import com.antique.demo.service.RoleService;
import com.antique.demo.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;
    @RequestMapping("/antique/user/{pageNum}")
    public String userPage(@PathVariable("pageNum") int pageNum,Model model, String UserOrAntiqueName){
        PageHelper.startPage(pageNum, 4);
        List<User> userList = null;
        if(UserOrAntiqueName == null || UserOrAntiqueName.equals(""))
            userList =  userService.selectAllUser();
        else
            userList = userService.searchByUsername(UserOrAntiqueName);
        PageInfo<User> pageInfo = new PageInfo(userList);
        model.addAttribute("userList",userList);
        model.addAttribute("pageInfo", pageInfo);
        return "antique_user";
    }
    @RequestMapping("/antique/user/updatePermission")
    public void updatePermission(String roleBox[],String user_id,String user_username,HttpServletResponse response) throws IOException {
        Role role = new Role();
        role.setUser_id(user_id);
        role.setUser_username(user_username);
        System.out.println(user_username);
        roleService.deleteRoleByUserId(Integer.valueOf(user_id));
        for (String permission:roleBox) {
            roleService.insertRolePermission(permission, Integer.valueOf(user_id), user_username);
        }
        response.sendRedirect("/antique/user/1");
    }
    @RequestMapping("/antique/user/selectPermission")
    public String selectPermission(String user_id,String user_username,Model model){
        Role role = new Role();
        role.setUser_id(user_id);
        User user = userService.selectUserByUsername(user_username);
        String permission[] = roleService.selectRoleByUserId(Integer.valueOf(user_id));
        for(String per:permission){
            if (per.equals("文物局"))
                role.setAntique("yes");
            else if (per.equals("老化痕迹鉴定人员")) {
                role.setBurn_in("yes");
            } else if (per.equals("工作人员")) {
                role.setWorker("yes");
            } else if (per.equals("文物商店")) {
                role.setAntique_store("yes");
            } else if (per.equals("拍卖行")) {
                role.setAuction("yes");
            } else if (per.equals("普通用户")) {
                role.setOrdinary("yes");
            } else {
                role.setFinance("yes");
            }
        }
        model.addAttribute("user",user);
        model.addAttribute("role",role);
        return "antique_user_permisson";
    }

    @RequestMapping("/antique/user/selectPermission2")
    public String selectPermission2(String user_id,String user_username,Model model){
        Role role = new Role();
        role.setUser_id(user_id);
        User user = userService.selectUserByUsername(user_username);
        String permission[] = roleService.selectRoleByUserId(Integer.valueOf(user_id));
        for(String per:permission){
            if (per.equals("文物局"))
                role.setAntique("yes");
            else if (per.equals("老化痕迹鉴定人员")) {
                role.setBurn_in("yes");
            } else if (per.equals("工作人员")) {
                role.setWorker("yes");
            } else if (per.equals("文物商店")) {
                role.setAntique_store("yes");
            } else if (per.equals("拍卖行")) {
                role.setAuction("yes");
            } else if (per.equals("普通用户")) {
                role.setOrdinary("yes");
            } else {
                role.setFinance("yes");
            }
        }
        model.addAttribute("user",user);
        model.addAttribute("role",role);
        return "antique_user_permisson2";
    }
}
