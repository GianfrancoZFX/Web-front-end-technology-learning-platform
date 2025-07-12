# Web前端技术学习平台 - PowerShell启动脚本
# 编码：UTF-8

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "    Web前端技术学习平台 - 一键启动" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "🚀 正在启动项目..." -ForegroundColor Green
Write-Host ""

# 检查Node.js是否安装
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js 已安装: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ 错误：未检测到Node.js，请先安装Node.js" -ForegroundColor Red
    Write-Host "📥 下载地址：https://nodejs.org/" -ForegroundColor Yellow
    Read-Host "按回车键退出"
    exit 1
}

Write-Host ""

# 获取脚本所在目录并进入主项目目录
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectPath = Join-Path $scriptPath "my-next-app"

if (-not (Test-Path $projectPath)) {
    Write-Host "❌ 错误：未找到项目目录 my-next-app" -ForegroundColor Red
    Read-Host "按回车键退出"
    exit 1
}

Set-Location $projectPath
Write-Host "📁 已切换到项目目录: $projectPath" -ForegroundColor Blue
Write-Host ""

# 检查是否存在node_modules
if (-not (Test-Path "node_modules")) {
    Write-Host "📦 首次运行，正在安装依赖包..." -ForegroundColor Yellow
    Write-Host "这可能需要几分钟时间，请耐心等待..." -ForegroundColor Yellow
    Write-Host ""
    
    try {
        npm install --legacy-peer-deps
        Write-Host "✅ 依赖安装完成" -ForegroundColor Green
    } catch {
        Write-Host "❌ 依赖安装失败，请检查网络连接" -ForegroundColor Red
        Read-Host "按回车键退出"
        exit 1
    }
    Write-Host ""
}

# 检查环境变量文件
if (-not (Test-Path ".env.local")) {
    Write-Host "📝 创建环境变量配置文件..." -ForegroundColor Yellow
    
    $envContent = @"
# QAnything API配置
QANYTHING_API_KEY=qanything-2V4LTGtwqRatKGoP52X3CMvAqVYrL4ch
QANYTHING_API_URL=https://api.qanything.ai/v1/chat/completions

# WakaTime API配置
WAKATIME_API_KEY=waka_9d042684-57b4-45ca-8cca-f6e5ee7a6381
"@
    
    $envContent | Out-File -FilePath ".env.local" -Encoding UTF8
    Write-Host "✅ 环境变量配置完成" -ForegroundColor Green
    Write-Host ""
}

Write-Host "🌟 启动开发服务器..." -ForegroundColor Green
Write-Host ""
Write-Host "📍 服务器地址：http://localhost:3000" -ForegroundColor Cyan
Write-Host "🔄 启动中，请稍候..." -ForegroundColor Yellow
Write-Host ""
Write-Host "⚠️  注意：请保持此窗口打开，关闭窗口将停止服务器" -ForegroundColor Red
Write-Host "💡 按 Ctrl+C 可以停止服务器" -ForegroundColor Yellow
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 启动开发服务器
try {
    npm run dev
} catch {
    Write-Host ""
    Write-Host "🛑 服务器已停止" -ForegroundColor Red
    Write-Host "📝 如需重新启动，请再次运行此脚本" -ForegroundColor Yellow
}

Write-Host ""
Read-Host "按回车键退出"