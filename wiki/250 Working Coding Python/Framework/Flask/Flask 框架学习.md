# Flask 框架学习

## 1. HTTP通信与Web框架

### 1.1 流程

- 客户端将请求打包成 **HTTP** 的 **请求** 报文（HTTP协议格式的请求数据）
- 采用 `TCP` 传输 **发送** 给服务器端
- 服务器接收到请求报文后按照HTTP协议进行 **解析**
- 服务器根据解析后获知的客户端请求进行 **逻辑执行**
- 服务器将执行后的 **结果封装** 成HTTP的响应报文（HTTP协议格式的响应数据）
- 采用刚才的TCP连接将响应报文 **回送** 给客户端
- 客户端按照HTTP协议 **解析** 响应报文 **获取结果** 数据



### 1.2 细节

- 客户端：不一定是浏览器，也可以是PC软件、手机APP、程序
- 根据服务器端的工作，将其分为两部分：
    - 服务器：与客户端进行 `TCP` 通信，接收、解析、打包、发送 `HTTP` 格式数据
    - 业务程序：根据解析后的请求数据执行逻辑处理，形成要返回的数据交给服务器
    - 服务器与Python业务程序 `如Django/Flask/Tornado等` 的配合使用 `WSGI`协议



### 1.3 Web框架

Why：避免重复造轮子

定义：能够被服务器调用起来，根据客户端的不同请求执行不同的逻辑处理形成要返回的数据的程序

核心：实现路由和视图（业务逻辑处理）



### 1.4 框架的轻重

- 重量级的框架：为方便业务程序的开发，提供了丰富的工具、组件，如 `Django`

- 轻量级的框架：只提供Web框架的核心功能，自由、灵活、高度定制，如 `Flask`、`Tornado`



### 1.5 明确Web开发的任务

Web 开发的重点任务就是：**视图开发**，即：**根据客户端请求实现业务逻辑（视图）编写**。模板、数据库等其他的都是为了帮助视图开发，不是必备的。



## 2. 认识Flask

### 2.1 简介

Python 最出名的框架要数Django，此外还有Flask、Tornado等框架。虽然Flask不是最出名的框架，但是Flask应该算是最灵活的框架之一。

Flask诞生于2010年，是 Armin ronacher（人名）用 Python 语言基于Werkzeug工具箱编写的轻量级Web开发框架。它主要 **面向需求简单的小应用**。

Flask本身相当于一个内核，其他几乎所有的功能都要用到 **扩展**（邮件扩展Flask-Mail，用户认证Flask-Login），都需要用第三方的扩展来实现。

- 比如可以用 `Flask-extension` 加入ORM、窗体验证工具，文件上传、身份验证等。
- Flask没有默认使用的数据库，你可以选择 `MySQL`，也可以用 `NoSQL`。
- 其 WSGI 工具箱采用 Werkzeug（路由模块） 
- 模板引擎则使用 Jinja2 。

可以说：Flask框架的核心就是 **Werkzeug** 和 **Jinja2**。



### 2.2 Flask 程序运行过程

1. 首先，所有 Flask 程序必须实现一个程序实例。
2. 
    当 **客户端** 想要获取资源时，一般会通过浏览器 **发起HTTP请求**。此时，**Web服务器** 使用WSGI（Web Server Gateway Interface）协议，把来自客户端的 **所有请求都交给Flask程序实例**。
    - WSGI是为 Python 语言定义的Web服务器和Web应用程序之间的一种简单而通用的接口，
    - 它封装了接受HTTP请求、解析HTTP请求、发送HTTP，响应等等的这些底层的代码和操作，使开发者可以高效的编写Web应用。
3. Flask 程序实例使用 **Werkzeug** 来做路由分发（URL请求和视图函数之间的对应关系）。根据每个URL请求，找到具体的视图函数。 
    - 在Flask程序中，路由的实现一般是通过程序实例的 `route` 装饰器实现。
    - `route` 装饰器内部会调用 `add_url_route()` 方法实现路由注册。
