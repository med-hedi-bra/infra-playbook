#!/bin/bash
environment=$1


run_playbook() {
    environment_playbook="playbook-$environment.yml" 
    environment="$environment.yml"
    echo "Running playbook: $environment_playbook"

    if [ ! -f "$environment_playbook" ]; then
        echo "Error: Playbook not found at $environment_playbook" 
        return 1
    fi
    
    ansible-playbook -e @env/"$environment" "$environment_playbook" 
    return $?
}


run_playbook