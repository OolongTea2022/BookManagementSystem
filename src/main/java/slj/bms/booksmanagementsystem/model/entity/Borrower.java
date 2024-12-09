package slj.bms.booksmanagementsystem.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 借阅者信息表
 * @TableName borrower
 */
@TableName(value ="borrower")
@Data
public class Borrower implements Serializable {
    /**
     * 借阅者ID
     */
    @TableId
    private Integer id;

    /**
     * 借阅卡号
     */
    private String cardId;

    /**
     * 姓名
     */
    private String name;

    /**
     * 类型: 本科生, 研究生
     */
    private String type;

    /**
     * 专业
     */
    private String major;

    /**
     * 部门
     */
    private String department;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}