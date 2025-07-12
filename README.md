# Web前端技术课程 - 学习平台

**注意**：如果GITHUB的文件存在问题们还可以通过百度网盘链接访问项目文件： https://pan.baidu.com/s/1ZSmZyFBq82BcDAoXQtv-8A?pwd=7sgg（提取码: 7sgg） 

一个集成课程练习展示、WakaTime编码统计、QAnything智能问答的现代化Web应用，基于Next.js 15构建。
<img width="1911" height="1225" alt="image" src="https://github.com/user-attachments/assets/cc423859-83fb-486d-86d8-8b305a208595" />

## 🚀 项目简介

本项目是一个综合性的Web前端学习平台，整合了以下核心功能：

- **📚 课程练习展示**：将本学期所有HTML/CSS/JavaScript课程练习整合到Next.js应用中
-<img width="1864" height="1263" alt="image" src="https://github.com/user-attachments/assets/9e368d2a-3f58-418e-b878-dcf6e50fc48b" />

- **⏱️ WakaTime编码统计**：实时展示个人编码时长和编程语言分布
- <img width="1956" height="1370" alt="image" src="https://github.com/user-attachments/assets/b1470c62-36a4-4a45-b555-1e479b9edfb5" />

- **🤖 QAnything智能问答**：集成大语言模型，提供智能问答服务
- ![Uploading image.png…]()

- **🎨 现代化UI设计**：使用Tailwind CSS构建响应式界面
- <img width="864" height="1094" alt="image" src="https://github.com/user-attachments/assets/36d1a222-fd50-4677-8521-9de9b18ed6e4" />

## 🛠️ 技术栈

- **前端框架**：Next.js 15.3.2 (React 19)
- **样式框架**：Tailwind CSS
- **开发语言**：TypeScript
- **图标库**：Lucide React
- **API集成**：WakaTime API、QAnything API
- **部署平台**：支持Vercel等现代化部署平台

## 📁 项目结构

```
my-next-app/
├── src/
│   ├── app/                    # Next.js App Router
│   │   ├── layout.tsx          # 根布局组件
│   │   ├── page.tsx            # 首页
│   │   ├── courses/            # 课程练习路由
│   │   │   ├── page.tsx        # 课程列表页
│   │   │   └── [id]/           # 动态课程详情页
│   │   │       └── page.tsx
│   │   └── chat/               # 智能问答页面
│   │       └── page.tsx
│   ├── components/             # React组件
│   │   ├── courses/            # 课程组件
│   │   │   ├── Course03.tsx    # CSS样式表练习
│   │   │   ├── Course04.tsx    # CSS布局练习
│   │   │   ├── Course05.tsx    # CSS定位练习
│   │   │   ├── Course06.tsx    # JavaScript类和对象
│   │   │   ├── Course07.tsx    # JavaScript异步编程
│   │   │   └── Course08.tsx    # 手机桌面界面
│   │   ├── QAnythingChat.tsx   # 智能问答组件
│   │   └── WakaTimeFooter.tsx  # 编码统计页脚
│   ├── lib/                    # 工具库
│   │   ├── wakatime.ts         # WakaTime API集成
│   │   ├── qanything.ts        # QAnything API集成
│   │   └── utils.ts            # 通用工具函数
│   └── utils.ts                # 样式工具函数
├── .env.local                  # 环境变量配置
├── package.json               # 项目依赖
└── README.md                  # 项目文档
```

## 🔧 QAnything集成实现

### 选择路径：自主开发API调用界面

**选择原因：**
1. **更好的用户体验**：可以完全控制界面设计和交互流程
2. **安全性考虑**：API密钥在服务端处理，不暴露给客户端
3. **功能扩展性**：便于后续添加更多自定义功能
4. **技术一致性**：与整个Next.js应用保持技术栈统一

### 实现细节

#### 1. API集成层 (`src/lib/qanything.ts`)
```typescript
// 核心功能
- sendQAnythingMessage: 发送单次问答请求
- sendQAnythingMessageStream: 处理流式响应
- 支持历史消息上下文
- 完整的错误处理机制
```

#### 2. 前端组件 (`src/components/QAnythingChat.tsx`)
```typescript
// 主要特性
- 实时消息展示
- 加载状态指示
- 错误处理和重试
- 历史消息管理
- 响应式设计
```

#### 3. 独立页面 (`src/app/chat/page.tsx`)
```typescript
// 页面功能
- 完整的问答界面
- 使用指南和推荐问题
- 导航集成
```

#### 4. 安全配置
```bash
# .env.local
QANYTHING_API_KEY=qanything-2V4LTGtwqRatKGoP52X3CMvAqVYrL4ch
QANYTHING_API_URL=https://api.qanything.ai/v1/chat/completions
```

## ⏱️ WakaTime API集成

### 实现方案

#### 1. API集成 (`src/lib/wakatime.ts`)
```typescript
// 核心功能
- getWakaTimeStats: 获取最近7天编码统计
- formatCodingTime: 时间格式化工具
- 编程语言分布统计
- 错误处理和缓存机制
```

