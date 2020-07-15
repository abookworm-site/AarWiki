# coding:utf-8
import os
import sys


def get_filelist():
    # 获取当前执行行的路径： C:\Users\Aaron
    # filepath = os.getcwd()
    # filepath = os.path.abspath(".")

    # 获取此文件的完整路径：d:/Aaron/Downloads/Python 核心技术与实战/1-8/pdf/Get_file_name.py
    # filepath = sys.argv[0]

    # 获取此文件所在文件夹的路径： d:\Aaron\Downloads\Python 核心技术与实战\1-8\pdf
    filepath = sys.path[0]
    # print(filepath)

    # 构建文件路径
    filelist = "%s/filelist.txt" % filepath
    # print(filelist)

    # 遍历打印当前路径下的文件
    for filenames in os.listdir(filepath):
        # print(filename)
        with open(filelist, "a") as f:
            f.write(filenames)
            f.write("\n")


if __name__ == "__main__":
    get_filelist()
    print("Well Done!")