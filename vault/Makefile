run:
	docker run -d --rm --name vault --cap-add=IPC_LOCK -e 'VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200' -p 8200:8200 vault:1.13.3

provision:
	docker logs vault 2>&1 | grep "Root Token" | awk '{ print $$3;}' | tee .vault-token
	chmod +x ./script.sh && ./script.sh

clean:
	docker stop vault
	rm .vault-token
