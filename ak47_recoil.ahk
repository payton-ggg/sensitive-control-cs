; ===== AK-47 Anti-Recoil Macro (усиленный) =====
; Sensitivity: 5.0
; Toggle ON/OFF with F8

toggle := false
sensitivityMultiplier := 1.8  ; Увеличь до 1.7–2.0 если всё ещё слабо

sprayPattern := Object()
sprayPattern[0] := [-1, 5]
sprayPattern[1] := [-1, 4.3]
sprayPattern[2] := [-1, 3.5]
sprayPattern[3] := [-1, 2.7]
sprayPattern[4] := [-0.9, 2]
sprayPattern[5] := [-0.7, 1.2]
sprayPattern[6] := [1, 4]
sprayPattern[7] := [-1, 4]
sprayPattern[8] := [-2, 3]
sprayPattern[9] := [-2, 3]
sprayPattern[10] := [-2, 3]
sprayPattern[11] := [-1, 3]
sprayPattern[12] := [0, 3]
sprayPattern[13] := [1, 3]
sprayPattern[14] := [2, 2]
sprayPattern[15] := [2, 2]
sprayPattern[16] := [2, 2]
sprayPattern[17] := [1, 2]
sprayPattern[18] := [0, 2]
sprayPattern[19] := [-1, 2]
sprayPattern[20] := [-2, 1]
sprayPattern[21] := [-2, 1]
sprayPattern[22] := [-2, 1]
sprayPattern[23] := [-1, 1]
sprayPattern[24] := [0, 1]
sprayPattern[25] := [1, 1]
sprayPattern[26] := [1, 1]
sprayPattern[27] := [1, 1]
sprayPattern[28] := [0, 1]
sprayPattern[29] := [-1, 1]

F8::
    toggle := !toggle
    if (toggle)
        TrayTip, AK-47 Macro, Макрос ВКЛЮЧЕН (F8), 1
    else
        TrayTip, AK-47 Macro, Макрос ВЫКЛЮЧЕН (F8), 1
return

~LButton::
    if (!toggle)
        return

    index := 0
    Loop
    {
        if (!GetKeyState("LButton", "P"))
            break

        if (index >= 30)
            break

        rawX := sprayPattern[index][1]
        rawY := sprayPattern[index][2]

        x := Round(rawX * sensitivityMultiplier)
        y := Round(rawY * sensitivityMultiplier)

        MoveMouse(x, y)
        Sleep, 80
        index++
    }
return

MoveMouse(x, y)
{
    DllCall("mouse_event", "UInt", 0x0001, "Int", x, "Int", y, "UInt", 0, "UInt", 0)
}
