#SingleInstance Force

; This is just test of concept - Only Shows Up To 15 Icons :)

; In Win11 you might need to run the script directly with:
; \> "c:\pathTo\AutoHotkey.exe" "pathTo\Script.ahk" "pathTo\fileWithIcons.xxx"
; As Win11 won't pass parameters to scripts on their own.

; You can pass a file (.exe, .dll, .ico ,..) on the command Line.
; or use AppPath := "file.exe"

;AppPath := "Notepad.exe"
AppPath := "msi.dll"


MaxIcons := 15

myGui := Gui()
myGui.BackColor := "0x8080C0"

myGui.Opt("+AlwaysOnTop +ToolWindow")
myGui.OnEvent('Close', (*) => ExitApp())



Try {

	If A_Args[1] {
		;MsgBox A_Args[1]
		AppPath := A_Args[1]
	}
}


SplitPath AppPath, &OutFileName ; , &OutDir, &OutExtension, &OutNameNoExt, &OutDrive

iconCount := 0

Loop {

	Try {
		myGui.Add("Picture", "x+5 y8 w48 h48 icon" A_Index, AppPath)

		If iconCount = MaxIcons {
			Break
		}

		iconCount++
	}
	Catch {
		if !iconCount {
			MsgBox OutFileName " Has No Icons"
			ExitApp(1)
		}
		Break
	}
}

myGui.Title := iconCount " Icons In: " OutFileName
myGui.Show()

SetTimer WatchCursor, 200

WatchCursor()
{
    MouseGetPos ,,, &control

    RegExMatch(control, "Static(\d+)", &match)

    If match { ;&& GetKeyState("LButton") = 1

		; Check GetKeyState LButton Down & Do something with Icon Number here...
		If GetKeyState("LButton") = 1 {
			ToolTip
			MyGui.Opt("+OwnDialogs")
			MsgBox OutFileName "`n> Icon: " match[1], "Icon"
		}

		ToolTip
		(
			" `n" OutFileName "`n`n   Icon: " match[1] "  `n "
		)
    }
    Else {
		ToolTip
    }
}

;GuiCtrl.SetIcon(FileName , IconNumber, PartNumber)