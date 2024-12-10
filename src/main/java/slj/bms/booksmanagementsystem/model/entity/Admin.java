package slj.bms.booksmanagementsystem.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 管理员信息表
 * @TableName admin
 */
@TableName(value ="admin")
@Data
public class Admin implements Serializable {

    /**
     * 管理员姓名
     */
    @TableId
    private String name;

    /**
     * 管理员用户ID
     */
    private String userid;

    /**
     * 管理员角色: 系统管理员、图书管理员
     */
    private String userRole;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}