;; Empty Recycle Bin

binCount(*) {

	shell := ComObject("shell.application")
	bin := shell.Namespace(10)

	Return bin.Items().Count
}

If binCount() = 0 {
	ExitApp
}

;; Empty Bin - With Original Win Dialogue :)
DllCall("shell32.dll\SHEmptyRecycleBin")

;; Empty Bin - With No Dialogue
;DllCall("shell32.dll\SHEmptyRecycleBinW", "ptr", 0, "ptr", 0, "uint", 0x0001)


;; ------------------------------------
;; Compact version:
;; ------------------------------------

;If ComObject("shell.application").Namespace(10).Items().Count = 0 {
;	ExitApp
;}
; DllCall("shell32.dll\SHEmptyRecycleBin")


