package com.antique.demo.realm;

import com.antique.demo.bean.User;
import com.antique.demo.service.RoleService;
import com.antique.demo.service.UserService;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;

public class UserRealm extends AuthorizingRealm {
    private ArrayList<String> roleNameList;
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;
    @Override
    public String getName() {
        return "UserRealm";
    }
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection auth) {
        String username = (String)auth.getPrimaryPrincipal();
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        System.out.println("进入到授权Realm中:"+username);
        System.out.println(roleService.selectAllRole().toString());
        roleNameList = roleService.selectRoleByUsername(username);
        System.out.println(roleNameList.toString());
        simpleAuthorizationInfo.addRoles(roleNameList);
        return simpleAuthorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) throws AuthenticationException {
        String username = (String) auth.getPrincipal();
        System.out.println("进入到认证Realm中"+username);
        User dbuser = userService.selectUserByUsername(username);
        //通过用户名在数据库中拿到，判断用户名和密码对不对
        if(dbuser!=null){
            SimpleAuthenticationInfo authInfo = new SimpleAuthenticationInfo(username, dbuser.getUser_pwd(), "userRealm");
            return authInfo;
        }
        return null;
    }
}
