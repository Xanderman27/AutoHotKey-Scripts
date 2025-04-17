#Requires AutoHotkey v2
#SingleInstance Force
sell := true
sellThreshold := 100
counter := 0
; Get window dimensions
WinGetClientPos &X, &Y, &W, &H, "Roblox"

; Coordinates to check to see if we are reeling
reelCheckX := .5703 * W
reelCheckY := .76 * H

; Coordinates checking for the white bar
reelClickX := .4742 * W
reelClickY := .75 * H

; Main fishing loop
While (True)
{
	ToolTip "Casting"
    Sleep 500
    Click
    Sleep 300
    
    ToolTip "Waiting For Fish"
    Sleep 3000  ; Change this to calibrate for hook speed
    Click
    Sleep 50
    color := PixelGetColor(reelCheckX, reelCheckY)
	counter++
    While (color = 0x53FA53)
    {
		ToolTip "Reeling"
        tcolor := PixelGetColor(reelClickX, reelClickY)
        if (tcolor = 0xFFFFFF)
        {
            Click 2
        }    
        Sleep 50
		color := PixelGetColor(reelCheckX, reelCheckY)
    }
	if ((counter > sellThreshold) and sell)
	{
	MouseGetPos &mx, &my
	ToolTip "Selling"
	counter := 0
	Send "f"
	Sleep 100
	MouseMove (.557 * W), (.2861 * H)
	Sleep 100
	MouseMove 1, 1, 20, "R"
	Sleep 100
	Click
	MouseMove (.6387 * W), (.4007 * H)
	Sleep 1000
	MouseMove 1, 1, 20, "R"
	Sleep 100
	Click
	MouseMove (.6387 * W), (.4007 * H)
	Sleep 1000
	MouseMove 1, 1, 20, "R"
	Sleep 100
	Click
	MouseMove (.7383 * W), (.3681 * H)
	Sleep 1000
	MouseMove 1, 1, 20, "R"
	Sleep 100
	Click
	Sleep 100
	Send "f"
	MouseMove mx, my
	}
}

; Pause/resume hotkey
^!p:: {
ToolTip ""
Pause -1
}
