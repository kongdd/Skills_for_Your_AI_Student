---
name: typst-pdv
description: typst公式中的偏微分方程编写
---

# 在typst文档的开头引用包

```typst
#import "@local/modern-cug-report:0.1.3": *
#show: doc => template(doc, footer: "CUG水文气象学2025", header: "")
```

用于如果已经引用了`modern-cug-report`，则无需再重复添加了。


# 使用typst的语法编写偏微分方程

- `(∂ theta) / (∂ t)`

  `\frac{\partial \theta}{\partial t}`采用typst编写会非常简单，`pdv(theta, t)`

  ```typst
  (partial.diff theta) / (partial.diff t) // 是错误写法
  pdv(theta, t)                           // 正确写法
  ```

- `(d theta) / (d t)`则是：`dv(theta, t)`


# text

typst公式中的本文需要使用引号：

```typst
q_(infiltration)   // 错误
q_("infiltration") // 正确
```
