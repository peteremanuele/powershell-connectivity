# Network Testing Script README

## Overview
This PowerShell script is designed to perform network connectivity tests, including pinging specified IP addresses (e.g., a router, Google, and an RDP gateway) and logging the results. The script runs for a specified duration (e.g., 15 minutes) and can be scheduled to run at regular intervals. It also includes log rotation for managing log files.

## Usage
1. **Modify Variables**: Before using the script, open it in a text editor and update the following variables in the script to match your network configuration:

   - `$RouterIP`: Replace with the IP address of your router.
   - `$GoogleIP`: Replace with the IP address you want to ping (e.g., 8.8.8.8 for Google's DNS server).
   - `$RDPIp`: Replace with the IP address of your RDP gateway.
   - `$LogDirectory`: Specify the directory where you want to store the log files.
   - `$LogArchiveDirectory`: Specify the directory where you want to archive log files.

2. **Running the Script**: To execute the script, open a PowerShell terminal and navigate to the directory where you saved the script. Run the script by using the following command:


Before running the script, ensure that your PowerShell execution policy allows running scripts. You can check and set the execution policy using the `Get-ExecutionPolicy` and `Set-ExecutionPolicy` commands, as needed.

3. **Output**: The script logs the test results in a file named `ping_log.txt` within the specified `$LogDirectory`. You can review these logs to monitor network connectivity over time.

4. **Scheduling**: To run the script at regular intervals (e.g., every 15 minutes), you can set up a task scheduler or use your Remote Monitoring and Management (RMM) tool to trigger the script execution.

5. **Log Rotation**: The script includes automatic log rotation. Old logs are moved to the specified `$LogArchiveDirectory`, and logs older than one week are deleted.

## Notes
- Ensure that the necessary network ports are open and accessible for the ping tests to work.

- Be cautious when running scripts, especially those from untrusted sources. Review and understand the script's functionality before running it.

- Customize the script as needed for your specific network environment and requirements.

## License
This script is provided under an open-source license. You are free to modify and distribute it as per the terms of the license.

