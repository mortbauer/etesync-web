#!/bin/sh
replace_environment_variables()
{
    find $1 -type f -exec sed -i "s,__REACT_APP_DEFAULT_API_PATH__,${ETESYNC_API_PATH},g" {} \;
}
#replace_environment_variables dist
replace_environment_variables /usr/share/nginx/html
exec "$@"

