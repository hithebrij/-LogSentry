# 🛰️ LogSentry – Advanced Log Analyzer & Alerting Script

LogSentry is a lightweight, advanced Bash script that scans critical Linux system logs for suspicious activities and sends email alerts. It’s designed for sysadmins who want fast, CLI-based log monitoring without heavy tools like ELK or Graylog.

---

## 🔍 Features

- 📡 Scans `/var/log` for:
  - SSH login failures
  - Sudo authentication issues
  - Cron job errors
  - Apache/Nginx errors
  - Kernel warnings
- 📨 Sends email alerts with categorized summaries
- 🧪 Can be scheduled via `cron` for automated reporting
- ⚙️ Lightweight, no agents or daemons required

---

## 🛠️ Installation

1. **Clone the repo**
```bash
git clone https://github.com/yourusername/logsentry.git
cd logsentry
```

2. **Make the script executable**
```bash
chmod +x log_analyzer_alert.sh
```

3. **Install required mail utility**
```bash
sudo apt install mailutils -y
```

---

## 🚀 Usage

Run manually:
```bash
./log_analyzer_alert.sh
```

Schedule with cron:
```bash
crontab -e
```

Add this to run daily at midnight:
```cron
0 0 * * * /path/to/log_analyzer_alert.sh
```

---

## ⚙️ Configuration

Inside the script (`log_analyzer_alert.sh`), set:
```bash
EMAIL="you@example.com"
```
to your preferred alert email address.

You can also modify or expand the `patterns[]` array to include custom log checks.

---

## 📦 Directory Structure

```
logsentry/
├── log_analyzer_alert.sh   # Main script
├── README.md               # Documentation
```

---

## 📬 Output

When run, LogSentry:
- Scans for defined log patterns
- Saves results to a temp report file (`/tmp/log_alert_DATE.log`)
- Sends the report to your configured email address

---

## 🧠 Ideas for Future Enhancements

- Telegram or Slack alert support
- HTML report formatting
- Monitor custom app logs
- Docker container version

---

## 📄 License

MIT License – use it freely with credit.

---

## 🤝 Contribute

PRs and ideas welcome! Let’s make Linux log monitoring simpler for everyone.

---

## 🔗 Connect

Made with ❤️ by Brijendra Pratap Singh  
[LinkedIn](https://www.linkedin.com/in/brijendrapratapsingh) • [GitHub](https://github.com/yourusername)
