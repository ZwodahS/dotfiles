import json
import readline
import atexit
import os
try:
    import arrow
except Exception as e:
    pass

def ddir(v):
    return [ item for item in dir(v) if (item[0:2] != "__" and item[-3:-1] != "__") ]

history = os.path.expanduser('~/.python_history')
readline.read_history_file(history)
readline.parse_and_bind('tab: complete')
atexit.register(readline.write_history_file, history)

import rlcompleter, readline
readline.parse_and_bind('tab:complete')
