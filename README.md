# bfetch.sh

A **mini neofetch** written in pure **Bash**, without dependencies.  
It prints basic system information with a small Tux ASCII logo aligned on the right.

---

## ✨ Features

- Pure **Bash**, no external tools required (only standard Linux utilities: `uname`, `uptime`, `df`, `free`).
- Displays:
  - Operating System
  - Distribution
  - Kernel version
  - Uptime
  - Shell
  - Terminal
  - Memory usage
  - Disk usage
- Includes a **small ASCII Tux logo** next to the system info.

---

## 📦 Installation

Clone the repository and make the script executable:

```bash
git clone https://github.com/vroby65/bfetch.sh.git
cd bfetch.sh
chmod +x bfetch.sh
```

---

## ▶️ Usage

Run directly:

```bash
./bfetch.sh
```

Example output:

```
OS:     GNU/Linux                             .--.   
Distro: Linux Mint 22.1                      |o_o |  
Kernel: 6.8.0-41-generic                     |:_/ |  
Uptime: 3 hours 12 minutes                  //   \ \ 
Shell:  /usr/bin/fish                      (|     | )
Term:   xterm-256color                     /'\_   _/`\
Memory: 1423MB / 7980MB                    \___)=(___/
Disk:   22G / 120G

user@hostname
```

---

## 🐧 Requirements

* Any **Linux distribution**
* Bash 4+
* Standard commands: `uname`, `uptime`, `df`, `free`

---

## 📜 License

MIT License © [vroby65](https://github.com/vroby65)
