@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ===== AutoLD 發佈腳本 =====
echo.

:: 1. 添加所有檔案並提交
echo [1/7] 添加檔案...
git add .

echo [2/7] 提交變更...
git commit -m "Update: %date% %time%"

:: 2. 創建新的 orphan 分支（無歷史）
echo [3/7] 創建無歷史分支...
git checkout --orphan temp_branch

:: 3. 添加所有檔案到新分支
echo [4/7] 添加所有檔案...
git add -A

:: 4. 提交
echo [5/7] 提交...
git commit -m "Initial commit - Clean history"

:: 5. 刪除舊的 main 分支
echo [6/7] 刪除舊分支...
git branch -D main

:: 6. 重命名為 main
git branch -m main

:: 7. 強制推送（覆蓋遠端歷史）
echo [7/7] 強制推送...
git push -f origin main

echo.
echo ===== 發佈完成，歷史已清除 =====
pause
