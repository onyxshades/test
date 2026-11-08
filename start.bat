@echo off
chcp 65001 >nul
cd /d "%~dp0"

rem Если рядом лежит папка node с node.exe (portable-версия), берём её. Иначе системный Node.
if exist "node\node.exe" (
  set "NODE=node\node.exe"
) else (
  set "NODE=node"
)

%NODE% -v >nul 2>&1
if errorlevel 1 (
  echo Node.js не найден.
  echo Установи Node.js 22 или новее, либо распакуй portable-версию в папку "node" рядом с этим файлом.
  pause
  exit /b 1
)

echo Запускаю MintGram... Открой в браузере http://localhost:3000
echo Чтобы остановить сервер, закрой это окно или нажми Ctrl+C.
echo.
%NODE% server\index.js
echo.
pause