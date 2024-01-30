#!/bin/bash

# Step 1: Update package manager
sudo yum update -y

# Step 2: Install Git
sudo yum install -y git

# Step 3: Install Node.js and npm using nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install 16.19.0
nvm use 16.19.0

# Step 4: Clone front-end repository (if applicable)
git clone https://github.com/iliass-bamghari/PFS.git

# Step 5: Install dependencies
cd PFS/backend
npm install

# Step 6: Install MySQL client
sudo yum install mysql -y

# Step 7: Get RDS endpoint using Terraform output (make sure Terraform is properly installed and initialized)
RDS_HOST=$(terraform output -module=db db_endpoint)

# Step 8: Set other database-related values
DB_NAME="test"
DB_USER="iliass"
DB_PASSWORD=$(terraform output -module=db db_password) 
PORT=3306

# Step 9: Create .env file with specified content
echo "DB_HOST=$RDS_HOST" > .env
echo "DB_USERNAME=$DB_USER" >> .env
echo "DB_PASSWORD=$DB_PASSWORD" >> .env 
echo "PORT=$PORT" >> .env

# Step 10: Connect to RDS and import test.sql
mysql --host=$RDS_HOST --user=$DB_USER --password=$DB_PASSWORD --database=$DB_NAME < test.sql

# Step 11: Set environment variables from .env file
source .env  # Use the standard `source` command to set variables

# Step 12: Start the back-end server
npm install
npm start  
