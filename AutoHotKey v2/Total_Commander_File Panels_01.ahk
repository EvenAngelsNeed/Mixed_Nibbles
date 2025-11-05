
#Requires Autohotkey v2
#SingleInstance Force


;ahk_class TTOTAL_CMD
;ahk_exe totalcmd64.exe \ totalcmd.exe
;ahk_pid 9160


if WinExist("ahk_class" "TTOTAL_CMD") {

	 WinActivate ; Use the window found by WinExist.

	Try {
		; TC64
		TextL := ControlGetText("Window13") ; , WinTitle, WinText, ExcludeTitle, ExcludeText
		TextR := ControlGetText("Window18")
	}

	Catch {
		Try {
			; TC32
			TextL := ControlGetText("TPathPanel1")
			TextR := ControlGetText("TPathPanel2")
		}
	}

	;MsgBox "Left:  " TextL "`n`nRight: "  TextR

}

;WinActivate "ahk_class AutoHotkeyGUI"
MsgBox "Left:`n " TextL "`n`nRight:`n "  TextR, "Total Cmdr's Folder Panels:"
;WinActivate "A"
