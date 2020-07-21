# Django 框架入门

## Web框架核心 - MVC

### Web MVC简介

> 全称：Model-View-Controller

- 核心观念：**分工的思想**

- 核心思想：**解耦**。让不同的代码块之间降低耦合，增强代码的可扩展性和可移植性，实现向后兼容。



### Ｗeb MVC各部分的功能

- M全拼为`Model`，主要封装对数据库层的访问，对数据库中的数据进行增、删、改、查操作。

- V全拼为`View`，用于封装结果，生成页面展示的html内容。

- C全拼为`Controller`，用于接收请求，处理业务逻辑，与Model和View交互，返回结果。



![mvc](_resource/Django%E6%A1%86%E6%9E%B6%E5%85%A5%E9%97%A8/mvc.png)





### Django MVC - MVT

- Django框架遵循MVC设计，并且有一个专有名词：MVT。



### Django MVT各部分的功能

- M全拼为`Model`，与MVC中的M功能相同，负责和数据库交互，进行数据处理。

- V全拼为`View`，与MVC中的C功能相同，接收请求，进行业务处理，返回应答。

- T全拼为`Template`，与MVC中的V功能相同，负责封装构造要返回的html。



![mvt](_resource/Django%E6%A1%86%E6%9E%B6%E5%85%A5%E9%97%A8/mvt-1575601682035.png)





## Django简介

*Django makes it easier to build better web apps more quickly and with less code.*

- 主要目的是简便、快速的开发数据库驱动的网站。

- 很强的可扩展性：强调代码复用，多个组件可以很方便的以"插件"形式服务于整个框架。

- 强调快速开发和DRY(`DoNotRepeatYourself`)原则。



特点

1. 重量级框架：原生提供众多功能组建。
2. MTV模式



更多信息：

-  [Django官方网站](https://www.djangoproject.com/)
-  [Django源码](https://github.com/django/django)
-  [1.8.2官方中文文档](http://python.usyiyi.cn/django/index.html)
- [Django Book](http://djangobook.com/)
- [Tange With Django](http://www.tangowithdjango.com/book17/)



## Django 搭建

### 1. 搭建虚拟环境

#### `Virtualenv` 环境隔离

- 创建：``mkvirtualenv my_project`
- 工作：`workon my_project`
- 停用：`deactivate`
- 删除：`rmvirtualenv my_project`



```
- 您可以创建一个项目，它会创建虚拟环境，并在 `$WORKON_HOME` 中创建一个项目目录。 当您使用 workon myproject 时，会 `cd` 到项目目录中。$ mkproject myproject**virtualenvwrapper** 提供环境名字的tab补全功能。当您有很多环境， 并且很难记住它们的名字时，这就显得很有用。`workon` 也能停止您当前所在的环境，所以您可以在环境之间快速的切换。停止是一样的：
- 
```



#### `Conda` 环境隔离

- 创建：`conda `
- 工作：`conda activate myEnv`
- 停用：
- 删除：



### 2. 创建项目

#### 2.1 创建命令

```bash
$ django-admin startproject 项目名称
# 例：
$ django-admin startproject MyWorld
```



#### 2.2 默认目录说明

```
MyWorld
|
|-- MyWorld
|   |-- __init__.py
|   |-- settings.py
|   |-- urls.py
|   `-- wsgi.py
`-- manage.py
```

- **`manage.py`**：一个实用的命令行工具，可让你以各种方式与该 Django 项目进行交互。
- **`MyWorld`**：项目的容器。
- **`MyWorld`/`__init__.py`**：一个空文件，告诉 Python 该目录是一个 Python 包。
- **`MyWorld`/`settings.py`**：该 Django 项目的设置/配置。
- **`MyWorld`/`urls.py`**： 该 Django 项目的 URL 声明; 一份由 Django 驱动的网站"目录"。
- **`MyWorld`/`wsgi.py`**： 一个 WSGI 兼容的 Web 服务器的入口，以便运行你的项目。



#### 2.3 运行默认开发服务器

命令如下：

```bash
$ python manage.py runserver ip:端口
# 示例
$ python manage.py runserver
```

- 可不写IP和端口，默认IP是`127.0.0.1`，默认端口为`8000`。打开浏览器即可访问。
- Django默认工作在调式Debug模式下，如果增加、修改、删除文件，服务器会自动重启。
- `ctrl+c` 停止服务器。



### 3. 创建应用

创建应用， 并将所有应用移动到 python package - `apps` 中：

```bash
# 创建所有需要建立的应用
$ python manage.py startapp 子应用名称
# 示例：
$ python manage.py startapp user
$ python manage.py startapp goods
$ python manage.py startapp cart
$ python manage.py startapp order
```

- `manage.py`为上述创建工程时自动生成的管理文件。



应用目录说明

```bash
MyWorld
|
├── book
│   ├── admin.py			# 文件跟网站的后台管理站点配置相关
│   ├── apps.py				# 配置当前子应用的相关信息
│   ├── __init__.py
│   ├── migrations			# 存放数据库迁移历史文件
│   │   └── __init__.py
│   ├── models.py			# 保存数据库模型类
│   ├── tests.py			# 开发测试用例，编写单元测试
│   └── views.py			# 编写Web应用视图
├── manage.py
└── MyWorld
    ├── asgi.py
    ├── __init__.py
    ├── __pycache__
    │   ├── __init__.cpython-36.pyc
    │   └── settings.cpython-36.pyc
    ├── settings.py
    ├── urls.py
    └── wsgi.py

```



#### 注册安装子应用

##### 建立应用和项目之间的关联

在 `MyWorld/settings.py` 中 `INSTALLED_APPS` 下添加应用的名称以完成安装

```python
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'apps.user', # 用户模块
    'apps.goods', # 商品模块
    'apps.cart', # 购物车模块
    'apps.order', # 订单模块
)
```



或者此步直接在配置文件 `settings.py` 中，添加应用搜索路径：

```python
import os  # raw line
import sys  # import modules of sys

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))  # raw line
# 添加 apps 搜索路径
sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))

