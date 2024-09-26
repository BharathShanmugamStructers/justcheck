#!/bin/bash

# Step 1: Download the dwagent_generic.sh script
echo "Downloading DWAgent installation script..."
sudo wget -O dwsagent.sh https://www.dwservice.net/download/dwagent_generic.sh

# Step 2: Make the script executable
echo "Making the script executable..."
sudo chmod +x dwsagent.sh

# Step 3: Automatically install the DWAgent without GUI and automate up to the code entry
echo "Running the installation script in CLI mode..."
(
    # Automate the steps for installation
    echo "1"    # Select '1.Install'
    sleep 1
    echo "/usr/share/dwagent"  # Installation path set to /usr/share/dwagent
    sleep 1
    echo "y"    # Confirm installation path
    sleep 1
    echo "1"    # Select '1. Enter the installation Code'
) | sudo DISPLAY= ./dwsagent.sh  # Ensure CLI mode by setting DISPLAY to null

# Step 4: Prompt the user to enter the installation code
echo "Please enter the installation code:"
read INSTALL_CODE

# Step 5: Provide the entered installation code to the script
echo "$INSTALL_CODE" | sudo DISPLAY= ./dwsagent.sh
