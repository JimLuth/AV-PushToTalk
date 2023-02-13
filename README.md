# AV-PushToTalk

A/V Push-to-Talk AutoHotKey script for Video Conference apps (Zoom, MS Teams, Google Meet ...) 

## Motivation

I spend hours in video conferences and wanted to have a global key assigned that would in unison toggle my mic and camera on and off no matter which window had the focus.  I also wanted this to work optionally in "push-to-talk" mode where pressing the key down performs one toggle and letting the key up performs the toggle again.

## Prerequisites

The script currently works with the following video conferencing services  both as Windows apps and in a browser as noted.

| Service         | Windows app | Web Browser |
| --------------- |:-----------:|:-----------:|
| Blue Jeans      |             | **$√$**     |
| Google Meet     | N/A         | **$√$**     |
| GoToMeeting     | **$√$**     | **$√$**     |
| Microsoft Teams | **$√$**     | **$√$**     |
| Slack           | 1           | 1           |
| Skype           | **$√$**     | **$√$**     |
| Zoom            | **$√$**     | **$√$**     |

1 -  Only the mic is toggled in Slack

## Installation

1. Install AutoHotkey v2.0 from https://www.autohotkey.com/.

2. Download `AV-PTT.ahk` from this repository and double click it to load the script into AutoHotKey.

## How to use

1. Make sure the script installed and running as described above.

2. Start a video conference using one the the supported services.

3. Make sure the camera and mic are either both on/unmuted or off/muted.

4. Click the mouse in the meeting window to be sure it is the active window and press the `Shift` - `Esc` key combination.  You should hear two beeps if the window is recognized as a supported video conference service. You need to repeat this step whenever you start or join a meeting.

5. Now clicking the `Esc` key will toggle the mic and camera on or off in unison. Note that the Esc key will perform the toggle no matter which window is active (i.e. the hotkey is global).

6. Alternatively you can hold the `Esc` key down in push-to-talk mode and the mic and camera will toggle again when the key is released.

## Additional Tips

When running the meeting in a browser tab, make sure the meeting tab is running in its own browser window, because the commands will go to whatever tab is active which may not be the meeting tab.

If you need to regain the use of the `Esc` key by other applications, you can temporarily disable the script by choosing "Pause Script" from the AutoHotKey right-click menu in the tool tray.
