#Requires Autohotkey v2+
#SingleInstance Force

;-------------------------------------------------------
; Uses MimCmd to change MirandaNG IM options on the fly.
; In this case to reconnect status if gone offline.
;
; About MirandaNG: https://miranda-ng.org/about/
; Help for MimCmd: https://wiki.miranda-ng.org/index.php?title=Plugin:CmdLine
;
; List of commands:
;   MimCmd.exe -h
;
; Options for a single command:
;   MimCmd.exe -h <command>
;-------------------------------------------------------

Path := "c:\PortableApps\MirandaNG"
Miranda := "Miranda64.exe"
MimCMD := "MimCmd.exe"

options := [
"status online FB",
"status online WhatsApp"
]


if ProcessExist(Miranda) {
	; If Miranda is already running just pass commands:
	runOptions()
}

else {
	; If not running start Miranda:
	command := Path "\" Miranda
	Run command
}

runOptions(*) {

	for option in options {

		command := Path "\" MimCMD " " option
		Run command
	}
}




