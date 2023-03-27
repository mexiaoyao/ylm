package com.config;

import com.model.UserInfo;
import com.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    UserService userService;

    /**
     * 支持授权
     * **/
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //获取用户信息
        Subject subject = SecurityUtils.getSubject();
        UserInfo userInfo = (UserInfo)subject.getPrincipal();
        List<String> perms = new ArrayList<String>();
         String[] strs = userInfo.getParms().split(",");
         for(String str : strs){
             perms.add(str);
         }
        info.addStringPermissions(perms);
        return info;
    }

    /**
     * 支持认证
     * **/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //UsernamePasswordToken token subject.login 对应此操作
        UsernamePasswordToken tk = (UsernamePasswordToken) token;
        UserInfo userInfo = userService.getUser(tk.getUsername());
        if(null==userInfo){
            return null;
        }
        //账户比较
        if(!userInfo.getUserName().equals(tk.getUsername())){
            return null;
        }
        //SimpleAuthenticationInfo密码比较
        return new SimpleAuthenticationInfo(userInfo, userInfo.getPassword(),""); //第一个参数传递UserInfo
    }
}
