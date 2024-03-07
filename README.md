# Duck.nvim
欢迎使用这个插件！<br>
这是一个简单的小插件，是一个学生独自开发的(就是我doge)<br>
以下是简单的配置<br>
### Lazy示范
~~~ lua
{
    'suangshuo/duck.nvim',
    config=function()
        tools={
            cta=true, --启用字符转ASCII
            compute=true, --启用计算器
        }
    end
}
~~~
其实tools里的cta之类的属性，大部分不用启用，因为默认已经启用了<br>
### 属性
以下是配置的选项
#### tools
这是你决定是否启用一些功能，一般用来不启用某些功能<br>
下面是tools中**可以填写**的内容<br>
- cta 字符转ASCII功能
- compute 计算器功能

### 感谢
这是本插件开发过程中参考的内容<br>
- (部分自动命令与用户命令)[https://zhuanlan.zhihu.com/p/557199534]

感谢使用这个插件！
