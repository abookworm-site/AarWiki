# Database Interaction 数据库交互



## 操作步骤

![img](file:///E:/251%20Show%20me%20Code/%2320%20Python%E9%AB%98%E7%BA%A7/Images/assets/WechatIMG9052.jpeg)





### 引入模块



```python
from pymysql import *
```



### 建立连接

#### 创建连接对象

调用connect()方法即可

```python
conn=connect(参数列表)
```

- 参数`host`：连接的mysql主机，如果本机是'localhost'
- 参数`port`：连接的mysql主机的端口，默认是3306
- 参数`database`：数据库的名称
- 参数`user`：连接的用户名
- 参数`password`：连接的密码
- 参数`charset`：通信采用的编码方式，推荐使用utf8



#### 连接对象的方法

- `close()`：关闭连接
- `commit()`：提交
- `cursor()`：返回Cursor对象，用于执行sql语句并获得结果



### 获取Cursor对象

获取Cursor对象：调用Connection对象的cursor()方法

```python
cs1=conn.cursor()
```

- 用于执行sql语句，使用频度最高的语句为select、insert、update、delete



#### Cursor对象的方法

- `close()`关闭
- `execute(operation [, parameters ])`执行语句，返回受影响的行数，主要用于执行insert、update、delete语句，也可以执行create、alter、drop等语句
- `fetchone()`执行查询语句时，获取查询结果集的第一个行数据，返回一个元组
- `fetchall()`执行查询时，获取结果集的所有行，一行构成一个元组，再将这些元组装入一个元组返回

#### Cursor对象的属性

- `rowcount`只读属性，表示最近一次execute()执行后受影响的行数
- `connection`获得当前连接对象



### 参数化语句

- SQL语句的参数化，可以有效防止sql注入
- 参数化不同于python的字符串格式化，**全部使用%s占位**





























