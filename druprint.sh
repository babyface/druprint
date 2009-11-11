#!/bin/bash

PROJECT_NAME=$1
DRUSH_MAKEFILE=$2
PROFILE_NAME=$3
PROFILE_FILE=$4

drush make $DRUSH_MAKEFILE 
mv __build__/ $PROJECT_NAME
mkdir $PROJECT_NAME/profiles/$PROFILE_NAME
cp $PROFILE_FILE $PROJECT_NAME/profiles/$PROFILE_NAME
cp $PROJECT_NAME/sites/default/default.settings.php $PROJECT_NAME/sites/default/settings.php
sudo chown -R _www $PROJECT_NAME/sites/default/
