# Use a imagem ubi8/ubi-minimal como base
FROM registry.access.redhat.com/ubi8/ubi-minimal
# Instale o netcat
RUN microdnf install -y nmap-ncat && microdnf clean all

RUN mkdir -p /app

# Adicione o script do servidor para o diretório de trabalho
ADD postal /app/postal

# Torna o script executável 
RUN chmod +x /app/postal

# Defina o diretório de trabalho para /app
WORKDIR /app

# Defina o ENTRYPOINT
ENTRYPOINT ["/app/postal"]

# Defina o CMD 
CMD ["./postal"]
