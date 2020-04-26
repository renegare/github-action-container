-include secrets.env
export

act-push:
	act push -s DOCKER_USER -s DOCKER_PASS
