PROJECT=$1
DEFAULT=sites/default

drush dl drupal
mv drupal-* $PROJECT

cd $PROJECT
mkdir sites/all/modules sites/all/themes sites/all/libraries
cp $DEFAULT/default.settings.php $DEFAULT/settings.php
sudo chmod a+w $DEFAULT/settings.php $DEFAULT

# then, after setting up through the web interface
sudo chmod o-w $DEFAULT/settings.php $DEFAULT

drush dl admin_menu backup_migrate cck filefield pathauto sitemap token views wysiwyg
drush dl reroute_email ie_css_optimizer
# Maybe these too?
drush dl features context

drush enable admin_menu backup_migrate content filefield pathauto token views wysiwyg reroute_email ie_css_optimizer views_ui fieldgroup number optionwidgets text
drush disable color comment

# Set up a custom theme
drush dl zen-6.x-2.x
mkdir sites/all/themes/$PROJECT
cp sites/all/themes/zen/STARTERKIT/* sites/all/themes/$PROJECT/
drush eval "variable_set('maintenance_theme','$PROJECT');"

# Set some variables. Not tested.
drush eval "variable_set('backup_migrate_schedule_backup_keep','3');"
drush eval "variable_set('backup_migrate_schedule_backup_keep','72');"
drush eval "variable_set('backup_migrate_timestamp_format','Y-m-d_H-i-s');"
drush eval "variable_set('backup_migrate_compression','gzip');"
drush eval "variable_set('backup_migrate_destination','save');"

drush eval "variable_set('date_format_short','m/d/Y - g:ia');"
drush eval "variable_set('date_format_medium','D, m/d/Y - g:ia');"
drush eval "variable_set('date_format_long','l, F j, Y - g:ia');"

drush eval "variable_set('pathauto_ignore_words','a,an,the');"
drush eval "variable_set('pathauto_node_page_pattern','[title-raw]');"
drush eval "variable_set('pathauto_node_story_pattern','[title-raw]');"
drush eval "variable_set('pathauto_node_story_pattern','[type]/[title-raw]');"
