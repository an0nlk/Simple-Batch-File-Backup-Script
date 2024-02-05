# Simple Batch File Backup Script
A simple Windows batch file script for automated folder backups

## Usage

1. Download `backup-script.bat`.
2. Open the script in a text editor.
3. Change the following variables to suit your needs:

   - `destination_folder`: Path to the folder where backups will be stored.
   - `source_folder`: Path to the folder you want to back up.
   - `freq`: Time interval (in seconds) between backups.
   - `amount`: Number of backups to keep.

```batch
set "source_folder=C:\source_folder"
set "destination_folder=C:\backups"
set "freq=600"
set "amount=10"
