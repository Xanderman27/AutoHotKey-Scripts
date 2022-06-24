#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

Pause
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
Cast:
ImageSearch, x, y, 1189, 964, 1278, 1042, C:\FSfullbp.png ; Make this line a comment if your backpack can't hold 600
if (ErrorLevel = 1)
{
	Click
	sleep 3150 ; Change this # to calibrate for hook speed
	Click
	PixelGetColor, color, 801, 833, RGB
	If (color = 0xFB624C)
	{
		While (color = 0xFB624C)
		{
			Click, 2
			sleep 900 ; Change this # to calibrate for strength and reeling speed
			PixelGetColor, color, 801, 833, RGB
		}
	
	}
	Else
		{	
			Goto, Cast
		}
	Goto, Cast
}
else
{
Return
}
^!p::Pause    ; Pause script with Ctrl+Alt+P

