# QAnything API 配置指南

## 概述
本指南将帮助您配置QAnything API，以便在应用中使用QAnything AI助手功能。

## 配置步骤

### 1. 注册有道智云账号
1. 访问 [有道智云AI开放平台](https://ai.youdao.com/)
2. 注册账号并完成实名认证
3. 登录到控制台

### 2. 创建QAnything应用
1. 在控制台中找到QAnything服务
2. 创建新的应用实例
3. 获取API Key（用于Authorization头）

### 3. 配置环境变量
在项目根目录的`.env.local`文件中配置以下变量：

```env
# QAnything API Configuration
NEXT_PUBLIC_QANYTHING_API_KEY=your_api_key_here
NEXT_PUBLIC_QANYTHING_API_URL=https://openapi.youdao.com/q_anything/api/chat_stream
```

**重要：** 请将 `your_api_key_here` 替换为您从有道智云获取的实际API Key。

⚠️ **当前问题：** 如果您看到"抱歉，我现在无法回答您的问题。请稍后再试。"的错误信息，这通常是因为API Key未正确配置导致的。

### 4. 知识库配置
当前配置使用的知识库ID为：`KB0d60e5f7506142f797eb532cb3ac68ad_240430`

如需使用其他知识库，请在 `src/lib/qanything.ts` 文件中修改 `QANYTHING_KB_ID` 常量。

### 5. 重启开发服务器
配置完成后，重启开发服务器：
```bash
npm run dev
```

### 6. 测试功能
1. 访问应用主页
2. 尝试与QAnything AI助手对话
3. 如果遇到问题，访问 `/debug-qanything` 页面进行调试
4. 确认功能正常工作

## API调用格式

根据官方文档，API使用以下格式：

```javascript
{
  "question": "你是谁",
  "kbIds": ["KB0d60e5f7506142f797eb532cb3ac68ad_240430"],
  "prompt": "",
  "history": [],
  "model": "QAnything 4o mini",
  "maxToken": 1024,
  "hybridSearch": false,
  "networking": true,
  "sourceNeeded": true
}
```

## 已修复的问题

1. **API格式错误**：修正为使用JSON格式而非FormData
2. **认证方式错误**：使用Authorization头而非签名机制
3. **缺少知识库ID**：添加了必需的kbIds参数
4. **参数格式不正确**：使用官方文档规定的参数格式

## 技术改进

- **简化认证**：使用标准的Authorization头认证
- **标准化格式**：遵循官方API文档的JSON格式
- **知识库集成**：正确配置知识库ID
- **参数完整性**：包含所有必需和可选参数

## 注意事项

- 请确保API Key的安全性，不要泄露给他人
- API调用可能产生费用，请关注您的账户余额
- 如遇到问题，请检查控制台日志获取详细错误信息
- 确保知识库ID正确且有访问权限