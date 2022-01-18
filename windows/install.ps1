#Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
#$env:path = $env:Path + ';%ALLUSERSPROFILE%\chocolatey\bin'
choco install -y $(cat choco_packages)
choco install -y python --version 3.8.6
choco install -y python --version 3.9.5
wsl --install
wsl --install -d Debian
