; LastRun_01.ahk
; Checks if something (this script) has already been run on this day.

#SingleInstance

iniFile := "LastRun_01.ini"

Now := FormatTime(, "yyyyMMdd")

Try {
	LastRun := IniRead(iniFile, "LastRun", "Date")

	If LastRun < Now {
		; Do STuff
	}
}

; Do main Stuff

; At end of script on exit:
IniWrite(FormatTime(, "yyyyMMdd"), iniFile, "LastRun", "Date")

; This can be improved by using:
; DateDiff(DateTime1, DateTime2, TimeUnits)

