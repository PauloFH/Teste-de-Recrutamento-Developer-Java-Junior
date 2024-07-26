FROM openjdk:21-jdk-slim

ENV MINECRAFT_VERSION=1.21
ENV MINECRAFT_HOME=/minecraft
ENV MINECRAFT_EULA=true

RUN mkdir -p $MINECRAFT_HOME
WORKDIR $MINECRAFT_HOME

RUN apt-get update && apt-get install -y curl git
RUN curl -o server.jar https://download.getbukkit.org/spigot/spigot-${MINECRAFT_VERSION}.jar

# Clone o repositório do plugin e copie o JAR gerado
COPY scripts/setup-plugins.sh $MINECRAFT_HOME/
RUN chmod +x setup-plugins.sh && ./setup-plugins.sh

COPY plugins /minecraft/plugins/
# Aceitar o EULA do Minecraft
RUN echo "eula=${MINECRAFT_EULA}" > eula.txt

# Iniciar o servidor Minecraft
CMD ["sh", "-c", "java -jar server.jar nogui && /bin/bash"]
