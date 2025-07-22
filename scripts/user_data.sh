#!/bin/bash

# Install Java & Maven
sudo apt update -y
sudo apt install apache2 -y

# Write a simple webpage
echo "<html><body><h1>This EC2 instance was automatically provisioned using Terraform and configured using User Data.</h1></body></html>" | sudo tee /var/www/html/index.html
 
# Start Apache and enable it on boot
sudo systemctl start apache2
sudo systemctl enable apache2