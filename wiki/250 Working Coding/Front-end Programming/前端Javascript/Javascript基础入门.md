# JavaScript 基础入门

## 1. JavaScript 基础

### 1.1 JavaScript简介

概述：

- JavaScript 简称【JS】，JavaScript是开发web脚本语言。

- 但是它也被用到了很多非浏览器环境中【比如：node平台】，

- 1995年由Netscape公司的 Brendan Eich 创建（创始人大概仅用了十天的时间）

- JS可以嵌套在静态页面中可以给静态页面添加一些动态效果（脚本语言）

- 不同浏览器厂商（在浏览器中都有内置解析器解析JS语法）

    - 各大浏览器厂商：chorme、IE、火狐、sofai、欧朋（都有属于自己的解析器）

    - 谷歌浏览器：V8解析器（可以解析JS语法：让谷歌浏览器知道你在写什么）

- 脚本语言【PHP、JavaScript】有一个很大特征，即可以嵌套静态页面中添加一些动态效果。



### 1.2 JavaScript组成

前端分为三层：

- 结构层：HTML

- 样式层：CSS

- 行为层 ：JavaScript



JavaScript组成三部分：

- ECMAScript：欧洲计算机协会大概每年6月中旬定制语法规范

    - 比如：变量为什么用 `var`、函数关键字为什么 `function`、循环语句为什么是`for`

    - 目前学习的是2014年规范，简称ES5

- DOM【document object model】文档对象模型（经常用来操作标签：在JS当中）

- BOM【browser object model】浏览器对象模型（模拟浏览器）

|组成|定义|
|---|---|
|ECMAScript|欧洲计算机协会每年6月份定时语法规范|
|DOM|Document Object Model|
|BOM|Browser Object Model|



### 1.3 JS书写格式

概述：JavaScript属于脚本语言，JS语法务必、必须嵌套在静态页面中，JS当中才可以运行

- 利用双闭合标签 `<script></scipt>`在静态页面中书写JS语法
- 双闭合标签 `<script></script>` 可以放置静态页面中任意地方，一般放置于底部
- 可重复多个script标签

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
</body>
</html>
<script>
    //这里面是要书写JS语法的地方
    alert("Hello word");
</script>
```
- JS语法必须放置在双闭合标签 `<script>` 里面

    

## 2. 内置功能函数使用

内置：浏览器厂商本身天生就有的，程序员可以直接使用



### 2.1 警告框-`alert（）`

概述：警告框功能是在浏览器正上方（中间）弹出一个警告框。


用法：
```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

</head>
<body>
</body>
</html>

<script>

    //单行注释

    /*
       多行注释：可以写多行注释给同事们看
       工作当中尽量养成这个习惯
    */

    //JS字符串，务必加上双引号、单引号
    alert("我是祖国未来");
    alert("我们希望我们将来很好");
    alert('希望听贾老师的课程你们有收获');

</script>
```
-   警告框功能可以多次使用

-   JS当中字符串，外层需要加上双引号、单引号

-   每行代码最后面加上一个分号：代表的是这行语句结束



### 2.2 提示框 - `prompt（）`


概述：在JS当中内置函数prompt，可以在浏览器正上方弹出一个提示框；
```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

</head>

<body>

</body>

</html>
<script>

    //提示框
    prompt("姑娘你的芳龄");

    // 传递第二参数，作为默认文本
    prompt("小小兄弟你回家了吗", 66666);

</script>
```



### 2.3 控制台使用

概述：`console.log（打印的数据）`


```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    //控制台打印数据
    console.log("我在控制台中打印数据，你看不见我");
    
    console.log(12306);

</script>
```



## 3. 数据类型

概述：

- 基本数据类型（5） 
- 引用类型【复杂数据类型】（1）



### 1. 基本数据类型

| 数据类型          | 数值            |
| ----------------- | --------------- |
| String：字符串    | "我爱你祖国"    |
| Number：数字类型  | 100，3.14，-666 |
| Boolean:布尔类型  | true，false     |
| Undefined：未定义 | undefined       |
| Null：空对象类型  | null            |



### 2. 引用类型数据：

| 数据类型         | 数值                       |
| ---------------- | -------------------------- |
| Object: 引用类型 | 函数、数组、正则、DOM、BOM |


```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
</body>
</html>
<script>

    //字符串（String）: 字符串即为人说的话【务必加上双引号、单引号】

    console.log("我爱你JS");
    console.log("最近快过年了，回家要胖五进");

    //数字类型(Number): 咱们小学学习数字

    console.log(100);
    console.log(-4.14);
    console.log(123456789);

    //布尔类型数值：true、false
    console.log(true);
    console.log(false);

    //未定类型数据
    console.log(undefined);

    //空对象类型
	console.log(null);

    //JS当中有一个关键字typeof可以检测数据类型

    console.log(typeof 123);
    console.log(typeof true);
    console.log(typeof undefined);

