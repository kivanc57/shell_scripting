# Utility Scripting Collection  

## Description 💥

This project consists of various `Bash` scripts designed to automate tasks related to system administration, backup management, log file handling, and more. Each script is crafted to fulfill a specific role, enhancing efficiency and simplifying complex processes while primarily targeting *Linux* operating systems.

### 📄 Purpose

The *main purpose* of this project is to provide a collection of reusable scripts that streamline routine administrative tasks, allowing system administrators and users to focus on more strategic activities. By automating these processes, we aim to reduce human error, improve reliability, and ensure consistency in execution.

### Key Features

- ⚡️ **Automation of Routine Tasks**: Each script automates common system administration tasks, such as backing up important directories, checking disk usage, and monitoring system resources.
  
- ⚡️ **Customizable and Modular Design**: Scripts are designed to be modular, making it easy for users to modify or extend functionality as needed to suit their specific environments or requirements.
  
- ⚡️**Error Handling**: Each script includes basic error handling to alert users of potential issues during execution, helping to ensure smoother operations.
  
- ⚡️**Documentation and Usage Instructions**: Comprehensive inline comments and documentation provide guidance on how to use each script effectively, making them accessible to users of varying skill levels.


## 👾 Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Scripts Overview](#scripts-overview)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## 🤖 Installation <a id="installation"></a>

To get started, clone the repository to your local machine:

```bash
git clone https://github.com/kivanc57/utility_scripting_collection
cd utility_scripting_collection
```

## 🐧 Usage <a id="usage"></a>
To use any of the scripts, navigate to the script's directory and execute it. For example:

```bash
chmod +x your_script.sh
./your_script.sh
```

Make sure to follow any specific instructions included in the comments of each script.

## 🧙🏽‍♂️ Scripts Overview <a id="scripts-overview"></a>
Below is a brief overview of the available scripts in this repository:

### 1. Log Archiver 💯
- **Filepath**: ./src
- **Filename**: `log_archiver.sh`
- **Description**: Moves log files older than 30 days to an archive directory and compresses them.
### 2. Backup Creator 💯
- **Filepath**: ./src
- **Filename**: `backup_creator.sh`
- **Description**: Backs up specified directories (/etc and /home) and stores them in a designated backup folder.
### 3. Simple Calculator 💯
- **Filepath**: ./src
- **Filename**: `calculator.sh`
- **Description**: A basic calculator that performs addition, subtraction, multiplication, and division.
### 4. CPU Usage Monitor 💯
- **Filepath**: ./src
- **Filename**: `cpu_monitor.sh`
- **Description**: Checks the current CPU usage and alerts if it exceeds a specified threshold.
### 5. URL Checker 💯
- **Filepath**: ./src
- **Filename**: `url_checker.sh`
- **Description**: Checks the HTTP status of a provided URL and reports the result.
### 6. File Deleter 💯
- **Filepath**: ./src
- **Filename**: `file_deleter.sh`
- **Description**: Deletes files older than a specified number of days in a given directory.
### 7. Disk Usage Checker 💯
- **Filepath**: ./src
- **Filename**: `disk_usage_checker.sh`
- **Description**: Reports the disk usage of a specified folder and warns if it exceeds a certain percentage.
### 8. Docker Deployment Script 💯
- **Filepath**: ./src
- **Filename**: `docker_deploy.sh`
- **Description**: Facilitates the deployment of a Docker application, handling image build and container management.
### 9. Largest File Finder 💯
- **Filepath**: ./src
- **Filename**: `largest_file_finder.sh`
- **Description**: Retrieves the top 10 largest files in a specified directory.
### 10. Error Log Checker 💯
- **Filepath**: ./src
- **Filename**: `error_log_checker.sh`
- **Description**: Searches system log files for errors and reports any findings.
### 11. MySQL Backup Script 💯
- **Filepath**: ./src
- **Filename**: `mysql_backup.sh`
- **Description**: Creates a backup of a specified MySQL database.
### 12. Package Installer 💯
- **Filepath**: ./src
- **Filename**: `package_installer.sh`
- **Description**: Installs a specified package based on the operating system detected.
### 13.System Monitoring 💯
- **Filepath**: ./src/server
- **Filename**: `server_disk_monitor.sh`  
- **Description**: Monitors disk utilization and logs the status every specified interval.
### 14. Service Configuration 💯
- **Filepath**: ./src/server
- **Filename**: `monitor.service`  
- **Description**: A systemd service configuration to run the `server_disk_monitor.sh` script as a service.

## Contributing 🤩 <a id="contributing"></a>
Contributions are welcome! If you would like to contribute to this project, please fork the repository and submit a pull request with your changes.

## License ✏️ <a id="license"></a>
This project is licensed under the GNU GENERAL PUBLIC LICENSE - see the [LICENSE](https://github.com/kivanc57/utility_scripting_collection/blob/main/LICENSE) file for details.

## Contact ✉ <a id="contact"></a>

For any inquiries or contributions, please feel free to reach out.

- **GitHub Profile**: [kivanc57](https://github.com/kivanc57)
- **Email**: [kivancgordu@hotmail.com](mailto:kivancgordu@hotmail.com)
