# Shell 运行Python代码

Shell运行Python代码

1. 文件表头
```python
#!/usr/bin/python3
# coding=utf-8
```
- 首先需要确认python3路径：`whereis python3` or `which python3`
	- `whereis` 命令会列出所有python3相关的文件版本：
	- `which`仅仅获取 `python3` 文件路径

2. 运行方式：
- `python3 filename.py`
- `./filename.py`
	- 此种方式需要添加文件的执行权限：`chmod +x filename.py`