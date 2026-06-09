
;PDF Page Count_001.ahk
; If the pdf is uncompressed then:

pdf := "abc.pdf"

data := FileRead(pdf)

pageMarker := "/Type\s*/Page[^s]"

RegExReplace(data, pageMarker, "", &PageCount)

If PageCount {
	MsgBox("Pages Found: " PageCount)
}
Else {
	MsgBox("Pdf probably compressed?")
}

