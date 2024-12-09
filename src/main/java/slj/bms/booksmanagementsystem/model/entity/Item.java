package slj.bms.booksmanagementsystem.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 书目信息表
 * @TableName item
 */
@TableName(value ="item")
@Data
public class Item implements Serializable {
    /**
     * 书目ID
     */
    @TableId
    private Integer id;

    /**
     * 馆内索书号
     */
    private String libraryCode;

    /**
     * 总数
     */
    private Integer total;

    /**
     * 剩余数量
     */
    private Integer restCount;

    /**
     * 借出数量
     */
    private Integer loanCount;

    /**
     * 预约数量
     */
    private Integer reserveCount;

    /**
     * 丢失数量
     */
    private Integer loseCount;

    /**
     * 书目详细信息 id
     */
    private Integer itemDetailId;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}