</script>
```
-   JS有五个基本数据类型是：字符串、数字、布尔值、未定义、空对象

-   `typeof()` : 检查数据类型



## 4. 变量

概述：

- 变量（variable）来源于数学。
- 变量相当于是一个容器，变量可以存储数据、存储计算完结果；
- 通过访问变量名字获取到存储数据。



JavaScript变量使用：

- 第一步：声明变量： `var 变量名字`

- 第二步：变量赋值： `变量名字 = 123；`

- 第三步：使用变量： `console.log(变量名字)`

```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

</head>
<body>
</body>
</html>


<script>

    //第一步：用关键字var进行声明变量
    var num;

    //第二步：可以给变量进行赋值 （将右侧数据||计算完结果）赋值给左侧变量
    num = 123;

    //第三步：使用。 
    //通过访问变量名字、获取到对应存储数据

    console.log(num);

</script>
```


变量用关键字var**声明**但**未赋值**，默认初始`undefined`

```js
  var abc;

    //给变量进行赋值（多次赋值）

    abc = 123;

    abc = "我爱你祖国";

    abc = "我喜欢貂蝉、吕布、鲁班";

    console.log(abc);
```


- 变量可以声明一次、但是可以多次赋值

-   多次赋值以后在使用：使用的是最后一次赋值数据
```js
<script>

    var a = 100;
    var b = 200;
    var c = 300;

    console.log(a, b, c);

</script>
```
- 这种写法是常用声明变量方式



### 特殊点

`0.1 + 0.2 ==0.3` 是错误的。由于遵守IEEE754浮点数标准（后面保留17位小数）

- [IEEE二进制浮点数算术标准（IEEE 754）]([https://baike.baidu.com/item/IEEE%20754/3869922?fr=aladdin](https://baike.baidu.com/item/IEEE 754/3869922?fr=aladdin))



## 5. 运算符

概述：

- 运算符，即操作符。JS 拥有数学运算符、比较运算符、逻辑运算符、赋值运算符等等。




### 5.1 数学运算符（5）

概述：

- 数学运算符即为： 加、减、乘、除、取余数。

- **在 JS 当中任意类型数据都可以参与数学运算符。**

- 因此，除了数字以为其他类型数据需要 **隐式转换为数字参与数学运算符。**


#### 5.1.1 数字参与

概述：
```js
<script>

    //数学运算符------数字参与

    //如果是数字和数字进行数学运算符：
    //先算乘除、后算加减、如果有小括号先算小括号里面的

    console.log(66 + 22);

    console.log(66 - 33);

    console.log(22 * 22);

    console.log(6 / 3);

    console.log(99 % 3); // 0

</script>
```


#### 5.1.2 布尔参与

概述：

- 布尔值参与数学运算符，计算机底层自动隐式转换为数字参与
- 底层完成隐式转换为起始通过系统内置函数 `Number()` 完成：`number(true)=1` & `number(false)=0`

- 布尔隐式转换为数字：`true=>1` & ` false=>0`

```js
<script>
	console.log(Number(true));//1

    console.log(Number(false));//0

    console.log(true + 99);//100

    console.log(false * 100);//0
</script>
```



#### 5.1.3 未定义类型参数

概述：

- 未定义类型是数值也可以参与数学运算符，需要隐式转换为数字：`NaN`【not a number】

- `NaN`：是JS语言当中一个数字类型特殊值，一般进行数学运算符的时候，计算不出结果，返回数字 `NaN`

```js
<script>
  //在JS当中未定义类型数据undefined也可以参数学运算符：
    //但是要隐式转换为数字参与
    //undefined未定义类型数据参与数学运算符的时候会隐式转换为数字NaN

    /************************************************************/

    // NaN 起始也是数字类型数值：值不够这个数值比较特殊，一般在计算数学运算符的时候算不出结果的时候: 返回数字NaN

    console.log(0 / 0);

    console.log(typeof NaN);

    console.log(NaN + 33);

    console.log(NaN * 33);

    console.log(NaN + NaN);

    console.log(undefined + 33);

    console.log(undefined / 33);
</script>
```
-   `typeof NaN`： 判断变量类型




#### 5.1.4 空对象类参与

概述：空对象类型数据 `null`，也可以参与数学运算符，但是需要隐式转换为数字 `0` 参与数学运算符；

```js
<script>
    //Null类型数值参与数学运算符

    console.log(Number(null));

    console.log(null * 99);

    console.log(0 + NaN);

    console.log(null + NaN);
