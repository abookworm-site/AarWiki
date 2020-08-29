# Vue 框架

 Vue 框架官网地址：<https://cn.vuejs.org/>



前端领域三大框架（都是开发单页面应用框架）

-   `Angular`诞生于2009年，是由谷歌创建出来的框架

-   `React`诞生于2013年，是由 facebook 公司创建出来框架

-   `Vue`诞生于2014年，是由中国在校大学生`尤雨溪`创建出来的。



概述：

- Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的 **渐进式（JavaScript）框架**。

- 与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。

- Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合



## 1. `Vue` 基本使用

获取源码：Vue属于前端当中的一个JavaScript框架，源码都封装到了一个尾缀为JS的文件里面。



```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引入Vue源码（引包） -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <!-- 页面标签布局 -->

    <div id="app">

        <h1>我是Vue,我今年{{age}}岁了</h1>

    </div>

</body>

</html>

<script>

    // Vue框架 对外暴露了一个 Vue构造函数
    // 通过这个Vue构造函数，创建实例

    var vm = new Vue({

        // el:挂载点（element）设置（将Vue实例）和结构层中标签进行挂载

        el: "#app",

        // 实例数据来源

        data: {
            age: 100
        }
    });

    // 修改实例age属性值

    vm.age = 23;

    vm.age = 99999;

</script>
```



## 2. `Vue` 常用指令

概述：

- `Vue`框架给我们提供了很多指令，都是以 `v-xxx` 开头，Vue提供这些指令其实都是作为标签属性直接使用；

- 指令：指令是由`Vue`提供的，主要作用是可以操作标签（文本、样式、事件等等）
- 指令理解：相当于长官给士兵下达军令（我让你干什么，你就干什么）

```html
<div id='box' class='cur'>我是div</div>
```



### 2.1 `v-text`

概述：可以更新标签文本内容；

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <div id="app">

        <h1>下面指令是操作文本</h1>

        <p v-text="msg"></p>

        <hr>

        <p>{{msg}}</p>

        <p v-html="msg"></p>

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        el: "#app",

        data: {

            msg: "<a href='http://www/baidu.com'>百度</a>"

        }

    })

</script>
```

-   v-text:它可以更新标签文本内容【简写的方式是双大括号】

-   v-html:它也可以更新标签文本内筒【如果渲染数据为标签形式字符串，会真的渲染为标签】

### 2.2 v-show

概述：v-show指令可以控制标签的显示与隐藏，底层原理其实是通过CSS中display属性进行控制。

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <div id="app">

        <ul>

            <li>吃饭</li>

            <li v-show='3 > 8'>睡觉</li>

            <li>打豆豆</li>

        </ul>

    </div>

</body>

</html>

<script>

    //创建实例

    var vm = new Vue({

        el: "#app"

    })

</script>
```

//用上面指令选项卡效果

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <div id="app">

        <button @click="add('军事')">军事</button>

        <button @click="add('新闻')">新闻</button>

        <button @click="add('直播')">直播</button>

        <ul v-show="'军事'==info">

            <li>军事军事</li>

            <li>军事军事</li>

            <li>军事军事</li>

            <li>军事军事</li>

            <li>军事军事</li>

            <li>军事军事</li>

            <li>军事军事</li>

            <li>军事军事</li>

            <li>军事军事</li>

            <li>军事军事</li>

        </ul>

        <ul v-show="'新闻'==info">

            <li>新闻新闻</li>

            <li>新闻新闻</li>

            <li>新闻新闻</li>

            <li>新闻新闻</li>

            <li>新闻新闻</li>

            <li>新闻新闻</li>

            <li>新闻新闻</li>

            <li>新闻新闻</li>

            <li>新闻新闻</li>

            <li>新闻新闻</li>

        </ul>

        <ul v-show="'直播'==info">

            <li>直播直播</li>

            <li>直播直播</li>

            <li>直播直播</li>

            <li>直播直播</li>

            <li>直播直播</li>

            <li>直播直播</li>

            <li>直播直播</li>

            <li>直播直播</li>

            <li>直播直播</li>

            <li>直播直播</li>

        </ul>

    </div>

</body>

</html>

