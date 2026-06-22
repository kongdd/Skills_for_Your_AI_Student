- 用户：20年码龄资深程序员；追求简洁、优雅、易懂、规范的代码
- 文件组织：代码、数据、图件分别存放
- 专业背景：生态水文学家
- 精通R语言：data.table, tidyverse, ggplot2等
- 精通Julia：精通高性能科学计算
- 报告写作：遵循学术论文规范，细节充分；逻辑严谨，语言凝练
- 语言表达：文字应符合中文表述习惯、书面表达，不要生硬的英文翻译
- 不要删除有意义的注释，代码（未来复用）或解释（帮助理解）

## 软件环境
```bash
alias Rscript=/opt/miniforge3/envs/r4.5/bin/Rscript
alias R=/opt/miniforge3/envs/r4.5/bin/R
alias julia=/home/kong/.local/bin/julia
```

## 上下文
@RTK.md

## 工具链：三件套

三个 token 优化工具，分工明确、组合使用：

| 工具         | 全称                | 角色                            | 输入类型         | 典型场景                                        |
| ------------ | ------------------- | ------------------------------- | ---------------- | ----------------------------------------------- |
| **rtk**      | Rust Token Killer   | 命令智能 (command intelligence) | shell 命令输出   | `git status` / `rg` / `find` / `ls` / `test`    |
| **sqz**      | Squeeze             | 内容记忆 (content memory)       | 源码、配置、文档 | 读 .jl/.py/.md 整文件或指定行范围               |
| **codebase** | codebase-memory-mcp | 代码知识图谱 (knowledge graph)  | 结构化查询       | 陌生项目探索、调用链追溯、热点分析、PR 风险评估 |

### 使用规则

- **文件内容读取**：优先 `mcp__sqz__sqz_read_file`（避免 `cat` / 原生 `Read`）
- **命令输出读取**：优先 `rtk`（适用于 `git/rg/grep/find/ls/test` 等）
- **陌生项目第一步**：先用 `codebase-memory-mcp` 索引 + 探索知识图谱，再读源码
- **结构性查询**（"谁调用 X"、"X 调什么"、"改 A 影响谁"）：**只用** codebase，grep 完全做不到
- **文本搜索**（"找包含 Y 的字符串"）：用 `sqz_grep`（图增强的 grep，比 ripgrep 多 2× 去重）
- **避免**：raw `cat`、原 `Read` 大文件、原 `Grep` 跨目录扫

### CLI 整文件压缩

```bash
sqz compress --cmd file < src/file.jl
```

### CLI 范围压缩

```bash
sed -n '80,150p' src/file.jl | sqz compress --cmd sed
```

### codebase-memory-mcp 工作流

```text
1. index_repository(repo_path=...)          # 首次接触必做（已配 hook 自动提醒）
2. get_architecture(aspects=["all"])        # 摸清项目骨架
3. search_graph / search_code               # 找目标符号
4. trace_path(function_name=..., depth=3)   # 看上下游调用
5. get_code_snippet(qualified_name=...)     # 精读实现
6. detect_changes(scope="staged")           # PR 提交前做影响分析
```

### Examples

```bash
# rtk: 命令输出压缩
rtk rg "target_function" src/ test/
rtk git status
rtk git diff
rtk julia --project test/runtests.jl

# sqz: 源码 / 配置 / 文档压缩读取
sqz compress --cmd file < src/file.jl
sed -n '80,150p' src/file.jl | sqz compress --cmd sed
sqz_grep "TODO" src/                       # MCP 工具，跨文件搜索
sqz_read_file path/to/large.md             # MCP 工具，>2KB 必用

# codebase: MCP 工具
# 见 mcp__codebase-memory-mcp__*（14 个工具，已在 settings.json 全部预授权）
```
