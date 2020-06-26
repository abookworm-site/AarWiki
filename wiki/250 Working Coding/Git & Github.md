# Git: 公司必备，一定要会

## 简介

1. Git是一个免费，开源的分布式版本控制系统



## 版本控制

概念：
一种记录一个或若干文件内容变化，以便将来查阅特定版本修订情况的系统
- 回溯之前的文件状态，甚至退回到过去某个时间点状态
- 比较文件变化细节，查找问题出现的原因
- 文件内容恢复

分类：
1. 集中化的版本控制系统
- 一个单一的集中管理的服务器保存所有文件的修订版本，而协同工作人员都通过客户端到这台服务器取出最新的文件或提交更新。
- 优势：
	- 每个人都可以一定程度上了解项目的进度
	- 管理员可以轻松掌握每个开发者的权限，并管理一个集中化的版本控制系统
- 缺点：
	- 中央服务器的单点故障

2. 分布式版本控制系统
- 去中心化，所有客户端都保存完整的代码仓库内容。
- 可指定若干不同的远端代码仓库后，可在同一个项目中于不同工作小组的人相互协作
- 分布式的版本控制系统在管理项目时，存放的不是项目版本与版本之间的差异，而是索引。
	- 集中化版本控制系统存储项目内容
	- 而分布式版本控制系统采用极致的压缩算法和解压算法，存储索引
	- 索引所占磁盘空间很少，所以每个客户端都可以放下整个项目的历史记录



## GIT 本地结构

1. 本地库
2. 暂存区
3. 工作区



## 代码托管中心

任务：



### 团队内部协作

![630bd8862a4dbc6261bbd7277222e3dc.png](resource/Git%20&%20Github/7f591e78cfbb49d5a1f1c931d438c5c7-1593184787469.png)

- 管理员创建本地库， 并推送远程库
- 开发人员克隆远程库，开发后，推送远程库（此时需要加入团队）
- 管理员拉取远程库到本地

### 跨团队协作

![93d0b21c1039357cafce63771720d96b.png](resource/Git%20&%20Github/7e1cdab2939f4fb89ac461c97593ee5d.png)


### 托管中心种类

1. 局域网：可以搭建GitLab服务器作为代码托管中心。
2. 外网环境：GitHub/Gitee



## Git 命令

初始化本地仓库
- git init

提交代码
- git add
	- git add .
	- git add --all
- git commit -m "comments"

查看状态
- git status

- git log:
	- 使用Key-values进行版本历史记录管理
	- key: log_id
	- values: 版本内容
- git log --pretty=online
- git log --oneline
- git reflog
	- 查看历史版本
	- 并显示当前指针退回历史版本时，需要回退的步数
- git reset --hard version_id
	- `hard`: 本地库指针移动，并同步更新暂存区，工作区
	- `mixed`: 本地库指针移动，并同步更新暂存区，但是工作区不动
	- `soft`: 本地库指针移动，暂存区和工作区都不动

![d358c1dbd3b072fdfe90fddd9ff9d7f7.png](resource/Git%20&%20Github/90da1ef7e4a04b2eb072f5ba1220a116.png)


- git diff [file]
	- 比较暂存区和工作区的所有内容差异：可添加文件限定
	- Git 按照行为单位进行数据管理：即会删除一行，增加一行
- git diff HEAD(version_id) [file]
	- 比较暂存区和本地库的所有内容差异：可添加文件限定



## 分支

命令：
查看分支
- gir branch -v

创建新分支
- git branch hot_fix

切换分支：
- git checkout hot_fix

合并分支
- 切换为主分支
- git merge
- 分支名称显示 **(master|MERGING)**
- 冲突解决后，需要再次提交修改后的内容



# 团队内部协作

## Github
- 邮箱注册时，163邮箱有可能接受不到注册信息。

### 关联本地库
```
# 查看别名
git remote -v

# 设置别名：origin。
# 别名可以随意根据需求设置
git remote add origin https://github.com/abookwrom-site/xxxx.git

# 查看远程仓库
git remote -v

# 推送本地仓库
git push origin master
```
- `git remote -v`查看远程仓库
	- `fetch`: 可从远程仓库拉取数据
	- `push`: 可从本地仓库推送数据
