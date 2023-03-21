package com.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor //有参构造器
@NoArgsConstructor //无参构造器
@TableName(value = "t_sys_permission")//指定表名
public class SysPermission implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;//主键.

    private String name;//名称.

    @Column(columnDefinition="enum('menu','button')")
    private String resourceType;//资源类型，[menu|button]

    private String url;//资源路径.

    private String permission; //权限字符串,menu例子：role:*，button例子：role:create,role:update,role:delete,role:view

    private Long parentId; //父编号

    private String parentIds; //父编号列表

    private Boolean available = Boolean.FALSE;

    @TableField(exist = false)
    private List<SysRole> roles;
}
