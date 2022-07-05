
if [ $# = 0 ]; then
    echo "Usage: $0 <disk>"
    exit 1
fi

echo "n
p
1
2048
1310720
n
p
2
1312768

w" | fdisk $1

mkfs.vfat ${1}1
mkfs.ext4 ${1}2
