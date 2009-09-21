#!/bin/bash

# Set the date format to be familiar to Americans
drush eval "variable_set('date_format_short','m/d/Y - g:ia');"
drush eval "variable_set('date_format_medium','D, m/d/Y - g:ia');"
drush eval "variable_set('date_format_long','l, F j, Y - g:ia');"
