export MINIMAX_API_KEY="sk-**"
export DEEPSEEK_API_KEY="sk-**"
export CLAUDE_CODE_EFFORT_LEVEL="high"

minimax() {
  env \
    ANTHROPIC_AUTH_TOKEN=$MINIMAX_API_KEY \
    ANTHROPIC_BASE_URL="https://api.minimaxi.com/anthropic" \
    ANTHROPIC_MODEL="MiniMax-M3" \
    ANTHROPIC_DEFAULT_OPUS_MODEL="MiniMax-M3" \
    ANTHROPIC_DEFAULT_SONNET_MODEL="MiniMax-M3" \
    ANTHROPIC_DEFAULT_HAIKU_MODEL="MiniMax-M3" \
    CLAUDE_CODE_SUBAGENT_MODEL="MiniMax-M3" \
    claude "$@"
}

deepseek() {
  env \
    ANTHROPIC_AUTH_TOKEN=$DEEPSEEK_API_KEY \
    ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic" \
    ANTHROPIC_MODEL="deepseek-v4-pro[1m]" \
    ANTHROPIC_DEFAULT_OPUS_MODEL="deepseek-v4-pro[1m]" \
    ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek-v4-pro[1m]" \
    ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-v4-flash" \
    CLAUDE_CODE_SUBAGENT_MODEL="deepseek-v4-pro[1m]" \
    claude "$@"
}
