FROM node:8-alpine

WORKDIR /app

# התקן את הדרישות
COPY package*.json ./
RUN npm install

# העתק את קוד הפרויקט
COPY . .

# הגדר סביבת בדיקות
ENV CI=true
ENV NODE_ENV=test

# התקן git ואתחל מאגר
RUN apk add --no-cache git \
    && git init \
    && git config --global user.email "test@example.com" \
    && git config --global user.name "Test User" \
    && git add . \
    && git commit -m "Initial commit"

# הגדר את פקודת הבדיקות כך שתעבוד בסביבת CI
CMD ["npm", "test", "--", "--watchAll=false", "--CI=true"]