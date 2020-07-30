#!/usr/bin/env bash

#set -x
file=test.json

for CLIENT in $(jq ". | keys | .[]" $file); do
    update=$(jq -r ".[$CLIENT].update" $file);
    if [ $update == true ]; then
      host=$(jq -r ".[$CLIENT].host" $file);
      sites=$(jq -r ".[$CLIENT].site" $file);
      for path in $(jq -r ".[$CLIENT].site | values | .[]" $file); do
        ansible-playbook manage_robots.yml -i server.yaml --extra-vars '{"host":'"$host"',"path":'"$path"'}'
      done
    fi
done

#ansible-playbook manage_robots.yml -i server.yaml --extra-vars '{"host":"ln1","path":"test"}'

#----------------------------------------------------
## BEGIN ANSIBLE MANAGED BLOCK

## END ANSIBLE MANAGED BLOCK
#----------------------------------------------------
#Example Block
#----------------------------------------------------
## BEGIN ANSIBLE MANAGED BLOCK
#User-Agent: Applebot
#Disallow: /
#
#User-Agent: MegaIndex
#Disallow: /
## END ANSIBLE MANAGED BLOCK
#----------------------------------------------------
