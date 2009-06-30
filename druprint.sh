#!/bin/bash

PROJECT=$1
DEFAULT=sites/default

drush dl -v drupal
mv drupal-* $PROJECT

cd $PROJECT
mkdir sites/all/modules sites/all/themes sites/all/libraries
cp $DEFAULT/default.settings.php $DEFAULT/settings.php
chmod a+w $DEFAULT/settings.php $DEFAULT

exit

# then, after setting up through the web interface
sudo chmod o-w $DEFAULT/settings.php $DEFAULT

drush dl -v admin_menu backup_migrate cck filefield pathauto site_map token views wysiwyg
drush dl -v reroute_email ie_css_optimizer
# Maybe these too?
drush dl -v features context
# Turn on modules that I always use
drush enable admin_menu backup_migrate content filefield pathauto token views wysiwyg reroute_email ie_css_optimizer views_ui fieldgroup number optionwidgets text
# If I'm using zen I don't need the color modules, and I don't use the comment module often
drush disable color comment

# Set up a custom Zen sub-theme
drush dl zen-6.x-2.x
mkdir sites/all/themes/$PROJECT
cp sites/all/themes/zen/STARTERKIT/* sites/all/themes/$PROJECT/
# drush eval "variable_set('maintenance_theme','$PROJECT');"


## Set some variables. Not tested.
# Include set_date_and_time.sh

## Set preferences for contributed modules
# Include set_backup_migrate.sh, set_pathauto.sh, and set_reroute_email.sh
