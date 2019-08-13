#!python
# -*- coding: utf-8 -*-
# rename arg1 to arg2 with replace

import os
import sys

for f in os.listdir():
    if sys.argv[1] in f:
        newName= f.replace(sys.argv[1],sys.argv[2])
        os.rename(f,newName)
