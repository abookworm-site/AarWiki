## Why Wiki？

自大二变故之后，对于知识的吸收变成一种渴望。像会发作的瘾一般，能够将自己从现实世界抽离出来。

后来，学习地多了，脑子也混乱了。于是便开始整理所学。笔记也就渐渐多了起来。

麦库笔记开始，到OneNote, 再到印象笔记。但是，总会在笔记数量达到一定程度之后便变得混乱起来。同时，**收藏瘾**也会慢慢袭来。从而导致整个笔记体系更加浑浊。

再后，慢慢接触到了**搜索意识**。也算缓解了一部分执著。

然而对于系统性作品，总会觉得不太过瘾。感觉会有太多的勾连，就像世界浩瀚到无穷边界。

... ...

故此，尝试使用**wiki记录系统性总结**。



## Content | 目录结构


```python
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

- 语言基础 - JavaSE
- Spring

250 Working Coding Python

- Django
- Flask

310 Learning English 万物有灵

410 Loving Reading 天地立心

420 Loving Writing 提笔安神

500 Living Life 人活于世
```

- 目前，Wiki 目录暂时摘录笔记管理体系中的部分，后续再行更新。
- 此目录结构仅作参考，未来得及更新部分，请以实际文章为准。



## 存放位置

主文件存放位置：

wiki 使用`Mkdocs`进行搭建，故此，所有文章均位于 `wiki` 文件夹 内。



文章资源文件存放位置：

由于一般采用Typora编辑文章，所以采用 `Typora settings`

```bash
./_resource/${filename}
```

- `Mkdocs` 文章部署不保障服务器绝对路径，因此使用相对路径进行存放。当然，也可以使用图库进行存储。
- `${filename}`： 文件名称



## Reference

1. [Mkdocs](https://www.mkdocs.org)

