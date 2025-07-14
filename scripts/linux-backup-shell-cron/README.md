## 🧰 Shell Backup Script

A simple and interactive Shell script to create, list, delete, and rename backups of the current directory.
It also supports automated backups via cron, running silently in the background.

## 📂 Features

📦 Create compressed backups (.tar.gz)

📋 List all existing backups

🗑️ Delete selected backups

✏️ Rename any backup file

⏰ Can run automatically via cron job (non-interactive mode)

## 📌 Backup Details

All backups are saved in:
~/projetos/backups/

Backup filenames follow the format:
backup_YYYY-MM-DD_HH-MM-SS.tar.gz

## 🚀 How to Use

Make the script executable:

chmod +x backup.sh

Run it:

./backup.sh

Use the interactive menu:

======= BACKUP MENU =======
1 - Create new backup
2 - List backups
3 - Delete a backup
4 - Rename a backup
5 - Exit
===========================

## 🔁 Automating with Cron
To schedule the script for daily execution at 8PM:

bash
Copiar
Editar
crontab -e

Add this line:

0 20 * * * /path/to/backup.sh
Make sure the script is executable and the path is correct.

## 📎 Requirements
Linux with Bash

Write permission to ~/projetos/backups

Standard tools: tar, mkdir, rm, ls, date

## 📄 Example Output

Current directory set as source: /home/danilo/my-project
BACKUP CREATED: backup_2025-07-14_20-00-00.tar.gz

## ✨ Author

Created by Danilo