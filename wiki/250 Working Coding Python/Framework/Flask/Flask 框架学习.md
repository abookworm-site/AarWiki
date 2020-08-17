# Flask 框架学习

## Flask程序运行过程：
1. 所有Flask程序必须有一个程序实例。

2. Flask调用视图函数后，会将视图函数的返回值作为响应的内容，返回给客户端。一般情况下，响应内容主要是字符串和状态码。
当客户端想要获取资源时，一般会通过浏览器发起HTTP请求。此时，Web服务器使用WSGI（Web Server Gateway Interface）协议，把来自客户端的所有请求都交给Flask程序实例。
	- WSGI是为 Python 语言定义的Web服务器和Web应用程序之间的一种简单而通用的接口，
	- 它封装了接受HTTP请求、解析HTTP请求、发送HTTP，响应等等的这些底层的代码和操作，使开发者可以高效的编写Web应用。

3. 程序实例使用Werkzeug来做路由分发（URL请求和视图函数之间的对应关系）。根据每个URL请求，找到具体的视图函数。 

4. 在Flask程序中，路由的实现一般是通过程序实例的route装饰器实现。route装饰器内部会调用add_url_route()方法实现路由注册。

5. 调用视图函数，获取响应数据后，把数据传入HTML模板文件中，模板引擎负责渲染响应数据，然后由Flask返回响应数据给浏览器，最后浏览器处理返回的结果显示给客户端。



## 1.	HTTP通信与Web框架

### 1.1 流程

客户端将请求打包成HTTP的请求报文（HTTP协议格式的请求数据）
采用TCP传输发送给服务器端
服务器接收到请求报文后按照HTTP协议进行解析
服务器根据解析后获知的客户端请求进行逻辑执行
服务器将执行后的结果封装成HTTP的响应报文（HTTP协议格式的响应数据）
采用刚才的TCP连接将响应报文发送给客户端
客户端按照HTTP协议解析响应报文获取结果数据

### 1.2 细节

客户端不一定是浏览器，也可以是PC软件、手机APP、程序
根据服务器端的工作，将其分为两部分：
服务器：与客户端进行tcp通信，接收、解析、打包、发送http格式数据
业务程序：根据解析后的请求数据执行逻辑处理，形成要返回的数据交给服务器
服务器与Python业务程序的配合使用WSGI协议

### 1.3 Web框架

能够被服务器调用起来，根据客户端的不同请求执行不同的逻辑处理形成要返回的数据的 程序

核心：实现路由和视图（业务逻辑处理）

### 1.4 框架的轻重

重量级的框架：为方便业务程序的开发，提供了丰富的工具、组件，如Django

轻量级的框架：只提供Web框架的核心功能，自由、灵活、高度定制，如Flask、Tornado

### 1.5 明确Web开发的任务

视图开发：根据客户端请求实现业务逻辑（视图）编写
模板、数据库等其他的都是为了帮助视图开发，不是必备的



## 2. 认识Flask

### 2.1 简介

Flask诞生于2010年，是Armin ronacher（人名）用Python语言基于Werkzeug工具箱编写的轻量级Web开发框架。它主要面向需求简单的小应用。

Flask本身相当于一个内核，其他几乎所有的功能都要用到扩展（邮件扩展Flask-Mail，用户认证Flask-Login），都需要用第三方的扩展来实现。比如可以用Flask-extension加入ORM、窗体验证工具，文件上传、身份验证等。Flask没有默认使用的数据库，你可以选择MySQL，也可以用NoSQL。其 WSGI 工具箱采用 Werkzeug（路由模块） ，模板引擎则使用 Jinja2 。

可以说Flask框架的核心就是Werkzeug和Jinja2。

Python最出名的框架要数Django，此外还有Flask、Tornado等框架。虽然Flask不是最出名的框架，但是Flask应该算是最灵活的框架之一，这也是Flask受到广大开发者喜爱的原因。

### 2.2 与Django对比

django提供了：
django-admin快速创建项目工程目录
manage.py 管理项目工程
orm模型（数据库抽象层）
admin后台管理站点
缓存机制
文件存储系统
用户认证系统

而这些，flask都没有，都需要扩展包来提供

### 2.3 Flask扩展包：

- Flask-SQLalchemy：操作数据库；
- Flask-migrate：管理迁移数据库；
- Flask-Mail:邮件；
- Flask-WTF：表单；
- Flask-script：插入脚本；
- Flask-Login：认证用户状态；
- Flask-RESTful：开发REST API的工具；
- Flask-Bootstrap：集成前端Twitter Bootstrap框架；
- Flask-Moment：本地化日期和时间；

