
# Teste de Recrutamento Developer Java Júnior

Esse repositório contem uma automação docker para montar um servidor spigot 1.21,criar o banco de dados mysql e baixar os dois plugins desenvolvidos para a seleção. para dentro do servidor.\
executando o comando de criação do container, o servidor estará disponível em: `localhost:25565`

## Plugins:
### [/home](https://github.com/PauloFH/Home-MCPlugin)

### [Wind Charge](https://github.com/PauloFH/Wind_Charge-MCPlugin.git)



## Pré-requisitos

- Docker
- Docker Compose

## Configuração

### Dockerfile
O `Dockerfile` configura o ambiente para o servidor automaticamente e cria o banco de dados.
deixando tudo pronto para a execução.

### setup-plugins.sh
Este script clona os repositórios dos plugins "Home" e "Wind Charge" e copia os arquivos JAR gerados para a pasta de plugins do servidor Minecraft.

### docker-compose.yml
O `docker-compose.yml` define os serviços necessários (servidor Minecraft e banco de dados MySQL) e configura as variáveis de ambiente.

## Possiveis conflitos:
o container do mysql usa a porta 3308 e 25565, garanta que elas estão livres ou mude as portas no arquivo `docker-compose.yml` e `Dockerfile`


## Como Usar
1. Clone este repositório:
    ```bash
    git clone https://github.com/seu-usuario/my-minecraft-server.git
    cd my-minecraft-server
    ```


2. Execute o Docker Compose para construir e iniciar os serviços:
    ```bash
    docker-compose up --build
    ```

4. O servidor Minecraft estará disponível na porta `25565`, e o banco de dados MySQL estará disponível na porta `3308`.


## Contato

Para dúvidas, entre em contato:
- **Nome**: Paulo Holanda
- **Email**: [paulorfholanda@gmail.com](mailto:paulorfholanda@gmail.com)
- **GitHub**: [PauloFH](https://github.com/Paulo