4. Flask 调用视图函数，获取响应数据后，把数据传入HTML模板文件中，模板引擎负责渲染响应数据，然后由Flask返回响应数据给浏览器，最后浏览器处理返回的结果显示给客户端。
    - 一般情况下，响应内容主要是字符串和状态码。

即：

1. 服务器中的 Flask 程序运行后将会创建一个程序实例
2. 当客户端想要获取服务器中资源时，将会发送 **HTTP请求** 到服务器，此处，服务器将会通过 WSGI 协议将此请求交给 Flask 程序实例。
3. Flask 程序实例使用 `Werkzeug` 进行路由分发，依据每个URL请求找到具体的试图函数。
4. Flask 调用试图函数，获取响应请求的数据，并将数据传入 HTML 模板文件中，模板引擎负责渲染响应数据。
5. 然后，Flask 返回响应数据给浏览器
6. 最后，浏览器处理返回的结果显示给客户端。



### 2.3 与Django对比

Django 框架本身提供了：

- **django-admin** 快速创建项目工程目录
- **manage.py** 管理项目工程
- **orm** 模型（数据库抽象层）
- **admin** 后台管理站点
- 缓存机制
- 文件存储系统
- 用户认证系统

而 Flask 则全部都需要程序员利用第三方扩展包来实现。

即：Django 框架将模块大集成，以便程序员能够简单配置便可以快速部署产品上线，通过降低开发难度来提升开发效率，而 Flask 可定制性强，可扩展性强，灵活性高。需要程序员自身实现高度定制化的应用程序。



### 2.4 Flask扩展包

- Flask-SQLalchemy：操作数据库；
- Flask-migrate：管理迁移数据库；
- Flask-Mail：邮件；
- Flask-WTF：表单；
- Flask-script：插入脚本；
- Flask-Login：认证用户状态；
- Flask-RESTful：开发REST API的工具；
- Flask-Bootstrap：集成前端Twitter Bootstrap框架；
- Flask-Moment：本地化日期和时间；



### 2.5 Flask文档

- 中文文档： http://docs.jinkan.org/docs/flask/
- 英文文档： http://flask.pocoo.org/docs/0.11/



## 3. 配置运行环境

### 3.1 创建虚拟环境

这里的虚拟环境使用 `virtualenv` 创建虚拟环境。



**查看系统是否安装了`virtualenv`：**

```bash
$ virtualenv --version
```



**安装虚拟环境(须在联网状态下)**

```bash
$ sudo pip install virtualenv
$ sudo pip install virtualenvwrapper
```



**安装完虚拟环境后，如果提示找不到 `mkvirtualenv` 命令，须配置环境变量：**

```bash
# 1、创建目录用来存放虚拟环境
mkdir $HOME/.virtualenvs

# 2、打开~/.bashrc文件，并添加如下：
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# 3、运行
source ~/.bashrc
```



**创建虚拟环境(ubuntu里须在联网状态下)**

```bash
$ mkvirtualenv Flask_py3
```



**进入虚拟环境**

```bash
$ workon Flask_py3
```



**退出虚拟环境**

```bash
$ deactivate Flask_py
```

- 如果所在环境为真实环境，会提示 `deactivate: 未找到命令`



### 3.2 安装Flask

```bash
# 指定Flask版本安装
$ pip install flask==0.10.1
```



### 3.3 安装Flask依赖包

依赖包

- 依赖就是开发以及程序运行需要使用的环境的集合，包括软件、插件等。
- 可把需要使用的依赖给保存在一个文件中，命名为 `requirements` 的txt文件。
- 如果需要在其它环境中运行此项目，可直接通过指令一次性安装所有依赖。



安装依赖包（须在虚拟环境中）：

```bash
$ pip install -r requirements.txt
```



生成依赖包（须在虚拟环境中）：

```bash
$ pip freeze > requirements.txt
```