</script>
```


#### 5.1.5 字符串参与

概述：

- 字符串也可以参与数学运算符，但是加号比较特殊。
- `+` 连字符：如果加号遇见字符串称之为连字符，将数据从左到右拼接为字符串

- 如果减、乘、除、取余数字符串参与：都隐式转换为数字参与，中文汉字转换为 `NaN`

```js
<script>
    // 字符串参与
	console.log("12" + 44);

    console.log("张三喜欢李四" + 666);
	
	// 如果是字符串参与数学运算符：减、乘、除、取余数
    console.log("12" - 44);

    console.log("12" * 44);

    console.log("12" / 44);

	console.log("12" % 44);

</script>
```



#### 5.1.6 小总结

概述：任意类型数据都可以参与数学运算符：如果不是数字类型的，隐式转换（浏览器自动）为数字参与；

| 数据类型 | 参与数学运算 |
| -------- | ------------ |
| 数学运算符 | 直接参数数学运算 |
|布尔值|`true=>1` <br> `false=>0`|
|未定义类型| `undefined=>NaN` |
|空对象类型| `null=>0` |
|字符串| `+` 为连字符<br>其他运算符转换为数字参与 |




### 5.2 比较运算符（8）

概述：

- 任意类型数据都可以参与比较运算符，比较最终结果：要么为布尔值 `true`、要么为布尔值 `false`

- 除了数字以外其他类型数据也可以参与比较运算符，但是需要隐式转换为数字参与（字符串特殊）


| 运算符 | 含义 |
| ------ | ---- |
|>|大于|
|>=|大于等于|
|<|小于|
|<=|小于等于|
|==|相等判断（就看数值是否一样）|
|!=|不等|
|===|全等（看数值+看数据类型）|
|!==|不全等|



#### 5.2.1 数字比较

```js
<script>
    //数字参与比较运算符

    console.log(3 > 6); //false

    console.log(3 >= 6); //false

    console.log(3 < 6); //true

    console.log(3 <= 6); //true 

    console.log(3 == 3); //true

    console.log(3 != 3); //false

    console.log(3 === "3"); //false

	// 内存地址不一样
	console.log([] === []); // false

    console.log(3 !== 3); //false
</script>
```
- 一个等号：赋值运算符 不是进行比较运算符（常用语给变量 **赋值**）
- 两个等号：相等比较运算符 (只看 **数值** 是否一样)
- 三个等号：全等比较 （即看 **数值** 又看 **类型比较**）



#### 5.2.2 其他类型数据比较（字符串除外）

概述：其他类型数据也可以参与比较（数字、字符串除去），其他类型数据也可以参与比较运算符，

但是需要隐式转换为数字参与。


```js
<script>
  console.log(100 > true);

    console.log(true === 1);

    console.log(true == 1);

    console.log(true < false);

    console.log(NaN > 100);

    console.log(undefined > 100);

    console.log(6666 > null);
	
	// 歧义的东西
	console.log(null == 0); // false
	console.log(null > 0); // false
	
	// NaN 无法计算，因此全部false

	console.log(NaN == NaN); // false

	console.log(NaN == undefined); // false

	// Null 是一个特殊类型，但是在控制台打印的是 `object` 类型。
	// typeof 这个函数的bug
	// 同样的，还有在 typeof 函数() 时，为 function。错误的～
	console.log(typeof null)	
</script>
```



#### 5.2.3 字符串比较（奇葩）

概述：

- 字符串参与比较时候分为两种情况：
    - 第一种：字符串和数字
    - 第二种：字符串和字符串比较



**字符串和数字比较**

如果是字符窜和数字比较：字符串隐式转换为数字参与比较；
```js
<script>

    //字符串和数字比较

    console.log("66" > 99); //false

    console.log("33" > 12); //true

    console.log("33" == 33); //true 

    console.log("33" === 33); //false

</script>
```



**字符串和字符串进行比较**

- 如果是字符串和字符串进行表：通过的是 **ASCII码数值** 进行比较：

- 两字符串都是从左到右开始一个一个字符进行比较，至到出现第一个字符比较出结果时，比较结束；

- `0 - 9` < `A - Z` < `a - z` ：从左到右依次变大。

```js
<script>
    //字符串和字符串比较

    console.log("a2" > "A2"); //true

    console.log("b2a" > "ABC"); //true

    console.log("李四" == "李四"); //true

