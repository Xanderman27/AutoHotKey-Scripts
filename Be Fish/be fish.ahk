while true
{
    ; Ensure Roblox window is focused
    WinActivate("Roblox")
    Sleep(100)

    ; Move mouse and click
    MouseMove(2336, 573)
    MouseMove(1, 1, 20, "R")
    Click()

    ; Press W to move forward
    Send("{w down}")
    Sleep(1000)  ; Hold W for 100 ms
    Send("{w up}")
    Sleep(1000)

    ; Click again
    MouseMove(2336, 573)
    MouseMove(1, 1, 20, "R")
    Click()

    Sleep(900000)
}

^!p:: {
Pause -1
}
