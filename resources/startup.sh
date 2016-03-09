#!/bin/bash

#A bit of a hack to push the JAVA_OPTS into the right file.
eval echo 'JAVA_OPTS=\"$JAVA_OPTS\"' >> /etc/default/tomcat7

# Start with supervisor -----------------------------------------------------------------------------------------------#
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf