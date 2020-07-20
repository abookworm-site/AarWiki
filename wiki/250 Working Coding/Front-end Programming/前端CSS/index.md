# 前端样式 - CSS

## 1. CSS样式

概述：

- CSS【Cascading Style Sheets】全称层叠样式表。

理解：

- 可以把HTML文件想向成是一个房子骨架，里面标签（块元素、行内元素）理解为搭建房子转，

CSS负责美化房子（进行装修）,让你的静态页面（网站看的相对好看一些）



### 1.1 体验样式

概述：下面是我们体验知识点。

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>

<!-- 样式一般是需要放在style标签里面 -->

<style type="text/css">

	div{

		color:green;
		
		font-size:30px;
		
		background-color:red;

		text-align:center;

		border:5px solid black;

		opacity:.5;
	}

</style>

</head>

<body>

	<div>我是祖国的老花骨朵</div>

</body>
</html>
```



### 1.2 标签选择器

概述：

- 样式【CSS】用来美观标签（页面）
- web领域样式分为三种（今天只是关注内部样式）。
    - 外部样式
    - 内部样式： 书写在head中，利用子元素双闭合标签 `style` 标签完成。
    - 行内样式



语法格式：

```html
<style type="text/css">

	标签名字{
		属性:属性值;
		属性：属性值;
		属性：属性值;
	}
    
</style>
```


```html
<!DOCTYPE html>

<html lang="en">

<head>

	<meta charset="UTF-8" />

	<title>Document</title>

	<style type="text/css">

		h1{

			/* 文字颜色:属性值红、橙、黄、绿、青、蓝、紫色等等 */
			color:skyblue;

			/* 字体大小设置 */
			font-size:16px;

			/* 背景颜色设置 */
			background-color:orange;

			/* 文本对齐方式 */
			text-align:center;

			/* 字体样式设置 */
			font-style:italic;

		}

		div{

			background-color:red;

			font-size:28px;

			color:cyan;

			text-align:center;

			font-style:italic;

			/* 透明度设置：透明度属性值范围0~1 */
			opacity:1;

			/* 光标防止标签中:变为小手; */
			cursor:pointer;

		}

</style>
    
</head>
<body>

	<h1>我是一级标题</h1>
	<h1>我是小明呀</h1>
	<div>我是常用布局标签</div>

</body>
</html>
```

-   标签选择器：常用样式中选择匹配标签

| 属性                              | 属性值                                         |
| --------------------------------- | ---------------------------------------------- |
| color【设置标签文字颜色】         | red、orange、yellow、green、cyan、blue、purple |
| font-size【标签文字大小尺寸设置】 | Numberpx (数字最小12~)                         |
| background-color【背景颜色设置】  | red、orange、yellow、green、cyan、blue、purple |
| text-align【文本对齐方式】        | left、center、right                            |
| font-style[字体样式]              | italic                                         |
| Opacity【透明度设置】             | 0~1【0：纯透明】                               |
| cursor                            | pointer【小手】                                |



### 1.3 id选择器

命名标识符规范：

1. 可以数字、字母、下划线、美元符号

2. 但是不能以数字开头

3. 不能是这门语言当中关键字、保留字

概述:

- 除通过标签名字匹配页面中对应标签进行设置(内部样式）之外， 还可以通过id选择器匹配标签（节点:element）

> 注意：一般情况下，页面中标签id属性值唯一



ID 选择器实现：

-   在标签（开始标签）添加一个id属性，对应右侧属性值
-   在style标签里面（内部样式），`#号 + 对应节点id的属性值`

```html
<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="UTF-8" />
	<title>id选择器</title>
	<style type="text/css">

		#box{
			color:black;
			/* 文本描述 */
			text-decoration:none;
		}

	</style>

</head>
<body>

	<a href="http://www.baidu.com" id="box">百度</a>

</body>
</html>
```


```html
<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="UTF-8" />
	<title>id选择器</title>
	<style type="text/css">

		#box{
			color:black;
			/* 文本描述 */
			text-decoration:none;
		}

		#box1{
			/* 列表默认样式设置 */
			list-style:square;
		}

		#cur{
			color:cyan;
		}

        #box2{
            /* 列表默认样式设置 */
            list-style:square;
        }

</style>

</head>
<body>

    <a href="http://www.baidu.com" id="box">百度</a>

    <ul id="box1">

        <li>吃饭</li>
        <li id="cur">睡觉</li>
        <li>打豆豆</li>

    </ul>

    <ol id="box2">

        <li>unity3D</li>
        <li>cos2D</li>
        <li>PHP</li>

	</ol>

</body>
</html>
```