在 **IPython** 中测试安装是否成功？

```bash
$ from flask import Flask
```



## 4. 视图开发**

我们这里新建一个 `Hello world`的项目，以便于代码演示。

```python
# coding:utf-8

from flask import Flask


# 创建 flask 实例
# app 接受一个参数 `__name__`，即当前模块的名称。
# app = Flask("__main__")
app = Flask(__name__)

# 使用装饰器将路由映射到视图函数index
@app.route('/')
def index():
    """定义主页视图函数"""
    return "Hello world"

if __name__ == "__main__":
    # Flask 应用程序实例的 run() 方法启动 Web 服务器
    app.run()
```

- `app = Flask(__name__)` ：
    - app 接受一个参数 `__name__`，即 `__main__`
    - app 接受参数 `__name__`后，Flask 就以此模块所在的目录为总目录。
    - 默认配置下，此目录下的 `static` 目录为 **静态目录**，`templates` 目录为模板目录



### 4.1 Flask创建APP对象

#### 4.1.1 初始化参数

```python
app = Flask(__name__, static_url_path='/python', static_folder='static', template_folder='templates')
```

- 参数`import_name` ： `__name__` 
    -  功能：导入路径，寻找静态模板与静态目录的路径
    - app 接受一个默认参数 `__name__`，即 `__main__`。即使传入未找到的其他未知参数，也以此为默认参数。
    - app 接受参数 `__name__`后，Flask 就以此模块所在的目录为总目录。
    - 此时，默认配置下目录下的 `static` 目录为 **静态目录**，`templates` 目录为模板目录

- 参数 `static_url_path`
    - 设置优先访问静态资源的 url 前缀
    - 默认：`static`
- 参数 `static_folder`
    - 设置静态文件目录
    - 默认：`static`
- 参数 `template_folder`
    - 设置模板文件目录
    - 默认：`templates`



#### 4.1.2 配置参数

**第一种：使用配置文件**

> config.cfg

```python
DEBUG = True
```

```python
# 指定一个配置文件
app.config.from_pyfile("config.cfg")
```



**第二种：从类中继承**，项目运用较多。

> Config 类

```python
class Config(object):
    """配置类"""
	Debug = True
```

```python
# 从类中继承类
app.config.from_object(class_name)
```



**第三种：直接操作 `Config` 实例对象**

```python
app.config["DEBUG"] = True
```



#### 4.1.3 在视图读取配置参数

```python
# 在视图函数中使用配置参数
# 可以直接获取 app 对象时
value = app.config.get("Key")

# 无法获得 app 对象
# 操作app代名词：current_app 获取
from flask import current_app


value2 = current_app.config.get("Key")
```



#### 4.1.4 `app.run` 参数

```python
app.run(host='0.0.0.0', port=5000, debug=True)
```

- `host='0.0.0.0'` ：本机网关都可以访问到
- `debug=True`：此处仅仅该配置参数可以在这里配置



### 4.2 路由

#### 4.2.1 查看视图函数中所有路由

```python
# 程序中直接打印 url_map
print(app.url_map)
```



使用 IPython 进行验证

```python
from hello import app
# 获取视图函数的路由
app.url_map
```



#### 4.2.2 `methods` 限制访问方式

```python
@app.route('/sample', methods=['GET', 'POST'])
```



#### 4.2.3 同一路由装饰多个视图函数

```python
@app.route('/hello', methods=["POST"])
def hello():
    return "Hello One"

@app.route('/hello', methods=["GET"])
def hello():
    return "Hello Two"
```



#### 4.2.4 同一视图多个路由装饰器

```python
@app.route('/h1')
@app.route('/h2')
def hello():
    return "Hello All"
```



#### 4.2.5 使用 `url_for` 进行反解析 & 重定向 `redirect`

