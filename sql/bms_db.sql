-- 创建数据库，如果不存在的话
CREATE DATABASE IF NOT EXISTS bms DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 选择数据库
USE bms;


-- 创建借阅者信息表
CREATE TABLE IF NOT EXISTS borrower (
                                        id INT(11) NOT NULL PRIMARY KEY COMMENT '借阅者ID',
                                        card_id VARCHAR(255) COMMENT '借阅卡号',
                                        name VARCHAR(255) COMMENT '姓名',
                                        type VARCHAR(255) COMMENT '类型: 本科生, 研究生',
                                        major VARCHAR(255) COMMENT '专业',
                                        department VARCHAR(255) COMMENT '部门'
) COMMENT='借阅者信息表';

-- 创建书目信息表
CREATE TABLE IF NOT EXISTS item (
                                    id INT(11) NOT NULL PRIMARY KEY COMMENT '书目ID',
                                    library_code VARCHAR(255) COMMENT '馆内索书号',
                                    total INT(11) COMMENT '总数',
                                    rest_count INT(11) COMMENT '剩余数量',
                                    loan_count INT(11) COMMENT '借出数量',
                                    reserve_count INT(11) COMMENT '预约数量',
                                    lose_count INT(11) COMMENT '丢失数量',
                                    item_detail_id INT(11) COMMENT '书目详细信息 id'
) COMMENT='书目信息表';


-- 创建书目详细信息表
CREATE TABLE IF NOT EXISTS item_detail (
                                    id INT(11) NOT NULL PRIMARY KEY COMMENT '书目ID',
                                    author VARCHAR(255) COMMENT '作者',
                                    isbn VARCHAR(255) COMMENT '国际标准书号',
                                    name VARCHAR(255) COMMENT '书名',
                                    price FLOAT COMMENT '价格',
                                    type VARCHAR(255) COMMENT '书籍类型: 杂志、书',
                                    publish_date DATE COMMENT '出版日期',
                                    press VARCHAR(255) COMMENT '出版社',
                                    version VARCHAR(255) COMMENT '版号'
) COMMENT='书目详细信息表';


-- 创建借阅记录表
CREATE TABLE IF NOT EXISTS loan (
                                    id INT(11) NOT NULL PRIMARY KEY COMMENT '借阅记录ID',
                                    loan_date DATE COMMENT '借出日期',
                                    borrower_id INT(11) NOT NULL COMMENT '借阅者ID',
                                    due_date DATE COMMENT '应还日期',
                                    item_id INT(11) NOT NULL COMMENT '书目ID',

                                    FOREIGN KEY (borrower_id) REFERENCES borrower(id),
                                    FOREIGN KEY (item_id) REFERENCES item(id)
) COMMENT='借阅记录表';

-- 创建预约记录表
CREATE TABLE IF NOT EXISTS reservation (
                                           id INT(11) NOT NULL PRIMARY KEY COMMENT '预约记录ID',
                                           borrower_id INT(11) NOT NULL COMMENT '借阅者ID',
                                           item_id INT(11) NOT NULL COMMENT '书目ID',
                                           reserve_date DATE COMMENT '预约日期',

                                           FOREIGN KEY (borrower_id) REFERENCES borrower(id),
                                           FOREIGN KEY (item_id) REFERENCES item(id)
) COMMENT='预约记录表';

-- 创建丢失记录表
CREATE TABLE IF NOT EXISTS lose (
                                           id INT(11) NOT NULL PRIMARY KEY COMMENT '丢失记录ID',
                                           borrower_id INT(11) NOT NULL COMMENT '丢失者ID',
                                           item_id INT(11) NOT NULL COMMENT '书目ID',
                                           lose_date DATE COMMENT '丢失日期',

                                           FOREIGN KEY (borrower_id) REFERENCES borrower(id),
                                           FOREIGN KEY (item_id) REFERENCES item(id)
) COMMENT='预约记录表';




-- 创建管理员信息表
CREATE TABLE IF NOT EXISTS admin (
                                            userid VARCHAR(255) COMMENT '管理员用户ID',
                                            name VARCHAR(255) NOT NULL PRIMARY KEY COMMENT '管理员姓名',
                                            user_role VARCHAR(255) COMMENT '管理员角色: 系统管理员、图书管理员'
) COMMENT='管理员信息表';