| 属性                        | 属性值                                  |
| --------------------------- | --------------------------------------- |
| text-decoration【文本描述】 | none、underline、overline、line-through |
| list-style                  | none、circle、square                    |



### 1.4 class选择器

概述：除了标签选择器、ID选择器、还可以使用class(类)选择器；

> 注意：ID选择器属性值一般唯一的、class属性值可以重复（不是唯一的）

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

        .current{
            font-size:30px;
            background-color:cyan;
        }

        .cur{
            color:skyblue;
            font-size:18px;
        }

    </style>

</head>

<body>

    <div class="current">我是祖国的老花骨朵,是祖国未来</div>
    <div>我也是祖国花鼓富哦</div>
    <div>我也是祖国花鼓富哦</div>
    <div class="current">我也是祖国花鼓富哦</div>
    <div>我也是祖国花鼓富哦</div>
    <div>我也是祖国花鼓富哦</div>
    <div>我也是祖国花鼓富哦</div>
    <div>今天是北京<span class="cur">2019年11月30日21:47:25</span></div>

</body>
</html>
```

- 选择器总结：
    - 标签选择器（标签名字）
    - ID选择器（#+id属性值）
    - class选择器（.+class属性值）



### 1.5 背景系列样式

背景系列属性有如下几个：

- Background-color ：背景颜色
- background-image： 背景图设置
- background-repeat：背景图重复

```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

        div{

            /*宽度和高度设置*/
            width:720px;
            height: 720px;

            /* 背景颜色 */
            background-color:red;

            /* 设置背景图 */
            background-image:url(jie.jpg);

            /* 背景重复设置 */
            background-repeat:no-repeat;

            /* 简写方式 */
            background: no-repeat url(jie.jpg) red;

        }

    </style>

</head>
<body>

    <div></div>

</body>
</html>
```

总结：

| 属性              | 属性值                  |
| ----------------- | ----------------------- |
| background-color  | 背景颜色设置（颜色）    |
| Background-image  | 背景图(图片路径)        |
| Background-repeat | 背景图重复（no-repeat） |

三者可简写：

```
background:cyan url(1.jpg) no-repeat;
```



### 1.6 外部样式

外部样式：

- 在前端web开发中，样式一般放在CSS文件夹里面，在HTML页面中通过link标签引入外部文件样式。



> 静态页面.html

```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <title>Document</title>

    <!-- 引入外部样式文件（CSS文件） -->
    <link rel="stylesheet" type="text/css" href="css/default.css">

</head>
<body>

    <div class="box">

    <p id="cur">北京昨天下大雪了,真的很美</p>

    </div>

</body>

</html>
```

- 如果想引入外部CSS文件，需要通过link标签进行引入



> default.css

```css
.box{

width:280px;

height: 280px;

background:red;

}

#cur{

font-size: 20px;

color:green;

text-align:center;

}
```



### 1.7 行内样式

概述：我们在给标签设置样式时候：可以选择器外部样式、内部样式、行内样式（对于web开发很少用）；

行内样式：直接在开始标签的地方就可以设置，通过style属性进行设置。

```html
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8" />
    <title>Document</title>

</head>

<body>

    <p style="width:600px;height:300px;font-size: 30;color: red;">最近比较热门话题是xx公司暴力裁员</p>

</body>
</html>
```

- 行内样式写法

```
<标签名字 style = "属性:属性值;属性:属性值;">正文文本</标签名字>
```



### 1.8 样式总结

Web前端开发中样式有三种：外部样式（link标签引入外部CSS文件）、内部样式、行内样式

| 样式     | 形式                                             |
| -------- | ------------------------------------------------ |
| 外部样式 | Link标签引入                                     |
| 内部样式 | <style></style>                                  |
| 行内样式 | <标签名字 style = "属性:属性值;">文本</标签名字> |

> 注意：前端开发中样式有优先级的：行内样式 => 内部样式 => 外部样式

问题：三种样式那种好?

- 外部样式相对而言在开发项目时候经常用外部样式
- 可以进行统一管理：让你的项目中样式看的更加整洁



## 2. 盒模型

概述：任意标签都有盒模型，可以让标签向外拓展。

- padding : 内边距
- border：外边框
- margin：对齐

盒模型中：padding【内边距】、border【外边框】可以让元素向外拓展。

前端盒模型包含的元素数据：margin + padding + border + width + heigh



```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

    .box{

        width:200px;
        height:200px;

        /* 外边框：可以让元素向外拓展 */
        border:5px solid red;
        padding:100px;

    }

    .box1{

        margin:10px;
        width:200px;
        height: 200px;
        background:red;

    }

    </style>