<script>

    //创建实例

    var vm = new Vue({

        el: "#app",

        data: {

            info: "直播"

        },

        //书写标签事件处理函数地方

        methods: {

            //事件处理函数add

            add(a) {

                //修改Vue实例属性值即可

                this.info = a;

            }

        },

    })

</script>
```

### 2.3 v-if

概述：v-if根据属性值为真假进行渲染标签。

注：它和v-show区别：显示与隐藏的标签（在节点树上始终是有的）

v-if控制标签在节点树上上树、下树操作。

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <div id="app">

        <h1>你的姓别是什么呀?</h1>

        <ul>

            <li v-if="'男'==sex">男</li>

            <li v-else-if="'女'==sex">女</li>

            <li v-else>未知</li>

        </ul>

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        el: "#app",

        data: {

            sex: "未知"

        }

    })

</script>
```

### 2.4 v-for*****

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <div id="app">

        <h1>非常常用的指令v-for</h1>

        <h1>循环语句遍历数字</h1>

        <h2 v-for="item in 2">我是二级标题{{item}}</h2>

        <h1>循环语句遍历数组</h1>

        <ul>

            <li v-for="(item , index) in arr">{{item}}----{{index}}</li>

        </ul>

        <table>

            <tr v-for="row in 9">

                <td v-for="col in 9">小明</td>

            </tr>

        </table>

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        el: "#app",

        data: {

            arr: ['吃饭', '睡觉', '打豆豆']

        }

    })

</script>
```

//v-for小练习

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <div id="app">

        <p><input type="text" v-model="hobby"><button @click="add">单击我添加爱好</button></p>

        <ul>

            <li v-for="item in arr">{{item}}</li>

        </ul>

    </div>

</body>

</html>

<script>

    //创建实例

    var vm = new Vue({

        el: "#app",

        data: {

            arr: ['吃饭', '睡觉', '打豆豆'],

            hobby: ''

        },

        methods: {

            add() {

                //向数组尾出添加元素

                vm.arr.push(this.hobby);

                //文本制空

                vm.hobby = '';

            }

        },

    })

</script>
```

### 2.5 v-on**

概述：这个指令可以给元素绑定事件。V-on简写方式即为@；

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <div id="app">

        <h1>我是计数器小案例{{count}}</h1>

        <button v-on:click="add">单击我+1</button>

        <button @click="minus">单击我-1</button>

        <p @mouseenter="haha">我绑定鼠标移上</p>

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        el: "#app",

        data: {

            count: 1

        },

        //事件处理函数地方

        methods: {

            //加上1事件处理函数

            add() {

                this.count++;

                //设置上限

                this.count = this.count >= 10 ? 10 : this.count;

            },

            minus() {

                this.count--;

                this.count = this.count <= -6 ? -1000000 : this.count;

            },

            haha() {

                alert("鼠标在我上面");

            }

        },

    })

</script>
```

-   Methods这里是书写标签事件处理函数地方,一定要注意函数名字务必要准确



### 2.6v-model**

概述：v-model这个指令，只能给表单元素使用【给非表单元素使用也可以，但是没有任何效果】。

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <div id="app">

        <h1>我是实例属性值{{msg}}</h1>

        <input type="text" v-model="msg">

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        el: "#app",

        data: {

            msg: "我是实例数据"

        }

    })

</script>
```



## 总结

复习一下指令:

v-text：简写为双大括号（渲染DOM文本）

v-html:可以渲染DOM文本（可以将标签形式字符串转换为标签）

v-if：通过标签上树、下树形式控制节点显示与隐藏

v-show：通过display这个属性，控制标签显示与隐藏

v-model：数据双向绑定（表单元素使用）

v-for:遍历

v-on：简写为@可以给元素绑定事件

v-bing：动态绑定属性值(简写为:)



## 1.1调色板



HTML5中新增的一些表单元素：

HTML5【即为超文本标记语言第五次重大修改，这次修改的时间为2014】新增了很多标签元素：