### 2.4 Flask文档

- 中文文档： http://docs.jinkan.org/docs/flask/
- 英文文档： http://flask.pocoo.org/docs/0.11/



## 3. 创建虚拟环境

虚拟环境是一个互相隔离的目录

1.	mkvirtualenv flask_py2
2.	pip install flask==0.10.1

pip freeze > requirements.txt
pip install –r requirements.txt



## 4. Flask的Hello world程序

### 4.1 Flask创建app对象

4.1.1 初始化参数
import_name: 导入路径，寻找静态模板与静态目录的路径
static_url_path: 
static_folder: 默认‘static’
template_folder: 默认‘templates’
4.1.2 配置参数
app.config.from_pyfile(“yourconfig.cfg”) 或
app.config.from_object(类名)

app.config[“DEBUG”] = True
4.1.3 在视图读取配置参数
app.config.get()  或者 current_app.config.get()
4.1.4 app.run的参数
app.run(host=”0.0.0.0”, port=5000, debug=True)



### 4.2 路由

4.2.1 app.url_map 查看所有路由
Print(app.url_map)
 


4.2.2 同一路由装饰多个视图函数

4.2.3 同一视图多个路由装饰器

4.2.4 利用methods限制访问方式
@app.route('/sample', methods=['GET', 'POST'])
4.2.5 使用url_for进行反解析

4.2.5 动态路由


4.2.5 自定义转换器

### 4.3 获取请求参数

from flask import request

就是 Flask 中表示当前请求的 request 对象，request对象中保存了一次HTTP请求的一切信息。

4.3.1 上传文件
已上传的文件存储在内存或是文件系统中一个临时的位置。你可以通过请求对象的 files 属性访问它们。每个上传的文件都会存储在这个字典里。它表现近乎为一个标准的 Python file 对象，但它还有一个 save() 方法，这个方法允许你把文件保存到服务器的文件系统上。这里是一个用它保存文件的例子:


如果你想知道上传前文件在客户端的文件名是什么，你可以访问 filename 属性。但请记住， 永远不要信任这个值，这个值是可以伪造的。如果你要把文件按客户端提供的文件名存储在服务器上，那么请把它传递给 Werkzeug 提供的 secure_filename() 函数:

### 4.4 abort函数与自定义异常处理

4.4.1 abort函数
from flask import abort
4.4.2 自定义异常处理
@app.errorhandler(404)
def error(e):
    return '您请求的页面不存在了，请确认后再次访问！%s'%e

### 4.5 返回的响应数据 

4.5.1 元组
可以返回一个元组，这样的元组必须是 (response, status, headers) 的形式，且至少包含一个元素。 status 值会覆盖状态代码， headers 可以是一个列表或字典，作为额外的消息标头值。

4.5.2 make_response

```py
From flask import make_response
resp = make_response()

# 设置响应头
resp.headers[“sample”] = “value”
# 设置状态码
resp.status = “404 not found”
```

### 4.6 使用jsonify返回json数据

- `dict -> json` : json.dumps(字典)
- `str->dict` : json.loads(str)

```py
from flask import jsonify
data = {
	“name”: “python”,
	“age”: 24
}

# 帮助转换为jsonify，
return jsonify(data)
```
4.5 重定向
from flask import redirect

4.6 设置和读取cookie
make_response

set_cookie(key, value=’’, max_age=None)

delete_cookie(key)

### 4.7 session

from flask import session

需要设置secret_key

### 4.8 请求上下文与应用上下文

全局变量request: 线程局部变量

```py
Request = {
	“线程A” : {
		Form: {“name”: “zhangsan”}
		Args:…
	}
}
```
请求上下文(request context)  
request和session都属于请求上下文对象。

应用上下文(application context)
current_app和g都属于应用上下文对象。
-	G变量：可以添加属性，就是一个空容器
-	一次请求之内的，再次请求就清空
current_app:表示当前运行程序文件的程序实例。
g:处理请求时，用于临时存储的对象，每次请求都会重设这个变量。

### 4.9 请求钩子 hook

请求钩子是通过装饰器的形式实现，Flask支持如下四种请求钩子：

before_first_request：在处理第一个请求前运行。

@app.before_first_request
Def handle_before_first_request():
	…




before_request：在每次请求前运行。

after_request(response)：如果没有未处理的异常抛出，在每次请求后运行。