</head>
<body>

    <div class="box">文字文字</div>
    <div class="box1"></div>

</body>
</html>
```



## 3. 定位

概述：在前端web开发中所谓文档流【页面中标签排列方式】：如果想打破文档流，即让标签可以在任意地方显示，那么需要进行定位

- 块元素：从上到下排列（独占一行）

- 行内元素：从左到右排列（不独占一行）

- 定位在前端开发中三种：固定定位、相对定位、绝对定位



### 3.1 固定定位

概述：

- 给某一个标签固定在网页中某一个位置，可以利用固定定位，哪怕页面有上下滑动效果也不影响。

注意：

- 定位元素有left、top、right、bottom四个属性；

  ​    

```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

    div{
        width:400px;
        height: 200px;
    }

    body{
        height: 10000px;
    }

    .box{
        /* 固定定位：固定定位元素不占起始位置 */
        position: fixed;
        left:500px;
        top:200px;
        background:red;
    }

    .box1{
	    background:green;
    }

    .box2{
	    background:purple;
    }

    </style>

</head>
<body>

    <div class="box"></div>
    <div class="box1"></div>
    <div class="box2"></div>

</body>
</html>
```

-   定位元素才有left、top、right、bottom四个属性

-   固定定位是以网页为参照，固定在某一个位置（即使页面滑动：也是在这个位置上）

-   固定定位元素不占用起始位置



### 3.2 相对定位

概述：相对定位也可以让元素脱离文档流，元素在进行相对定位的时候，其实相对的起始位置进行偏离，

而且还需要注意：相对定位元素起始位置值占用的。


```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

    /* 清除默认样式：默认情况下有缝隙 */
    *{
        margin:0;
        padding: 0;
    }

    div{
        width:400px;
        height: 200px;
    }

    .box1{
        background:red;
    }

    .box2{

        position: relative;
        left:400px;
        top:200px;
        background:green;

    }

    .box3{
        background:purple;
    }

    </style>
</head>
<body>

    <div class="box1"></div>
    <div class="box2"></div>
    <div class="box3"></div>

</body>
</html>
```

- 相对定位元素：相对于自己起始位置

- 相对元素起始位置是占用的（别人用不了）




### 3.3 绝对定位

概述：绝对定位也可以让元素脱离标准文档流：

1. 绝对定位元素，如果**没有定位父元素**【绝对定位元素：参照页面进行偏移】

2. 绝对定位元素，如果**有定位父元素**【绝对定位元素：参照定位父元素进行偏移】

3. 绝对定位元素不占起始位置（别人可以占用起始位置）

     

参照页面进行偏移

```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

    /* 清除默认样式 */
    *{
        margin:0;
        padding: 0;
    }

    body{
        height: 1000px;
    }

    div{
            width:400px;
            height: 200px;
    }

    .box1{
            position: fixed;
            left:100px;
            top:100px;
            background:red;
    }

    .box2{
	    background:green;
    }

    .box3{
	    background:purple;
    }

    </style>

</head>
<body>

    <div class="box1"></div>
    <div class="box2"></div>
    <div class="box3"></div>

</body>
</html>
```



参照定位父元素进行偏移


```html
<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8" />

<title>Document</title>

<style type="text/css">

*{

    margin:0;

    padding: 0;

}

.outer{

    position: relative;
    /* 父元素 */
    width:400px;
    height: 400px;
    background:red;
    margin:200px;

}

.inner{

    position: absolute;
    left:10px;
    top:20px;
    width:200px;
    height: 200px;
    background:green;

}

</style>
</head>
<body>

    <div class="outer">
    	<div class="inner"></div>
    </div>

</body>
</html>
```



### 3.4 定位小练习

| cur  | cur1 |
| ---- | ---- |
| cur  | cur2 |

```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

    /* 子绝父相*/
    *{
        margin:0;
        padding: 0;
    }

    .box{
        position: relative;
        width:600px;
        height: 400px;
        background:red;
        border:1px solid black;
        left:200px;
    }

    .cur{
        position: absolute;
        left:0px;
        top:0px;
        width:300px;
        height:400px;
        background:cyan;
    }

    .cur1{

        position: absolute;
        width:300px;
        height:200px;
        left:300px;
        top:0px;
        background:purple;

    }

    .cur2{
        position: absolute;
        width:300px;
        height:200px;
        background:yellow;
        left:300px;
        top:200px;
    }

    </style>
