# Use uma imagem base do Red Hat Universal Base Image 8
FROM registry.access.redhat.com/ubi8/ubi:latest

# Instale as dependências necessárias
RUN yum -y install wget

# Defina o diretório de trabalho
WORKDIR /usr/local/bin

# Baixe o binário do Node.js
RUN wget https://nodejs.org/dist/v14.17.5/node-v14.17.5-linux-x64.tar.xz && \
    tar -xJf node-v14.17.5-linux-x64.tar.xz && \
    cp node-v14.17.5-linux-x64/bin/node /usr/local/bin/ && \
    rm -rf node-v14.17.5-linux-x64*

# Defina o diretório de trabalho para o diretório do aplicativo
WORKDIR /app

# Copie o aplicativo para o diretório de trabalho (por exemplo, o aplicativo Node.js)
COPY ./my-app /app

# Exponha a porta do aplicativo
EXPOSE 3000

# Execute o aplicativo quando o contêiner iniciar
CMD ["node", "app.js"]
