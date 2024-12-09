-- 创建数据库，如果不存在的话
CREATE DATABASE IF NOT EXISTS bms DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 选择数据库
USE bms;

-- 创建本科生信息表
CREATE TABLE IF NOT EXISTS undergraduate (
                                             id INT(11) NOT NULL PRIMARY KEY COMMENT '本科生ID',
                                             major VARCHAR(255) COMMENT '专业'
) ENGINE=InnoDB COMMENT='本科生信息表';


-- 创建借阅者信息表
CREATE TABLE IF NOT EXISTS borrower (
                                        id INT(11) NOT NULL PRIMARY KEY COMMENT '借阅者ID',
                                        cardno VARCHAR(255) COMMENT '借阅卡号',
                                        department VARCHAR(255) COMMENT '部门',
                                        name VARCHAR(255) COMMENT '姓名',
                                        type VARCHAR(255) COMMENT '类型'
) ENGINE=InnoDB COMMENT='借阅者信息表';

-- 创建书目信息表
CREATE TABLE IF NOT EXISTS item (
                                    id INT(11) NOT NULL PRIMARY KEY COMMENT '书目ID',
                                    itemcode VARCHAR(255) COMMENT '物品代码',
                                    rest INT(11) COMMENT '剩余数量',
                                    m_logobook INT(11) COMMENT '预约数量',
                                    m_reservation INT(11) COMMENT '预约数量',
                                    status INT(11) COMMENT '状态'
) ENGINE=InnoDB COMMENT='书目信息表';

-- 创建杂志信息表
CREATE TABLE IF NOT EXISTS magazine (
                                        id INT(11) NOT NULL PRIMARY KEY COMMENT '杂志ID',
                                        author VARCHAR(255) COMMENT '作者',
                                        borrowednumber INT(11) COMMENT '借阅数量',
                                        date VARCHAR(255) COMMENT '日期',
                                        name VARCHAR(255) COMMENT '名称',
                                        price DECIMAL(10, 2) COMMENT '价格',
                                        number INT(11) COMMENT '数量',
                                        type VARCHAR(255) COMMENT '类型'
) ENGINE=InnoDB COMMENT='杂志信息表';

-- 创建书籍信息表
CREATE TABLE IF NOT EXISTS book (
                                    id INT(11) NOT NULL PRIMARY KEY COMMENT '书籍ID',
                                    press VARCHAR(255) COMMENT '出版社',
                                    publishdate DATE COMMENT '出版日期',
                                    version VARCHAR(255) COMMENT '版本'
) ENGINE=InnoDB COMMENT='书籍信息表';

-- 创建借阅记录表
CREATE TABLE IF NOT EXISTS loan (
                                    id INT(11) NOT NULL PRIMARY KEY COMMENT '借阅记录ID',
                                    student_id INT(11) NOT NULL COMMENT '本科生ID',
                                    borrowed_id INT(11) NOT NULL COMMENT '书目ID',
                                    due_date DATE COMMENT '应还日期',
                                    FOREIGN KEY (student_id) REFERENCES undergraduate(id),
                                    FOREIGN KEY (borrowed_id) REFERENCES item(id)
) ENGINE=InnoDB COMMENT='借阅记录表';

-- 创建预约记录表
CREATE TABLE IF NOT EXISTS reservation (
                                           id INT(11) NOT NULL PRIMARY KEY COMMENT '预约记录ID',
                                           borrower_id INT(11) NOT NULL COMMENT '借阅者ID',
                                           item_id INT(11) NOT NULL COMMENT '书目ID',
                                           reservedate DATE COMMENT '预约日期',
                                           FOREIGN KEY (borrower_id) REFERENCES borrower(id),
                                           FOREIGN KEY (item_id) REFERENCES item(id)
) ENGINE=InnoDB COMMENT='预约记录表';

-- 创建图书管理员信息表
CREATE TABLE IF NOT EXISTS librarian (
                                         name VARCHAR(255) NOT NULL PRIMARY KEY COMMENT '图书管理员姓名',
                                         userid VARCHAR(255) COMMENT '图书管理员用户ID'
) ENGINE=InnoDB COMMENT='图书管理员信息表';

-- 创建系统管理员信息表
CREATE TABLE IF NOT EXISTS system_admin (
                                            name VARCHAR(255) NOT NULL PRIMARY KEY COMMENT '系统管理员姓名',
                                            userid VARCHAR(255) COMMENT '系统管理员用户ID'
) ENGINE=InnoDB COMMENT='系统管理员信息表';