#AutoIt3Wrapper_Version=Beta
#AutoIt3Wrapper_Icon=Icon.ico
#AutoIt3Wrapper_Outfile=Screenshot.exe
#AutoIt3Wrapper_Res_Description=Royals Screenshot Tool
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_Language=1033

; ================================
; | Title: Royals Screenshot Tool
; | Last updated: 6/8/2015
; |
; | Hotkeys:
; |	Pause/Break = Exits the Program
; |	PrintScreen = Takes a Screenshot
; |
; | Notes:
; | Timestamps are obtained from a time server
; | Anti-Virus Software may detect as false-positive
; | Interval = Minutes per backup
; ================================

#include <ScreenCapture.au3>
#include <Date.au3>

HotKeySet("{PrintScreen}", "Screenshot")
HotKeySet("{Pause}", "Quit")

Local $Index
Local $Win
Local $Time
Local $Timer
Local $Difference
Local $Timer = TimerInit()
Local $Interval = 5

While 1
	Sleep(100)
	If TimerDiff($Timer) > $Interval * 60000 Then Backup()
WEnd

Func Screenshot()
	If WinExists("[CLASS:MapleStoryClass]") Then
		$Index = 1
		WinActivate("[CLASS:MapleStoryClass]")
		Local $Win = WinGetPos("[CLASS:MapleStoryClass]")
		If $Win[0] < 5 Then
			WinMove("[CLASS:MapleStoryClass]", "", 5, $Win[1])
			$Win = WinGetPos("[CLASS:MapleStoryClass]")
		ElseIf $Win[0] > @DesktopWidth - 810 Then
			WinMove("[CLASS:MapleStoryClass]", "", @DesktopWidth - 810, $Win[1])
			$Win = WinGetPos("[CLASS:MapleStoryClass]")
		EndIf
		If $Win[1] > @DesktopHeight - 672 Then
			WinMove("[CLASS:MapleStoryClass]", "", $Win[0], @DesktopHeight - 672)
			$Win = WinGetPos("[CLASS:MapleStoryClass]")
		ElseIf $Win[1] < 5 Then
			WinMove("[CLASS:MapleStoryClass]", "", $Win[0], 5)
			$Win = WinGetPos("[CLASS:MapleStoryClass]")
		EndIf
		If FileExists(@ScriptDir & "\MapleRoyals" & $Index & ".jpg") Then
			Do
				$Index += 1
			Until Not FileExists(@ScriptDir & "\MapleRoyals" & $Index & ".jpg")
		EndIf
;~ 		$Time = BinaryToString(InetRead('http://www.timeapi.org/' & 'utc' & '/now?format=\m/\d/\Y%20\H:\M:\S',1))
;~ 		ToolTip("Image Saved: MapleRoyals" & $Index & @CRLF & $Time, $Win[0] + 75, $Win[1] + 10, "", "", 5)
		_ScreenCapture_CaptureWnd(@ScriptDir & "\MapleRoyals" & $Index & ".jpg", "[CLASS:MapleStoryClass]")
		Sleep(3000)
		ToolTip("")
	EndIf
EndFunc   ;==>Screenshot

Func Backup()
	If WinExists("[CLASS:MapleStoryClass]") Then
		$Index = 1
		WinActivate("[CLASS:MapleStoryClass]")
		$Win = WinGetPos("[CLASS:MapleStoryClass]")
		If $Win[0] < 5 Then
			WinMove("[CLASS:MapleStoryClass]", "", 5, $Win[1])
			$Win = WinGetPos("[CLASS:MapleStoryClass]")
		ElseIf $Win[0] > @DesktopWidth - 810 Then
			WinMove("[CLASS:MapleStoryClass]", "", @DesktopWidth - 810, $Win[1])
			$Win = WinGetPos("[CLASS:MapleStoryClass]")
		EndIf
		If $Win[1] > @DesktopHeight - 672 Then
			WinMove("[CLASS:MapleStoryClass]", "", $Win[0], @DesktopHeight - 672)
			$Win = WinGetPos("[CLASS:MapleStoryClass]")
		ElseIf $Win[1] < 5 Then
			WinMove("[CLASS:MapleStoryClass]", "", $Win[0], 5)
			$Win = WinGetPos("[CLASS:MapleStoryClass]")
		EndIf
		If FileExists(@ScriptDir & "\MapleRoyals" & $Index & ".jpg") Then
			Do
				$Index += 1
			Until Not FileExists(@ScriptDir & "\MapleRoyals" & $Index & ".jpg")
		EndIf
;~ 		$Time = BinaryToString(InetRead('http://www.timeapi.org/' & 'utc' & '/now?format=\m/\d/\Y%20\H:\M:\S',1))
;~ 		ToolTip("Image Saved: MapleRoyals Backup" & @CRLF & $Time, $Win[0] + 75, $Win[1] + 10, "", "", 5)
		_ScreenCapture_CaptureWnd(@ScriptDir & "\MapleRoyals Backup.jpg", "[CLASS:MapleStoryClass]")
		$Timer = TimerInit()
		Sleep(3000)
		ToolTip("")
	EndIf
EndFunc

Func Quit()
	Exit
EndFunc   ;==>Quit