</script>
```




### 5.3 逻辑运算符(3)

概述：在JavaScript脚本语言当中也有所谓逻辑运算符【与、或、非】，任意类型数据都可以参与逻辑运算符，但是需要注意（除了布尔值以外数据）需要隐式转换为布尔值参与逻辑运算符（通过内置函数Boolean将其他类型数据转换为布尔值）



#### 5.3.1 逻辑与

概述：在JS当中使用两个`&&` 代表逻辑与。两者（A、B）同时为真，返回结果才为真，否则结果为假的。

- 语法格式：`A && B`

-   A数值一般需要布尔值，B数值一般需要也是布尔值

```js
<script>
    console.log(true && false); //false

    console.log(false && true); //false

    console.log(false && false); //false

    console.log(true && true); //true
</script>
```

- 如果A为真，结果看B
- 如果A为假，结果看A



#### 5.3.2 逻辑或

概述：在JS当中使用两个||代表逻辑或。两者有一个为真即为真，否则为假的

- 语法格式：`A || B`

```js
<script>
    
    console.log(true || false); //true

    console.log(true || true); //true

    console.log(false || true); //true

    console.log(false || false); //false 
</script>
```

- 如果A为真，结果看A
- 如果A为假，结果看B



#### 5.3.3 逻辑非

概述：JS当中逻辑非`!`，它的作用是置反；
```js
<script>
    console.log(!true); //false

    console.log(!false); //true

    console.log(!!!true); //false
</script>
```
-   JS当中的逻辑非可以同时使用多个



#### 5.3.4 其他类型数据参与逻辑运算

数字隐式转换为布尔值

| 数字值 | 布尔值 |
| ---- | ------ |
|0|False|
|NaN|False|
|非0、NaN数字|true|


字符串隐式转换为布尔值

| 字符串 | 布尔值 |
| ------ | ------ |
|空字符串|False|
|非空字符串|True|

未定义类型和空对象类型

| 其他类型 | 布尔值 |
| -------- | ------ |
|undefined|False|
|null|False|



```js
<script>

    //逻辑与

    console.log(1 && 0); //false

    console.log(66666 && 999999); // ture

    console.log(NaN && 34); // false

    console.log("张三" && "李四"); // true

    console.log("小明" || "小花花"); // true

    console.log(NaN || 123); // true

</script>
```





## 6. IF条件语句

概述: 在JavaScript脚本语言当中，也有条件语句、也有循环语句；

### 6.1 条件语句基本使用

```js
<script>

    //条件语句基本使用

    if (true) alert("大江东去浪淘尽");

    if (false) alert(123);

    //其他类型数据也可以作为条件语句条件：但是都隐式转换为布尔值

    if (6666) alert(123);

    if (NaN) console.log("我能执行吗");

</script>
```

-   条件语句条件一般为布尔值，但是其他类型数值也可以参与（隐式转换为布尔值）

-   如果条件语句只有一行代码可以省略大花括号



### 6.2 `if`结合 `else` 关键字一起使用

```js
<script>

    // 关键字else【否则】，可以结合if条件语句一起使用

    // else关键字是对于上面条件进行否定

    // 小案例:让用户输入一个分数对应弹出这个学生是否及格

    var score = prompt("请你输入你的分数");

    if (score >= 60) {

        // 条件：分数大于等于60

        alert("兄弟恭喜你及格啦");

    } else {

        // 暗含条件：对于上面条件进行否定（分数是小于60分）

        alert("兄弟不好意思,来年回来继续考试，我等你");

    }

</script>
```

-   `else` 关键字可以结合if条件语句一起使用（可以：不是必须）

-   `else` 这个分支对于上面分支条件进行否定
- 比如：当前这个案例else这个分支暗含条件是（分数小于60分）



### 6.3 多分支条件语句

概述：javaScript脚本语言也支持条件语句【多分支条件语句也有的】

案例：比如让学生输入分支对应弹出成绩

| 成绩 | 状态 |
| ---- | ---- |
|<60|挂科|
|>=60且<70|及格|
|>=70且<80|良好|
|>=80|优秀|

程序：


```js
script>

    //用户输入分数

    var score = prompt("请你输入一个分数");

    if (score < 60) {

        //条件：分数小于60

        alert("兄弟不好意思,来年补考");

    } else if (score < 70) {

        //出现else:暗含条件分数一定是大于等于60

        //完整条件大于等于60 且小于70

        alert("兄弟恭喜你及格");

    } else if (score < 80) {

        //暗含条件：分数大于等于70

        //完整条件：大于等于70 且小于80

        alert("良好");

    } else {

        //暗含条件：分数大于等于80

        alert("优秀");

    }

</script>
```



### 6.4 嵌套使用

```js
<script>

    var nl = 88;

    var sex = "男";

    if (sex == "女") {

    } else {

        if (nl > 60) {

            alert(123);//弹出结果

        } else {

            alert(456);

        }

    }

