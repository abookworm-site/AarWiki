# 前端页面 - HTML

## 1.  HTML简介

概述:

- HTML（Heyper Text MarkUp Language）超文本标记语言，它是世界上最简单的语言，在开发的时候我们只需要进行页面布局（利用标签:element）

- 超文本标记语言（HTML）又称之为web(开发)，它诞生(1993~2019)这门语言大大小小经历过变化有五次，最近一次2014称之为HTML5（超文本标记语言第五次重大变化）。



## 2.  开发工具

- Sublime [http://www.sublimetext.com/](http://www.sublimetext.com/)
- VS code [https://code.visualstudio.com/](https://code.visualstudio.com/)
- Webstorm [http://www.jetbrains.com/webstorm/](http://www.jetbrains.com/webstorm/)



## 3.  体验HTML编程

体验心得：

- HTML标记语言开发的程序的时候，利用就是标签（element）进行布局页面。

标签组成如下：   

```
<标签名字> 文本内容 </标签名字>
```

-   开始标签 + 结束标签（闭合标签）

-   中间： 文本内容（text）



## 4. 标签学习（element）

概述：

- HTML（超文本标记语言）页面（静态页面）由标签组成，最重要一部分就是块元素

- 明显特征：独占一行



### 4.1 块元素

#### 4.1.1 静态页面骨架

快捷键：**shift + ！+ tab**

```html
<!DOCTYPE html> // 这是超文本标记语言第五次重大变化文档声明方式
<html lang="en">
<head>

	<meta charset="UTF-8" /> // chartset:设置字符集 UTF-8（简称万国编码）
	<title>Document</title>

</head>
<body>
    
</body>
</html>
```

- `<html> xxx </html>` 标签是整个网页根元素（进行页面布局的其他元素：都是嵌套在HTML标签里面作为子元素）

- `<html lang = "en">`: `lang`是一个属性，属性值为 `en` (这里表示英文的简写：代表的是英文下开发)




#### 4.1.2 常用标签 -- 块元素

概述：

- web开发中非常常用
- 块(block)元素是独占一行
- 在页面中是由上到下进行排列。
- 常用块元素有很多：``h1` -`h6`、`div`、`p`、`ul`、`li`.....

> 注意：在书写学习这些标签（块元素），一定要注意在body标签内部进行书写.

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>我是人生当中第一12ABC个静态页面</title>
</head>

<body>

	<p>我也是一个块元素--独占一行(一个段落)</p>
	<p>我也是一个块元素--独占一行(一个段落)</p>
	<p>我也是一个块元素--独占一行(一个段落)</p>
	<p>我也是一个块元素--独占一行(一个段落)</p>
	<p>我也是一个块元素--独占一行(一个段落)</p>

	<h1>我代表的是网页中一级标题</h1>
	<h2>我代表的是网页中二级标题</h2>
	<h3>我代表的是网页中三级标题</h3>
	<h4>我代表的是网页中四级标题</h4>
	<h5>我代表的是网页中五级标题</h5>
	<h6>我代表的是网页中六级级标题</h6>

<h1>我有事一级标题</h1>
<h1>我有事一级标题</h1>

	<div>我也是一个块元素-----经常会用到（布局用到）</div>

	<div>
		<h3>我是三级标题---作为div子元素</h3>
	</div>

</body>
</html>
```

-  h1~h6：一级标题~六级标题（字体越来越小）

-  标签可以复用（多次使用）、可以嵌套使用

> 标签小技巧：打出标签名（`ctr + E`）标签自动补齐；



#### 4.1.3 常用块元素 -- 列表系列

概述：列表（也是块元素）有两个：无序列表ul 、有序列表ol，这两个块元素用来显示列表，

而且li标签经常作为他们子元素一起使用；	


```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>

<body>

	<!-- 无序列表 -->
	<ul>
		<li>吃饭</li>
		<li>睡觉</li>
		<li>打豆豆</li>
	</ul>
	<!-- 有序列表 -->
	<ol>
		<li>学习</li>
		<li>喝酒</li>
		<li>烫头</li>
	</ol>

</body>
</html>
```

总结：

- h1~h6(不同级别标题)
- div(盒子标签) 
- p(段落)

- ul（无序列表） 
- ol(有序列表) 
- 他们两者经常结合li元素一起使用



### 4.2 行内元素

概述:

- 前端开发当中行内元素（内联元素）：常见的行内元素有如下几个：



行内元素特征：

- 不是独占一行，从左到右进行排列
- `span`、`img`、`a`、`alt`

> 注意：在web领域中标签（双闭合标签）、单闭合标签

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>

	<a href="http://www.sina.com">新浪</a>
	<a href="http://www.taobao.com">淘宝</a>
	<a href="http://www.baidu.com">百度</a>

	<span>我也是行内元素</span>
	<span>我也是行内元素span</span>

	<img src="xiaomao.jpg" alt="默认文字">

</body>
</html>
```

-   `a标签href属性`：设置超链接的地址属性
-   `img标签src属性`：设置显示图片路径的（图片名称） 图片没有情况下默认显示文字



案例：百度地图静态页面调用

```
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>

<body>
	<!-- address:块元素独占一行 -->

	<address>

		<iframe width="204" height="613" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://j.map.baidu.com/s/5BcIFb">			</iframe>

	</address>

</body>
</html>
```

- 调用 [百度地图开放平台](https://lbsyun.baidu.com/) , 创建地图生成器
- 直接复制到 `<address>` 标签即可



### 4.3 表单元素

概述：

- 前端中的重要标签
- 表单元素经常用来收集用户输入信息，将用户输入信息提交给服务器。

- 表单元素即为input标签（单闭合标签），这个标签经常集合form标签一起使用。

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Document</title>
</head>

<body>

	<form>

		<!-- 表单元素即为input标签 -->
		<p>
			用户名: <input type="text" />
		</p>

		<p>
			密&nbsp;&nbsp;码: <input type="password" />
		</p>

		<p>
			日历:<input type="date" />
		</p>
		
		<p>
			你喜欢的颜色: <input type="color" />
		</p>
		
		<p>
			你的身高: <input type="range" >
		</p>
		
		<p>
			你喜欢的食物
			<input type="checkbox" />烤鸭
			<input type="checkbox" />烤鸭
			<input type="checkbox" />烤鸭
			<input type="checkbox" />烤鸭
			<input type="checkbox" />烤鸭
		</p>
		
		<p>
		
			你喜欢那个国家？
		
			<input type="radio" name="A"/>中国
			<input type="radio" name="A"/>韩国
			<input type="radio" name="A"/>日本
			<input type="radio" name="A"/>美国
		
		</p>
		
		<p>
			<input type="submit" />
		</p>
	</form>

</body>
</html>
```



## 5. 小复习

问题：What is HTML？

- 答:HTML[HyperText MarkUp langage]即为超文本标记语言，它是世界上最简单的编程，利用标签完成页面中布局。

问题：块元素

- 答：块元素在网页中独占一行【一般从上到下进行排列】
- `h1~h6、div、p、ul、ol、li、address`等等


问题：行内元素

- span、a、img、表单元素：输入框、单选按钮、复选按钮、提交按钮等等



## 6. 音频标签

概述：

- 网页中显示音频可以利用`audio`标签显示音频。
- Web领域中音频audio标签，只能播放mp3、ogg、wav三种音频格式。（行内元素）



MP3:音频格式

- MP3是一种音频压缩技术，其全称是动态影像专家压缩标准音频层面3（Moving Picture Experts Group Audio Layer III），简称为MP3。它被设计用来大幅度地降低音频数据量。利用 MPEG Audio Layer 3 的技术，将音乐以1:10 甚至 1:12 的压缩率，压缩成容量较小的文件，而对于大多数用户来说重放的音质与最初的不压缩音频相比没有明显的下降。它是在1991年由位于德国埃尔朗根的研究组织Fraunhofer-Gesellschaft的一组工程师发明和标准化的。用MP3形式存储的音乐就叫作MP3音乐，能播放MP3音乐的机器就叫作MP3播放器。

Ogg:音频格式

- Ogg全称是OGGVobis(oggVorbis)是一种音频压缩格式，类似于MP3等的音乐格式。Ogg是完全免费、开放和没有专利限制的。OggVorbis文件的扩展名是".ogg"。Ogg文件格式可以不断地进行大小和音质的改良，而不影响旧有的编码器或播放器。

wav:音频格式

- WAV是最常见的声音文件格式之一，是微软公司专门为Windows开发的一种标准数字音频文件，该文件能记录各种单声道或立体声的声音信息，并能保证声音不失真。但WAV文件有一个致命的缺点，就是它所占用的磁盘空间太大（每分钟的音乐大约需要12兆磁盘空间）。它符合资源互换文件格式（RIFF）规范，用于保存Windows平台的音频信息资源，被Windows平台及其应用程序所广泛支持。Wave格式支持MSADPCM、CCITT A律、CCITT μ律和其他压缩算法，支持多种音频位数、采样频率和声道，是PC机上最为流行的声音文件格式；但其文件尺寸较大，多用于存储简短的声音片段。



```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>

<body>

	<h1>下面兄弟就是音频</h1>
	<audio src="1.mp3" controls></audio>
	<audio src="1.mp3" controls autoplay muted loop></audio>

</body>
</html>
```

-   利用audio标签播放音频（mp3、ogg、wav）
-   视频利用的是video标签(用法和上面音频几乎一模一样的)


| 属性标签 | 含义                 |
| -------- | -------------------- |
| src      | 设置音频播放路径     |
| controls | 显示默认控制条       |
| autoplay | 自动播放（兼容问题） |
| muted    | 静音                 |
| loop     | 循环播放             |


> 注意：video视频标签也是支持三种格式：mp4、ogg、webm

mp4:

MP4是一套用于音频、视频信息的压缩编码标准，由国际标准化组织（ISO）和国际电工委员会（IEC）下属的"动态图像专家组"（Moving Picture Experts Group，即MPEG）制定，第一版在1998年10月通过，第二版在1999年12月通过。MPEG-4格式的主要用途在于网上流、光盘、语音发送（视频电话），以及电视广播。

WebM：

webM由Google提出，是一个开放、免费的媒体文件格式。WebM 影片格式其实是以 Matroska（即 MKV）容器格式为基础开发的新容器格式，里面包括了VP8影片轨和 Ogg Vorbis 音轨，其中Google将其拥有的VP8视频编码技术以类似BSD授权开源，Ogg Vorbis 本来就是开放格式。 WebM标准的网络视频更加偏向于开源并且是基于HTML5标准的，WebM 项目旨在为对每个人都开放的网络开发高质量、开放的视频格式，其重点是解决视频服务这一核心的网络用户体验。Google 说 WebM 的格式相当有效率，应该可以在 netbook、tablet、手持式装置等上面顺畅地使用。



## Reference

### 学习手册

- [https://www.w3school.com.cn/html/index.asp](https://www.w3school.com.cn/html/index.asp)
- [https://www.runoob.com/](https://www.runoob.com/) 

