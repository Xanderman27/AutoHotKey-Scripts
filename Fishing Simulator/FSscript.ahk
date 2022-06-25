#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
WinGetActiveStats, Title, Width, Height, X, Y
reelX = Width * 0.4171875
reelY = Height * 0.7712963

Start:
Pause
Cast:
ImageSearch, x, y, Width * 0.619271, Height * 0.8925926, Width * 0.665625, Height * 0.964815, C:\FSfullbp.png
if (ErrorLevel = 1)
{
	Click
	sleep 3150 ; Change this # to calibrate for hook speed
	Click
	PixelGetColor, color, reelX, reelY, RGB
	If (color = 0xFB624C)
	{
		While (color = 0xFB624C)
		{
			Click, 2
			sleep 900 ; Change this # to calibrate for strength and reeling speed
			PixelGetColor, color, reelX, reelY, RGB
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
goto, Start
}
^!p::
goto, Start
