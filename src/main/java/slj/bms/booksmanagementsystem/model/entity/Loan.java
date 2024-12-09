package slj.bms.booksmanagementsystem.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 借阅记录表
 * @TableName loan
 */
@TableName(value ="loan")
@Data
public class Loan implements Serializable {
    /**
     * 借阅记录ID
     */
    @TableId
    private Integer id;

    /**
     * 借出日期
     */
    private Date loanDate;

    /**
     * 借阅者ID
     */
    private Integer borrowerId;

    /**
     * 应还日期
     */
    private Date dueDate;

    /**
     * 书目ID
     */
    private Integer itemId;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}