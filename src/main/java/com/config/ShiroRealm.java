package com.config;

import com.model.UserInfo;
import com.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    UserService userService;

    /**
     * 支持授权
     * **/
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
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
        return new SimpleAuthenticationInfo("", userInfo.getPassword(),"");
    }
}
