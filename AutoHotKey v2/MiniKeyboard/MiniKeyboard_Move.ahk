#Requires Autohotkey v2
#SingleInstance

; The program 'MINI_KEYBOARD.exe' always starts maximised and doesn't save its state.
; This script just starts MiniKeyboard and resizes as needed.

; This type:
; https://sikaicase.com/products/one-handed-macro-mechanical-keyboard-12-keys-gaming-keyboard-fully-programmable-for-knobs-and-keys-osu-keypad-hotswap-keypad-with-rgb-for-game-editing-ps-12-keys-2-4g-3-layer-black-1?_pos=4&_sid=65ce219e3&_ss=r

; MiniKeyboard software:
; https://sikaicase.com/blogs/support/setting-for-software



myProgram := "MINI_KEYBOARD.exe"

; From Top Left Of Screen & Window:
; x,y = Widow Start Position
; w,h = Window Size

x := 1015
y := 64
w := 1485
h := 928

Run myProgram

WinWaitActive("ahk_exe " myProgram,, 3) ; Wait Until myProgram Loaded. For 3 seconds.

WinRestore "ahk_exe " myProgram ; Some Maximized myPrograms May Need Restoring First.


WinMove x, y, w, h, "ahk_exe " myProgram



; If you want to centre window use below instead:
; ------------------------------------------------

;WinRestore "ahk_exe " myProgram ; Some Maximized myPrograms May Need Restoring First.

;CenterWindow("ahk_exe " myProgram)

;CenterWindow("ahk_exe " myProgram)
;{
;    WinGetPos ,, &Width, &Height, "ahk_exe " myProgram
;    WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "ahk_exe " myProgram
;}



ExitApp()

