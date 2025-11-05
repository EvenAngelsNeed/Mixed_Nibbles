#Requires Autohotkey v2
#SingleInstance Force

; Ordinal number words are words representing position or rank in a sequential order.

; Cardinal: one, two, three, four = 1, 2, 3, 4
; Ordinal: first, second, third, fourth = 1st, 2nd, 3rd, 4th



switch A_DD {

  case "01":
    day := "1st"
  case "02":
    day := "2nd"
  case "03":
    day := "3rd"
  case "31":
    day := "31st"

  default:
    day := Format("{:d}", A_DD)
    day .= "th"
}


MsgBox("Today is " FormatTime(, "dddd") " the " day " of " FormatTime(, "MMMM yyyy"), "Ordinal Day Numerals")