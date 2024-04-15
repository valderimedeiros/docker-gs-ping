# Use a base image
FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# Set maintainer label
LABEL maintainer="Your Name <your.email@example.com>"

# Install necessary packages
RUN microdnf install -y curl && \
    microdnf clean all

# Set the working directory
WORKDIR /opt/app

# Download the binary file
RUN curl -L -o app-binary https://github.com/ruanyf/simple-bash-scripts/blob/master/scripts/hello-world.sh

# Make the binary executable
RUN chmod +x app-binary

# Set the default command to execute the binary
CMD ["./app-binary"]