</head>
<body>

    <div class="box">

        <div class="cur"></div>
        <div class="cur1"></div>
        <div class="cur2"></div>

    </div>

</body>
</html>
```



## 4. 浮动

概述：

- 可以利用定位打破文档流，除此以外也可以利用浮动，其实浮动就是让元素进行*靠左、靠右进行水平排列；

- 浮动时，如果一行放不下会自动换行


```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

    /* 清除默认样式 */
    *{
        margin:0;
        padding: 0;
    }

    div{
        /* 靠左侧浮动 */
        float:left;
        width:150px;
        height: 50px;
        background:cyan;
    }

    </style>
</head>
<body>

    <div>最近北京气温降低</div>
    <div>最近北京气温降低</div>
    <div>最近北京气温降低</div>
    <div>最近北京气温降低</div>
    <div>最近北京气温降低</div>
    <div>最近北京气温降低</div>
    <div>最近北京气温降低</div>
    <div>最近北京气温降低</div>
    <div>最近北京气温降低</div>

</body>
</html>
```



### 4.1 导航


```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />

    <title>Document</title>

    <style type="text/css">

    *{
        margin:0;
        padding: 0;
    }

    .box{
        position: relative;
        /* 当前这个div宽度是按照父元素宽度进行百分比*/
        width:100%;
        height:50px;
        background:#01204f;
    }

    ul{
        position: absolute;
        left:20%;
        width:80%;
        height: 50px;
        /* 将列表默认样式清除（将前面黑色圆球干掉） */
        list-style: none;
    }

    li{
        float:left;
        width:60px;
        height: 50px;
        color:white;
        /* 行高 */
        line-height:50px;
        /* 小手 */
        cursor:pointer;
        /* 文字居中 */
        text-align:center;

    }

    li:hover{
        background:red;
    }

    </style>
</head>
<body>

    <div class="box">
        <ul>
            <li>首页</li>
            <li>国内</li>
            <li>国际</li>
            <li>军事</li>
            <li>财经</li>
            <li>娱乐</li>
            <li>体育</li>
            <li>互联网</li>
            <li>科技</li>
            <li>游戏</li>
            <li>女人</li>
            <li>汽车</li>
            <li>房产</li>
        </ul>

    </div>
</body>
</html>
```

-   子元素宽度可以是百分比单位，按照父元素宽度进行划分百分比的；

-   Line-heigh(行高)：可以让文本在垂直方向居中（最好它的属性值和当前元素高度一边高就行了）



### 4.2 轮播图小圆球


```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

    *{
        margin:0;
        padding: 0;
    }

    ul{
        position: relative;
        width:300px;
        height: 50px;
        list-style: none;
        border:1px solid black;
        left:500px;
    }

    li{

        float:left;
        /* 左侧外边距 */
        margin-right:10px;
        width:50px;
        height: 50px;
        background:green;
        /* 圆角设置 */
        border-radius:50%;

    }

    .cur{
        background:yellow;
    }

    </style>

</head>
<body>
    <ul>

        <li class="cur"></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>

    </ul>
