clear
echo "# Unshare the user"
echo "# With no UID mapping the user and group is 'nobody'"
echo "unshare --user
"
unshare --user << EOF
printf "%20s : %s\n" 'hostname'  "\$(hostname)"
printf "%20s : %s\n" 'uname -a'  "\$(uname -a)"
printf "%20s : %s\n" 'id'        "\$(id)"
printf "%20s : %s\n" 'echo \$\$' "\$(echo \$\$)"
printf "%20s : %s\n" 'pwd'       "\$(pwd)"
echo " "
EOF
read -p "Press any key to continue..." -n1 -s
echo "

"
echo "# Unshare the user"
echo "# This time mapping the current UID/GID as superuser"
echo "unshare --user --map-root-user
"
unshare --user --map-root-user << EOF
printf "%20s : %s\n" 'hostname'  "\$(hostname)"
printf "%20s : %s\n" 'uname -a'  "\$(uname -a)"
printf "%20s : %s\n" 'id'        "\$(id)"
printf "%20s : %s\n" 'echo \$\$' "\$(echo \$\$)"
printf "%20s : %s\n" 'pwd'       "\$(pwd)"
echo " "
EOF

echo "# Note the difference in the UID and GID output in the two \`id\` commands above"
read -p "Press any key to continue..." -n1 -s
clear

echo "# Unshare the network space and manipulate network resources"
echo "unshare --user --map-root-user --net
"
unshare --user --map-root-user --net << EOF
echo "# ip link show before:" && ip link show
echo "
# Add a veth adapter:

ip link add type veth" && ip link add type veth
echo "# ip link show after:" && ip link show
echo " "
EOF

read -p "Press any key to continue..." -n1 -s
clear

echo "# Unshare the UTS (Unix time sharing) namespace and change host name"
echo "unshare --user --map-root-user --net --uts
"
unshare --user --map-root-user --net --uts << EOF
printf "%20s : %s\n\n" 'hostname before'  "\$(hostname)"
echo "# Set a new hostname:
"
echo "hostname alpine" && hostname alpine
echo " "
printf "%20s : %s\n\n" 'hostname after'  "\$(hostname)"
EOF

read -p "Press any key to continue..." -n1 -s
clear

echo "# Give the process its own set of process ID space (--pid);"
echo "# Allow it to fork (--fork);"
echo "# Allow it to mount filesystems (--mount);"
echo "# Mount /proc (--mount-proc);"
echo "# Start a new shell (bash)"
echo "unshare --user --map-root-user --net --uts --pid --fork --mount --mount-proc bash
"
unshare --user --map-root-user --net --uts --pid --fork --mount --mount-proc bash << EOF
echo "# What processes are running?
"
echo "ps -ef" && ps -ef
echo " "
printf "%20s : %s\n"  'hostname'  "\$(hostname)"
printf "%20s : %s\n"  'uname -a'  "\$(uname -a)"
printf "%20s : %s\n"  'id'        "\$(id)"
printf "%20s : %s\n"  'echo \$\$' "\$(echo \$\$)"
printf "%20s : %s\n"  'pwd'       "\$(pwd)"
echo " "
EOF

read -p "Press any key to continue..." -n1 -s
clear

echo "# Add a dedicated IPC namespace and change the root directory"
echo "unshare --user --map-root-user --net --uts --pid --fork --mount --mount-proc --ipc chroot /home/opc/alpine
"
unshare --user --map-root-user --net --uts --pid --fork --mount --mount-proc --pid --ipc chroot /home/opc/alpine 2>&1
echo "
# Why did this fail?
"
read -p "Press any key to continue..." -n1 -s
echo " "
echo "# Provide a shell to run:"
echo "unshare --user --map-root-user --net --uts --pid --fork --mount --mount-proc --ipc chroot /home/opc/alpine /bin/ash
"
unshare --user --map-root-user --net --uts --pid --fork --mount --mount-proc --ipc chroot /home/opc/alpine /bin/ash << EOF
printf "%20s : %s\n" 'hostname'     "\$(hostname)"
printf "%20s : %s\n" 'uname -a'     "\$(uname -a)"
printf "%20s : %s\n" 'id'           "\$(id)"
printf "%20s : %s\n" 'echo \$\$'    "\$(echo \$\$)"
printf "%20s : %s\n" 'pwd'          "\$(pwd)"
read -p "Press any key to continue..." -n1 -s
echo " "
echo "ip link show" && ip link show
echo " "
read -p "Press any key to continue..." -n1 -s
echo "# What processes are running?"
echo "ps -ef" && ps -ef
echo " "
EOF
