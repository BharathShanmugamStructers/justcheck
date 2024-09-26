To ensure that the dwagent_generic.sh script runs entirely in a non-interactive mode (Command Line Interface, CLI) without launching a GUI, you can use certain environment variables or additional options, depending on how the script is designed.

Here’s how you can approach it:

Ensure CLI Mode: Some scripts automatically detect a graphical environment and launch a GUI. To prevent this, set the DISPLAY environment variable to null before running the script, which forces the script to run in CLI mode.

Modify the Installation Script: If there are no specific options provided by the script to force CLI mode, you might have to modify the script or ensure it's running in a CLI environment.

Here’s an updated version of your automation script:

bash
Copy code
#!/bin/bash

# Step 1: Download the dwagent_generic.sh script
echo "Downloading DWAgent installation script..."
sudo wget -O dwsagent.sh https://www.dwservice.net/download/dwagent_generic.sh

# Step 2: Make the script executable
echo "Making the script executable..."
sudo chmod +x dwsagent.sh

# Step 3: Run in CLI mode by disabling DISPLAY to avoid launching GUI
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
) | sudo DISPLAY= ./dwsagent.sh  # Force CLI by setting DISPLAY to null

# Step 4: Prompt the user for the installation code
echo "Please enter the installation code:"
read INSTALL_CODE

# Continue the process by accepting the installation code
echo "Installation will continue after you provide the code."
echo "Installation completed!"
Key Changes:
DISPLAY=: Setting DISPLAY to an empty value (null) forces the script to run in CLI mode, preventing it from opening any graphical user interface (GUI).
How to Execute:
Save the script as auto_install_dwagent_cli.sh.
Make the script executable:
bash
Copy code
chmod +x auto_install_dwagent_cli.sh
Run the script:
bash
Copy code
./auto_install_dwagent_cli.sh
This should prevent the application from launching the GUI and ensure the entire process runs in the command line. Let me know how it works for you!
