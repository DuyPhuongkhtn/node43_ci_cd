# đặt tên cho container muốn kiểm tra
CONTAINER_NAME=mysql

# -q: chỉ hiển thị ID của container
# -f -name=^${CONTAINER_NAME}: lọc chính xác tên container
# kiểm tra xem container có tồn tại hay không
if [ "(docker ps -a -q -f -name=^${CONTAINER_NAME}$)" ];then
    echo "Container $CONTAINER_NAME exists"
else
    echo "Build container mysql"
    docker run -d --name $CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=123456 -p 3306:3306 mysql:latest
fi