</script>
```



## 7. 循环语句

概述：JavaScript脚本语言当中有循环`loop`语句，可以做一些重复事情；也有 `for`、`while`、`do...while`

### 7.1 `for()`

```js
<script>

    //for循环

    for (var i = 0; i < 10; i++) {

        console.log(i);

        document.write("<h1>我爱你祖国</h1>");

    }
	
    console.log(i);

</script>
```

-   在JS当中循环语句第一步（红色部分），认为全局变量，可以在循环体外面使用；



**累加**

```js
<script>

    //计算数字1~100之间的数字累加和
    //声明变量：保存每一次循环计算结果

    var sum = 0;

    for (var i = 1; i <= 100; i++) {

        sum += i;

    }

    console.log(sum);

</script>
```



**水仙花数字**

水仙化数字：个，十，百各个

```js
<script>
    
	for (var i = 100; i < 1000; i++) {

        //分别获取当前这次循环数字个、十、百
        var ge = i % 10,

            shi = parseInt(i / 10) % 10,
            
            bai = parseInt(i / 100);

        //计算数字累加和
        var result = Math.pow(ge, 3) + Math.pow(shi, 3) + Math.pow(bai, 3);

        if (i == result) {

            console.log(i + "是一个水仙花数字")

        }

    }
</script>
```



### 7.2 `while()`

```js
<script>

    //计算数字1-10累加和

    var i = 11;

    var sum = 0;

    while (i--) {

        sum += i;

    }

    console.log(sum);

</script>
```



### 7.3 `do...while`

```js
<script>

    var i = 10;

    var sum = 0;

    do {

        sum += i;

        console.log(i);

    } while (i--);

    console.log(sum);

</script>
```



> 总结：JS当中循环语句和Java循环语句很类似，但是JS循环语句变量可以在循环体外边使用；



### 7.4 `break` 和 `continue` 关键字

概述：

- `break`可以终止就近循环语句（立刻终止）

- `continue`可以终止当前这一次循环，去执行下一次循环。

- 用法和 Java 几乎一模一样的；

```js
<script>

    waiceng: for (var i = 1; i < 10; i++) {

        if (i % 3 == 0) break waiceng;

        console.log(i)

    }

</script>
```

- 需要注意：JS当中的循环语句中声明变量可以在循环语句外面使用；



## 8. 函数

概述：函数就是将某一个功能进行封装，当你事项用这个功能的时候，需要调用、执行这个函数。比如：

-   内置函数 `alert()`：在浏览器正上方弹出一个警告框
-   内置函数 `prompt()`：在浏览器正上方弹出一个提示框



在javaScript脚本语言当中：函数使用分为两部分：声明 + 调用

- 声明方式有两种：
    - 关键字function声明函数
    - 表达式声明函数

- 调用：函数名字 +小括号



### 8.1 关键字函数基本使用

概述：JS当中如果想声明关键字形式函数，需要用到关键字function进行声明。

基本语法：

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    //关键字形式函数分为两部分声明+调用

    //声明部分(函数名字务必符合命名标识符规范)

    function fun() {

        //这里面是书写代码地方(函数体)

        console.log("鹅鹅鹅,去向向天歌");

        console.log("白毛浮绿水,红掌拨清波");

    }

    //函数调用部分

    fun();

    fun();

    fun();

</script>
```

-   函数声明一次可以多次使用。



### 8.2 形参和实参

```js
// 形参【形式参数】和实参【实际参数】
<script>
    //计算两个数字之和
    //a、b所谓形参
    function sum(a, b) {

        console.log(a + b);

    }

    //100、200实参
    sum(100, 200);

	// 实参可以是任何类型数据
    sum("张三", "李四");

</script>
```

- 当调用函数的时候：实参会一一对应进行赋值；


- 注意：在JS当中数学运算符中：加号比较特殊，如果加号遇见字符串【称之为连字符】不进行书写加法，而是将数据从左到右进行字符串拼接；



### 8.3 全局变量和局部变量**

局部变量：

- 作为函数形参【只能在函数体中使用】
- 在函数体中声明变量【局部变量：只能在函数体中使用】

全局变量：

- 只要不是局部变量即为全局变量【全局变量可以在JS行为层中任意地方使用】

```html
// 下面代码为局部变量：只能在函数体中使用
<script>

    // 局部变量：函数形参、在函数体中声明变量（只能在函数体中使用）

    // 声明部分
    function fun(a, b) {

        //形参a、形参b称之为局部变量
        console.log(a);
        console.log(b);

        //在函数体中声明变量（局部变量）
        var c = "么么哒";

    }

    //调用
    fun(true, "我是祖国的老花骨朵");

    // console.log(a);
    // console.log(c);

</script>
```



