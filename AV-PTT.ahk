; AV-PTT.ahk - from https://github.com/JimLuth/AV-PushToTalk
#Requires AutoHotkey v2.
#SingleInstance
Persistent
DetectHiddenWindows True
global ActiveHwnd := 0
global WindowTitles := [ "Teams",  "Zoom", "Skype", "Slack", "GoTo",   "Meet ",        "Blue Jeans"]
global ExeNames :=     [ "Teams",  "Zoom", "Skype", "Slack", "GoTo",   "NoEXEforMeet", "BlueJeansEXENotSupported" ]
global ExeKeys :=      [ "^+M^+O", "!a!v", "^+K^m", "^+ ",   "!m!v",   "^d^e",         "mv" ]
global CurrentKeys := ""
Esc::  
{
	if WinExist( {Hwnd: ActiveHwnd} )
	{
		SaveHwnd := WinExist("A")
		MinMax := WinGetMinMax({Hwnd: ActiveHwnd})
		WinActivate {Hwnd: ActiveHwnd}
		WinWaitActive {Hwnd: ActiveHwnd}
		ControlClick {Hwnd: ActiveHwnd},,,"MIDDLE"  ; click the mouse in the window to really set the focus - needed for Teams in a browser
	
		SendEvent CurrentKeys
		SoundBeep
		Sleep 100
		if( GetKeyState("Esc") )
		{
			While GetKeyState("Esc") 
			{
				Sleep 500
			}
			SendEvent CurrentKeys	
		}

		
		if( MinMax = -1 )
		{
			WinMinimize {Hwnd: ActiveHwnd}
		}
		WinActivate {Hwnd: SaveHwnd}
		Sleep 500
		WinActivate {Hwnd: SaveHwnd}
	}
}
+Esc::
{
    global ActiveHwnd := WinExist("A")
	Name := WinGetProcessName("A")
	Title := WinGetTitle("A")
	global CurrentKeys := ""
	i := 0
	Loop ExeNames.Length  ; first test for matching EXE name
	{		
		i := i + 1
		if ( Instr( Name, ExeNames[i] ) > 0 )
		{
			global CurrentKeys := ExeKeys[i]
			SoundBeep 600, 200
			SoundBeep 1000, 200
			if StrCompare( ExeNames[i], "GoTo" ) = 0 
			{  
				SendEvent "!v"   ; hack for bug in GoToMeeting where the first !v opens the menu instead of toggling the camera
			}
			return
		}
	}
	i := 0
	Loop ExeNames.Length  ; EXE not found, so test for matching Window Title
	{		
		i := i + 1
		if ( Instr( Title, WindowTitles[i] ) > 0 )
		{
			global CurrentKeys := ExeKeys[i]
			SoundBeep 600, 200
			SoundBeep 1000, 200
			if StrCompare( ExeNames[i], "GoTo" ) = 0 
			{  
				SendEvent "!v"   ; hack for bug in GoToMeeting where the first !v opens the menu instead of toggling the camera
			}
			return
		}
	}
	MsgBox "The active window is not from a supported application"
}
