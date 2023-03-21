package com.controller;

import com.service.IndexService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class IndexController {

    @Autowired
    private IndexService indexService;


    @GetMapping("/")
    public String selectList() {
        //indexService.selectList();
        return "index";
    }


}
