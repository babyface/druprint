#!/bin/bash

drush eval "variable_set('pathauto_ignore_words','a,an,the');"
drush eval "variable_set('pathauto_node_page_pattern','[menu-link-title-raw]');"
# drush eval "variable_set('pathauto_node_story_pattern','[title-raw]');"
drush eval "variable_set('pathauto_node_pattern','[type]/[title-raw]');"
