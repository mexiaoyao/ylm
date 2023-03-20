package com.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mapper.GradeDictMapper;
import com.model.GradeDict;
import com.service.IndexService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class IndexServiceImpl extends ServiceImpl<GradeDictMapper, GradeDict> implements IndexService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void selectList() {
        QueryWrapper<GradeDict> wrapper=new QueryWrapper<>();
        //wrapper.eq("id",'');
        System.out.println("----- selectAll method test ------");
        List<GradeDict> userList = baseMapper.selectList(wrapper);
        userList.forEach(System.out::println);
    }
}
