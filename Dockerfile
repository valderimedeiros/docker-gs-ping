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
RUN curl -L -o app-binary.sh https://filesamples.com/samples/code/sh/sample3.sh

# Make the binary executable
RUN chmod +x app-binary.sh

# Set the default command to execute the binary
CMD ["./app-binary.sh"]