#### 2. 页脚组件 (`src/components/WakaTimeFooter.tsx`)
```typescript
// 主要特性
- 全局页脚展示
- 实时数据更新（每5分钟）
- 编程语言颜色标识
- 加载和错误状态处理
```

#### 3. 安全配置

### 展示内容
- 总编码时长
- 日均编码时长
- 编程语言分布
- 数据更新时间

## 📚 课程练习整合

### 整合策略

#### 1. 组件化改造
将原有HTML文件转换为React组件：
- `course-03.html` → `Course03.tsx` (CSS样式表)
- `course-04.html` → `Course04.tsx` (CSS布局)
- `course-05.html` → `Course05.tsx` (CSS定位)
- `course-06.html` → `Course06.tsx` (JavaScript类)
- `course-07.html` → `Course07.tsx` (异步编程)
- `course-08.html` → `Course08.tsx` (手机界面)

#### 2. 路由设计
```
/courses          # 课程列表页
/courses/03       # 课程03详情
/courses/04       # 课程04详情
...               # 其他课程
```

#### 3. 样式迁移
- 保留原有样式逻辑
- 使用Tailwind CSS优化布局
- 添加响应式设计
- 统一视觉风格

#### 4. 功能增强
- 课程导航
- 进度跟踪
- 代码高亮
- 交互优化

## 🚀 运行指南

### 环境要求
- Node.js 18.0+
- npm 或 yarn
- 现代浏览器

### 安装步骤

1. **克隆项目**
```bash
git clone <repository-url>
cd my-next-app
```

2. **安装依赖**
```bash
npm install --legacy-peer-deps
# 或
yarn install
```

3. **配置环境变量**
创建 `.env.local` 文件：
```bash
# QAnything API配置
QANYTHING_API_KEY=your_qanything_api_key
QANYTHING_API_URL=https://api.qanything.ai/v1/chat/completions

# WakaTime API配置
WAKATIME_API_KEY=your_wakatime_api_key
```

4. **启动开发服务器**
```bash
npm run dev
# 或
yarn dev
```

5. **访问应用**
打开浏览器访问 `http://localhost:3000`

### 构建部署

```bash
# 构建生产版本
npm run build

# 启动生产服务器
npm start
```

## 📸 功能截图

### 1. QAnything智能问答界面
*展示自主开发的API调用界面，包含问题输入、回答展示、加载状态等*

### 2. WakaTime编码统计展示
*显示页脚中的编码时长统计，包含总时长、语言分布等信息*

### 3. 课程练习导航页面
*展示课程列表页面，包含所有练习的导航入口*

### 4. 具体课程练习界面
*展示某个具体课程练习的运行界面，如手机桌面界面*

## 🔒 安全最佳实践

1. **API密钥管理**
   - 使用环境变量存储敏感信息
   - 不在代码中硬编码密钥
   - .env.local文件已加入.gitignore

2. **错误处理**
   - 完整的API错误处理
   - 用户友好的错误提示
   - 网络异常重试机制

3. **数据验证**
   - 输入数据验证
   - API响应格式检查
   - 类型安全保障

## 🎯 项目亮点

### 技术亮点
- **现代化架构**：采用Next.js 15 + React 19最新技术栈
- **类型安全**：全面使用TypeScript确保代码质量
- **响应式设计**：完美适配各种设备屏幕
- **组件化开发**：高度模块化的组件设计
- **API集成**：优雅的第三方服务集成方案

### 功能亮点
- **智能问答**：集成大语言模型提供智能助手功能
- **编码统计**：实时展示个人编程数据
- **课程整合**：完整的学习内容管理系统
- **用户体验**：流畅的交互和优雅的界面设计

### 工程亮点
- **安全性**：完善的API密钥管理和错误处理
- **可维护性**：清晰的项目结构和代码组织
- **可扩展性**：易于添加新功能和集成新服务
- **性能优化**：合理的数据缓存和更新策略

## 📝 开发日志

- ✅ 项目初始化和基础配置
- ✅ QAnything API集成和界面开发
- ✅ WakaTime API集成和页脚展示
- ✅ 课程练习组件化改造
- ✅ 路由系统和导航设计
- ✅ 响应式布局和样式优化
- ✅ 错误处理和用户体验优化
- ✅ 文档编写和部署准备

## 🤝 贡献指南

欢迎同学们提交Issue和Pull Request来改进这个项目！

## 📄 许可证

MIT License

---

**开发者**: [周方雄]  
**项目地址**: [https://github.com/GianfrancoZFX/Web-front-end-technology-learning-platform]  
**更新时间**: 2025年7月
**注意**：如果GITHUB的文件存在问题们还可以通过百度网盘链接访问项目文件： https://pan.baidu.com/s/1ZSmZyFBq82BcDAoXQtv-8A?pwd=7sgg（提取码: 7sgg）
