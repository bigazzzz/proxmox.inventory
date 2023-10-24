# Установка just - https://github.com/casey/just#installation

set positional-arguments
set export

# set shell := ["python3", "-c"]
set shell := ["bash", "-uc"]

[private]
default:
    @just --list --unsorted

commit +MESSAGE:
    git pull
    git add -A
    git commit -m "{{MESSAGE}}"
    git push

run:
    ansible-playbook -i inventory.proxmox.yml proxmox.cluster.vm.playbook.yml

inventory:
    ansible-inventory -i inventory.proxmox.yml --list

prepare:
    source ansible-venv/bin/activate
    pip install -r requirements.txt
    ansible-galaxy collection install -r galaxy.requirements.yml