teardown_request(response)：在每次请求后运行，即使有未处理的异常抛出。
-	无论有没有异常
-	需要有返回值，return response
-	其中,response是视图函数的返回值，打包为response.

所有的钩子对所有的视图函数都会被执行，
使用其内部的request.path，可以作为视图函数的区分



If request.path in [url_for(), url_for(),…..]:
	….



## 5. Flask-Script扩展命令行

```py
pip install Flask-Script
```



## 6. Jinja2模板

### 6.1 基本流程

使用flask 中的render_template渲染模板

### 6.2 变量

### 6.3 过滤器

6.3.1 字符串过滤器

```
safe：禁用转义；
  <p>{{ '<em>hello</em>' | safe }}</p>
```

Xss 攻击：前端注入脚本被执行。
capitalize：把变量值的首字母转成大写，其余字母转小写；
  <p>{{ 'hello' | capitalize }}</p>

lower：把值转成小写；
  <p>{{ 'HELLO' | lower }}</p>

upper：把值转成大写；
  <p>{{ 'hello' | upper }}</p>

title：把值中的每个单词的首字母都转成大写；
  <p>{{ 'hello' | title }}</p>

trim：把值的首尾空格去掉；
  <p>{{ ' hello world ' | trim }}</p>

reverse:字符串反转；
  <p>{{ 'olleh' | reverse }}</p>

format:格式化输出；
  <p>{{ '%s is %d' | format('name',17) }}</p>

striptags：渲染之前把值中所有的HTML标签都删掉；
  <p>{{ '<em>hello</em>' | striptags }}</p>

6.3.2 支持链式使用过滤器
<p>{{ “ hello world  “ | trim | upper }}</p>
6.3.3 列表过滤器
first：取第一个元素
  <p>{{ [1,2,3,4,5,6] | first }}</p>

last：取最后一个元素
  <p>{{ [1,2,3,4,5,6] | last }}</p>

length：获取列表长度
  <p>{{ [1,2,3,4,5,6] | length }}</p>

sum：列表求和
  <p>{{ [1,2,3,4,5,6] | sum }}</p>

sort：列表排序
  <p>{{ [6,2,3,1,5,4] | sort }}</p>

6.3.4 自定义过滤器
自定义的过滤器名称如果和内置的过滤器重名，会覆盖内置的过滤器。

方式一：
	通过 add_template_filter (过滤器函数, 模板中使用的过滤器名字)


方式二：
	通过装饰器  app.template_filter (模板中使用的装饰器名字)

### 6.4 表单

使用Flask-WTF表单扩展，可以帮助进行CSRF验证，帮助我们快速定义表单模板，而且可以帮助我们在视图中验证表的数据

pip install Flask-WTF
6.4.1 不使用Flask-WTF扩展时，表单需要自己处理

6.4.2 使用Flask-WTF扩展
需要设置 SECRET_KEY 的配置参数

模板页：


视图函数

### 6.5 控制语句

6.5.1 if语句

```html
{% if %} {% endif %}
```
6.5.2 for语句
```
{% for item in samples %} {% endfor %}
```



### 6.6 宏

类似于python中的函数，宏的作用就是在模板中重复利用代码，避免代码冗余。

#### 6.6.1 不带参数宏的定义与使用
定义：
{% macro input() %}
  <input type="text"
         name="username"
         value=""
         size="30"/>
{% endmacro %}

使用
{{ input() }}

#### 6.6.2 带参数宏的定义与使用

1. 定义
```html
{% macro input(name,value='',type='text',size=20) %}
    <input type="{{ type }}"
           name="{{ name }}"
           value="{{ value }}"
           size="{{ size }}"/>
{% endmacro %}
```

2. 使用
```html
{{ input(value='name',type='password',size=40)}}
```

#### 6.6.3 将宏单独封装在html文件中

1. 文件名可以自定义 `macro.html`

```html
{% macro input() %}

    <input type="text" name="username" placeholde="Username">
    <input type="password" name="password" placeholde="Password">
    <input type="submit">

{% endmacro %}
```

2. 在其它模板文件中先导入，再调用

```
{% import 'macro.html' as func %}
{{ func.input() }}
```

### 6.4 模板继承
> html doc

extend



### 6.5 模板包含

include

### 6.6 flask在模板中使用特殊变量和方法

6.6.1 config

6.6.2 request

6.6.3 url_for 



## 数据库


数据库命名规范：
1. 项目名缩写_表名
	
	- ihome --> ih_user
