package com.java.ylm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index(Model model){
        model.addAttribute("msg","你们好");
        return "home/index";
    }

    @RequestMapping("/test")
    public String test(Model model) throws Exception {
        model.addAttribute("msg", "标准变量表达式" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
        return "index";
    }
    @GetMapping("/test1")
    public String test1(Model model) throws Exception {
        model.addAttribute("msg", "标准变量表达式" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
        return "error";
    }
    @RequestMapping("/login")
    public ModelAndView login(){
        ModelAndView mv=new ModelAndView();
        mv.addObject("newText","你好，Thymeleaf！");
        mv.addObject("msg","login"+ new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
        mv.setViewName("index.html");
        return mv;
    }
}