```python
from flask import redirect, url_for


# 使用装饰器将路由映射到视图函数index
@app.route('/')
def index():
    """定义主页视图函数"""
    return "Hello world"


@app.route('/login')
def login():
    """登录页面视图函数"""
	# 使用 url_for() 传入视图函数名称 找到视图对应的 url 路径
    url = url_for("index")
    
    # 返回重定向 url 路径
    return redirct(url)
```

- 特别推荐使用 `url_for()` 进行 url 路径反推



#### 4.2.6 动态路由传参

动态路由可匹配指定的URL，以达到限制访问，以及优化访问路径的目的。

```python
# coding:utf-8

from flask import Flask


# 创建 flask 实例
app = Flask(__name__)

# 使用装饰器将路由映射到视图函数index
@app.route('/goods/<int:goods_id>')
def goods_detail(goods_id):
    """定义商品视图函数"""
    return "Goods detail page： %s" % goods_id

if __name__ == "__main__":
    app.run(debug=True)
```

- `<int:goods_id>` ：整个尖括号中的内容称为：转换器
    - `<int:goods_id>` ：冒号前面的内容为参数匹配类型
    - `<int:goods_id>`：冒号后面的内容是动态的，也是视图函数的传入参数
    - `<goods_id>` ：若不指定参数类型，路由传递的参数默认当做 `string` 处理（除了 `/` 的字符）

- 转换器提供的参数匹配类型
    - `string` ：默认字符串类型（除了 `/` 的字符）
    - `int` ：仅接受整数
    - `float` ：同 `int`，但是接受浮点数
    - `path` ：和默认的相似，但也接受斜线



#### 4.2.7 自定义转换器

**实现一个万能转换器**

```python
from werkzeug.routing import BaseConverter

# 1. 定义自定义的转换器
class RegexConverter(BaseConverter):
    """自定义手机匹配转换器"""
    # url_map 为默认参数，regex 为传入的正则表达式
   	def __init__(self, url_map, regex):
        # 调用父类的初始化方法
        super(RegexConverter, self).__init__(url_map)
        # 将正则表达式参数保存到对象属性，flask 会使用这个属性来进行路由的正则匹配
        self.regex = regex

# 2. 将自定义的转换器添加到 flask 应用中
# 这里自定义该转换器的名称：re
app.url_map.converters["re"] = RegexConverter

# 3. 使用自定义的转换器的名称 re 匹配动态参数
# 1270.0.1/5000/send/18612345678
@app.route("/send/<re(r'1[34578]\d{9}'):mobile>")
def send_sms(mobile):
    """定义发送短信的视图函数"""
    return "Send sms to %s" % mobile
```



**实现一个仅仅手机号的正则表达式类**

```python
from werkzeug.routing import BaseConverter

# 1. 定义自定义的转换器
class MobileConverter(BaseConverter):
    """自定义手机匹配转换器"""
    # url_map 为默认参数，regex 为传入的正则表达式
   	def __init__(self, url_map):
        # 调用父类的初始化方法
        super(RegexConverter, self).__init__(url_map)
        # 将正则表达式参数保存到对象属性，flask 会使用这个属性来进行路由的正则匹配
        self.regex = r'1[34578]\d{9}'

# 2. 将自定义的转换器添加到 flask 应用中
# 这里自定义该转换器的名称：mbl
app.url_map.converters["mbl"] = MobileConverter

# 3. 使用自定义的转换器的名称 re 匹配动态参数
# 1270.0.1/5000/send/18612345678
@app.route("/send/<mbl:mobile>")
def send_sms(mobile):
    """定义发送短信的视图函数"""
    return "Send sms to %s" % mobile
```



**自定义转换器中的钩子函数**

