#!/usr/bin/expect

# Set a timeout for interactions
set timeout -1

# Step 1: Download the dwagent_generic.sh script
spawn sudo wget -O dwsagent.sh https://www.dwservice.net/download/dwagent_generic.sh
expect eof

# Step 2: Make the script executable
spawn sudo chmod +x dwsagent.sh
expect eof

# Step 3: Run the installer script
spawn sudo ./dwsagent.sh

# Automate the selection of the "Install" option
expect "By selecting the 'Install' or 'Run' option I accept the Terms and Conditions"
send "1\r"  # Select 'Install'

# Automate the installation path selection
expect "Installation path"
send "/usr/share/dwagent\r"  # Installation path set to /usr/share/dwagent

# Automate the confirmation of the installation path
expect "Would you like to install DWAGENT in /usr/share/dwagent"
send "y\r"  # Confirm with 'yes'

# Automate the configuration mode selection
expect "How would you like to configure the agent?"
send "1\r"  # Select 'Enter the installation code'

# Step 4: At this point, prompt the user to enter the installation code
expect "Enter the installation code"
interact  # Hand over control to the user to manually enter the code

# End of script
