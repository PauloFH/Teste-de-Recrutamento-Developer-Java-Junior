FROM openjdk:21-jdk-slim

# Variaveis de ambiente para configurar o servidor
ENV MINECRAFT_VERSION=1.21
ENV MINECRAFT_HOME=/minecraft
ENV MINECRAFT_EULA=true
ENV DB_HOST=db
ENV DB_PORT=3308
ENV DB_NAME=minecraft
ENV DB_USER=root
ENV DB_PASSWORD=root

RUN mkdir -p $MINECRAFT_HOME
WORKDIR $MINECRAFT_HOME

RUN apt-get update && apt-get install -y curl git
RUN curl -o server.jar https://download.getbukkit.org/spigot/spigot-${MINECRAFT_VERSION}.jar

COPY scripts/setup-plugins.sh $MINECRAFT_HOME/
RUN chmod +x setup-plugins.sh && ./setup-plugins.sh

RUN echo "eula=${MINECRAFT_EULA}" > eula.txt

CMD ["sh", "-c", "java -jar server.jar nogui"]
