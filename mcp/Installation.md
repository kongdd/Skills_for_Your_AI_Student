# 1 如何安装mcp


## 1.1 Claude-Desktop

```bash
code $env:APPDATA/Claude/claude_desktop_config.json
```

## 1.2 Claude-Code

```bash
# code ~/.claude.json
# code C:\Users\hydro\.claude.json # 或者手动编辑，推荐
claude mcp add --transport stdio <name> -- <command> [args...]
# --scope user
```

默认情况下，服务器添加在 local 范围（用户特定、项目本地）。

`--scope local`（默认）：当前项目中仅您私有。

`--scope project`：通过 .mcp.json 共享（团队可访问）。

`--scope user`：跨所有您的项目可用。

## 1.3 Cline

比较简单。
