#!python
# -*- coding: utf-8 -*-

import sys
import win32api
import win32gui
import win32con

def clickRT():#点击右上角
    win32api.SetCursorPos((1400,-650))
    win32api.mouse_event(win32con.MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)#按下
    win32api.keybd_event(0x11,0,0,0) 
    win32api.keybd_event(0x52,0,0,0)
    win32api.keybd_event(0x52,0,win32con.KEYEVENTF_KEYUP,0)
    win32api.keybd_event(0x11,0,win32con.KEYEVENTF_KEYUP,0)
    win32api.mouse_event(win32con.MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)#弹起
    hwnd = win32gui.FindWindow('SunAwtFrame',None) 
    win32gui.SetForegroundWindow(hwnd)

if (len(sys.argv)==2):
    print(win32api.GetCursorPos())
else:
    clickRT()

        
