clear
echo "# Start a container named 'ubuntu1':"
echo "docker run -it --name ubuntu1 ubuntu"
echo " "; read -p "Begin..." -n1 -s
docker run -i --name ubuntu1 ubuntu << EOF
hostname
uname -a
echo " "
echo "# curl fails:"
echo "curl google.com"
sleep 2
curl google.com
sleep 2
echo "# Install curl:"
echo "apt-get update && apt install -y curl"
sleep 2
apt-get update && apt install -y curl
sleep 2
echo "# Run curl; it works."
echo "curl google.com"
sleep 2
curl google.com
exit
EOF
echo "# Start a new container named 'ubuntu2':"
echo "docker run -it --name ubuntu2 ubuntu"
echo " "; read -p "Begin..." -n1 -s
docker run -i --name ubuntu2 ubuntu << EOF
hostname
uname -a
sleep 2
echo "# curl fails:"
echo "curl google.com"
sleep 2
curl google.com
exit
EOF
echo " "; read -p "Continue..." -n1 -s; echo " "
echo "List all containers:"
echo "docker ps -a"
echo " "; read -p "Continue..." -n1 -s; echo " "
docker ps -a
echo " "; read -p "Continue..." -n1 -s; echo " "
echo "Start ubuntu1:"
echo "docker start ubuntu1"
echo " "; read -p "Continue..." -n1 -s; echo " "
docker start ubuntu1
echo " "; read -p "Continue..." -n1 -s; echo " "
echo "Connect to the container:"
echo "docker exec -it ubuntu1 bash"
echo " "; read -p "Continue..." -n1 -s; echo " "
docker exec -i ubuntu1 bash << EOF
sleep 2
echo "# Run curl; it works."
echo "curl google.com"
sleep 2
curl google.com
exit
EOF
echo " "; read -p "Continue..." -n1 -s; echo " "
echo "Commit the container with curl installed as a new image:"
echo "docker commit ubuntu1 curlbuntu"
echo " "; read -p "Continue..." -n1 -s; echo " "
docker commit ubuntu1 curlbuntu
echo " "; read -p "Continue..." -n1 -s; echo " "
echo "Show images:"
echo "docker images"
echo " "; read -p "Continue..." -n1 -s; echo " "
docker images
echo " "; read -p "Continue..." -n1 -s; echo " "
echo "Run a container using the newly created image, curlbuntu"
echo "docker run -it --name ubuntu3 curlbuntu"
echo " "; read -p "Continue..." -n1 -s; echo " "
docker run -i --name ubuntu3 curlbuntu << EOF
echo "# Run curl; it works."
echo "curl google.com"
sleep 2
curl google.com
exit
EOF

