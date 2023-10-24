# Установка just - https://github.com/casey/just#installation

set positional-arguments
set export

# set shell := ["python3", "-c"]
set shell := ["bash", "-uc"]

[private]
default:
    @just --list --unsorted

commit +MESSAGE:
    @just check-secret
    git pull
    git add -A
    git commit -m "{{MESSAGE}}"
    git push