```python
from werkzeug.routing import BaseConverter

# 1. 定义自定义的转换器
class RegexConverter(BaseConverter):
    """自定义手机匹配转换器"""
    # url_map 为默认参数，regex 为传入的正则表达式
   	def __init__(self, url_map, regex):
        # 调用父类的初始化方法
        super(RegexConverter, self).__init__(url_map)
        # 将正则表达式参数保存到对象属性，flask 会使用这个属性来进行路由的正则匹配
        self.regex = regex
    
    def to_python(self, value):
        """
        @value: 在路径进行正则匹配后提取的参数
        @return: 默认直接返回 value
        """
        print("to_python() 被调用")
        return value
        
    def to_url(self, value):
        """url_for() 方法时调用"""
        print("to_url() 被调用")
        return value

# 2. 将自定义的转换器添加到 flask 应用中
# 这里自定义该转换器的名称：re
app.url_map.converters["re"] = RegexConverter

# 3. 使用自定义的转换器的名称 re 匹配动态参数
# 1270.0.1/5000/send/18612345678
@app.route("/send/<re(r'1[34578]\d{9}'):mobile>")
def send_sms(mobile):
    """定义发送短信的视图函数"""
    return "Send sms to %s" % mobile

@app.route('/login/')
def login():
    url = url_for("send_sms", mobile = "18911111111")
    return redirect(url)
```

- `to_python()` 方法：钩子函数，即在 url 路由访问时，调用转换器处理后，最后将调用 `to_python()` 方法，该方法的返回值（即正则/钩子处理过后的数据内容）将再传入到视图函数的参数。
- `to_url()` 方法：钩子函数。即在调用 url_for() 方法时，将传入的参数传入路径对应视图函数后，调用转换器处理后，最后会调用 `to_url()` 方法，该方法的返回值（即正则/钩子处理过后的数据内容）将传入路径跳转后的视图函数中进行匹配，之后重定向后的 url 路径返回。



### 4.3 获取请求参数

#### 4.3.1 导入全局请求对象 `request`

```python
from flask import Flask
# 导入请求对象
from flask import request


app = Flask(__name__)


@app.route('/index', methods=["GET", "POST"])
def index():
    """主页视图函数"""
    # requet.form 可以直接提取请求体中的表单格式的数据，是一个类字典的对象
    name = request.form.get("name")
    age = requetst.form.get("age")
    
    print(request.data)
    
    city = request.args.get("city")
   
    return "Hello %s, your ages are %s" % (name, age)

if __name__ == "__main__":
    app.run(debug=True)
```

-  `request`： Flask 中表示当前请求的对象
    - `request` 对象中保存了一次HTTP请求的一切信息。
- `get()` ：`get()` 方法只能拿到多个同名参数的第一个
- `getlist()`：可以拿到多个参数列表



#### 4.3.2 对象 `request` 常用属性

| 属性 | 说明 | 类型 |
| ---- | ---- | ---- |
|data|记录请求体的数据，并转换为字符串，但是除了表单数据之外的数据|*|
|form|记录请求中的表单数据|MultiDict|
|args|记录请求中的查询参数（查询字符串中的请求）|MultiDict|
|cookies|记录请求中的cookie信息|Dict|
|headers|记录请求中的报文头|EnvironHeaders|
|method|记录请求使用的HTTP方法|GET/POST|
|url|记录请求的URL地址|string|
|files|记录请求上传的文件|*|

**`request.form.get("Key")`**

若请求数据为表单格式，那么存在于 `request.form.get("Key")` 中

- 表单格式数据：`name=xxx&age=xxx&gender=xxx`



**`request.data`**

若请求数据为字符串，那么存在于 `request.data` 中

- 字符串格式数据：Json数据

- `method` 参数：区分不同访问方式进行不同的业务逻辑。



**`request.files.get("col_name")`**

1. 已上传的文件存储在内存或是文件系统中一个临时的位置。
2. 可通过请求对象的 `files` 属性访问
3. 每个上传的文件都会存储在这个字典里。其表现近乎为一个标准的 Python file 对象。即：`file_name：file_obj`
4. 该对象提供一个  `save()` 方法，允许把文件直接保存到服务器的文件系统上

