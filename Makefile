clean:
	rm -rvf ".docker/home/data"/*
	rm -rvf ".docker/home/config"/*
	rm -rvf ".docker/home/keyring"*

testnet-node:
	docker-compose up initialize-xion-testnet-1
	docker-compose up download-genesis-xion-testnet-1
	docker-compose up discover-peers-xion-testnet-1
	docker-compose up download-node-snapshot-xion-testnet-1
	docker-compose up start-daemon-xion-testnet-1
