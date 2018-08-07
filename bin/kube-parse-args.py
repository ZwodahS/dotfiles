#!/usr/bin/env python3
"""
Example of the config file
{
    "command": {
        "use": [ "config", "use-context" ],
        "ctx": [ "config", "current-context" ],
    },
    "object": {
        "de": "deployment"
    }
}

command replaces the first argument (if found)
object replaces the second argument if the first argument is get/edit/delete/explain
"""

"""
Next put the following in your bash_profile

function _kubectl() {
    REPLACE=$(kube-parse-args.py $*)
    kubectl ${REPLACE}
}

if [ -n "$(which kubectl)" ]; then
    if [ -n "$(which kube-parse-args.py)" ]; then
        alias k=_kubectl
    else
        alias k=kubectl
    fi
fi

This will alias "k" to the function

now you should be able to run

k ctx => kubectl config current-context

or

k get de => kubectl get deployment
"""

import json
import sys
from os.path import expanduser

try:
    with open(expanduser("~/.dotfiles/kube_alias")) as f:
        config = json.loads(f.read())

except FileNotFoundError as e:
    print(" ".join(sys.argv[1:]))
    sys.exit(0)

command_aliases = config.get("command", {})
object_aliases = config.get("object", {})

args = sys.argv[1:]
if len(args) == 0:
    sys.exit(0)

# replace command if there is any
replace = command_aliases.get(args[0]) or [args[0]]
args = replace + args[1:]

if args[0] in { "get", "edit", "delete", "explain" }:
    # if there is a get/edit/delete, we will replace the args[1]
    args[1] = object_aliases.get(args[1]) or args[1]

print(" ".join(args))
sys.exit(0)