```python
from flask import request


@app.route("/upload", methods=["POST"])
def upload():
    """文件上传视图函数"""
    # 获取图片
    file_obj = request.files.get("pic")
    
    # 验证
    if file_obj is None:
        return "未上传文件"
    
    # 处理：保存本地
    file_obj.save('./image.png')
    
    # 返回
    return "上传成功"
```



获取上传前文件在客户端的文件名，那么可访问 `filename` 属性

- 注意：请不要信任这个属性值，这个值是可以伪造的。



将文件按客户端提供的文件名存储在服务器上，实现：把它传递给 Werkzeug 提供的 `secure_filename()` 函数:

```python
from flask import Flask
from werkzeug import secure filename


@app.route('/upload', methods=["GET", "POST"])
def upload_file():
    if request.method = "POST":
        f = request.files['the_file']
        f.save('/uploads/' + secure_filename(f.filename))
```



### 4.4 `abort()` 函数与自定义异常处理

#### 4.4.1 abort函数

若视图函数执行过程中，出现异常错误，则使用 `abort()` 函数立即终止视图函数的执行。

通过 `abort()` 函数，可以向前端返回一个http标准中存在的 **错误状态码**，或者表示出现的 **错误信息**。

- 不要使用 `abort`抛出一个http标准中 **不存在的自定义的状态码**，没有实际意义。
- 如果 `abort()` 函数被触发，其后面的语句将不会执行。类似于python中 `raise`。

```python
from flask import Flask, abort


@app.route('/')
def hello():
    # 使用abort函数立即终止视图函数的执行，并可返回
    # 1. 传递状态码信息，且必须为 HTTP 标准状态码
    abort(404)
    
    # 2. 传递响应信息
    resp = Response("login failed")
    abort(resp)
    return 'Hello Python',999
```



#### 4.4.2 自定义异常处理

在Flask中通过装饰器来实现捕获异常，`errorhandler()` 接收的参数为异常状态码。

而自定义视图函数的参数为程序默认返回的错误信息。返回值将为前端用户看到的最终效果。

```python
@app.errorhandler(404)
def error(err):
    """自定义的错误处理方法"""
    # 该函数返回值将会在前端用户看到最终效果
    return '您请求的页面不存在了，请确认后再次访问！%s' % err
```



### 4.5 返回的响应数据 

#### 4.5.1 直接返回自定义元组

响应信息可以返回一个元组，元组必须是 `(response, status, headers)` 的形式，且至少包含一个元素。 

- `response` 响应体：必须
- `status` 状态码：该值有可能会覆盖状态代码
    - 该值可以自主定义状态码，即使这个状态码不存在。
    - 当客户端的请求已经处理完成，由视图函数决定返回给客户端一个状态码，告知客户端这次请求的处理结果。
    - 格式：`404`  or `666 my status`
- `headers` 响应头：可以是一个列表或字典，作为额外的消息标头值。
    - 格式：`[("Name", "Python"), ("City", "ShenZhen")]`

```python
from flask import Flask

@app.route('/')
def hello():
    """主页视图函数"""
    return 'Hello Python', "999 my status", [("Name", "Python"), ("City", "ShenZhen")]
    return 'Hello Python', 200, [("Name", "Python"), ("City", "ShenZhen")]
```



#### 4.5.2  使用 `make_response()` 构造信息

```python
from flask import Flask, make_response

@app.route('/')
def hello():
    """主页视图函数"""
    # 参数：响应体，可省
    resp = make_response("Index page")

	# 设置响应头
	resp.headers["sample"] = "value"
    resp.headers["City"] = "ShenZhen"
	
    # 设置状态码
	resp.status = “404 not found”

    return resp
```



#### 4.5.3 使用 `jsonify`返回json数据

- `json.dumps(字典)`：将字典转换为 json 数据
- `json.loads(str)`：将字符串转换为 字典 数据

