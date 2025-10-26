# 1 配型说明

## 1.1 Claude-Code

```bash
scoop install nodejs # 也可以自行安装
npm install -g @anthropic-ai/claude-code
```

terminal中需要设置网络代理。

```powershell
$env:http_proxy = "http://127.0.0.1:1081"
claude

> /init
```

> **数学、物理超教师水平！**

> 但知识系统性、推理系统性方面不如人类。

## 1.2 KIMI K2

- 未付费用户的选择：`国产`

```powershell
# code $PROFILE
$env:ANTHROPIC_AUTH_TOKEN="${YOUR_MOONSHOT_API_KEY}"
$env:ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic"
$env:ANTHROPIC_MODEL="kimi-k2-turbo-preview"
$env:ANTHROPIC_SMALL_FAST_MODEL="kimi-k2-turbo-preview"
```


## 1.3 智普 GLM-4.6

> 实测解土壤水运动，数学能力很渣，不如qwen3

```powershell
$env:ANTHROPIC_AUTH_TOKEN = "your_key"
$env:ANTHROPIC_BASE_URL = "https://open.bigmodel.cn/api/anthropic"
$env:API_TIMEOUT_MS = "3000000"
$env:CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC = 1
```

**数学能力很渣！**


## 1.4 qwen-coder

```bash
npm install -g @qwen-code/qwen-code@latest
```

采用账户登录，每天2000次调用限制，每5小时600次限制。

**一定不要用API！一定不要用API！一定不要用API！**

**Token消耗特别快，比Claude贵！**
