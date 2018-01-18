## 使用栈实现数值表达式求值
* 为了更好地理解Foundation，所以没有用NSExpression，而是自己实现一个栈来完成表达式求值。这就是基本运算所依赖的核心算法。

## 实现的功能
* 项目实现了带有括号计算器的四则运算，并有删除和清空功能。

## 项目核心代码
* Medel文件夹存放了栈实现数值表达式算法的文件:Stack.h Stack.m Calculate.h Calculate.m 。
* Stack.h和Stack.m是自定义的栈结构文件，Calculate.h定义了一些四则运算需要的成员变量和操作的方法，而Calculate.m则是具体实现了四则运算操作的方法。整个业务逻辑的代码位于ViewController.m的文件中。

## 算法参考
* 对四则运算算法表示困惑的同学，可以参考下严蔚敏老师的数据结构教材。

## 运行效果
![basic_calculator_effect](https://github.com/ahutsunshine/Basic_Calculator/blob/master/Raw/app%E6%95%88%E6%9E%9C%E5%9B%BE.gif?raw=true)

## 联系方式
### <a href="mailto:ahutsunshine@163.com" font >Email:ahutsunshine@163.com</a>