- `git push origin master`推送本地仓库
	- `origin`: 别名
	- `master`: 需要推送的分支


### 克隆远程库
```
# 克隆远程库
git clone https://github.com/abookwrom-site/xxxx.git
```
- 克隆之后，已经自动设置好了远程仓库别名`origin`

### 远程提交操作

Windows 凭据：
- 单台电脑拥有Win 凭据，会跳过团队提交申请。

![69e66c1d6bf20e781e210545e14d2484.png](resource/Git%20&%20Github/1f83b40a1f524609af5c0a42452a38d6.png)

加入团队：
- 必须加入团队后才可以提交仓库
- 邀请人：`Settings` ---> `Manager access` ---> `Invite a collaborator` ---> 生成邀请链接 to 被邀请人
- 被邀请人：访问邀请链接，接收邀请即可。

推送本地库

### 拉取操作

1. 分 fetch + merge 两步操作

```shell
# 抓取远程库内容
git fetch origin master

# 查看远程库内容
git checkout origin/master

# 切换本地分支
git checkout master

# 合并本地内容
git merge origin/master
```
- 抓取操作后，仅仅只是将远程库下载到本地，而工作区的内容并不会更新。


2. 直接利用pull操作
```
git pull origin master
```
- 此处，所有内容都会更新到远程操作内容

3. 两种操作比较：
- `fetch + merge`: 慎重起见
- `pull`:简单方便

### 冲突解决

在远程库发生冲突的时候，必须先拉取`pull`修改冲突，之后再推送到远程服务器。
- 在解决冲突后的本地提交，不能加文件名称。

# 跨团队协作

### pull requests
- 申请人：fork修改后 ---> `new pull requests` ---> 修改的详细内容
- 拥有人：查看`pull requests`
	- 留言给申请人，相互沟通
	- 查看更改：`Files changed`
	- 合并，或者拒绝



# SSH免密登录

### 生成密钥
```
cd ~

ssh-keygen -t rsa -C chenmoxxx@outlook.com
```
- 邮箱为Github注册邮箱

### 关联Gihub账户密钥

1. 复制生成的密钥：`~/.ssh/id_rad.pub`文件内容
2. 登录账户，并增加`New SSHkey`: `Settings` ---> `SSH and GPG keys` ---> `New SSHkey`
3. 新增即可。

### 免密推送

```
# 添加别名
git remote add origin_name https://github.com/abookworm-site/xxxx.git

# 查看别名
git remote -v

# 提交到主
git push origin_name master

# 提交到远程新分支
git push origin_name master:branch_name
```



# IDEA 集成 GIT

1. IDEA 集成 Git：
- `Settings` ---> `Version Control` ---> `Git`
- `Path to Git executable`: `c:\Program Files\Git\cmd\git.exe`

2. 初始化本地库
- `VCS` ---> `Import into Version Control` ---> `Create Git Repository...`

3. 提交更改到本地库
- 右击文件 ---> `Git` ---> `Add`
- 右击文件 ---> `Git` ---> `Commit`
- 其他操作

4. 推送到远程库
- `Git` ---> `Repository` ---> `Push` ---> `Define remote`
	- `Name`: 设置别名
	- `URL`: 远程仓库地址

> 注意：开发中，一般我们先拉取远程库，再提交我们的修改代码。以避免提交失败。

5. 远程库克隆
- `File` ---> `New` ---> `Project from Version Control...`
- `Repository URL`
	- `URL`:远程仓库地址
	- `Directory`: 本地仓库路径



# 关联不相关的远程库和本地库

1. 拉取远程库，并设置不相关历史合并
```
git remote -v
git remote add origin http://github.com/abook......git

git pull origin master --allow-unrelated-histories
```
- 此时，仅仅拉取了远程仓库内容到本地
- 如果本地仓库和远程仓库有冲突内容，需要解决冲突

2. 推送拉取后的本地库到远程库master
```
git push -u origin master -f
```



# 如何尽量避免冲突

1. 团队开发中，避免在一个文件中修改代码
2. 在修改文件时，先Pull操作， 再Push操作