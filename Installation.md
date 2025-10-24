## 配型说明

- `claude-code`

```bash
scoop install nodejs # 也可以自行安装
npm install -g @anthropic-ai/claude-code
```

- 未付费用户的选择：`国产KIMI K2`

```powershell
# code $PROFILE
$env:ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic"
$env:ANTHROPIC_AUTH_TOKEN="${YOUR_MOONSHOT_API_KEY}"
$env:ANTHROPIC_MODEL="kimi-k2-turbo-preview"
$env:ANTHROPIC_SMALL_FAST_MODEL="kimi-k2-turbo-preview"
```

## Claude运行

```
claude
/init
```