# ...


INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'user', # 用户模块
    'goods', # 商品模块
    'cart', # 购物车模块
    'order', # 订单模块
)
```



### 4. 配置数据库

Django 框架默认使用 **SQLite3** 数据库。也可自定义：

打开 `MyWorld/settings.py`文件，找到 `DATABASES`项，修改为MySQL数据库。

- 将引擎改为 **mysql**，提供连接的主机HOST、端口PORT、数据库名NAME、用户名USER、密码PASSWORD。

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'db_name', # 数据库名字，
        'USER': 'root', # 数据库登录用户名
        'PASSWORD': 'mysql', # 数据库登录密码
        'HOST': 'localhost', # 数据库所在主机
        'PORT': '3306', # 数据库端口
    }
}
```

- 注意：这里的数据库 **db_name** 需要自己进入数据库去**手动创建**。

- ```sql
  create database test2 default charset=utf8;
  ```




#### 配置数据库支持

MySQLdb is the interface to MySQL database. As mentioned by other posts, MySQLdb doesn't support Python 3.x. I used PyMySQL as the replacement. You need to install it first:

```
pip install PyMySQL
```

The next step is to replace 'MySQLdb' with 'pymysql' in all the codes, which is intimidating. Luckily, PyMySQL can be loaded as MySQLdb dyanamically. 

In order to achieve it in Django, you need to add the following lines to `__init__.py` file under the dir of the project's default app (If your have a project named 'myproject', add lines to myproject/myproject/init.py):

```
import pymysql
pymysql.install_as_MySQLdb()
```

This __init__.py would be executed when you run the Django project, and MySQLdb will be replaced.



### 5. 运行服务器

配置于此，便可以运行 `Django` 提供的开发服务器

```bash
$ python manage.py runserver ip:端口
# 示例：
$ python manage.py runserver
```



### 6. 其他可提前设置项

#### 配置本地化

在 `settings.py` 中配置本地化设置如下：

```python
# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/

LANGUAGE_CODE = 'en-hans'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = True
```



#### 配置静态文件目录

新建 `MyWorld/static` 文件夹，在 `settings.py` 中配置静态文件目录如下：

```python
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/

STATIC_URL = '/static/'

# 配置静态文件目录
STATIC_DIR = os.path.join(BASE_DIR, 'static')
```



## 模型设计

### ORM框架



- O是object，也就**类对象**

- R是relation，关系数据库中**数据表**

- M是mapping，是**映射**

把类和数据表进行了一个映射，从而可以**通过类和类对象就能操作它所对应的表格中的数据**。也可以**根据我们设计的类自动帮我们生成数据库中的表格**



使用 `django` 进行数据库开发的步骤：

- 1.在models.py中定义模型类
- 2.迁移
- 3.通过类和对象完成数据增删改查操作



### 1. 定义模型类

模型类定义在 `models.py` 文件中，继承自 `models.Model`类。

##### 设计模型类

##### 定义模型类

在 `models.py` 中定义模型类。

```python
from django.db import models

class BookInfo(models.Model):
    btitle = models.CharField(max_length=20)
    bpub_date = models.DateField()
```



### 2. 迁移

迁移由两步完成:

- 1.生成迁移文件：根据模型类生成创建表的迁移文件。

  ```
  python manage.py makemigrations
  ```

- 2.执行迁移：根据第一步生成的迁移文件在数据库中创建表。

```
python manage.py migrate
```



数据库迁移

```
$ python manage.py migrate   # 创建表结构

$ python manage.py makemigrations TestModel  # 让 Django 知道模型有变更
$ python manage.py migrate TestModel   # 创建表结构
```



##### 默认生成的表名称

数据表的默认名称为：

```
<app_name>_<model_name>
例：
booktest_bookinfo
```

**在我们之后迁移生成表的时候，Django框架就会自动帮我们在图书表和英雄表之间建立一个外键关系。**



### 3. 数据操作

完成数据表的迁移之后，可以通过进入项目的shell，进行简单的API操作。

