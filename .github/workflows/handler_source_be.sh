if [ ! -d "node43_ci_cd" ]; then
    echo "Folder node43_ci_cd does not exist. Cloning repository..."
    git clone https://github.com/DuyPhuongkhtn/node43_ci_cd.git
else
    echo "Folder node43_ci_cd exists. Pulling latest changes..."
    cd node43_ci_cd
    git pull origin main
fi