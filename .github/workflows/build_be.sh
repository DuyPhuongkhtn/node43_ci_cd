# Dừng và xóa container đã tồn tại nếu có
if [ "$(sudo docker ps -a -q -f name=node43)" ]; then
    echo "Stopping and removing existing container..."
    sudo docker stop node43
    sudo docker rm node43
fi

# Xóa image cũ nếu có
if [ "$(sudo docker images -q node43)" ]; then
    echo "Removing existing image..."
    sudo docker rmi node43
fi

# Build image mới
echo "Building new Docker image..."
sudo docker build -t node43 .

# Tạo container mới từ image
echo "Creating new container..."
sudo docker run -d -p 8080:8080 --name node43 node43

echo "Docker container 'node43' is up and running."