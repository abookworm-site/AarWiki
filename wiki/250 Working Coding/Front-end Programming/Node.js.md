# Node平台**

<http://nodejs.cn/> 官方地址

概述

- node诞生于2009年，它是一款软件（并不是一门语言）
- 这个软件有一个很牛功能，可以让JS在这个软件上运行

- Node在设计的时候目的想替代老牌Java、PHP后台语言，你会发现痴心妄想

注意：

- node软件最开始的时候，想搞服务器端开发（最近已经停止更新了）

- 但是，前端工程师使用node软件目的不是为了开发开发服务器。目前，Node相当于前端开发当中 **脚手架**



## 4.1 安装

概述：安装非常简单，无脑下一步。



安装node.js四样东西：

-   JS运行环境

-   NPM工具

-   在线学习手册

-   Node软件添加环境变量



验证是否安装成功：

- 打开CMD命令行，输入 `node -v` 如果出现版本号即代表安装成功



## 4.2 Node基本使用

概述：

- node是一个软件，可让JavaScript脚本语言在这个软件上运行。

注意：

- node软件可以运行JS语法，node软件只能运行尾缀为 `.js`文件。
- Node平台支持JS全部核心语法
- Node 运行不了像静态页面、CSS、PHP等等文件

```js
// Node平台支持JS全部核心语法

// 变量

var a = 100;

var b = 200;

console.log(a + b);

// 运算符[数学运算符、比较运算符、逻辑运算符]都支持

console.log(3 > 8 ? 6 : 9);

// 流程控制语句

for (var i = 1; i <= 100; i++) {

  if (i % 2 == 0) console.log(i);

}

// 函数

function sum(a, b) {

  return a + b;

}

console.log(sum(11, 11));

// 数组

var arr = ["吃饭", "睡觉", "打豆豆"];

console.log(arr.reverse());

// 构造函数

function People(name, age, sex) {

  this.name = name;

  this.age = age;

  this.sex = sex;

}

// 原型对象方法

People.prototype.eat = function() {

  console.log("我可以吃八斤米饭");

};

// 创建小明

var xiaoming = new People("小明", 18, "男");

xiaoming.eat();
```
-   Node软件支持JS全部核心语法（ES6、7、8、9、10）

-   node平台没有DOM、BOM概念。

    

运行方式：

- node软件只能运行JS文件，运行JS文件是在CMD窗口里面运行的（没有浏览器概念）

- 进入到JS文件的文件夹里面（shift+鼠标右键）使用CMD
- 执行JS文件，即： `node + JS文件名字` 



## 4.3 Node平台中内置模块

概述：

- 传统JS使用是在静态页面中通过 `scrit标签` 引入。
- Node软件给JS赋予一些'超能力'：
    - 传统JS是没办法做到的：比如通过JS向某一个文件里面 **写入一些数据**，
    - 这些所谓超能力，即为node软件给我们 **提供内置模块**。



### 4.3.1 `fs` 模块

概述：fs [`files`]是node软件给我们提供内置模块功能，可以向某一个文件里面写入数据。

```js
// node软件提供的模块就是给JS赋予超能力，且 Node 软件本身就有的

// require() 引包
// fs：可以通过JS向某一个文件写入数据
var fs = require("fs");

// 写入数据

fs.writeFile("./jch.txt", "老师是祖国的老花骨朵把", function () {

    console.log("数据写入......")

});

// 读取数据

fs.readFile("./jch.txt", function (err, data) {

    console.log(data.toString());

})
```


### 4.3.2 `queryString`模块

```js
// node软件给我们提供模块（给JS赋予超能力），node软件本省就有的

// fs：可以通过JS向某一个文件写入数据
// 模块名和变量名最好一致
var fs = require("fs");

// queryString模块：可以将JSON数据格式转换为queryString字符串

var querystring = require("querystring");

// 写入数据

fs.writeFile("./jch.txt", "老师是祖国的老花骨朵把", function () {

    console.log("数据写入......")

});

// 读取数据

fs.readFile("./jch.txt", function (err, data) {

    console.log(data.toString());

});

// 将JSON转换为queryString字符串

console.log(querystring.stringify({

    "a": 1,

    "b": 2

}));


// Node 服务器开发

var http = require("http");

// 创建服务器对象

var app = http.createServer(function (req, res) {

    res.setHeader('Content-Type', 'text/html;charset=utf-8');

    // 服务器响应数据

    res.end("老师自己开发的服务器");

});

// 端口号监听设置

app.listen(3000);
```



## 4.4 NPM工具使用

概述：

- 安装node后，使用npm工具可以去社区下载其他人已经写好自定义模块，直接在你的程序中使用。

- 社区网站（网站服务器位于美国）：<https://www.npmjs.com/>
- 可利用npm工具去社区网站下载别人已经写好插件使用（Vue、React）



### 4.4.1 `colors` 社区自定义模块

自定义：程序员自己写好了的一些模块，不是node平台提供。需要我们去社区网站通过npm工具进行下载

问题：CMD控制台打印的文字变颜色？

- 第一步：去社区网站npm搜索

- 第二步：打开CMD命令行（路径：务必是当前案例文件夹路径）

- 第三步：安装通过 `npm install 自定义模块名字`

```js
// 可以改变文字颜色

// 引入社区自定义模块colors
var colors = require("colors");

console.log("我非常喜欢贾成豪,因为贾成豪只是深渊".green);

console.log("我很喜欢小明".rainbow);
```


### 4.4.2 `solarlunar` 社区自定义模块

概述：进行公历、农历转换。
```js
//引入社区自定义模块solarLunar

var solarLunar = require("solarLunar");

var solar2lunarData = solarLunar.solar2lunar(1996, 3, 8);

console.log(solar2lunarData);

console.log(solar2lunarData.animal);
```