package com.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.model.GradeDict;

public interface IndexService extends IService<GradeDict> {

    void selectList();
}
