clear
echo "# What images are present?"
echo "# docker images"
docker images
echo "

# Run an ubuntu container:"
echo "# docker run -it ubuntu
"
read -p "Press any key to begin. Type \"exit\" to leave the container." -n1 -s
echo "

"
docker run -it ubuntu
echo "
"
read -p "Press any key to continue..." -n1 -s
echo "

"

echo "# What images are present now?"
echo "# docker images"
docker images
echo "
"
echo "# Run a new ubuntu container (again):"
echo "# docker run -it ubuntu
"
read -p "Press any key to begin. Type \"exit\" to leave the container." -n1 -s
echo "

"
docker run -it ubuntu
echo "
"
read -p "Press any key to continue..." -n1 -s
echo "

"

echo "# What containers are present?"
echo "# docker ps -a"
docker ps -a
echo " "
