#!/bin/bash

PLUGIN_REPO_HOME="https://github.com/PauloFH/Home-MCPlugin.git"
PLUGIN_REPO_WIND="https://github.com/PauloFH/Wind_Charge-MCPlugin.git"

# Clonar os repositórios dos plugins
git clone $PLUGIN_REPO_HOME /minecraft/tmp/home
git clone $PLUGIN_REPO_WIND /minecraft/tmp/wind

# Criar diretório de plugins, se não existir
mkdir -p /minecraft/plugins

# Copiar os JARs dos plugins para o diretório de plugins
cp /minecraft/tmp/home/build/libs/*.jar /minecraft/plugins/
cp /minecraft/tmp/wind/build/libs/*.jar /minecraft/plugins/

# Configurar variáveis de ambiente no plugin Home
HOME_PLUGIN_CONFIG="/minecraft/plugins/home-config.yml"
echo "database:" > $HOME_PLUGIN_CONFIG
echo "  host: ${DB_HOST}" >> $HOME_PLUGIN_CONFIG
echo "  port: ${DB_PORT}" >> $HOME_PLUGIN_CONFIG
echo "  name: ${DB_NAME}" >> $HOME_PLUGIN_CONFIG
echo "  username: ${DB_USER}" >> $HOME_PLUGIN_CONFIG
echo "  password: ${DB_PASSWORD}" >> $HOME_PLUGIN_CONFIG

# Remover diretório temporário
rm -rf /minecraft/tmp
