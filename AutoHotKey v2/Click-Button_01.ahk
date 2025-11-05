; Click-Button_01.ahk

; Run exe \ app then:

myExe :=  "winrar.exe"
myButton := "OK"
clicks := 1 ; Some buttons may need 2+ clicks?


myButtonID := ControlGetHwnd(myButton, "ahk_exe " myExe)

ControlClick(, "ahk_id " myButtonID,,, clicks)