全局变量和局部变量区分案例


```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

</head>
<script>

    // 当前变量i是全局变量（可以在JS行为层中任意地方使用）
    for (var i = 0; i < 10; i++) {
        console.log(i);
    }
    console.log("循环语句结束" + i);

    // 当前变量str：既不是形参、也不是函数体中声明变量[全局变量]
    if (true) {
        var str = "我是全局还是局部呀";
    }
    console.log(str);

    //判断下面变量是全局还是局部
    var a = 100;

    /*****************************************************************************/

    function fun(haha, hehe) {

        console.log(haha, hehe);

        //判断这个变量是全局还是局部
        for (var num = 1; num < 5; num++) {

            console.log(num);

        }

    }

    // 调用函数
    fun(1, 2);

    // console.log(haha);

</script>
<body>
</body>
</html>
```

- 局部变量：函数形参、函数体中声明变量（只能在函数体中使用）
- 全局变量：全局变量可以在JS行为层中任意地方使用



### 8.4 作用域

概述：作用域【scope】代码书写范围

问题：作用域是什么呀？

- 书写代码范围即为作用域

分类：

- 全局作用域：两个双闭合标签 `<script> & </script>` 之间的内容

- 函数作用域：函数体

```html
<!DOCTYPE html>

<html lang="en">

<script>

    // 作用域书写代码范围
    // 全局作用域: <script> <\/script> 两个标签之间的内容。
    console.log(123);

    //函数也有作用域概念
    function fun(a, b) {

        console.log(a);

        console.log(b);

    }

    fun(5, 6);

</script>
<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>
<body>

	测试文本

</body>
</html>
```



案例


```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

</head>
<body>
</body>
</html>
<script>

    // 全局变量
    var b = 100;

    // 声明一个函数
    function fun() {

        // 局部变量
        var b = 200;

        console.log(b);

    }
    fun();

</script>
```



### 8.5 JS当中没有函数重载概念**

概述：在JS当中如果有多个重名的函数，永远是 **后者覆盖前者**，没有函数重载问题；

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    function fun(a) {

        console.log("我是第一个");

    }

    function fun(a, b) {

        console.log("我是第二个");

    }

    function fun(a, b, c) {

        console.log("我是第三个");

    }
	// 没有函数重载的问题：第三个函数执行。
    fun("我爱你祖国");

</script>
```



### 8.6 关键字 `return`

概述：`return` 是JS当中关键字，经常结合函数一起使用，可以将函数计算完后返回；

- `return` 关键字只能在函数体中使用



作用：

1. 在函数体中return关键字后面语句不在执行

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    function mul() {

        console.log(123);

        console.log(456);

        return;

        console.log(789);

    }

    mul();

</script>
```



2. 可以将函数体中计算完结果返回，可以在函数体外面使用

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    function mul(a, b) {

        return a * b;

    }

    var result = mul(6, 7);

    console.log(result);

</script>
```



## 9. 拓展 - canvas

### 9.1 canvas简介 

学习手册： https://developer.mozilla.org/zh-CN/docs/Web/API/Canvas_API

- 中文开发手册最好选择 MDN（火狐）

- 概述：canvas是2014年（超文本标记语言第五次重大修改中新增的）结构层中一个双闭合标签；

- 使得我们可以通过JS操作在行为层中操作画布，可以在canvas中绘制一些简单图形、对于图片进行裁切、实现一些简单2D动画、显示视频；



### 9.2 canvas基本使用

```html
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <style>

        * {
            margin: 0;
            padding: 0;
        }

        canvas {
            border: 1px solid black;
        }

    </style>
</head>
<body>
	
    <--> 通过标签属性定义大小 </-->
    <canvas width="600" height="400"></canvas>

</body>

</html>

<script>

    // 获取canvas标签
    var canvas = document.querySelector("canvas");

    // 画布当中任何操作必须通过 2D上下文 进行操作
    var ctx = canvas.getContext("2d");
    // console.log(ctx);

    // 一定要注意：画布当中任何操作都是通过ctx属性、方法进行操作
    
    // 设置矩形填充颜色
    ctx.fillStyle = "cyan";

    // 绘制矩形
    ctx.fillRect(100, 100, 100, 100);

    // 绘制圆
    //通过绘制路径形式绘制圆

    ctx.beginPath();

    //用户在描述绘制图形

    ctx.arc(200, 200, 50, 0, Math.PI * 2, false);

    //设置填充颜色

    ctx.fillStyle = "red";

    //开始填充

    ctx.fill();

    //边框设置

    ctx.lineWidth = 20;

    ctx.strokeStyle = "pink";

    //开始绘制

    ctx.stroke();

