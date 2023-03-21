package com.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor //有参构造器
@NoArgsConstructor //无参构造器
@TableName(value = "t_user_info")//指定表名
public class UserInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)   //生成策略，这里配置为自增
    private Integer uid;

    @Column(unique =true)
    private String userName;//帐号

    private String name;//名称（昵称或者真实姓名，不同系统不同定义）

    private String password; //密码;

    private String salt;//加密密码的盐

    private byte state;//用户状态,0:创建未认证（比如没有激活，没有输入验证码等等）--等待验证的用户 , 1:正常状态,2：用户被锁定.

    @TableField(exist = false)
    private List<SysRole> roleList;// 一个用户具有多个角色
}
