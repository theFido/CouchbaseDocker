echo "Starting container"
sudo docker start cbase_server
echo "Container running on:"
sudo docker inspect cbase_server | grep "IPAddress	"