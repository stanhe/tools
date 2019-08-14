#!python
# -*- coding: utf-8 -*-
# add head

import os
import sys

for f in os.listdir():
    if not f.startswith(sys.argv[1]):
        newName= sys.argv[1]+f
        os.rename(f,newName)
