# Oracle 数据库配置

## 数据库安装后

本文配置使用的数据库版本为：`Oracle11g`

### 1. 创建全局数据库实例

Oracle 安装时，程序搭建了整体数据库框架。并实例化数据库，即新建全局数据库。

- 设置了全局数据库名称：`orcl`，以及系统管理员 `sys` 密码。因此，数据库实例名统一使用`orcl`

- 此时，默认已有用户
    - `sys` 超级管理员
    - `system` 普通管理员
    - `scott` 普通的用户



## 查看 Oracle 服务

### 1. 查看Oracle服务

Oracle 软件安装完成之后会有如下服务。其中，`OracleServiceORCL` 和 `OracleOraDb11g_home1TNSListener` 是最关键的服务。如果安装完成之后发现只有两个服务，那意味着安装过程中存在问题，需要将oracle完整删除后，再行安装。

> - Oracle ORCL VSS Writer Service
> - OracleDBConsoleorcl
> - OraclelobSchedulerORCL
> - OracleMTSRecoveryService
> - OracleOraDb11g_home1ClrAgent
> - **OracleOraDb11g_home1TNSListener**
> - **OracleServiceORCL**



### 2. Oracle服务作用

#### 2.1 Oracle 11g服务详细介绍及哪些服务是必须开启的？

安装oracle 11g R2中的方法成功安装Oracle 11g后，共有7个服务，这七个服务的含义分别为：

1. `Oracle ORCL VSS Writer Service`：Oracle卷映射拷贝写入服务，VSS（Volume Shadow Copy Service）能够让存储基础设备（比如磁盘，阵列等）创建高保真的时间点映像，即映射拷贝（shadow copy）。它可以在多卷戒者单个卷上创建映射拷贝，同时不会影响到系统的系统能。**（非必须启动）**

2. `OracleDBConsoleorcl`：Oracle数据库控制台服务，`orcl`是Oracle的实例标识，默认的实例为`orcl`。在运行Enterprise Manager（企业管理器OEM）的时候，需要启动这个服务。**（非必须启动）**

3. `OracleJobSchedulerORCL`：Oracle作业调度（定时器）服务，ORCL是Oracle实例标识。**（非必须启动）**

4. `OracleMTSRecoveryService`：服务端控制。该服务允许数据库充当一个微软事务服务器MTS、COM/COM+对象和分布式环境下的事务的资源管理器。（非必须启动）

5. `OracleOraDb11g_home1ClrAgent`：Oracle数据库.NET扩展服务的一部分。 **（非必须启动）**

6. `OracleOraDb11g_home1TNSListener`：监听器服务，服务只有在数据库需要远程访问的时候才需要。（必须启动，下面会有详细详解）。

7. `OracleServiceORCL`：数据库服务(数据库实例)，是Oracle核心服务该服务，是数据库启动的基础， 只有该服务启动，Oracle数据库才能正常启动。**(必须启动)**。



#### 2.2 在开发的时候到底需要启动哪些服务呢？

- 对新手来说，要是只用Oracle自带的 `sql*plus` 的话，只要启动 `OracleServiceORCL` 即可，
- 要是使用 `PL/SQL Developer` 等第三方工具的话，`OracleOraDb11g_home1TNSListener` 服务也要开启。
- `OracleDBConsoleorcl` 是进入基于web的EM必须开启的，其余服务很少用。

- 注意：`ORCL`是数据库实例名，默认的数据库是ORCL，你可以创建其他的，即OracleService+数据库名



#### 2.3 `OracleRemExecService`

- `OracleRemExecService` 这个windows服务只是被OUI暂时性的使用，当OUI完成它的工作后，该服务会被remove掉。因此，在reboot之前，该服务的值为`disabled`
- 在reboot之后，该服务会消失（gone）请忽略该服务，并 `leave this service untouched`



#### 2.4  必须启动的服务总结

![image-20200729194332659](_resource/Oracle%E6%95%B0%E6%8D%AE%E5%BA%93%E9%85%8D%E7%BD%AE/image-20200729194332659.png)



## 配置 Oracle 服务

1，将所有的服务改成 **"手动"**。
2，启动其中的两个服务

- 监听服务，以监听客户端的连接：`OracleOraDb10g_home1TNSListener`
- 数据库服务：`OracleServiceORCL`
    - 该服务命名规则为：`OracleService+实例名`
    - 因此，这里的 `ORCL` 为软件安装时设置的全局数据库实例。若要使用其他数据库实例 `xxxx`，则需要启动其他数据库服务：`OracleServiceXXXX`



