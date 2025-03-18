#!/bin/bash

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Installing Git..."
    if [[ "$OSTYPE" == "msys" ]]; then
        winget install Git.Git
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install git
    else
        sudo apt-get install git
    fi
fi

# Clone repository
echo "Cloning repository..."
git clone https://github.com/shroudcamo6/orbit.git
cd orbit

# Install Node.js and npm
echo "Installing Node.js and npm..."
if [[ "$OSTYPE" == "msys" ]]; then
    winget install OpenJS.NodeJS
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install node
else
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Install MongoDB
echo "Installing MongoDB..."
if [[ "$OSTYPE" == "msys" ]]; then
    winget install MongoDB.MongoDBCommunityServer
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew tap mongodb/brew
    brew install mongodb-community
else
    wget -qO - https://www.mongodb.org/static/pgp/server/6.0.asc | sudo apt-key add -
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
fi

# Install dependencies
echo "Installing dependencies..."
npm install

# Create environment file
echo "Creating environment file..."
echo "MONGODB_URI=mongodb://localhost/orbit
RSS_FEEDS=https://feeds.bbci.co.uk/news/rss.xml,https://www.nytimes.com/services/xml/rss/nyt/HomePage.xml" > .env

# Initialize MongoDB
echo "Initializing MongoDB..."
mongod --fork --logpath /var/log/mongodb/mongod.log

# Start application
echo "Starting application..."
npm start
