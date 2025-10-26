#import "@local/modern-cug-report:0.1.3": *
#show: doc => template(doc, footer: "CUG水文气象学2025", header: "")


== 1 Richards方程

Richards方程：

$ pdv(theta, t) = nabla dot [K(theta) nabla H] + S $

其中：
- $theta$：体积含水量 [L^3/L^3]
- $t$：时间 [T]
- $S$：源汇项 [1/T]

总水头 $H$ 由基质势 $h$ 和重力势 $z$ 组成：
$ H = h + z $


== 2 质量守恒定律
对于土壤控制体积，质量守恒方程为：
$ pdv(rho theta, t) + nabla dot (rho q) = rho S $

假设水密度 $rho$ 为常数，简化为：
$ pdv(theta, t) + nabla dot q = S $


== 3 上边界层条件

上边界通常受大气条件控制，主要包括：

*降雨入渗条件：*
$ -K(theta) pdv(H, z) |_(z=0) = q_("infiltration") $

*蒸发条件：*
$ -K(theta) pdv(H, z) |_(z=0) = q_("evaporation") $
