export INTERNAL_IP=$(hostname -I|cut -d' ' -f1)
exec sudo docker-compose up
