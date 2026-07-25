@echo off
title OpenHands
color 0A
echo ========================================
echo   OpenHands - Agent Canvas
echo ========================================
echo.
echo Backend:  http://127.0.0.1:3000
echo Frontend: http://127.0.0.1:3001
echo Workspace: %~dp0workspace
echo.
echo Press Ctrl+C to stop all servers.
echo.

set PYTHONPATH=%~dp0openhands
set VIRTUAL_ENV=%~dp0.venv
set PATH=%~dp0.venv\Scripts;%PATH%
set OPENHANDS_CONFIG=%~dp0config.toml
set PROJECTS_PATH=%~dp0workspace

echo Starting Backend on port 3000...
start "OpenHands Backend" python -m uvicorn openhands.app_server.app:app --host 127.0.0.1 --port 3000 --reload

timeout /t 4 /nobreak >nul

echo Starting Frontend on port 3001...
cd /d %~dp0frontend
start "OpenHands Frontend" npx sirv build/ --single --port 3001
cd /d %~dp0

echo.
echo Both servers are starting...
echo Open http://127.0.0.1:3001 in your browser.
echo.
echo To stop servers, close the terminal windows.
echo.
pause