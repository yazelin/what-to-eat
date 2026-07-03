@echo off
chcp 65001 >nul
title 今天要吃什麼？
cd /d "%~dp0"

echo ============================================
echo   今天要吃什麼？  啟動中...
echo ============================================
echo.

set PORT=8000

REM 嘗試用 Python 啟動本機伺服器（SVG icon 最穩定）
where python >nul 2>nul
if %errorlevel%==0 (
    echo 使用 Python 啟動本機伺服器： http://localhost:%PORT%
    echo 開啟瀏覽器中...按 Ctrl+C 可關閉伺服器。
    echo.
    start "" "http://localhost:%PORT%/index.html"
    python -m http.server %PORT%
    goto :eof
)

REM 沒有 Python 就退而直接開檔
echo 找不到 Python，改用瀏覽器直接開啟 index.html
echo （若食物 icon 沒顯示，請安裝 Python 後再執行本檔）
echo.
start "" "%~dp0index.html"
