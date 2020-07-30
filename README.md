# manage_robots


Make the needed change to the playbook, under the blockinfile module

```
blockinfile:
    path: {{ path }}
    block: |
      # Add your configurations here 
      User-Agent: Applebot
      Disallow: /

      User-Agent: MegaIndex
      Disallow: /

```

Run `deploy_robots.sh` script to deploy the change to all the servers

#This module will insert/update/remove a block of multi-line text surrounded by customizable marker lines

```
# BEGIN ANSIBLE MANAGED BLOCK
User-Agent: Applebot
Disallow: /

User-Agent: MegaIndex
Disallow: /
# END ANSIBLE MANAGED BLOCK
```



