# Virtualenv 系统隔离环境配置及其使用

## 一、`virtualenv` 系统隔离环境配置

1. Install `virtualenv` && `virtualenvwrapper`
```bash
sudo pip3 install virtualenv
sudo pip3 install virtualenvwrapper
```

2. Check the file location of `virtualenvwrapper` whether on the `/usr/local/bin/`.
```bash
which virtualenvwrapper.sh

# Review the location of python
whereis python
```

3. 配置环境变量: `vi ~/.bashrc (bash)`
```bash
# 在文件末，增加以下代码
export WORKON_HOME=$HOME/.virtualenvs  #设置virtualenv的统一管理目录
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.6 #指定python解释器
source /usr/local/bin/virtualenvwrapper.sh  #执行virtualenvwrapper安装脚本
读取文件，使得生效，此时已经可以使用virtalenvwrapper
```

4. 使配置文件生效: `bash ~/.bashrc`

5. 配置成功，即可使用。



## 二、`virtualenv` 使用

```bash
# 新建虚拟环境
# create a virtual environment named flask3.6
# -p : python environment
mkvirtualenv -p /usr/bin/python3.6 flask3.6

# 查看虚拟环境
lsvirtualenv

# 进入虚拟环境
workon env1

# 退出虚拟环境
deactivate
```



## Reference

https://juejin.im/post/5be1104fe51d4572e33a7145

https://blog.csdn.net/mbl114/article/details/78089741
