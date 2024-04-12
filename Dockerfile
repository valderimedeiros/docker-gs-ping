# Use uma imagem base do Red Hat Universal Base Image 8
FROM registry.access.redhat.com/ubi8/ubi:latest

# Instale as dependências necessárias
RUN yum -y install wget

# Defina o diretório de trabalho
WORKDIR /usr/local/bin

# Baixe o binário do NGINX
RUN wget https://nginx.org/download/nginx-1.21.1.tar.gz && \
    tar xvzf nginx-1.21.1.tar.gz && \
    cd nginx-1.21.1 && \
    ./configure && \
    make && \
    make install && \
    cd .. && rm -rf nginx-1.21.1*

# Exponha a porta do NGINX
EXPOSE 80

# Execute o servidor NGINX quando o contêiner iniciar
CMD ["nginx", "-g", "daemon off;"]
