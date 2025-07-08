; ===== AK-47 Anti-Recoil Macro (усиленный) =====
; Sensitivity: 5.0
; Toggle ON/OFF with F8

toggle := false
sensitivityMultiplier := 5.8  ; Увеличь до 1.7–2.0 если всё ещё слабо

sprayPattern := Object()
sprayPattern[0] := [-1, 5]
sprayPattern[1] := [-1, 4.3]
sprayPattern[2] := [-1, 3.5]
sprayPattern[3] := [-1, 2.7]
sprayPattern[4] := [-0.9, 2]
sprayPattern[5] := [-0.7, 1.2]
sprayPattern[6] := [0, 0.5]
sprayPattern[7] := [-0.8, 0.2]
sprayPattern[8] := [-1.8, 0.2]
sprayPattern[9] := [-2.3, 0.2]
sprayPattern[10] := [-3.05, 0.1]
sprayPattern[11] := [-3.1, -0.1]
sprayPattern[12] := [-2.9, -0.1]
sprayPattern[13] := [-2.4, -0.15]
sprayPattern[14] := [-1.8, -0.15]
sprayPattern[15] := [-0.7, -0.2]
sprayPattern[16] := [-0.2, -0.08]
sprayPattern[17] := [-0.17, -0.12]
sprayPattern[18] := [0.2, -0.1]
sprayPattern[19] := [0, -0.15]
sprayPattern[20] := [-0.1, -0.5]
sprayPattern[21] := [-0.15, -0.5]
sprayPattern[22] := [-1.8, -0.2]

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

        if (index >= 23)
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