```python
from flask import jsonify

@app.route("/index")
def index():
    """主页视图"""
	data = {
		“name”: “python”,
		“age”: 24
	}

	# 将 json 转换为字符串
    # json_str = json.dumps(data)
    # 返回响应体
	# return json_str, 200, {"Content-Type": "application/json"}
    
    # jsonify() 将数据转换为 json 数据，将响应头改变为 application/json
    return jsonify(data)
```


### 4.6 设置和读取cookie

```python
from flask import Flask, make_response, request

# 设置 cookie
@app.route('/set_cookie')
def set_cookie():
    """设置 cookie 视图函数"""
    # 设置cookie， 默认有限期是临时cookie, 浏览器关闭是失效
    resp = make_response('this is to set cookie')
    # max_age 设置有限期，单位：秒
    resp.set_cookie('username', 'python')
    resp.set_cookie("City", "ShenZhen", max_age=3600)
    
    # 操作 cookie 即是在响应头里面设置 Set-Cookie 的值
    resp.headers["Set-Cookie"] = "Name=Python"
    return resp


@app.route("/get_cookie")
def get_cookie():
    """获取 cookie 视图函数"""
    re = request.cookie.get("username")
    return re


@app.route("/dele_cookie")
def delete_cookie():
    """删除 cookie 视图函数"""
    resp = make_response("del succes")
    # 删除 cookie
    resp.delete_cookie("username")
    
    return resp
```

- 操作 Cookie 即是在响应头里面设置：`Set-Cookie` 的值



### 4.7 设置和获取session

```python
from flask import Flask, session


app = Flask(__name__)

# 设置密钥字符串
app.configp["SECRET_KEY"] = "asdlfkjla;sdp9wejro;ig"


@app.route("/login")
def login():
    """登录视图函数"""
	# 设置 session 数据
    session['name'] = "python"
    session['mobile'] = "15622221111"
    return "login success"


@app.route("/index")
def index():
    """主页视图函数"""
	# 获取 session 数据
    name = session.get("name")
    return "Hello %s" % name


if __name__ == "__main__":
    app.run(debug=True)
```

- Session 跨服务器问题
    - Session 保存的位置有许多：数据库，Redis，文件，程序内存中。
    - 保存在程序内存中时，将会存在跨服务器问题。当然，也可用IP地域进行解决
- 不使用 Cookie 保存 Session_id
    - 保存在 url 路径中。此时，无法设置有效期



### 4.8 请求上下文与应用上下文

Flask中有两种上下文，请求上下文和应用上下文。

- 上下文：相当于一个容器，保存了Flask程序运行过程中的相关信息。



#### 4.8.1 请求上下文(request context)

`request`和`session`都属于请求上下文对象。

- `request`：封装了HTTP请求的内容，针对的是http请求。

- `session`：用来记录请求会话中的信息，针对的是用户信息。



`request` 请求上下文实现

将 **全局变量** `request` 设计为依据线程不同而不同的 **线程局部变量**

```python
request = {
	“线程A” : {
		Form: {“name”: “Zhangsan”}
		data: ...
		args: ...
	}
	“线程B” : {
		Form: {“name”: “Lisi”}
		data: ...
		args: ...
	}
}
```



#### 4.8.2 应用上下文(application context)

`current_app` 和 `g` 都属于应用上下文对象。

`current_app`：表示当前运行程序文件的程序实例。

- 可通过 `current_app.name` 获取当前应用程序实例名称



`g`：处理请求时，用于临时存储的对象，每次请求都会重设这个变量。

- 可以获取一些临时请求的用户信息。

- G变量就是一个空容器，可以随意添加属性
- G变量的属性一直保存在一次请求之内的，再次请求将被清空。即可在一次请求的多个函数之间传递参数。



#### 4.8.3 `request` & `g`

- 当调用 `app = Flask(__name__)` 的时候，创建了程序应用对象app；
- request 在每次http请求发生时，WSGI server调用 `Flask.call()` ；然后在Flask内部创建的 `request` 对象；
- app 的生命周期大于 `request`和 `g`，一个app存活期间，可能发生多次http请求，所以就会有多个request和g。
- 最终传入视图函数，通过return、redirect或render_template生成response对象，返回给客户端。



