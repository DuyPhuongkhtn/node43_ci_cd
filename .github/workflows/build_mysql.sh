CONTAINER_NAME=${{secrets.CONTAINER_NAME_SQL}}
if [ "$(sudo docker ps -a -q -f name=^${CONTAINER_NAME}$)" ];then
    echo "Container $CONTAINER_NAME exists"
else
    echo "Build container mysql"
    sudo docker run -d --name $CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=123456 -p 3306:3306 mysql:latest
fi