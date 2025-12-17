#Requires AutoHotkey 1.1
#MaxHotkeysPerInterval 999999

; paths for cursor files
normalCursor := A_WorkingDir . "\wii-open-ccw.cur"
grabCursor := A_WorkingDir . "\wii-grab-ccw.cur"


; set to normal wii cursor
DllCall("SetSystemCursor", "Ptr", LoadCursor(normalCursor), "UInt", 32512)

; on press, change cursor to grabby
~LButton::
    DllCall("SetSystemCursor", "Ptr", LoadCursor(grabCursor), "UInt", 32512)
Return

; on release, change cursor to normal
~LButton Up::
    DllCall("SetSystemCursor", "Ptr", LoadCursor(normalCursor), "UInt", 32512)
Return

; alt + shift + esc exits
!+Esc::
    ; restores default cursor
    DllCall("SystemParametersInfo", "UInt", 0x57, "UInt", 0, "Ptr", 0, "UInt", 0)
    ExitApp
Return


LoadCursor(file) {
    return DllCall("LoadCursorFromFile", "Str", file, "Ptr")
}
