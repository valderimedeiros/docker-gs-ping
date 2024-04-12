# Use uma imagem base do Red Hat Universal Base Image 8
FROM registry.access.redhat.com/ubi8/ubi:latest

# Instale as dependências necessárias
RUN yum -y install wget unzip

# Defina o diretório de trabalho
WORKDIR /usr/local/bin

# Baixe o binário do Terraform
RUN wget https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_amd64.zip && \
    unzip terraform_1.0.8_linux_amd64.zip && \
    rm terraform_1.0.8_linux_amd64.zip

# Verifique a instalação
RUN terraform --version

# Defina o diretório de trabalho para o diretório do projeto Terraform
WORKDIR /app

RUN ls

# Copie o projeto Terraform para o diretório de trabalho
COPY ./my-terraform-project /app

# Execute o Terraform init quando o contêiner iniciar
CMD ["terraform", "init"]