## 新建数据库实例

### 1. 创建新数据库实例

#### 1.1 新建数据库：`Database Configuration Assistant`。

在 **开始** 菜单中，启动 `Database Configuration Assistant` 进行数据库创建。

- 该选项，可以创建新的数据库，同时也可以进行 **数据库的删除** 和 **数据库配置** 等操作



#### 1.2 选择数据库实例，默认 `一般用途或事务处理`。



#### 1.3 填写数据库的名称和SID

- 之后要求配置管理器，默认选项即可，不需要做任何修改



#### 1.4 设置数据库密码

此处填写实例数据库的密码，建议设置统一密码，方便记忆。

![image-20200723141339720](_resource/Oracle%E6%95%B0%E6%8D%AE%E5%BA%93%E9%85%8D%E7%BD%AE/image-20200723141339720.png)

- 若密码过于简单，那么会弹出口令警告信息，忽略即可。



#### 1.5 默认选项，等待安装完成

安装完成之后显示oracle帮助，此时又可进入口令管理页面修改密码，也可 **直接确定不修改** 到后续修改。



### 2. 安装新数据库之后的服务列表

安装新数据库之后，会多出几个跟此数据库相关的服务，意味新建数据库完成。

> - Oracle MSB VSS Writer Service
> - Oracle ORCLVSS Writer Service
> - **OracleDBConsoleabookworm**
> - OracleDBConsoleor
> - **OracleJobSchedulerABOOKWORM**
> - OracleJobScChedulerORCL
> - OracleMTSRecoveryService
> - OracleOraDb11g home1CIrAgent
> - OracleOraDb11g home1TNSListener
> - OracleRemExecService
> - **OracleServiceABOOKWORM**
> - OracleserViceORCL



## 账号管理

使用 `scott` 用户登录，第一次登录的时候会显示账户锁定，需要将账户解锁：

1. 运行命令行工具，使用DBA登录

    ```sql
    sqlplus /nolog;
    
    conn sys/*****@orcl as sysdba;
    ```

    - `sys`：系统管理员账户
    - `*****` ：这里表示系统管理员密码
    - `orcl`：全局数据库实例名称

    

2. 解锁命令：

    ```sql
    alter user scott account unlock|lock;
    ```

    

3. 测试：

    ```sql
    conn scott/****@orcl;
    ```

    - `xxxx`：为对应用户的密码。
    - 要求重新输入密码，确认你自己的密码即可



## `Pl/sql` 连接常见问题
### 1. 问题

-  `ORA-12541: TNS: 监听程序当前无法识别连接描述符中请求的服务`
-  `ORA-12541: TNS: 无监听程序`

![image-20200729194437836](_resource/Oracle%E6%95%B0%E6%8D%AE%E5%BA%93%E9%85%8D%E7%BD%AE/image-20200729194437836.png)



### 2. 解决方案

以上两种问题都是由于监听服务引起的。因此，大方向都是：**查看监听服务，保证监听服务启动即可**。特别是： `OracleOraDb11g_home1TNSListener`。

#### 2.1 重启监听服务

#### 2.2 重新配置监听服务

- 启动 `Net Configuration Assistant` 重新配置监听服务。
- `监听程序配置` and `本地网络配置`
- 1. 本地网络配置

![01本地网络配置](_resource/Oracle%E6%95%B0%E6%8D%AE%E5%BA%93%E9%85%8D%E7%BD%AE/01%E6%9C%AC%E5%9C%B0%E7%BD%91%E7%BB%9C%E9%85%8D%E7%BD%AE.png)

- 2. 重新配置

![02重新配置](_resource/Oracle%E6%95%B0%E6%8D%AE%E5%BA%93%E9%85%8D%E7%BD%AE/02%E9%87%8D%E6%96%B0%E9%85%8D%E7%BD%AE.png)

- 3. 填写服务名

![03填写服务名](_resource/Oracle%E6%95%B0%E6%8D%AE%E5%BA%93%E9%85%8D%E7%BD%AE/03%E5%A1%AB%E5%86%99%E6%9C%8D%E5%8A%A1%E5%90%8D.png)



- 4. 配置本地网络回路

![04配置本地网络回路](_resource/Oracle%E6%95%B0%E6%8D%AE%E5%BA%93%E9%85%8D%E7%BD%AE/04%E9%85%8D%E7%BD%AE%E6%9C%AC%E5%9C%B0%E7%BD%91%E7%BB%9C%E5%9B%9E%E8%B7%AF.png)

