package com.model;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor //有参构造器
@NoArgsConstructor //无参构造器
@TableName(value = "t_sys_role_permission")//指定表名
public class SysRolePermission  implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer permissionId;

    private Integer roleId;
}
