sudo apt update && sudo apt install -y curl
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup component add rustfmt
rustup update
sudo apt-get update
sudo apt-get install -y \
	libssl-dev \
	libudev-dev \
	pkg-config \
	zlib1g-dev \
	llvm \
	clang \
	cmake \
	make \
	libprotobuf-dev \
	protobuf-compiler

export TAG=v1.18.22-jito
