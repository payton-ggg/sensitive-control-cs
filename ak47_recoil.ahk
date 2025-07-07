; AK-47 Recoil Macro — под sensitivity = 4.899305 @ 800 DPI
; AutoHotkey v1, Toggle: F8, Активен при удержании ЛКМ

toggle := false
~F8::toggle := !toggle

~LButton::
if (toggle)
{
    yStrength := 1.9 ; усиление вертикального движения
    xStrength := 1.5 ; лёгкое усиление бокового контроля

    sprayX := [0, -1, -2, -3, -3, -2, -1, 1, 2, 3, 4, 3, 2, 1, 0, -1, -2, -3, -3, -2, -1, 0, 1, 2, 2, 1, 0, 0, -1, -1]
    sprayY := [4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]

    sprayLength := sprayX.Length()
    i := 1

    while GetKeyState("LButton", "P") and (i <= sprayLength)
    {
        xMove := sprayX[i] * xStrength
        yMove := sprayY[i] * yStrength

        DllCall("mouse_event", "UInt", 0x0001, "Int", xMove, "Int", yMove, "UInt", 0, "UPtr", 0)
        Sleep, 75
        i++
    }
}
return
