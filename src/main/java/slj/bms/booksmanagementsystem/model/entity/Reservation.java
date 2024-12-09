package slj.bms.booksmanagementsystem.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 预约记录表
 * @TableName reservation
 */
@TableName(value ="reservation")
@Data
public class Reservation implements Serializable {
    /**
     * 预约记录ID
     */
    @TableId
    private Integer id;

    /**
     * 借阅者ID
     */
    private Integer borrowerId;

    /**
     * 书目ID
     */
    private Integer itemId;

    /**
     * 预约日期
     */
    private Date reserveDate;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}