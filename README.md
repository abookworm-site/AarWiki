# Abookworm's Wiki
Here is for my wiki page: [wiki.abookworm.site](https://wiki.abookworm.site)

这里是本 Wiki 的仓库地址：https://github.com/abookworm-site/AarWiki

## Content | 目录



```markdown
# Site info.
site_name: Abookworm's Wiki
site_author: Aaron Loong
site_url: https://wiki.abookworm.site

# Repository
repo_name: abookworm-site/AarWiki
repo_url: https://github.com/abookworm-site/AarWiki

# Files info
.
├── .git
├── .gitignore
├── README.md			# repo README
├── CNAME			# 修改自定义域名
├── mkdocs.yml			# mkdocs config
├── .travis.yml			# Travis config, which is for auto deploy
└── wiki			# Content of abookworm's wiki

```

- 持续更新中...



## Build | 构建

本 Wiki 使用 `Mkdocs` 搭建，利用 `Travis` 自动提交更新，利用利用 `github` 的 page 服务部署网页。有兴趣的可以自行构建。

这里是完整教程：[GitHub + Travis + Mkdocs 搭建文档库](https://learnku.com/articles/32279)



## Working | 运行

```bash
# 本地调试用：http://127.0.0.1:8000
$ mkdocs serve

# 提交Github后，进行服务器运行
$ mkdocs build --clean

$ mkdocs gh-deploy --clean --force
```

- `mkdocs serve` ：调试时，对于连接的跳转仅仅只能以当前目录上下各一级跳转。想要远程跳转需要采用 **设置域名链接** 跳转。
- `mkdocs gh-deploy`：每次强制进行部署后，若有设置自定义域名，那么需要再去 github 进行设置。



## Updating Content

### Ongoing List

- 每次都需要手工强制部署



### To-do List

- 自动构建目录

    

### zDone List

- Building
- 



## Reference

| 序号 | 参考                                                         | 说明                    |
| ---- | ------------------------------------------------------------ | ----------------------- |
| 1    | [Mkdocs](https://www.mkdocs.org)                             | `HomePage`， `Tutorial` |
| 2    | [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) | `HomePage`，`Theme`     |
| 3    | [基于 mkdocs-material 搭建个人静态博客](https://cyent.github.io/markdown-with-mkdocs-material/) | `Tutorial`              |
| 4    | [Noodlefighter's Wiki](https://wiki.noodlefighter.com)       | `Reference`             |
| 5    | [叶子坑](https://flc.io)                                     | `Reference`             |