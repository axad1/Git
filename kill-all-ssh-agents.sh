
#!/bin/bash
# Find all running ssh-agent processes and kill them
ps aux | grep '[s]sh-agent' | awk '{print $2}' | xargs kill
echo "All ssh-agent processes have been killed."
