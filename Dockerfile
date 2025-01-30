# Use Debian bookworm as the base image
FROM debian:bookworm

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    git

# Install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh

# Add Miniconda to the PATH
ENV PATH="/opt/conda/bin:${PATH}"

# Clone the python-helloworld repository
RUN git clone https://github.com/dbarnett/python-helloworld.git /root/python-helloworld

# Set the working directory
WORKDIR /root/python-helloworld

# Default command
CMD ["python", "hello.py"]