如下：

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

    <form>

        <p>

            <!-- placeholder:占位符属性 -->

            文本框: <input type="text" placeholder="请你输入用户名">

        </p>

        <p>

            单选按钮:

            <input type="radio" name="hobby">吃饭

            <input type="radio" name="hobby">睡觉

            <input type="radio" name="hobby">打豆豆

        </p>

        <p>

            复选按钮

            <input type="checkbox">飞机

            <input type="checkbox">大炮

            <input type="checkbox">坦克

        </p>

        <hr>

        <p>

            <!-- min：设置范围条最小数值 max最大数值 -->

            范围条: <input type="range" min="0" max="255" value="0">

        </p>

        <p>

            颜色表单元素: <input type="color">

        </p>

        <p>

            日历表单元素： <input type="date">

        </p>

        <p>

            第几周日历:<input type="week">

        </p>

        <p>

            搜索的表单元素： <input type="search">

        </p>

        <p>

            地址格式表单元素:(表单元素输入文本务必符合URL格式)

            <input type="url">

        </p>

        <p>

            邮箱格式：（表单元素的文本务必符合邮箱格式）

            <input type="email">

        </p>

        <p>

            输入密码的表单元素

            <input type="password">

        </p>

        <p>

            <input type="submit">

        </p>

    </form>

</body>

</html>
```

//调色板代码

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <!-- 模板 -->

    <div id="app">

        <!-- 颜色变化元素 -->

        <div :style="{width:'400px',height:'100px',background:`rgb(${R},${G},${B})`}"></div>

        <!-- 三个范围条 -->

        <p>

            R: <input type="range" min="0" max="255" value="0" v-model="R"><span>{{R}}</span>

        </p>

        <p>

            G: <input type="range" min="0" max="255" value="0" v-model="G"><span>{{G}}</span>

        </p>

        <p>

            B: <input type="range" min="0" max="255" value="0" v-model="B"><span>{{B}}</span>

        </p>

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        //配置对象

        // 挂载点设置[设置Vue可以管理区域]

        el: "#app",

        data: {

            R: 0,

            G: 0,

            B: 0

        }

    })

</script>
```

## 1.2微博发布框效果

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

    <style>

        * {

            margin: 0;

            padding: 0;

        }

        .cur {

            animation: donghua 2s linear 0s infinite;

        }

        @-webkit-keyframes donghua {

            from {

                transform: rotate(0deg);

            }

            to {

                transform: rotate(360deg);

            }

        }

    </style>

</head>

<body>

    <!-- 模板 -->

    <div id="app" class="cur">

        <!-- 多行文本框 -->

        <textarea cols="30" rows="10" v-model="info"></textarea><span>{{info.length}}/140字</span>

        <p>

            <button :disabled='info.length==0||info.length>140'>发布</button>

            <button @click="clear">清除</button>

        </p>

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        // 配置对象

        el: "#app",

        data: {

            info: ''

        },

        methods: {

            //事件处理函数

            clear() {

                this.info = '';

            }

        },

    })

</script>
```

## 1.3animation ******

概述:animation是CSS3中新增的动画样式，它的使用类似于函数，分为两步：声明和调用。

Animation这个属性可以让程序员在样式当中完成动画效果。

注意：以前让元素运动一般都是需要通过JS【比如：JQ】

浏览器私有前缀：

-------- ------ ------------ ------
  谷歌     微软   火狐浏览器   欧朋
  webkit   ms     Moz          o
-------- ------ ------------ ------

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

        div {

            position: relative;

            width: 300px;

            height: 150px;

            background-color: cyan;

            /* 调用动画 */

            /* 

              第一个参数：动画名称

              第二个参数：每一次动画执行时间（S||MS）

              第三个参数：动画执行速率

              第四个参数：第一次动画延迟时间

              第五个参数：动画执行次数（infinite:代表动画执行无数次）

             */

            animation: erha 3s linear 0s infinite;

        }

        /* animation动画声明部分 */

        /* webkit代表谷歌浏览器私有前缀：这个动画只能在谷歌浏览器中使用 */

        @-webkit-keyframes erha {

            from {

                left: 0px;

                background-color: cyan;

                border-radius: 0px 0px 0px 0px;

                font-size: 16px;

            }

            to {

                left: 600px;

                background-color: red;

                font-size: 30px;

                border-radius: 0px 0px 100px 0px;

            }

        }

    </style>

</head>

<body>

    <div>我爱你</div>

</body>

</html>

## 1.4watch监听属性

概述：Vue框架当中给我们的配置对象当中可以进行监听属性值变化。

​```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <!-- 模板 -->

    <div id="app">

        <h1>{{msg}}</h1>

        <input type="text" v-model="msg">

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        // 挂载点设置

        el: "#app",

        data: {

            msg: ""

        },

        // 监听实例属性值变化地方

        watch: {

            //watch可以监听实例属性值变化

            //watch这里书写函数名字务必和监听属性名字要统一

            msg() {

                console.log("你发生变化了");

            }

        },

    })

