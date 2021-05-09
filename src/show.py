#!/usr/bin/python3

import json
import yaml
import sys 

# read from STDIN.
jsonArg    = sys.stdin.read()
# convert to python dictionary.
dictionary = json.loads(jsonArg)
# format and print.
formatted  = json.dumps(dictionary, sort_keys=True, indent=4) # format as JSON style.
print(formatted)
formatted  = yaml.dump(dictionary, default_flow_style=False) # format as YAML style.
print(formatted)

