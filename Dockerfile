# Use uma imagem base do Red Hat Universal Base Image 8
FROM registry.access.redhat.com/ubi8/ubi:latest

# Instale as dependências necessárias
RUN yum -y install wget

# Defina o diretório de trabalho
WORKDIR /usr/local/bin

# Baixe o binário do Hugo
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.88.1/hugo_0.88.1_Linux-64bit.tar.gz && \
    tar -xzf hugo_0.88.1_Linux-64bit.tar.gz && \
    mv hugo /usr/local/bin/ && \
    rm -rf hugo_0.88.1_Linux-64bit.tar.gz LICENSE README.md

# Defina o diretório de trabalho para o diretório do site
WORKDIR /usr/share/nginx/html

# Copie o site para o diretório de trabalho (por exemplo, o site Hugo)
COPY ./my-site /usr/share/nginx/html

# Exponha a porta do site
EXPOSE 80

# Gere o site e inicie o servidor Hugo quando o contêiner iniciar
CMD ["hugo", "server", "--bind=0.0.0.0"]
