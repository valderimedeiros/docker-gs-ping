# Use a imagem ubi8/ubi-minimal como base
FROM registry.access.redhat.com/ubi8/ubi-minimal
# Instale o netcat
RUN microdnf install -y nmap-ncat && microdnf clean all

# Defina o diretório de trabalho para /app
WORKDIR /app

# Adicione o script do servidor para o diretório de trabalho
ADD postal /app/postal/postal

# Torna o script executável 
RUN chmod +x /app/postal/postal

# Defina o ENTRYPOINT
ENTRYPOINT ["/app/postal"]

# Defina o CMD 
CMD ["./postal"]
