@echo off
cd /d "E:\AUTO KLIK\9Drive"
echo Starting 9Drive Gateway...
echo Opening dashboard at http://localhost:5173
start http://localhost:5173
npm run dev
pause
