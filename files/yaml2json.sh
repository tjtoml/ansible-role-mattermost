#!/bin/sh
python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < /tmp/config.yaml > /opt/mattermost/config/config.json