</script>
```

## 1.4 百度预搜索效果

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <div id="app">

        {{url}}

        <h1>请你输入想搜索的内容: <input type="text" v-model="url"></h1>

        <ul>

            <li v-for="item in arr">{{item}}</li>

        </ul>

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        //挂载点设置

        el: "#app",

        data: {

            url: "",

            arr: []

        },

        //监听url属性值变化

        watch: {

            //函数名字务必和监听属性名字一直

            url(a) {

                //这个函数在监听的属性值发生变化的时候回立即执行一次

                //会将最新的数值给我们作为实参注入

                //请求网址拼接

                var path = "https://sp0.baidu.com/5a1Fazu8AA54nxGko9WTAnF6hhy/su?wd=" + a + "&cb=a";

                //JSONP跨域拉去数据

                //实现原理：

                //利用script标签src属性

                //利用函数声明+调用放在两个不同服务器上面

                //动态创建script

                var script = document.createElement("script");

                //设置script标签的src属性值

                script.src = path;

                //标签上树将请求发出去

                document.body.appendChild(script);

            }

        },

    });

    //声明一个同名函数

    function a(obj) {

        console.log(obj);

        //修改vue实例的arr属性值

        vm.arr = obj.s;

    }

</script>


<!-- JSONP跨域原理：利用script标签src属性（天生就跨域） -->
```



## Vue下

重要知识点：

1：生命周期函数

2：Vue当中使用AJAX技术

3：Vue组件

4: Vue当中通信方式

5：明星小案例



## 2.1 生命周期函数

概述：在Vue实例和模板DOM标签进行关联的时候，其实这个阶段经历很多种状态，

可以通过Vue框架提供生命周期函数，可以在不同的状态下，书写自己业务代码即可。

注意：在特定的条件下执行函数而已。（面试常问道：八个）

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <!-- 模板 -->

    <div id="app">

        <h1>生命周期函数-----{{msg}}</h1>

        <button @click="add">单击我我加上1</button>

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        //配置对象

        //挂载点

        el: "#app",

        // 数据

        data: {

            msg: 1

        },

        //事件处理函数

        methods: {

            //事件处理函数

            add() {

                this.msg++;

            }

        },

        //监听属性地方

        watch: {},

        //生命周期函数

        beforeCreate() {

            //在创建实例之前执行一次，这里访问不到实例data数据

            console.log("在创建vm之前执行一次");

            // console.log(this.msg);

        },

        created() {

            //在实例创建完毕以后立即执行一次

            console.log("在创建vm之后执行一次");

            // console.log(this.msg);

        },

        beforeMount() {

            //在实例创建完毕且和模板进行关联之前执行一次

            console.log("我是VM即将和模板进行关联");

        },

        /*************************/

        mounted() {

            //实际工作当中经常从这个生命周期函数拉去服务器数据

            console.log("我是VM我已经和模板关联完毕");

            // console.log(this.msg);

        },

        beforeUpdate() {

            console.log("当数据发生变化时候立即执行一次");

            if (this.msg % 2 == 0) {

                this.msg += 6;

            }

        },

        updated() {

            console.log("当数据发生改变以后立即执行一次");

            if (this.msg < 10) {

                this.msg = "哈哈哈";

            }

        },

    })

