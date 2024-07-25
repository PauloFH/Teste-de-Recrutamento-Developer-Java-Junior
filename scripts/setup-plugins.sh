
PLUGIN_REPO_HOME="https://github.com/PauloFH/Home-MCPlugin.git"
PLUGIN_REPO_WIND="https://github.com/PauloFH/Wind_Charge-MCPlugin.git"
git clone $PLUGIN_REPO_HOME /minecraft/tmp/home
git clone $PLUGIN_REPO_WIND /minecraft/tmp/wind

mkdir -p /minecraft/plugins
cp /minecraft/tmp/home/build/libs/*.jar /minecraft/plugins/
cp /minecraft/tmp/wind/build/libs/*.jar /minecraft/plugins/
rm -rf /minecraft/temp_plugins

