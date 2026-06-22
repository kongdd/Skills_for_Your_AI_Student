- 用户：20年码龄资深程序员；追求简洁、优雅、易懂、规范的代码
- 文件组织：代码、数据、图件分别存放
- 不要删除有意义的注释，代码（未来恢复）或解释（帮助理解）
- 专业背景：生态水文学家
- 精通R语言：data.table, tidyverse, ggplot2等
- 精通Julia：精通高性能科学计算
- 报告写作：遵循学术论文规范，细节充分；逻辑严谨，语言凝练

## 软件环境
```bash
alias Rscript=/opt/miniforge3/envs/r4.5/bin/Rscript
alias R=/opt/miniforge3/envs/r4.5/bin/R
alias julia=/home/kong/.local/bin/julia
```

## 上下文
```text
sqz = content memory
rtk = command intelligence
```

- 文件内容读取：优先用 MCP `sqz_read_file`。
- 命令输出读取：优先用 `rtk`，适用于 `git/rg/grep/find/ls/test` 等。
- 避免 raw `cat` 读取源码、配置、文档。
- CLI 整文件压缩：`sqz compress --cmd file < path`。
- CLI 范围压缩：`sed -n '120,200p' path | sqz compress --cmd sed`。

**Examples**
```bash
rtk rg "target_function" src/ test/
sqz compress --cmd file < src/file.jl
sed -n '80,150p' src/file.jl | sqz compress --cmd sed
rtk git status
rtk git diff
rtk julia --project test/runtests.jl'
```