</script>
```

-   `canvas` 是HTML5中新增的一个双闭合标签，浏览器将识别为一张图片。

-   `canvas` 标签是由默认w（300）、h（150）

-   `canvas` 标签宽和高务必通过属性进行设置，别写样式设置，否则变形

-   `canvas` 标签文本、儿子标签都没有任何意义

-   `canvas`最基本功能是绘制图形，需要注意画布任何操作都是通过 2D上下文 进行渲染；

    



## 10. 拓展 - WebGL

学习手册： https://threejs.org/



## 11. 数组`array`

概述：在JS当中也有数组存在，数组你可以理解为是一个'容器'，可以存储很多有序数据。

- 数组在JS当中是 **引用类型数据**
- 在JS当中数组是用中括号表示



### 11.1 数组基本使用

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    //在JS当中数组使用[]进行表示
    //JS当中数组是引用类型数据

    console.log([]);

    console.log(typeof []);

    //数组目的：可以一次性存储很多有序数据
    console.log([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

</script>
```

-   JS当中数组可以存储很多数据，这里的数据可以是任意类型




### 11.2 数组经常存储、读取、修改、新增数据


```html
<script>

    // 为了在JS当中使用数组方便

    // 经常将右侧数组赋值给左侧变量（通过变量名字可以访问存储数组）

    // 存储数据

    var arr = ["我爱你祖国", 12306, true, NaN, [2, 3, 4]];

    // 读取数据: 通过枚举法 + 下角标（索引值）获取数组里面存储数据

    console.log(arr[0]);

    console.log(arr[3]);

    console.log(arr[4]);

    // 修改 数组里面数据

    arr[0] = "我爱你母亲";

    arr[1] = 110;

    arr[4][0] = 66666;

    console.log(arr);

    // 新增 数据
    arr[5] = "我是后来的";

    arr[6] = "稍等我也来了";

    // 中间的数据采用 undefine 进行填充
    arr[9999] = "我是老嘎达";

    console.log(arr);

    console.log(arr[100]);

</script>
```



### 11.3 `length`属性

概述：`length` 是数组一个属性，主要的作用是可以获取数组元素总个数，它返回一个数字；

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    // length属性：可以获取数组里面元素总个数

    var arr = ["吃饭", "睡觉", "打豆豆", "喝酒", "烫头"];

    // 数组里面一共是五个元素

    console.log(arr.length);

    // 数组里面元素是从零开始的

    // 数组的length属性常用语遍历数组

    for (var i = 0; i < arr.length; i++) {

        // 获取数组里面元素
        console.log(arr[i]);
    }

</script>

<script>

    // 数组常见算法题：
    // 比如：计算数组里面元素累加和问题

    var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    var sum = 0;

    for (var i = 0; i < arr.length; i++) {

        sum += arr[i];

    }

    // 计算完毕获取结果
    console.log(sum);

</script>

<script>

    // 获取数组里面最大元素
    var arr = [66, 3, 2, 99, 26, 21, 19, 88];

    // 获取最大数字
    var max = arr[0];

    for (var i = 0; i < arr.length; i++) {

        // 后者元素大于前者进行重新赋值
        if (arr[i] > max) {
            max = arr[i];
        }
    }

    console.log(max);

</script>
```



### 11.4 数组方法

数组方法学习手册：https://www.w3school.com.cn/jsref/jsref_obj_array.asp



#### 11.4.1 `pop` & `push`**

概述：主要的作用是可以在数组尾处移除、添加元素。

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    // 声明数组
    var arr = ["幺鸡", "五万", "三饼", "二条", "二筒", "发财"];

    // pop: 可以在数组尾巴出移除一项元素

    var result = arr.pop();

    var result1 = arr.pop();

    console.log(arr);

    console.log(result);

    console.log(result1);

</script>
```

-   `pop()` 是数组方法，可以在数组尾出移除掉一项元素

-   `pop()` 有返回数值，返回的是移除掉的那项元素

```html
<script>
    // push: 
	var result = arr.push("曹操");

    var result1 = arr.push("刘备", "关二爷", "张飞");

    console.log(arr);

    console.log(result);

    console.log(result1)
</script>
```

-   `push()`也是数组方法，主要的作用是可以向数组尾出添加一项、多项元素

-   `push()` 执行完毕有返回数值，返回的数值是数组新增完元素总个数；



**总结：**

- pop是数组方法，可以在数组尾巴出移除一项元素，返回的是删除调的那个元素

