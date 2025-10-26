#import "@local/modern-cug-report:0.1.3": *
#show: doc => template(doc, footer: "CUG水文气象学2025", header: "")


= 1 土壤水运动

== 1.1 基本原理

=== 1.1.1 达西定律（Darcy's Law）

达西定律描述了多孔介质中流体流动的基本规律，是土壤水运动理论的基础：

$ q = -K(theta) nabla H $

其中：
- $q$：水流通量 [L/T]
- $K(theta)$：导水率，是含水量的函数 [L/T]
- $H$：总水头 [L]
- $nabla$：梯度算子

=== 1.1.2 理查兹方程（Richards Equation）
理查兹方程结合达西定律和质量守恒定律，描述非饱和土壤中水分运动：

$ pdv(theta, t) = nabla dot [K(theta) nabla H] + S $

其中：
- $theta$：体积含水量 [L^3/L^3]
- $t$：时间 [T]
- $S$：源汇项 [1/T]

总水头 $H$ 由基质势 $h$ 和重力势 $z$ 组成：
$ H = h + z $

=== 1.1.3 质量守恒定律
对于土壤控制体积，质量守恒方程为：
$ pdv(rho theta, t) + nabla dot (rho q) = rho S $

假设水密度 $rho$ 为常数，简化为：
$ pdv(theta, t) + nabla dot q = S $

== 1.2 上边界层条件

=== 1.2.1 大气边界条件
上边界通常受大气条件控制，主要包括：

*降雨入渗条件：*
$ -K(theta) pdv(H, z) |_ (z=0) = q_("infiltration") $

*蒸发条件：*
$ -K(theta) pdv(H, z) |_ (z=0) = q_("evaporation") $

*通量边界条件：*
$ q_("surface") = P - E - R $
其中：
- $P$：降水量 [L/T]
- $E$：蒸发量 [L/T]
- $R$：地表径流量 [L/T]

=== 1.2.2 积水条件
当降雨强度超过土壤入渗能力时，地表形成积水：
$ h(0,t) = h_("ponding") quad "当" quad P > K_("sat") $

== 1.3 下边界层条件

=== 1.3.1 自由排水边界
假设下边界为自由排水条件：
$ pdv(h, z) |_ (z=L) = 0 $

=== 1.3.2 地下水埋深边界
当下边界与地下水相连时：
$ h(L,t) = h_("water table") $

=== 1.3.3 不透水边界
下边界为不透水层时：
$ q(L,t) = -K(theta) pdv(H, z) |_ (z=L) = 0 $

== 1.4 模型求解

=== 1.4.1 数值离散化方法

*有限差分法（FDM）：*
将连续的偏微分方程离散为差分方程：
$ (theta_i^(n+1) - theta_i^n) / (Delta t) = (K_(i+1/2)^n(H_(i+1)^n - H_i^n) - K_(i-1/2)^n(H_i^n - H_(i-1)^n)) / (Delta z^2) $

*有限元法（FEM）：*
采用Galerkin方法建立弱形式：
$ integral_Omega N_i pdv(theta, t) d Omega = -integral_Omega nabla N_i dot K(theta) nabla H d Omega + integral_Gamma N_i q_n d Gamma $

=== 1.4.2 时间离散化方案

*显式格式：*
$ theta_i^(n+1) = theta_i^n + Delta t dot f(theta^n, H^n) $

*隐式格式：*
$ theta_i^(n+1) = theta_i^n + Delta t dot f(theta^(n+1), H^(n+1)) $

*Crank-Nicolson格式：*
$ theta_i^(n+1) = theta_i^n + (Delta t) / 2 [f(theta^n, H^n) + f(theta^(n+1), H^(n+1))] $

=== 1.4.3 非线性求解方法

*Picard迭代法：*
$ K^(k+1) = K(theta^(k)) $
$ theta^(k+1) = theta^n + Delta t dot f(theta^(k+1), H^(k+1)) $

*Newton-Raphson法：*
$ J^(k) Delta theta^(k) = -R^(k) $
$ theta^(k+1) = theta^(k) + Delta theta^(k) $

== 1.5 土壤水力参数

=== 1.5.1 土壤水分特征曲线

*van Genuchten模型：*
$ theta(h) = theta_r + (theta_s - theta_r) / {[1 + |alpha h|^n]^m} $

其中：
- $theta_s$：饱和含水量 [L^3/L^3]
- $theta_r$：残余含水量 [L^3/L^3]
- $alpha$：拟合参数 [1/L]
- $n$：拟合参数，$m = 1 - 1/n$

*Brooks-Corey模型：*
$ theta(h) = theta_r + (theta_s - theta_r) (h_e / |h|)^lambda quad "当" quad |h| > h_e $

=== 1.5.2 导水率函数

*van Genuchten-Mualem模型：*
$ K(theta) = K_s dot S_e^l [1 - (1 - S_e^(1/m))^m]^2 $

其中：
- $K_s$：饱和导水率 [L/T]
- $S_e = (theta - theta_r) / (theta_s - theta_r)$：有效饱和度
- $l$：形状参数，通常取0.5

*Brooks-Corey导水率模型：*
$ K(theta) = K_s dot S_e^(2+3lambda) $

=== 1.5.3 比水容量
$ C(h) = dv(theta, h) = -((theta_s - theta_r) m n |alpha h|^(n-1) alpha) / {[1 + |alpha h|^n]^(m+1)} $

== 1.6 驱动数据

=== 1.6.1 气象数据
- *降水量*：时间序列数据，支持不同时间步长（小时、日、月）
- *潜在蒸散发*：可通过Penman-Monteith公式计算
- *气温*：影响蒸发和土壤冻结
- *相对湿度*：影响蒸发计算
- *风速*：影响蒸散发计算
- *太阳辐射*：能量平衡计算

=== 1.6.2 土壤属性数据
- *土壤质地*：砂粒、粉粒、黏粒含量
- *土壤容重*：影响孔隙度和导水率
- *有机质含量*：影响土壤结构和水力特性
- *土壤分层*：不同深度的土壤属性变化

=== 1.6.3 植被数据
- *植被覆盖度*：影响蒸散发和截留
- *根深分布*：影响根系吸水
- *作物系数*：用于实际蒸散发计算

== 1.7 编程工具

=== 1.7.1 编程语言选择
- *Python*：丰富的科学计算库（NumPy、SciPy、matplotlib）
- *MATLAB*：强大的数值计算和可视化功能
- *Julia*：高性能科学计算，适合大规模模拟
- *Fortran*：传统数值计算语言，性能优异
- *C++*：高性能要求的应用

=== 1.7.2 数值计算库
- *线性求解器*：UMFPACK、SuperLU、PETSc
- *非线性求解器*：Newton-Krylov方法
- *插值库*：用于土壤水力参数的插值
- *并行计算*：OpenMP、MPI用于大规模计算

=== 1.7.3 可视化工具
- *2D可视化*：matplotlib、gnuplot
- *3D可视化*：ParaView、VisIt
- *交互式可视化*：Plotly、Bokeh
- *GIS集成*：GDAL、QGIS

=== 1.7.4 数据处理
- *时间序列处理*：pandas、xarray
- *空间数据处理*：geopandas、rasterio
- *数据格式*：NetCDF、HDF5、CSV
- *数据库*：SQLite、PostGIS
