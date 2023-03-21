package com.controller;

import com.service.IndexService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.text.SimpleDateFormat;

@Controller
@Slf4j
public class IndexController {

    @Autowired
    private IndexService indexService;


    @GetMapping("/")
    public String selectList() {
        //indexService.selectList();
        return "index";
    }

    @GetMapping("/test")
    public String test(Model model) throws Exception {
        model.addAttribute("msg", "标准变量表达式" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
        return "index";
    }


}
