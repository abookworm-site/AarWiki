## Why Wiki？

自大二之后，对于知识的吸收变成一种渴望。像会发作的瘾一般，能够将自己从现实世界抽离出来。

后来，学习地多了，脑子也混乱了。于是便开始整理所学。笔记也就渐渐多了起来。

麦库笔记开始，到OneNote, 再到印象笔记。但是，总会在笔记数量达到一定程度之后便变得混乱起来。同时，**收藏瘾** 也会慢慢袭来。从而导致整个笔记体系更加浑浊。

再后，慢慢接触到了 **搜索意识**。也算缓解了一部分执著。

然而对于系统性作品，总会觉得不太过瘾。感觉会有太多的勾连，就像世界浩瀚到无穷边界。

... ...

故此，尝试使用 **wiki记录系统性总结**。



## Content | 目录结构

### 100 Workspace

- [Workspace WorkFlow](100 Workspace\index.md)



### 250 Working Coding

- [操作系统底层](250 Working Coding\操作系统底层\Java 程序员掌握的系统底层知识.md)

- [数据库操作与配置](250 Working Coding\数据库操作与配置\index.md)

- [Git & Github 代码管理](250 Working Coding\Git & Github 代码管理\Git & Github.md)

- [Docker 与 K8s 容器技术](250 Working Coding\Docker & K8s 容器技术\index.md)

- [环境安装与配置](250 Working Coding\环境安装与配置\index.md)






```markdown
100 WorkSpace

200 Working Business 积极主动要事第一

210 Working Project 以始为终双赢思维

220 Working Professionalism 专业技能

230 Working Excellence 追求卓越

240 Working Framework 统合综效

250 Working Coding 策码奔腾

- 操作系统底层
- 数据库操作与配置
- Git & Github 代码管理
- Docker & K8s 容器技术
- 环境安装与配置

250 Working Coding C

- 语言基础

250 Working Coding Java

- 数据结构与算法

- 语言基础：JavaSE
- Spring

250 Working Coding Python
- Basics
- Django
- Flask

310 Learning English 万物有灵

410 Loving Reading 天地立心

420 Loving Writing 提笔安神

500 Living Life 人活于世
```

- 目前，Wiki 目录暂时摘录笔记管理体系中的部分，后续再行更新。因此，此目录结构仅作参考，未来得及更新部分，请以实际文章为准。
- `250 Working Coding C`/`250 Working Coding Java`/`250 Working Coding Python` 三个主分支仅作个自技术分类使用。即 **251分支及其后续分支** 始终归于`250 Working Coding`主分支所有。



## Wiki Edit | 文章编辑

所有文章均采用 `Markdown` 格式进行编写排版，采用 `Mkdocs` 进行最终页面渲染部署。

### Aaron风格

#### 补充说明

表格，公式，程序等后续直接排版项目为上述表格/公式/程序等的补充说明。

示例1：

| 表格项目1     | 表格项目2     | ...  | 表格项目N     |
| ------------- | ------------- | ---- | ------------- |
| 我是表格数据1 | 我是表格数据2 | ...  | 我是表格数据N |

- 我是上述表格补充说明



示例2：

```mark
我是程序
```

- 我是程序补充说明



#### 参考说明

文章撰写离不开诸多的参考文章，同时，诸多的参考文章也提供更加详尽的内容补充。因此为了查阅方便，Aaron所有说明均采用表格形式进行链接，同时附加个人的 **参考说明标签** 如下：

- `HomePage`: 采用官方主页参考
- `Tutorial`: 相关教程
- `Framework`: 文章结构框架
- `Theme` : 采用的主题样式
- `Reference`: 参考资料

> 后续持续补充...



示例：

| 序号 | 参考                                                         | 说明                     |
| ---- | ------------------------------------------------------------ | ------------------------ |
| 1    | [Mkdocs](https://www.mkdocs.org)                             | `HomePage`, `Tutorial`   |
| 2    | [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) | `HomePage`，`Theme`      |
| 3    | [基于 mkdocs-material 搭建个人静态博客](https://cyent.github.io/markdown-with-mkdocs-material/) | `Tutorial`               |
| 4    | [Noodlefighter's Wiki](https://wiki.noodlefighter.com)       | `Reference`, `Framework` |
| 5    | [叶子坑](https://flc.io)                                     | `Reference`              |



### 特别注意

#### 加粗功能

文章采用 `Mkdocs` 进行部署发布时，加粗功能会因为编辑的原因导致最终显示失效。 **因此，务必在 Markdown 的加粗要求下，前后再各自加上一个空格分隔**。导致的效果区别如下：

| 推荐or   | 编辑差别           | 排版                             | `Typora` 效果                 | `Mkdocs` 效果                  |
| -------- | ------------------ | -------------------------------- | ----------------------------- | ------------------------------ |
| 不推荐   | 未加空格           | `使用**wiki记录系统性总结**。`   | 使用 **wiki记录系统性总结**。 | 使用**wiki记录系统性总结**。   |
| 一般推荐 | 前后全部添加空格   | `使用 **wiki记录系统性总结** 。` | 使用 **wiki记录系统性总结**。 | 使用 **wiki记录系统性总结** 。 |
| 特别推荐 | 添加空格，连接标点 | `使用 **wiki记录系统性总结**。`  | 使用 **wiki记录系统性总结**。 | 使用 **wiki记录系统性总结**。  |

- 除去空格外，其他标点符号具备同样的功效。



## File Storage|文件存储

### Wiki文章存储

**Wiki** 使用`Mkdocs`进行搭建，存储平台为Github，仓库地址为：https://github.com/abookworm-site/WikiPage

故此，所有文章均位于项目的 `wiki` 文件夹 内。



### 资源文件存储

Wiki文章中包含的许多资源文件，特别是图片文件，都依照Markdown文件资源链接规则进行链接。此处，由于一般采用Typora编辑文章，所以采用如下的 `Typora settings`。

```bash
./_resource/${filename}
```

- `${filename}`： 文件名称



同时，请注意：`Mkdocs` 文章部署不保障服务器绝对路径，因此务必使用 **相对路径存放**。当然，也可以使用 **图库** 进行存储。



### 直链文件存储

**Wiki** 中有部分源文件提供便捷的直链下载链接。该部分主要是一些零散的小程序源文件。因此，如果文章没有特别说明，那么默认使用的直链下载存储为 **永硕E盘**。当然，这就有可能会进行不定期不一致更新。因此，若链接失效，可自行到我的共享空间查看：[壹书呆的共享空间](http://abookworm.ys168.com/)



## Copyright Statement | 版权说明

由于此 **Wiki** 重点在于Aaron个人的系列总结。同时，也由于Aaron个人经历所限，目前对于版权方面并未多加考虑。采取互联网默认的版权协议。

对于Aaron参考的文章。则基本遵循以下原则：

- 若文章采取二次创作，则一定尊重原作者，链接参考原文。见 `Reference`
- 若文章附有参考，则尽量尊重原作者，链接参考原文。见 `Reference`
- 若文章为教程笔记，则尽量尊重原作者，链接参考教程。见 `Reference`



## Reference

| 序号 | 参考 | 说明                                                         |
| ---- | ---- | ------------------------------------------------------------ |
| 1    |[Mkdocs](https://www.mkdocs.org)      | `HomePage` |
| 2 |[Noodlefighter's Wiki](https://wiki.noodlefighter.com) | `Homepage`, `Framework` |



> 持续更新...