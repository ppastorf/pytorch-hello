.PHONY: *

install-pytorch-linux-cpu:
	@pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

install-pytorch-linux-rocm:
	@pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.2

install-pytorch-win-cpu:
	@pip install torch torchvision torchaudio

testinstall:
	@python3 testinstall.py

run:
	@python3 main.py

testinstall-docker:
	@docker run \
		-it \
		--network=host \
		--device=/dev/dri \
		--group-add=video \
		--ipc=host \
		--cap-add="SYS_PTRACE" \
		--security-opt "seccomp=unconfined" \
		--shm-size 8G \
		-v ".:/app" \
		--workdir "/app" \
		rocm/pytorch:latest \
		python3 testinstall.py

run-docker:
	@docker run \
		-it \
		--network=host \
		--device=/dev/dri \
		--group-add=video \
		--ipc=host \
		--cap-add="SYS_PTRACE" \
		--security-opt "seccomp=unconfined" \
		--shm-size 8G \
		-v ".:/app" \
		--workdir "/app" \
		rocm/pytorch:latest \
		python3 main.py