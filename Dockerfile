# Use a imagem ubi8/ubi-minimal como base
FROM registry.access.redhat.com/ubi8/ubi-minimal
# Instale o netcat
RUN microdnf install -y nmap-ncat && microdnf clean all

# Adicione o script do servidor para o diretório de trabalho
ADD postal /app/postal/postal

# Torna o script executável 
USER root
# Torna o script executável 
RUN chgrp -R 0 /app && \
  chmod -R g=u /app && \
  chmod +x /app/postal/postal

# Defina o diretório de trabalho para /app
WORKDIR /app

# Defina o ENTRYPOINT
ENTRYPOINT ["/app/postal/postal"]

# Defina o CMD 
CMD ["./postal/postal"]
