package slj.bms.booksmanagementsystem.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 预约记录表
 * @TableName lose
 */
@TableName(value ="lose")
@Data
public class Lose implements Serializable {
    /**
     * 丢失记录ID
     */
    @TableId
    private Integer id;

    /**
     * 丢失者ID
     */
    private Integer borrowerId;

    /**
     * 书目ID
     */
    private Integer itemId;

    /**
     * 丢失日期
     */
    private Date loseDate;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}