#### 4.8.4 区别

- 请求上下文：保存了客户端和服务器交互的数据。 
- 应用上下文：在flask程序运行过程中，保存的一些配置信息，比如程序文件名、数据库的连接、用户信息等。



### 4.9 请求钩子 hook

在客户端和服务器交互的过程中，有些准备工作或扫尾工作需要处理，比如：在请求开始时，建立数据库连接；在请求结束时，指定数据的交互格式。为了让每个视图函数避免编写重复功能的代码，Flask提供了通用设施的功能，即请求钩子。

- 所有的钩子对所有的视图函数都会被执行，使用其内部的 `request.path`，可以作为视图函数的区分



请求钩子是通过装饰器的形式实现，Flask支持如下四种请求钩子：

- `before_first_request`：在处理第一个请求前运行。
- `before_request`：在每次请求前运行。
- `after_request(response)`：如果没有未处理的异常抛出，在每次请求后运行。
- `teardown_request(response)`：在每次请求后运行，即使有未处理的异常抛出。
    - 无论有没有异常
    - 需要有返回值，return response
    - 其中,response是视图函数的返回值，打包为response.



```python
from flask import Flask


@app.route("/index")
def index():
    return "index page"

@app.before_first_request
def handle_before_first_request():
    """在第一次请求处理之前被执行"""
    print("handle_before_first_request 被执行")

@app.before_request
def handle_before_request():
    """在每次请求处理之前被执行"""
    print("handle_before_request 被执行")

@app.after_request
def handle_after_request(response):
    """在每次请求（视图函数）处理之后被执行，前提是视图函数没有出现异常"""
    print("handle_after_request 被执行")
    return response

@app.teardown_request
def handle_teardown_request(response):
    """
    当工作在非调试模式时，即：debug=False 时，
    在每次请求（视图函数）处理之后被执行，无论视图函数是否出现异常，都会被执行
    """
    print("handle_teardown_request 被执行")
    return response
```



### 5.0 Flask装饰器路由的实现

Flask有两大核心：`Werkzeug`和 `Jinja2`。

- `Werkzeug`实现路由、调试和Web服务器网关接口。
- `Jinja2`实现了模板。

`Werkzeug`是一个遵循`WSGI`协议的python函数库。

- 其内部实现了很多Web框架底层的东西，比如request和response对象；
- 与WSGI规范的兼容；
- 支持Unicode；
- 支持基本的会话管理和签名Cookie；
- 集成URL请求路由等。

`Werkzeug`库的routing模块负责实现URL解析。

- 不同的URL对应不同的视图函数，routing模块会对请求信息的URL进行解析，匹配到URL对应的视图函数，以此生成一个响应信息。

- routing模块内部有Rule类（用来构造不同的URL模式的对象）、Map类（存储所有的URL规则）、MapAdapter类（负责具体URL匹配的工作）；



### 5.1 `Flask-Script` 扩展命令行

扩展安装

```py
pip install Flask-Script
```



目的&用途

使得Flask服务器以命令行的方式启动，此处可以传入相应的参数。

- 不再仅仅通过 `app.run()` 方式传参



默认格式

```bash
# 设置运行时网络监听
$ python hello.py runserver --host ip

# 查看相应参数
python hello.py runserver --help
```

- 默认情况下，服务器只监听来自服务器所在计算机发起的连接，即`localhost` 连接。

```python
from flask import Flask
from flask-script import Manager

# 创建 flask 应用
app = Flask(__name__)

# 创建 flask-script 实例
manager = Manager(app)

# 定义视图函数
@app.route('/')
def index():
    """定义主页面视图"""
    return "天若有情天亦老，人间正道是沧桑。"

# 启动
if __name__ == "__main__":
    manager.run()
```



## 5. `Jinja2` 模板



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



## 6. 数据库


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











