# Linux System Report Generator

A simple Bash command-line tool that collects basic information about a Linux computer and saves it as a readable text report.

## Features

The report includes:
- Hostname
- Kernel version and architecture
- Disk usage (`df -h`)
- Memory usage (`free -h`, with a `/proc/meminfo` fallback)
- Top 10 running processes sorted by CPU usage

## Requirements

- A Linux system
- Bash
- Standard Linux utilities: `hostname`, `uname`, `df`, `ps`, `head`
- `free` is recommended; the script falls back to `/proc/meminfo` if it is unavailable

## How to run

1. Clone this repository or download the project files.
2. Open a terminal and move into the project directory:

   ```bash
   cd linux-system-report
   ```

3. Make the script executable:

   ```bash
   chmod +x system_report.sh
   ```

4. Run the script:

   ```bash
   ./system_report.sh
   ```

5. Read the generated report:

   ```bash
   cat system-report.txt
   ```

By default, the script writes `system-report.txt` in the current directory. You can optionally provide a different output path:

```bash
./system_report.sh my-report.txt
```

## Files

- `system_report.sh` — collects system information and creates the report.
- `system-report.txt` — example report file included with the project; running the script replaces it with current system data.
- `README.md` — project overview and instructions.

## Notes

The report reflects the computer and time on which the script is run. Some commands or output details may vary across Linux distributions. The script does not require root privileges for the information it collects.

## License

This project is available for educational use.
