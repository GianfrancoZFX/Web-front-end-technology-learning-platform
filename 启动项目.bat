@echo off
chcp 65001 >nul
echo ========================================
echo    Web前端技术学习平台 - 一键启动
echo ========================================
echo.
echo 🚀 正在启动项目...
echo.

REM 检查Node.js是否安装
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ 错误：未检测到Node.js，请先安装Node.js
    echo 📥 下载地址：https://nodejs.org/
    pause
    exit /b 1
)

echo ✅ Node.js 已安装
node --version
echo.

REM 进入主项目目录
cd /d "%~dp0my-next-app"

REM 检查是否存在node_modules
if not exist "node_modules" (
    echo 📦 首次运行，正在安装依赖包...
    echo 这可能需要几分钟时间，请耐心等待...
    echo.
    npm install --legacy-peer-deps
    if %errorlevel% neq 0 (
        echo ❌ 依赖安装失败，请检查网络连接
        pause
        exit /b 1
    )
    echo ✅ 依赖安装完成
    echo.
)

REM 检查环境变量文件
if not exist ".env.local" (
    echo 📝 创建环境变量配置文件...
    echo # QAnything API配置 > .env.local
    echo QANYTHING_API_KEY=qanything-2V4LTGtwqRatKGoP52X3CMvAqVYrL4ch >> .env.local
    echo QANYTHING_API_URL=https://api.qanything.ai/v1/chat/completions >> .env.local
    echo. >> .env.local
    echo # WakaTime API配置 >> .env.local
    echo WAKATIME_API_KEY=waka_9d042684-57b4-45ca-8cca-f6e5ee7a6381 >> .env.local
    echo ✅ 环境变量配置完成
    echo.
)

echo 🌟 启动开发服务器...
echo.
echo 📍 服务器地址：http://localhost:3000
echo 🔄 启动中，请稍候...
echo.
echo ⚠️  注意：请保持此窗口打开，关闭窗口将停止服务器
echo 💡 按 Ctrl+C 可以停止服务器
echo.
echo ========================================
echo.

REM 启动开发服务器
npm run dev

REM 如果服务器停止，显示提示信息
echo.
echo 🛑 服务器已停止
echo 📝 如需重新启动，请再次运行此脚本
echo.
pause