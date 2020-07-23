# Oracle 完全卸载 on Win10

## Preface

1. 本教程为个人总结笔记，原则上仅用于自我二次查询使用。
2. 本教程仅对重要步骤配图及说明，未说明的步骤请选择默认判断 **下一步** 即可。
3. 若您有缘参考本教程，那么希望您对于本教程有任何不同意见，欢迎同笔者交流。
4. 由于诸多因素，并不能保证对于步骤设置的百分白准确实用，读者请自行判断，同时笔者也会更新不当之处。



## Configuration

1. OS :  **Win10**
2. Platform：**Win10**
3. Oracle version:  **Oracle11g**



## Operating Procedure

### 1. 停止所有服务：`任务管理器` --> `服务`。
![image-20200723133047064](_resource/Oracle%E6%95%B0%E6%8D%AE%E5%BA%93%E5%8D%B8%E8%BD%BD/image-20200723133047064.png)



### 2. 卸载程序 `PLSQL Developer`。

单击"卸载产品"-"全部展开"，选中除"OraDb11g_home1"外的全部目录，删除。

![image-20200723134700969](_resource/Oracle%E6%95%B0%E6%8D%AE%E5%BA%93%E5%8D%B8%E8%BD%BD/image-20200723134700969.png)



### 3. 删除注册表

- 运行`regedit`，选择 `HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE`，按del键删除这个入口。
- 运行`regedit`，选择 `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControl\SetServices`，滚动列表，删除所有Oracle入口(以`oracle`或`OraWeb`开头的键)。
- 运行`refedit`，`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Application`，删除所有Oracle入口。

- 删除`HKEY_CLASSES_ROOT`目录下所有以`Ora`、`Oracle`、`Orcl`或 `EnumOra` 为前缀的键。

- 删除 `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder\StartMenu\Programs`中，所有以oracle开头的键。

- 删除`HKEY_LOCAL_MACHINESOFTWAREODBCODBCINST.INI`中，除`MicrosoftODBC for Oracle`注册表键以外的所有含有Oracle的键。

### 4. 删除环境变量

- `我的电脑`--> `属性` --> `高级` --> `环境变量`，删除环境变量CLASSPATH和PATH中有关Oracle的设定。


### 5. 删除文件

1. 从桌面上、STARTUP（启动）组、程序菜单中，删除所有有关Oracle的组和图标。
2. 删除所有与Oracle相关的目录(如果删不掉，重启计算机后再删就可以了)包括：
  - `C:Program file/Oracle`目录。
  - `ORACLE_BASE` 目录(oracle的安装目录)。
  - `C:\WINDOWS\system32\config\systemprofile\Oracle` 目录。
  - `C:\Users\Administrator\Oracle` 或 `C:\Documentsand Settings\Administrator\Oracle` 目录。
  - `C:\WINDOWS` 下删除以下文件 `ORACLE.INI`、`oradim73.INI`、`oradim80.INI`、`oraodbc.ini`等等。
  - `C:\WINDOWS` 下的 `WIN.INI` 文件中若有[ORACLE]的标记段，删除该段。

3. 如有必要，删除所有Oracle相关的ODBC的DSN
4. 到事件查看器中，删除Oracle相关的日志说明
    - 如果有个别DLL文件无法删除的情况，则不用理会，重新启动；
    - 开始新的安装，安装时，选择一个新的目录，到安装完毕并重新启动后，老的目录及文件就可以删除掉了。