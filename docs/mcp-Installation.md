# MCP安装说明

```bash
# Basic syntax
claude mcp add --transport stdio <name> <command> [args...]

# Real example: Add Airtable server
claude mcp add --transport stdio airtable --env AIRTABLE_API_KEY=YOUR_KEY -- npx -y airtable-mcp-server

# This creates command="cmd" which Windows can execute
claude mcp add --transport stdio my-server -- cmd /c npx -y @some/package
```
