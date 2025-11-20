#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Auto-Deployment Setup...${NC}"

# 1. Check for Node.js
if ! command -v node &> /dev/null; then
    echo -e "${YELLOW}Node.js not found. Please install it from https://nodejs.org/${NC}"
    exit 1
fi

# 2. Install Dependencies
echo -e "${GREEN}Installing dependencies...${NC}"
npm install

# 3. Build Project
echo -e "${GREEN}Building project...${NC}"
npm run build

# 4. Git Setup
if [ ! -d ".git" ]; then
    echo -e "${GREEN}Initializing Git...${NC}"
    git init
    git add .
    git commit -m "Auto-deploy commit"
fi

# 5. Remote Setup
echo -e "${YELLOW}Please enter your GitHub Repository URL (e.g., https://github.com/username/repo.git):${NC}"
read REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "Repository URL is required."
    exit 1
fi

git remote add origin "$REPO_URL" 2>/dev/null || git remote set-url origin "$REPO_URL"

# 6. Push
echo -e "${GREEN}Pushing to GitHub...${NC}"
git branch -M main
git push -u origin main

echo -e "${GREEN}Done! Your code is on GitHub.${NC}"
echo -e "${GREEN}If you configured the GitHub Action, it will deploy automatically now.${NC}"