</body>
</html>
```


### 4.3 四叶草效果

添加动画：

- CSS中给元素添加动画:Animation： [https://www.w3school.com.cn/cssref/pr_animation.asp](https://www.w3school.com.cn/cssref/pr_animation.asp)

- Web前端开发浏览器厂商常见：谷歌、IE、火狐、欧朋。特有的效果需要浏览器厂商私有前缀， 即带有私有前缀样式只能在当前浏览器中使用

- Animation：动画稍微了解，前端工程师可以利用样式搞动画

各厂商私有前缀：

| 谷歌   | IE   | 火狐 | 欧朋 |
| ------ | ---- | ---- | ---- |
| webkit | ms   | moz  | o    |


```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

    *{
        margin:0;
        padding: 0;
    }

    .box{

        /*相对定位：相对的是自己起始位置 */
        position: relative;
        width:200px;
        height: 200px;
        left:40%;
        /* 调用动画 */
        animation:donghua 5s linear 0s infinite;

    }

    .ye1{
        /* 绝对定位：参照定位父元素进行偏移*/
        position: absolute;

        width:100px;
        height: 100px;
        background:green;
        left:0px;
        top:0px;
        /* 圆角设置:分别左上、右上、右下、左下 */
        border-radius:0px 90px 0px 90px;
    }

    .ye2{
        /* 绝对定位：参照定位父元素进行偏移*/
        position: absolute;
        width:100px;
        height: 100px;
        background:green;
        left:100px;
        border-radius:90px 0px 90px 0px;
    }

    .ye3{
        position: absolute;
        width:100px;
        height: 100px;
        background:green;
        left:0px;
        top:100px;
        border-radius:90px 0px 90px 0px;
    }

    .ye4{
        position: absolute;
        width:100px;
        height:100px;
        background:green;
        left:100px;
        top:100px;
        border-radius:0px 90px 0px 90px;
    }

    /* 声明一个animation动画 */
    @-webkit-keyframes donghua{
        from{
            /* 旋转属性：可以让元素进行旋转（旋转单位是deg）*/
            transform:rotate(0deg);
        }
        to{
            transform:rotate(360deg);
        }
    }

    </style>
</head>
<body>

    <div class="box">
    <div class="ye1"></div>
    <div class="ye2"></div>
    <div class="ye3"></div>
    <div class="ye4"></div>

</div>
</body>
</html>
```



### 5. 轮播图布局

概述：很多电商（淘宝、京东）网站首页中都带有banner(轮播图功能)。



```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Document</title>
    <style type="text/css">

    /* 默认样式清除 */
    *{
        margin:0;
        padding: 0;
    }

    .box{

        /*相对定位 */
        position: relative;//相对自己起始位置进行便宜，起始位置占用（别人不能用）
        width:520px;
        height: 280px;
        border:1px solid red;//外边框【外边框大小设置 实线 颜色设置】
        left:400px; //定位元素才有left、top、right bottom
        top:100px;
        /* 如果子元素超出父元素部分隐藏*/
        overflow: hidden; //子元素超出父元素部分：隐藏掉

    }

    ul{

        position: absolute;
        list-style: none;//去除列表默认样式（前面黑色小球）
        width:520px;
        height: 280px;

    }

    .leftbtn{

        position:absolute;//绝对定位：按照已经定位父元素进行便宜
        width:60px;
        height:30px;
        background:black;
        left:0px;
        top:120px;
        color:white;
        text-align:center;//文本居中
        line-height:30px;//行高设置（让蚊子垂直方向居中：一般和高度一样）
        cursor:pointer;//小手
        opacity: .8;//透明【0~1】

    }

    .rightbtn{

        position: absolute;
        width:60px;
        height: 30px;
        background:black;
        right:0px;
        top:120px;
        color:white;
        text-align:center;
        line-height:30px;
        cursor:pointer;
        opacity: .8;

    }

    ol{

        position: absolute;
        width:200px;
        height:25px;
        list-style: none;
        left:35%;
        bottom:5px;

    }

    /* 后代选择器 */
    ol li{

        float:left;//左侧浮动
        width:25px;
        height: 25px;
        background:black;
        color:white;

        /* 变为圆球 */
        border-radius:12.5px; //圆角设置【左上、右上、右下、左下】
        text-align:center;
        line-height:25px;
        margin-right:5px;

    }

    .cur{
        background:skyblue;
        /* 进行缩放 */
        transform:scale(1.2);
    }

    </style>

</head>
<body>

    <div class="box">
        <!--有序列表去做显示图片 -->
        <ul>
            <li><img src="1.jpg" alt="" /></li>
            <li><img src="1.jpg" alt="" /></li>
            <li><img src="1.jpg" alt="" /></li>
            <li><img src="1.jpg" alt="" /></li>
            <li><img src="1.jpg" alt="" /></li>
        </ul>

        <!-- 左右按钮 -->
        <div class="leftbtn">left</div>
        <div class="rightbtn">right</div>
        
        <!-- 分页器 -->
        <ol>
            <li class="cur">1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>
        </ol>

    </div>
</body>
</html>
```

- transform：让元素实现变化：旋转、平移、缩放
    - 旋转（单位是度数deg）: 让元素按照图形几何中心进行旋转 `transform:rotate(30deg)`

    - 缩放：可以等比例让元素宽度和高度成比例放大、缩小。

    - `tranform:scale(1.2)`：属性值【0-1】缩小 大于1代表的是放大
