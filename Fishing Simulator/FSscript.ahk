#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative
reelX := (801 * (A_ScreenWidth / 1920))
reelY := (833 * (A_ScreenHeight / 1080))

Start:
Pause
Cast:
ImageSearch, x, y, (1189 * (A_ScreenWidth / 1920)), (964 * (A_ScreenHeight / 1080)), (1278 * (A_ScreenWidth / 1920)), (1042 * (A_ScreenHeight / 1080)), FSfullbp.png
if (ErrorLevel = 1)
{
	Click
	sleep 3150 ; Change this # to calibrate for hook speed
	Click
	PixelGetColor, color, %reelX%, %reelY%, RGB
	If (color = 0xFB624C)
	{
		While (color = 0xFB624C)
		{
			Click, 2
			sleep 900 ; Change this # to calibrate for strength and reeling speed
			PixelGetColor, color, %reelX%, %reelY%, RGB
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
ExitApp
}
^!p:: Pause
