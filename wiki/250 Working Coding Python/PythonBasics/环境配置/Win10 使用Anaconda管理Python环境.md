# Win10 使用 Anaconda 管理 Python 环境（包括原有的 python）


## Anaconda 环境变量

下载 Anaconda 安装包安装后，务必到系统环境变量配置里面确认：`PATH` 中已经添加如下三个目录：

```
c:\program\anaconda3;
c:\program\anaconda3\Scripts;
c:\program\anaconda3\Library\bin

```



## 安装 Anaconda 之前已安装 python

如果在安装 Anaconda 之前已经安装 python，要使用 anaconda 管理之前安装的 python 版本，需要：  

1. 需要把 python 的安装目录全部拷贝到 anaconda 安装目录下的 envs\\目录下面即可。  
	- 如在安装 anaconda 之前安装了 python 3.7，直接将 python 3.7 的整个目录拷贝到 anaconda3 的 envs 目录下面，D:\\program\\anaconda3\\envs\\Python37  

2. 删除 `PATH` 环境变量里面配置的 python 目录

3. 如此，便可通过 anaconda 管理之前安装的 python 环境



## Conda 命令管理 python 环境

以下命令如果添加 `-n` 参加，表示指定某套环境，如果没有，就是当前环境

```bash

# 查看已经安装的环境
conda info -e

# 创建环境
conda create --name env_name python=3.7

# 激活环境 env_name
activate env_name

# 退出当前环境，env_name --> base --> shell
deactivate

# 删除某个环境
conda remove --name env_name --all

# 查看当前环境下已安装的包, 默认所有包
conda list
 
# 查看某个环境已安装的包
conda list -n env_name

# 安装package
conda install -n env_name package_name
conda install --channel https://conda.anaconda.org/anaconda tensorflow=1.8.0

# 更新package  
conda update package_name

# 更新 env_name 环境的python版本为最新版
conda update -n env_name python

# 卸载package
conda uninstall package_name
```

## Conda 镜像设置

由于 anaconda 的镜像在国外，所以访问会较慢，我们可以手动将镜像设置成清华 TUNA 镜像源

```cmd
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes

```

- “conda config --set show_channel_urls yes” 表示设置搜索时显示通道地址  。
- 设置完成后，就是在用户目录下生成. condarc 文件，内容如下：

```
channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
  - defaults
show_channel_urls: true

```

## Reference
1. [windows系统Anaconda管理python环境（包括原有的python）](https://blog.csdn.net/xuemeilu/article/details/84571055)