</script>
```

## 2.2 Vue当中AJAX技术实现

概述：AJAX：它是前端当中一门技术，客户端可以悄悄的想服务器端发起上行请求，服务器端接收到请求做出响应的响应，

在页面没有重新加载的情况下实现页面局部更新。

Vue2.0版本以后，当时Vue当中AJAX技术，经常使用axios第三放实现AJAX技术（底层使用promise进行封装）。



axios:它是Vue当中经常使用第三方JavaScript函数库，它主要作用是可以向服务器端发起请求。

下载axios源码方式：

CDN：百度静态资源库（百度公司给提供网站：各种常用前端源码文件都有）

<https://www.bootcdn.cn/>

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

    <script src="./js/axios.js"></script>

    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>

</head>

<body>

    <div id="app">

        <h1>{{msg}}</h1>

        <button @click="fetchData">单击我发起GET</button>

        <button @click="psotData">单击我法七POST</button>

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        //挂载点

        el: "#app",

        data: {

            msg: "默认文本"

        },

        methods: {

            //通过GET请求拉去服务器数据

            fetchData() {

                //发起GET请求，拉去服务器新闻数据

                axios.get("./data.txt").then((obj) => {

                    this.msg = obj.data;

                });

            },

            psotData() {

                //发起POST请求，拉去服务器数据

                // axios.post("./data.txt").then((obj) => {

                //     this.msg = obj.data;

                // })

                $.post("./data.txt", (data) => {

                    this.msg = data;

                });

            }

        },

    })

</script>
```

## 2.3 生命周期函数结合axios一起使用

```html
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Document</title>

    <!-- 引包 -->

    <script src="./js/axios.js"></script>

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <div id="app">

        <ul>

            <li v-for="item in postList">{{item.name}}</li>

        </ul>

    </div>

</body>

</html>

<script>

    //创建Vue实例

    var vm = new Vue({

        //挂载点

        el: "#app",

        data: {

            postList: []

        },

        //生命周期函数:实例已经和模板挂在完毕

        mounted() {

            //向服务器拉去数据

            axios.get("./jieyong.txt").then(obj => {

                //修改实例postList属性值

                this.postList = obj.data.postList;

            })

        },

    })

</script>
```

## 2.4 组件开发

组件：component

概述：React、Vue框架开发离不开组件是开发。

到底什么是组件啊？

答：在程序当中经常出现功能类似结构且重复结构，就可以利用组件进行开发；





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

        p {

            float: left;

            width: 100px;

            height: 100px;

            background-color: cyan;

            margin-right: 10px;

        }

    </style>

    <!-- 引包 -->

    <script src="./js/vue.min.js"></script>

</head>

<body>

    <!-- 模板 -->

    <div id="app">

        <!-- 用标签形式使用组件 -->

        <jch></jch>

        <gen></gen>

        <say-call></say-call>

        <go></go>

    </div>

    <hr>

    <!--下面这里是组件模板 -->

    <template id="erha">

        <div>

            <p @click="add">{{msg}}</p>

        </div>

    </template>

    <template id="gen">

        <div>

            <ul>

                <go></go>

                <li v-for="item in arr">{{item}}</li>

            </ul>

        </div>

    </template>

    <template id="memeda">

        <div>

            <go></go>

            <h1>我是么么打</h1>

        </div>

    </template>

    <template id="go">

        <div>

            <a href="http://www.sina.com">新浪</a>

        </div>

    </template>

</body>

</html>

<script>

    //全局组件

    Vue.component("go", {

        template: "#go"

    })

    //创建Vue实例

    var vm = new Vue({

        //挂载点

        el: "#app",

        //根组件数据

        data: {},

        methods: {},

        watch: {},

        //局部组件需要注册

        components: {

            //组件名字

            jch: {

                //jch组件模板

                template: "#erha",

                //jch组件数据

                data() {

                    console.log(123);

                    //组件数据务必要有返回值

                    return {

                        msg: 1

                    }

                },

                //事件处理函数地方

                methods: {

                    //jch组件事件处理函数地方

                    add() {

                        this.msg++;

                    }

                }

            },

            gen: {

                // gen组件的模板

                template: "#gen",

                data() {

                    return {

                        arr: [1, 2, 3, 4, 5]

                    }

                }

            },

            // 组件名字不能是以后标签名字

            div: {

                template: "#gen"

            },

            sayCall: {

                template: "#memeda"

            }

        }

    });

    //Vue当中组件分为两种：

    //局部组件务必需要在compoents里面进行注册

    //使用的时候当中一个自定义标签即可

    //注意组件名字不能瞎写：不能是以后标签名字

</script>
```





