
rootFolderName=contracts-docker

cd /tmp
rm -fr $rootFolderName

# Clone repository
git clone https://github.com/playerx/contracts-docker.git

# Pull Images
cd $rootFolderName

input="./pull-images.txt"
while IFS= read -r var
do
	docker pull $var
done < "$input"


# Compose
docker-compose up -d

# Cleanup
cd ..
rm -fr $rootFolderName