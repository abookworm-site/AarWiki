# 快速构建 Markdown 文件操作教程

## 需求



> 需求伪不伪，没关系。主要是练习了Coding.



快速构建 Markdown 文件操作教程：

- 主要是写教程太繁琐了，还要大量贴图～
- 所以，操作的时候，有意截图操作。而后，整理而已啦～



## 用途

1. 写截图教程



## 实现

```python
#!usr/bin/python
# coding:utf-8

import os
import sys


def mkdir(path):
    """
    Function: 创建图片资源文件夹
    @Pram path: 文件夹路径
    Return: None
    """
    # 判断文件夹是否存在
    folder = os.path.exists(path)

    if not folder:
        # 调用系统模块创建文件夹
        os.makedirs(path)
        print("The folder is created now!")

    else:
        print("The folder had been created!")

    return None


def test_mkdir():
    """
    测试函数
    """
    folder = "%s/_resource" % sys.path[0]
    mkdir(folder)

    return None


def pre_content_procedure(filelist):
    """
    Function: 构建基本文本 - 程序文件
    """
    file_content = """# xxxx 安装教程 on Win10

## Preface

1. 本教程为个人总结笔记，原则上仅用于自我二次查询使用。
2. 本教程仅对重要步骤配图及说明，未说明的步骤请选择默认判断 **下一步** 即可。
3. 若您有缘参考本教程，那么希望您对于本教程有任何不同意见，欢迎同笔者交流。
4. 由于诸多因素，并不能保证对于步骤设置的百分白准确实用，读者请自行判断，同时笔者也会更新不当之处。



## Configuration

1. OS :  **Win10**
2. Platform：**Win10**
3. xxxx version:  **xxxx**


## Operating Procedure

"""
    # print(file_content)

    with open(filelist, "w") as f:
        f.write(file_content)

    return None


def mk_markdown_regular():
    """
    Function: 创建Markdown 图片语法规则的文本
    Return: None
    """
    # 获取此文件所在文件夹的路径
    filepath = sys.path[0]
    # print("Filepath: ", filepath)

    # 创建图片资源文件夹
    folder = "%s/_resource" % filepath
    mkdir(folder)

    # 构建文件路径
    filelist = "%s/Operation Procedure.md" % filepath
    # print("Filelist: ", filelist)

    # 创建基本文件
    pre_content_procedure(filelist)

    # 遍历打印当前路径下的文件，并按照 Markdown 格式输出
    for filenames in os.listdir(filepath):

        fname = filenames[:-4]
        fpath = filenames

        with open(filelist, "a") as f:
            
            # f.write(filenames[:-4])
            f.write(fname)
            f.write("\n")
            # f.write(": ![%s](%s)" % (filenames[:-4], filenames))
            f.write("![%s](./_resource/%s)" % (fname, fpath))
            f.write("\n" * 4)


if __name__ == "__main__":
    mk_markdown_regular()
    print("Construction Completed!")

```



## 用法

1， 复制该文件到目标文件夹。

2，运行程序，结果输出：`Construction Completed!`， 并在本地文件夹中得到文件`Operation Procedure.md`

3，复制文件图片到资源文件夹 `./_resource` 即可。



## 其他

1. 该文件重复执行将会在上次执行之后，追加内容。
2. 该程序为添加文件后缀判断。