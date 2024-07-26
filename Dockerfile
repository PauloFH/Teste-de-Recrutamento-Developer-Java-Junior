FROM openjdk:21-jdk-slim

ENV MINECRAFT_VERSION=1.21
ENV MINECRAFT_HOME=/minecraft
ENV MINECRAFT_EULA=true

# Criar diretório principal e definir como diretório de trabalho
RUN mkdir -p $MINECRAFT_HOME
WORKDIR $MINECRAFT_HOME

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    curl \
    git \
    screen \
    && rm -rf /var/lib/apt/lists/*

# Baixar o servidor Minecraft
RUN curl -o server.jar https://download.getbukkit.org/spigot/spigot-${MINECRAFT_VERSION}.jar

# Copiar o script de configuração de plugins e dar permissão de execução
COPY scripts/setup-plugins.sh $MINECRAFT_HOME/
RUN chmod +x setup-plugins.sh

# Executar o script de configuração de plugins
RUN ./setup-plugins.sh

# Copiar os plugins para o diretório adequado
COPY plugins /minecraft/plugins/

# Aceitar o EULA do Minecraft
RUN echo "eula=${MINECRAFT_EULA}" > eula.txt

CMD ["tail", "-f", "/dev/null"]