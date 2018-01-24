#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icon.ico
#AutoIt3Wrapper_Outfile=Dye Assist.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#AutoIt3Wrapper_Run_Tidy=y
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Color.au3>
#include <MsgBoxConstants.au3>
HotKeySet("{End}", "Terminate")
HotKeySet("{Del}", "RGBChecker")
HotKeySet("{Left}", "Left")
HotKeySet("{Right}", "Right")
HotKeySet("{Up}", "Up")
HotKeySet("{Down}", "Down")
HotKeySet("{PgUp}", "Save")
HotKeySet("{PgDn}", "GoTo")

Local $colortoggle = 0
Local $Saved
Local $MousePos

While 1
	Sleep(25)
	ToolTip("Dye Assist is active", Default, Default)
WEnd

Func RGBChecker()
	If $colortoggle = 0 Then
		WinActivate("Program Manager")
		$colortoggle = 1
		While 1
			If $colortoggle = 0 Then
				ToolTip("")
				ExitLoop
			EndIf
			Sleep(10)
			$pos = MouseGetPos()
			$color = _ColorGetRGB(PixelGetColor($pos[0], $pos[1]))
			ToolTip("RGB Checker" & @CRLF & $color[0] & ", " & $color[1] & ", " & $color[2], Default, Default)
		WEnd

	ElseIf $colortoggle = 1 Then
		WinActivate("Vindictus")
		$colortoggle = 0
	EndIf
EndFunc   ;==>RGBChecker

Func Left()
	MouseDown("Left")
	$MousePos = MouseGetPos()
	MouseMove($MousePos[0] - 1, $MousePos[1])
	MouseUp("Left")
EndFunc   ;==>Left

Func Right()
	MouseDown("Left")
	$MousePos = MouseGetPos()
	MouseMove($MousePos[0] + 1, $MousePos[1])
	MouseUp("Left")
EndFunc   ;==>Right

Func Up()
	MouseDown("Left")
	$MousePos = MouseGetPos()
	MouseMove($MousePos[0], $MousePos[1] - 1)
	MouseUp("Left")
EndFunc   ;==>Up

Func Down()
	MouseDown("Left")
	$MousePos = MouseGetPos()
	MouseMove($MousePos[0], $MousePos[1] + 1)
	MouseUp("Left")
EndFunc   ;==>Down

Func Save()
	$Saved = MouseGetPos()
EndFunc   ;==>Save

Func GoTo()
	MouseMove($Saved[0], $Saved[1], 0)
	Sleep(50)
	MouseClick("Left")
EndFunc   ;==>GoTo

Func Terminate()
	Exit
EndFunc   ;==>Terminate
