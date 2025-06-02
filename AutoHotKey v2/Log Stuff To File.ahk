; AHK v2

; Logs whatever needed to file.
; Avoids hammering disk by only writing every 30 seconds or so.

#Requires AutoHotkey v2
#SingleInstance Force

Filename := "LogFile.txt"
logString := ""
Temp := 0
logInterval := 5000 ; Time between measurements - Must be modulus of "Write": i.e. Keeps subracting from "Write" unto 0
Write := 30000 ; How often to write to file

myGui := Gui()
myGui.Title := "Log To File"
myGui.SetFont("s12")
myGui.Opt("+AlwaysOnTop")

ButtonStart := myGui.Add("Button", "x24 y32 w80 h23", "&Start")
ButtonStop := myGui.Add("Button", "x160 y32 w80 h23", "&Stop")

Edit1 := myGui.Add("Edit", "x160 y56 w80 h25 +0x1 +Disabled", "Stopped")

ButtonStart.OnEvent("Click", log.Bind("True"))
ButtonStop.OnEvent("Click", log.Bind("False"))

myGui.OnEvent('Close', (*) => ExitApp())

myGui.Show("w262 h88")


indicator(*) {
	Edit1.SetFont("underline")
	Sleep 200
	Edit1.SetFont("norm")
}


log(start, *) {
	global
	static start1 := ""

	Loop {

		;MsgBox start

		If start == "False" {
			Edit1.Value := "Stopped"
			start1 := "False"
			SetTimer indicator , 0
			Return
		}

		Else {

			Edit1.Value := "Running"

			SetTimer indicator, 1000 ; , Priority

			; Add what you want to log here:

			MouseGetPos &X, &Y, &vWin, &vControl

			logString .= FormatTime("T0", "Time") " - X: " X ", Y: " Y
												. ", Win: " vWin ", Control: " vControl "`n"

			; Write to log
			Temp := Temp + logInterval

			if Temp == Write {

				Edit1.Value := "Saved"
				FileAppend logString, Filename
				Temp := 0
				logString := ""
			}

			Sleep logInterval
		}
		If start1 == "False" {
			Edit1.Value := "Stopped"
			start1 := "False"
			Return
		}

	}
	Return
}










