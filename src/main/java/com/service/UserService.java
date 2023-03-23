package com.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.model.UserInfo;

public interface UserService extends IService<UserInfo> {

    void selectList();

    UserInfo getUser(String userName);
}
