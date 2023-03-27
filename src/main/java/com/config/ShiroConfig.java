package com.config;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {

    /**
     * 此页面需要三个对象
     * **/
    /**拦截器*/
    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean( @Qualifier("securityManager") DefaultWebSecurityManager securityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();

        //开始设置拦截内容
        //anon 无需认真 放行
        //authc 必须认证
        //perms 有权限放行
        Map<String, String> filterMap = new LinkedHashMap<String, String>();
        //此处顺序要注意
        //filterMap.put("/add","authc");
        filterMap.put("/toLogin","anon");
        filterMap.put("/login","anon");
        filterMap.put("/logout","logout");
        filterMap.put("/add","perms[add]"); //授权范例
        filterMap.put("/update","perms[update]"); //授权范例
        filterMap.put("/**","authc"); //此行需要放置在最后

        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterMap);
        shiroFilterFactoryBean.setLoginUrl("/toLogin"); //未登陆时，进入此页面
        shiroFilterFactoryBean.setUnauthorizedUrl("/noAuth"); //未授权时，进入此页面

        shiroFilterFactoryBean.setSecurityManager(securityManager);
        return shiroFilterFactoryBean;
    }

    /**
     * 通过Qualifier达到注入
     * **/
    /**
     * 安全 name可以省略
     * **/
    @Bean(name="securityManager") //可以是@Bean("securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(@Qualifier("shiroRealm") ShiroRealm userRealm){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //关联Realm
        securityManager.setRealm(userRealm);
        return securityManager;
    }

    @Bean("shiroRealm") //交给容器 是该方法的id  可以加name="shiroRealm"
    public ShiroRealm getShiroRealm(){
        return new ShiroRealm();
    }

    /**
     * 配置 ShiroDialect
     * 数据库 方言 对应前端的  功能 shiro:haspermission="add"
     * **/
    @Bean
    public ShiroDialect getShiroDialect(){
        return new ShiroDialect();
    }
}
