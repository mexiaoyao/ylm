package com.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mapper.GradeDictMapper;
import com.mapper.UserMapper;
import com.model.GradeDict;
import com.model.UserInfo;
import com.service.IndexService;
import com.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, UserInfo> implements UserService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void selectList() {
        QueryWrapper<UserInfo> wrapper=new QueryWrapper<>();
        //wrapper.eq("id",'');
        System.out.println("----- selectAll method test ------");
        List<UserInfo> userList = baseMapper.selectList(wrapper);
        userList.forEach(System.out::println);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public UserInfo getUser(String userName) {
        QueryWrapper<UserInfo> wrapper=new QueryWrapper<>();
        wrapper.eq("user_name",userName);
        return baseMapper.selectOne(wrapper);
    }
}
