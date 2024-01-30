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
cd PFS/client/src/pages

# Step 5: Get ALB DNS name from Terraform output (make sure Terraform is installed and initialized)
ALB_DNS_NAME=$(terraform output -module=app-alb app-alb_dns)

# Step 6: Change src/pages/config.js content
echo "const API_BASE_URL = \"http://$ALB_DNS_NAME:8080\";" > config.js
echo "export default API_BASE_URL;" >> config.js

# Step 7: Install npm dependencies
cd ../..
npm install

# Step 8: Build the front-end code
npm start
#npm run build

# Examine Instance Logs: Inspect the instance logs (usually in sudo cat /var/log/cloud-init-output.log) for any errors or clues about the cloning process. This can help identify issues if the cloning failed.

