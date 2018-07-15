#!/bin/sh
rootFolderName=contracts-docker

# Create neessary folders
if [ -e /neo4j ]; then
  echo "/neo4j folder already exists, skipped writing";
else
  mkdir /neo4j
  cd /neo4j
  mkdir /data
  mkdir /plugins
  cd /plugins
  wget https://github.com/neo4j-graphql/neo4j-graphql/releases/download/3.4.0.1/neo4j-graphql-3.4.0.1.jar
fi

# Start deployment
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