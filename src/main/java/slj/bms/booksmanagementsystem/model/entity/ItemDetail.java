package slj.bms.booksmanagementsystem.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 书目详细信息表
 * @TableName item_detail
 */
@TableName(value ="item_detail")
@Data
public class ItemDetail implements Serializable {
    /**
     * 书目ID
     */
    @TableId
    private Integer id;

    /**
     * 作者
     */
    private String author;

    /**
     * 国际标准书号
     */
    private String isbn;

    /**
     * 书名
     */
    private String name;

    /**
     * 价格
     */
    private Double price;

    /**
     * 书籍类型: 杂志、书
     */
    private String type;

    /**
     * 出版日期
     */
    private Date publishDate;

    /**
     * 出版社
     */
    private String press;

    /**
     * 版号
     */
    private String version;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}