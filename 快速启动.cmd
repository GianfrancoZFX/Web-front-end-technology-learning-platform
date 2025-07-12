@echo off
chcp 65001 >nul
title Web前端学习平台 - 快速启动

echo.
echo  ██╗    ██╗███████╗██████╗     ██╗     ███████╗ █████╗ ██████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗ 
echo  ██║    ██║██╔════╝██╔══██╗    ██║     ██╔════╝██╔══██╗██╔══██╗████╗  ██║██║████╗  ██║██╔════╝ 
echo  ██║ █╗ ██║█████╗  ██████╔╝    ██║     █████╗  ███████║██████╔╝██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
echo  ██║███╗██║██╔══╝  ██╔══██╗    ██║     ██╔══╝  ██╔══██║██╔══██╗██║╚██╗██║██║██║╚██╗██║██║   ██║
echo  ╚███╔███╔╝███████╗██████╔╝    ███████╗███████╗██║  ██║██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝
echo   ╚══╝╚══╝ ╚══════╝╚═════╝     ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
echo.
echo                           🚀 Web前端技术学习平台 - 快速启动 🚀
echo.
echo ═══════════════════════════════════════════════════════════════════════════════════════════════
echo.

REM 快速检查并启动
if exist "my-next-app\package.json" (
    echo ✅ 项目检测成功
    echo 🚀 正在启动...
    echo.
    cd my-next-app
    
    REM 快速检查Node.js
    node --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo ❌ 请先安装 Node.js: https://nodejs.org/
        pause
        exit /b 1
    )
    
    REM 如果没有依赖，快速安装
    if not exist "node_modules" (
        echo 📦 安装依赖中...
        npm install --legacy-peer-deps --silent
    )
    
    echo 🌐 启动地址: http://localhost:3000
    echo 💡 按 Ctrl+C 停止服务
    echo.
    
    REM 启动服务
    npm run dev
) else (
    echo ❌ 未找到项目文件，请检查目录结构
    pause
)

echo.
echo 👋 感谢使用！
pause