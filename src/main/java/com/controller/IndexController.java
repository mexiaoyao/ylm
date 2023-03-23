package com.controller;

import com.service.IndexService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.text.SimpleDateFormat;

@Controller
@Slf4j
public class IndexController {

    @Autowired
    private IndexService indexService;


    @GetMapping("/")
    public String selectList(Model model) {
        model.addAttribute("msg", "index " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
        return "index";
    }

    @GetMapping("/add")
    public String add(Model model) throws Exception {
        model.addAttribute("msg", "add " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
        return "index";
    }

    @GetMapping("/update")
    public String update(Model model) throws Exception {
        model.addAttribute("msg", "update" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
        return "index";
    }

    @GetMapping("/toLogin")
    public String toLogin() {
        if(SecurityUtils.getSubject().isAuthenticated()){
            SecurityUtils.getSubject().logout();
        }
        return "login";
    }

    @GetMapping("/login")
    public String login(String name, String pwd, Model model) {
        UsernamePasswordToken token = new UsernamePasswordToken(name, pwd);
        Subject subject = SecurityUtils.getSubject();
        if(subject.isAuthenticated()){
            subject.logout();
        }
        try{
            subject.login(token);
        }catch (UnknownAccountException e){
            log.info("账户错误");
            //账号异常
            model.addAttribute("msg","账号不正确");
            return "login";
            //登录失败，转发到登录页面
            //return "forward:tologin";
        }catch (IncorrectCredentialsException e){
            log.info("密码错误");
            //密码异常
            model.addAttribute("msg","密码不正确");
            return "login";
        }
        return "forward:/";
    }
    @GetMapping("/logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        if(subject.isAuthenticated()){
            subject.logout();
        }
        return "redirect:/toLogin";
        //登录失败，重定向到登录页面
        //return "redirect:tologin";
    }


}
