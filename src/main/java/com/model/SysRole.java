package com.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor //有参构造器
@NoArgsConstructor //无参构造器
@TableName(value = "t_sys_role")//指定表名
public class SysRole implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer id; // 编号
    private String role; // 角色标识程序中判断使用,如"admin",这个是唯一的:
    private String description; // 角色描述,UI界面显示使用
    @TableField(exist = false)
    private Boolean available = Boolean.FALSE; // 是否可用,如果不可用将不会添加给用户

    //角色 -- 权限关系：多对多关系;
    @TableField(exist = false)
    private List<SysPermission> permissions;

    // 用户 - 角色关系定义;
    @TableField(exist = false)
    private List<UserInfo> userInfos;// 一个角色对应多个用户
}
