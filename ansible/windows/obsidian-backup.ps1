$OBSIDIAN_DIR="G:\My Drive\DriveSyncFiles\pkonkol-obsidian\\"
$RSYNC_DEST="C:\backup\obsidian"
Push-Location $OBSIDIAN_DIR
git status
git add .
git commit -m "Autocommit by scheduled task @$(date)"
robocopy $OBSIDIAN_DIR $RSYNC_DEST /MIR
Pop-Location