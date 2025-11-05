
; ReturnMultipleVars_01.ahk

; AHK won't Return multiple variables so they
; need to be packaged into one object:

; ==========================
; Method 1:
; ==========================

ReturnObject(*) {

	var1 := "Test1"
	var2 := "Test2"

	Return AHK_Temp := {W: var1, H: var2}
}

Output := ReturnObject()

MsgBox(Output.W "`n"
		. Output.H)

; ==========================
; Method 2:
; ==========================

ReturnList(*) {

	var1 := "Test1"
	var2 := "Test2"

	Return [var1, var2]
}

Output := ReturnList()

MsgBox(Output[1] "`n"
		. Output[2])


