# AK-47 Recoil Control Macro (AutoHotkey)

This script helps you control the AK-47 spray pattern in CS:GO or CS2 by automatically moving the mouse to counter recoil.

## ✅ Features

- Automatic recoil compensation (X and Y movement)
- Toggle ON/OFF with `F8`
- Works while holding the left mouse button
- Easy to customize for your DPI/sensitivity

---

## ⚠️ Disclaimer

> This script is for **educational purposes only**.  
> Using it in official matches (Valve MM, Faceit, ESEA) may lead to **account bans**. Use at your own risk.

---

## 🔧 Requirements

- **AutoHotkey v1.1** (Download from [https://www.autohotkey.com/download/1.1/](https://www.autohotkey.com/download/1.1/))
- Windows OS

> ❗ Do **not** use AutoHotkey v2 — the script is written for v1.

---

## 🚀 How to Use

1. Download and install **AutoHotkey v1.1**
2. Create a file named `ak47_macro.ahk`
3. Copy the script content into the file
4. Run the script (Right-click → "Run as Administrator")
5. In-game:
   - Press `F8` to toggle the macro ON/OFF
   - Hold **Left Mouse Button** while shooting with AK-47

---

## 🛠 Configuration

You can adjust strength multipliers in the script:

```ahk
yStrength := 2.5 ; vertical control power (increase for high sensitivity)
xStrength := 1.5 ; horizontal correction
Sleep := 75      ; delay between shots (adjust for fire rate)
```

## 🎯 Recommended Settings Example

- DPI: 800
- In-game Sensitivity: 4.9

```ahk
yStrength := 2.5
xStrength := 1.5
```