- push是数组方法， 可以在数组尾巴出添加一个、多个元素，返回的是添加完元素总个数



#### 11.4.2 `shift` & `unshift`

概述：`shift`||`unshift `他们两者是数组方法，可以在数组头部添加、移除元素。


```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    // shift:在数组头部删除一项元素

    var arr = ["北京", "上海", "广州", "深圳"];

    // 头部删除一项元素

    var result = arr.shift();

    console.log(arr);

    console.log(result);

    // 头部添加一个、多个元素

    var result = arr.unshift("杭州", "苏州", "小米粥");

    console.log(arr);

    console.log(result);

</script>
```

-   `shift()` 在数组头部移除一项元素、返回删除掉的那个元素

-   `unshift()` 在数组头部添加一个、多个元素，返回的是数组元素总个数（新的总个数）



#### 11.4.3 `reverse()`

概述：数组方法，主要的作用是可以 **让数组里面元素进行倒置**。

```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>
<body>
</body>
</html>
<script>

    //reverse:数组方法让数组元素进行倒置

    var arr = ["香港港独", "最近最好别吃香蕉", "最近广厦事件"];

    arr.reverse();

    console.log(arr);

</script>
```



#### 11.4.4 `indexOf()`

概述：数组方法，作用是可以 **获取数组当中某一个元素索引值**。

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    var arr = ["香港港独", 1, 2, 3, 4, 5, "香蕉", "香蕉", "香蕉", "最近广厦事件"];

    // indexOf：可以检测某一个元素索引值

    console.log(arr.indexOf("香蕉"));
    console.log(arr.indexOf("贾成豪"));

</script>
```

-   注意1：获取到的是从左到右第一个符合条件索引值

-   注意2：如果获取的是数组里面没有元素，返回索引值是-1



#### 11.4.5 `join()`**

概述：数组方法，作用是可以 **通过某一个字符将数组转换为字符串**。

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    // join:将数组转换为字符串

    var arr = ["北京", "南京", "燕京", "东京", "吴京", "亮晶晶"];

    console.log(arr.join());

    console.log(arr.join("*"));

    console.log(arr.join(""));

</script>
```



#### 11.4.6 `concat`


概述：数组方法，主要的作用是 **将多个数组合并为一个数组**，对原始数组没有影响。

```js
<script>
    //concat:将多个数组合并为一个数组

    var a = [1, 2, 3]；

    var b = [4, 5, 6];

    var c = [7, 8, 9];

    console.log(a.concat(b, c));

    console.log(a, b, c);
</script>
```



#### 11.4.7 `slice`

概述：数组方法，主要的作用是 **切割数组**；

语法格式：`arr.slice(起始索引值，结束索引值);`

- 切割的时候，包含起始位置，但是不包含结束位置

- `slice()` 方法对于起始数组没有任何影响



```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>

<body>

</body>

</html>

<script>

    // slice:数组方法用于切割数组

    // 代表起始位置索引值，结束索引值（包含起始位置，但是不包含结束位置）

    var arr = ["小浣熊", "麻花", "包子", "烤鸭", "棒棒糖"];

    // 一个参数：代表起始位置

    var newArr1 = arr.slice(1);

    var newArr2 = arr.slice(1, 3);

    var newArr3 = arr.slice(-2);

    console.log(newArr3);

</script>
```



#### 11.4.8 `splice`

概述：数组方法，主要的作用是 **切割数组**。

语法格式：`arr.splice(start_loc, length)`

- 影响起始数组，将会丢失切割块。



```html
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

</head>
<body>
</body>
</html>
<script>

    var arr = ["王者荣耀", "吃鸡", "lol", '魔兽', "传奇", "劲舞团", "CF", "DNF", "逆战"];

    // 切割
    var newArr1 = arr.splice(2, 3);

    console.log(newArr1);

    console.log(arr);

    // 插入

    arr.splice(2, 0, "哈哈哈插入数据", "么么哒");

    console.log(arr);

    // 替换

    arr.splice(2, 2, "哈哈哈插入数据", "么么哒");

    console.log(arr);

</script>
```



## Reference

<https://www.w3school.com.cn/> 学习手册

<https://www.runoob.com/php/php-ref-array.html> php学习手册



前端资料网址：

<https://cn.vuejs.org/>  Vue.js学习手册

<https://reactjs.org/docs/hello-world.html> React.js学习手册

<http://jquery.cuishifeng.cn/> jQuery函数库手册

<http://nodejs.cn/> node平台

<https://developer.mozilla.org/zh-CN/docs/Web/API/Canvas_API/Tutorial> canvas

<https://www.echartsjs.com/examples/zh/index.html> 图表函数库Echarts

