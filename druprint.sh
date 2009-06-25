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

drush dl -v admin_menu backup_migrate cck filefield pathauto sitemap token views wysiwyg
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

# Set the date format to be familiar to Americans
drush eval "variable_set('date_format_short','m/d/Y - g:ia');"
drush eval "variable_set('date_format_medium','D, m/d/Y - g:ia');"
drush eval "variable_set('date_format_long','l, F j, Y - g:ia');"

## Set preferences for contributed modules
# These are the settings that I prefer for the backup migrate module
drush eval "variable_set('backup_migrate_schedule_backup_keep','3');"
drush eval "variable_set('backup_migrate_schedule_backup_keep','72');"
drush eval "variable_set('backup_migrate_timestamp_format','Y-m-d_H-i-s');"
drush eval "variable_set('backup_migrate_compression','gzip');"
drush eval "variable_set('backup_migrate_destination','save');"

# For pathauto
drush eval "variable_set('pathauto_ignore_words','a,an,the');"
drush eval "variable_set('pathauto_node_page_pattern','[menu-link-title-raw]');"
drush eval "variable_set('pathauto_node_story_pattern','[title-raw]');"
drush eval "variable_set('pathauto_node_story_pattern','[type]/[title-raw]');"

# For reroute email
drush eval "variable_set('reroute_email_address','chris@coyote.local');"
