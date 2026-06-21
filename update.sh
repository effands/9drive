#!/bin/bash
# Go to the project root directory
cd "$(dirname "$0")"

echo "=== System Update Started: $(date) ===" > update.log

echo "1. Pulling latest code from GitHub..." >> update.log
git pull >> update.log 2>&1

echo "2. Installing backend dependencies and building..." >> update.log
cd backend
npm install >> ../update.log 2>&1
npx prisma generate >> ../update.log 2>&1
npm run build >> ../update.log 2>&1
npx prisma migrate deploy >> ../update.log 2>&1

echo "3. Installing frontend dependencies and building..." >> update.log
cd ../frontend
npm install >> ../update.log 2>&1
npm run build >> ../update.log 2>&1

echo "4. Restarting application via PM2..." >> ../update.log
pm2 restart 9drive-backend >> ../update.log 2>&1

echo "=== System Update Completed: $(date) ===" >> ../update.log
