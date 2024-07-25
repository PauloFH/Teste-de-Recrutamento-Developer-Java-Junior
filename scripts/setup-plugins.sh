#!/bin/bash

# Plugin repositories
PLUGIN_REPO_HOME="https://github.com/PauloFH/Home-MCPlugin.git"
PLUGIN_REPO_WIND="https://github.com/PauloFH/Wind_Charge-MCPlugin.git"

# Clone the plugin repositories
git clone $PLUGIN_REPO_HOME /minecraft/tmp/home
git clone $PLUGIN_REPO_WIND /minecraft/tmp/wind

# Create the plugins directory
mkdir -p /minecraft/plugins

# Copy the plugin JARs to the plugins directory
cp /minecraft/tmp/home/build/libs/*.jar /minecraft/plugins/
cp /minecraft/tmp/wind/build/libs/*.jar /minecraft/plugins/

# Clean up
rm -rf /minecraft/tmp/home /minecraft/tmp/wind
