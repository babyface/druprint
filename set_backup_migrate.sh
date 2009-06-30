#!/bin/bash

drush eval "variable_set('backup_migrate_schedule_backup_keep','3');"
drush eval "variable_set('backup_migrate_schedule_backup_keep','72');"
drush eval "variable_set('backup_migrate_timestamp_format','Y-m-d_H-i-s');"
drush eval "variable_set('backup_migrate_compression','gzip');"
drush eval "variable_set('backup_migrate_destination','save');"
