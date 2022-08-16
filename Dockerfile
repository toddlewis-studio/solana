FROM ubuntu:latest

# update apt
RUN apt update

# get curl
RUN apt install -y curl

# install solana
RUN sh -c "$(curl -sSfL https://release.solana.com/v1.10.32/install)"
ENV PATH="/root/.local/share/solana/install/active_release/bin:$PATH"

# install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# dependancies
RUN apt install libudev-dev -y
RUN apt install libssl-dev pkg-config -y
RUN apt install build-essential -y

RUN cargo install spl-token-cli