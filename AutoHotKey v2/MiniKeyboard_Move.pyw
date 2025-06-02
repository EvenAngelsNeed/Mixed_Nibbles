
# Python 3+
# pip install pygetwindow

# The program 'MINI_KEYBOARD.exe' always starts maximised and doesn't save its state.
# This script just starts MiniKeyboard and resizes as needed.

# This type:
# https://sikaicase.com/products/one-handed-macro-mechanical-keyboard-12-keys-gaming-keyboard-fully-programmable-for-knobs-and-keys-osu-keypad-hotswap-keypad-with-rgb-for-game-editing-ps-12-keys-2-4g-3-layer-black-1?_pos=4&_sid=65ce219e3&_ss=r

# MiniKeyboard software:
# https://sikaicase.com/blogs/support/setting-for-software

import pygetwindow
import subprocess
import time

title = "MINI_KEYBOARD"

x = 1015
y = 64
w = 1485
h = 928

subprocess.Popen(r'MINI_KEYBOARD.exe')


time.sleep(.7) # Increase if 'MINI_KEYBOARD.exe' takes longer to open and doesn't resize.

win = pygetwindow.getWindowsWithTitle(title)[0]
print(window.isMaximized)

window.restore() # Some apps that are maximized might need restoring to normal first?
window.size = (w, h)
window.moveTo(x, y)


input()

#Other Commands:

#import pygetwindow as gw

#windowTitles = gw.getAllTitles()
#windowAll = gw.getAllWindows()
#windowWithTitle = gw.getWindowsWithTitle('Untitled')
#windowActive = gw.getActiveWindow()
#windowActiveTitle = gw.getActiveWindow().title
#windowsAt = gw.getWindowsAt(10, 10)

#window.maximize()
#window.isMaximized
#window.restore()
#window.minimize()
#window.restore()
#window.activate()
#window.resize(10, 10) # increase by 10, 10
#window.resizeTo(100, 100) # set size to 100x100
#window.move(10, 10) # move 10 pixels right and 10 down
#window.moveTo(10, 10) # move window to 10, 10
#window.size
#window.width
#window.height
#window.topleft
#window.top
#window.left
#window.bottomright

#window.close()

