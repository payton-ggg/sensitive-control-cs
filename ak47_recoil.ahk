; ===== AK-47 Anti-Recoil Macro =====
; Sensitivity: 5.0
; Toggle ON/OFF with F8

toggle := false

; ===== Список смещений (XY) для 30 пуль =====
sprayPattern := [
    [-1, 5], [0, 5], [1, 5], [2, 5], [2, 5],
    [2, 4], [1, 4], [-1, 4], [-2, 3], [-2, 3],
    [-2, 3], [-1, 3], [0, 3], [1, 3], [2, 2],
    [2, 2], [2, 2], [1, 2], [0, 2], [-1, 2],
    [-2, 1], [-2, 1], [-2, 1], [-1, 1], [0, 1],
    [1, 1], [1, 1], [1, 1], [0, 1], [-1, 1]
]

; ===== Активация по F8 =====
F8::
    toggle := !toggle
    if toggle
        TrayTip, AK-47 Macro, Макрос ВКЛЮЧЕН (F8), 1
    else
        TrayTip, AK-47 Macro, Макрос ВЫКЛЮЧЕН (F8), 1
return

; ===== Макрос работает при зажатой ЛКМ =====
~LButton::
    if (!toggle)
        return

    index := 0
    Loop
    {
        if (!GetKeyState("LButton", "P"))
            break

        if (index >= sprayPattern.Length())
            break

        ; Масштабирование под sensitivity (коэф. 1.0 условный)
        x := sprayPattern[index][1] * 1.0
        y := sprayPattern[index][2] * 1.0

        MoveMouse(x, y)
        Sleep(80)
        index++
    }
return

; ===== Движение мыши (безопасное API) =====
MoveMouse(x, y) {
    DllCall("mouse_event", "UInt", 0x0001, "Int", x, "Int", y, "UInt", 0, "UInt", 0)
}
