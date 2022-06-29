#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
Width := A_ScreenWidth / 1920
Height := A_ScreenHeight / 1080
reelX := (801 * Width)
reelY := (833 * Height)

Start:
Pause
Cast:
Sleep 500
Click
Sleep 300
PixelGetColor, hcolor, (821 * Width), (707 * Height), RGB
if (hcolor = 0xFD0061)
	{
		Goto, Start
	}
sleep 3150 ; Change this to calibrate for hook speed
Click
sleep 50
PixelGetColor, color, %reelX%, %reelY%, RGB
While (color = 0xFB624C)
{
	PixelGetColor, tcolor, (937 * Width), (811 * Height), RGB
	if (tcolor = 0xFD0061)
	{
		Goto, Start
	}
	Sleep 50
	PixelGetColor, color, %reelX%, %reelY%, RGB
}
Goto, Cast

^!p:: Pause

F5::
Send {Esc}r{Enter}

F6:: ; this is for debugging purposes
Loop
{
	MouseGetPos, mx, my
	PixelGetColor, mcolor, %mx%, %my%, RGB
	ToolTip, %mx% %my% %mcolor%
	sleep 150
}
