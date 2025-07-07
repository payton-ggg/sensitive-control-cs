; AK-47 Recoil + AutoFire Macro — AHK v1
; Sens: 4.899305 @ 800 DPI
; F8: Toggle Recoil Control
; F7: Toggle AutoFire for Semi-Auto Weapons

#NoEnv
#SingleInstance, force
SendMode Input
SetTitleMatchMode, 2
#IfWinActive Counter-Strike

; State toggles
recoilEnabled := false
autoFireEnabled := false

; Config
recoilStrength := 4     ; Adjust for sensitivity
recoilDelay := 30       ; Delay between recoil pulls
autoFireDelay := 60     ; Delay between auto fire clicks (ms)

; Toggle recoil on F8
F8::
recoilEnabled := !recoilEnabled
SoundBeep, % recoilEnabled ? 1000 : 600
ToolTip % "Recoil: " (recoilEnabled ? "ON" : "OFF")
SetTimer, RemoveTooltip, -1000
return

; Toggle autofire on F7
F7::
autoFireEnabled := !autoFireEnabled
SoundBeep, % autoFireEnabled ? 1200 : 400
ToolTip % "AutoFire: " (autoFireEnabled ? "ON" : "OFF")
SetTimer, RemoveTooltip, -1000
return

; Main logic on LButton
$*LButton::
if (!recoilEnabled && !autoFireEnabled) {
    Click
    KeyWait, LButton
    return
}

Click down
while GetKeyState("LButton", "P")
{
    if (recoilEnabled) {
        DllCall("mouse_event", "UInt", 0x01, "Int", 0, "Int", recoilStrength, "UInt", 0, "Int", 0)
        Sleep %recoilDelay%
    }

    if (autoFireEnabled) {
        Click up
        Sleep 15
        Click down
        Sleep %autoFireDelay%
    }
}
Click up
return

RemoveTooltip:
ToolTip
return