2. tbl_表名
	- tbl_user
	- 
	
	
	
```py






# manager 是flask-script的实例，添加一条 "db"(名字) 命令
manager.add_command("db", MigrateCommand)








```

### 操作命令
```
# 初始化命令, 生成数据库迁移文件夹
python main_file.py db init

# 生成迁移文件
python main_file.py db migrate

# or
python main_file.py db migrate -m "更新数据说明注释在这里"

# 更新数据库
python main_file.py db upgrade

# 查看数据库迁移版本说明
python main_file.py db history

# 数据库版本回退
python main_file.py db downgrade ee602d992e79
```



## 文件操作

```
from flask import Flask
from flask_mail import Mail, Message


app = Flask(__name__)

# 配置邮件
app.config.upate(
	DEBUG = True,
	MAIL_SERVER = "smtp.qq.com",
	MAIL_PORT = 465,
	MAIL_USE_TLS = True,
	MAIL_USERNAME = "XXXX@outlook.com",
	MAIL_PASSWORD = "sfdkj"
)

mail = Mail(app)


@app.route("/")
def index():
	msg = Message("This is a test", sender="sdsfasdf@outlook.com", recipients=["sfsdf@outlook.com", "sdfasd@outlook.com"])
	
	# 邮件内容
	msg.body = "Flask test mail"
	
	# 发送邮件
	mail.send(msg)
	
	print("Mail sent")
	return "Sent Succeed"
	

if __name__ == "__main__":
	app.run(debug=True)
```



## 蓝图


### Python 基本解决

Python 自身语法进行解析时会出现循环导入的问题：

1. 推迟一方的导入，让另一方先完成。

2. 将装饰器后补充，视图函数中只定义相应的函数定义。

> goods.py
```py
def get_goods():
	return "Get goods page"
```

> user.py
```py
def register():
	return "User register page"
```

> main.py
```
from flask import Flask
from goods import get_goods
from users import register


app = Flask(__name__)

# 补充视图函数的装饰器
app.route("/get_goods")(get_goods)
app.route("/register")(register)

@app.route("/")
def index():
	return "index page"


if __name__ == "__main__":
	print(app.url_map)
	app.run(debug=True)
```

### 蓝图解决

> orders.py

```py

from flask import Blueprint

# 创建蓝图，一个小模块的抽象概念
app_orders = Blueprint("app_orders", __name__, template_folder="templates")


@app_orders.route("/get_orders")
def get_orders():
	return "order Page"
	
```


> main.py
```py
from flask import Flask
from goods import get_goods
from users import register

from orders import app_orders


app = Flask(__name__)

# 补充视图函数的装饰器
app.route("/get_goods")(get_goods)
app.route("/register")(register)

# 注册蓝图
app.register_blueprint(app_orders)

# 注册蓝图时，可以添加前缀
app.register_blueprint("/orders")

@app.route("/")
def index():
	return "index page"


if __name__ == "__main__":
	print(app.url_map)
	app.run(debug=True)
```



### 拆分目录之后

> `cart` - `__init__.py`
```py
#coding=utf-8


from flask import Blueprint

# 创建蓝图
# “app_cart": 装饰器应用名称
# `__name__`: 定义此文件所在的小项目目录
# `template_folder`: 模板文件目录定义，并且先以主应用程序的模板文件目录为主，而后再查找此项目中的模板文件目录
# `static_folder`: 同上。。。
app_cart = Blueprint("app_cart", __name__, template_folder="template", static_folder="static")

# 在此文件被执行的时候，将视图加载进来，让蓝图和应用程序明晰视图的存在
from .views import get_cart
```




### CSRF 验证机制


同源策略：限制了不同源的网站不能相互操作资源。


CSRF 攻击：黑客伪造用户的操作指令，从而欺骗到服务器的过程。

例如：
1. 正常情况下，用户发送向银行发送转账的请求。ok
2. 用户在不知情的情况下，访问黑客制造的夹杂了非法请求表单的页面。从而使用户在不知情的情况下发送了向银行转账的请求。从而从中获利。

CSRF验证：

验证机制：
1. 从cookie中获取一个csrf_token的值，再从请求体中获取另一个csrf_token的值
	- 相同：ok
	- 不同：failed, 向前端发送400状态码的错误

即：
在黑客伪造的表单之中验证csrf_token数据，由于浏览器的同源策略机制，黑客无法获取该csrf_token密钥。从而无法通过验证。











