## AutoHotScript

* Open startup folder: open Run window by Win+R and then write shell:startup and enter.
* It'll open explorer at something like this path: C:\Users\{username}\AppData\Roaming\Microsoft\Windows\Start
*  Menu\Programs\Startup
* Copy a script (*.ahk) -> go to that Startup folder -> right-click and select Paste shortcut.

https://github.com/GorvGoyl/Autohotkey-Scripts-Windows/blob/master/look_up.ahk

```
; Main Navigation
CAPSLOCK & j::MoveCursor("{LEFT}")
CAPSLOCK & l::MoveCursor("{RIGHT}")
CAPSLOCK & i::MoveCursor("{UP}")
CAPSLOCK & k::MoveCursor("{DOWN}")
CAPSLOCK & h::MoveCursor("{HOME}")
CAPSLOCK & `;::MoveCursor("{END}")
CAPSLOCK & BACKSPACE::Send {DELETE}

; Navigation Combos
MoveCursor(key) {
    shift := GetKeyState("SHIFT","P")
    control := GetKeyState("CONTROL","P")
    controlShift := control && shift

    if controlShift {
        Send, ^+%key%
    }
    else if shift {
        Send, +%key%
    }
    else if control {
        Send, ^%key%
    }
    else {
        Send, %key%
    }
}

```