- 退出项目：可以使用`ctrl+d`快捷键或输入`quit()`
- 进入项目shell ： `python manage.py shell`



对数据模型类进行增删改查：

- 查询所有图书信息：

```
BookInfo.objects.all()
```



进行对象的关联操作：

```
b.heroinfo_set.all()
```







## 后台管理

> 解决快速生成数据库中数据的操作

使用Django的管理模块，需要按照如下步骤操作：

- 1.管理界面本地化
- 2.创建管理员
- 3.注册模型类
- 4.自定义管理页面



### 1. 管理界面本地化

设置语言编码、时区：`settings.py`

```
LANGUAGE_CODE = 'zh-hans' #使用中国语言
TIME_ZONE = 'Asia/Shanghai' #使用中国上海时间
```



### 2. 创建管理员

创建管理员用户：

```
python manage.py createsuperuser
```

测试默认后台管理页面接口：

```
http://127.0.0.1:8000/admin/
```



### 3. 注册模型类

在应用 `admin.py` 中，注册数据库模型类：

```
from django.contrib import admin
from booktest.models import BookInfo,HeroInfo

# 注册数据库模型类
admin.site.register(BookInfo)
admin.site.register(HeroInfo)
```



### 4. 自定义管理页面

自定义继承自`admin.ModelAdmin`的管理类，用户自定义管理页面的功能：

- 属性list_display表示要显示哪些属性

```
class BookInfoAdmin(admin.ModelAdmin):
    list_display = ['id', 'btitle', 'bpub_date']
```

- 修改模型类BookInfo的注册代码如下

```
admin.site.register(BookInfo, BookInfoAdmin)
```



---

---

## 视图及URL

在django的设计框架MVT中，用户在URL中请求的是视图，视图接收请求后进行处理，并将处理的结果返回给请求者。

使用视图时需要进行两步操作：

1. 定义视图函数
2. 配置URLconf



### 1. 定义视图

视图就是定义在`views.py` 文件的python函数。

- 必须有`request` 参数
- 必须返回 HttpResponse 对象， HttpResponse 中参数内容会显示在浏览器的页面上。

```
from django.http import HttpResponse

def index(request):
    return HttpResponse("index")
```



### 2. 配置URLconf

#### 查找视图的过程

请求者在浏览器地址栏中输入url，请求到网站后，获取url信息，然后与编写好的URLconf逐条匹配，如果匹配成功则调用对应的视图函数，如果所有的URLconf都没有匹配成功，则返回404错误。



一条URLconf包括url规则、视图两部分：

- url规则使用正则表达式定义。
- 视图就是在`views.py`中定义的视图函数。



需要两步完成URLconf配置：

- 1.在应用中定义URLconf
- 2.包含到项目的URLconf中



1. **在应用中定义**：创建 `booktest/urls.py` 文件，代码如下：

```
from django.conf.urls import url
from booktest import views

urlpatterns = [
    url(r'^$', views.index),
]
```

2. **包含到项目中**：打开test1/urls.py文件，为urlpatterns列表增加项如下：

```
url(r'^', include('booktest.urls')),
```

`test1/urls.py`文件完整代码如下：

```
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^', include('booktest.urls')),
]
```



#### 请求访问，进行测试~



## 模板

> 解决**返回页面需要携带复杂数据**的问题

在Django中，将前端的内容定义在模板中，然后再把模板交给视图调用，以便获得各种漂亮、炫酷的效果。

### 创建模板

1. 创建相关模板文件：`Booktest/templates/booktest/index.html`
2. 设置查找模板路径：在 `settings.py` 中，设置TEMPLATES的DIRS值

```
'DIRS': [os.path.join(BASE_DIR, 'templates')],
```



### 定义模板

在模板中输出变量语法如下，变量可能是从视图中传递过来的，也可能是在模板中定义的。

```
{{ 变量名 }}
```

在模板中编写代码段语法如下：

```
{% 代码段 %}
```



### 视图调用模板

调用模板分为三步骤：

- 1.找到模板
- 2.定义上下文
- 3.渲染模板

```python
from django.http import HttpResponse
from django.template import loader,RequestContext

def index(request):
    # 1.获取模板
    template=loader.get_template('booktest/index.html')
    # 2.定义上下文
    context=RequestContext(request,{'title':'图书列表','list':range(10)})
    # 3.渲染模板
    return HttpResponse(template.render(context))
```



### 视图调用模板简写

视图调用模板都要执行以上三部分，于是Django提供了一个函数render封装了以上代码。 方法render()包含3个参数：

- 第一个参数为request对象
- 第二个参数为模板文件路径
- 第三个参数为字典，表示向模板中传递的上下文数据

```python
from django.shortcuts import render

def index(request):
    context={'title':'图书列表','list':range(10)}
    return render(request,'booktest/index.html',context)
```



## 更多业务细化

现在还需要的代码包括三个方面，三个方面顺序不分先后。

- 1.定义视图
- 2.定义URLconf
- 3.定义模板


