# 1. PHP 基础入门

## 2.1 PHP简介

- PHP即"超文本预处理器"，是一种通用开源脚本语言。PHP是在服务器端执行的脚本语言，与C语言类似，是常用的网站编程语言。
- 客户端发送上行请求，服务器执行收到请求，执行相应的PHP脚本而后进行下行响应，发送静态页面数据给浏览器渲染。

- 学习网址：<https://www.w3school.com.cn/php/index.asp> 



## 2.2 PHP壳子

- 一定要切记PHP是在服务器端运行的。

- 学习PHP路径千万别出现汉字，否则导致程序奔溃

- PHP语法务必放置的壳子当中书写

    

```php
// php 书写规则：
<?php "书写代码地方"?>

// 案例
<?php echo "PHP是世界上最好的语言"?>


<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<bo<?php echo "d"?>y>

     <h1>我非常喜欢华为买了一个花了我<?php echo 5888 + 1?></h1>

</body>

</html>


<?php echo "我爱你php"?>
```
-   PHP 语法需要放置在壳子当中使用： `<?php 书写代码地方?>`

-   PHP 可以可以有多个，可以放置程序任意地方

## 2.3 `echo`

概述：

- `echo` 是PHP当中一个关键字，

- `echo` 主要作用是可以输出数据。

- 一般输出的都是基本类型数据：字符串、数字、布尔值

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<!-- PHP语言当中基本类型数据：数字、字符串、布尔值、空对象：没有未定义 -->

```php
<!-- 解决输出乱码  -->
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">


<!-- PHP语言当中基本类型数据：数字、字符串、布尔值、空对象：没有未定义 -->
<?php

   echo 123;

   echo "<br/>";

   echo "我爱你祖国";

   echo "<br/>";

   echo true;

?>
```


## 2.4 变量

```php
<?php

   // 变量需要用关键字$进行声明

   $a = 100;

   $b = 200;

   echo $a + $b;

   // PHP也支持我们曾经学习运算符

   // 数学运算符： + -  * / %

   // 比较运算符：大于、小于等等

   // 赋值运算符： ++ -- +=

   // 逻辑运算符：与、或、非

   echo $a > $b ? $a : $b;

?>
```



## 2.5 流程控制语句

概述：PHP语言当中也有流程控制语句：条件、循环语句。

```php
<?php

    for($i = 1 ; $i <=100;$i++){

          if($i % 2 ==0){
			// . 为连字符号
              echo $i."<br>";

          }
    }
?>
```
- `.` 为连字符号



## 2.6 函数

```php
<?php

   // 全局变量

   $c = 1000;

   // 函数声明部分

   function sum($a,$b){

       // 如果在函数体中使用全局变量

       // 需要需要使用global关键字进行声明

      global $c;

      return $a + $b + $c;

   }

   // 调用

   echo sum(100,666);

?>
```
-   PHP当中函数使用类似于JS，但是还有有区别的



## 2.7 数组

概述：PHP 也有数组，而且还是所有语言中所提供的内置的函数最多的语言。

```php
<?php
    // php 中的总数组需要通过PHP内置 array 函数进行声明
    
    $arr = array("吃饭", "睡觉", "打豆豆")    
    
?>
```

