:: WPV.bat - v1.1  2025-02-13 - Duncan MacLeod - https://github.com/Paddleslapper
:: Windows batch file that allows Windows Photo Viewer to be set as the default viewer on no-admin Windows 10/11 accounts.
:: Instructions:
::  - Right-click a random *.jpg file
::  - Select 'Open with'->'Choose another app'->Check 'Always use this app...' box->'More apps'->'Look for another app on this PC'
::  - Find and 'Open' WPV.bat 
::  - Repeat for other picture files that should be opened with Windows Photo Viewer (eg *.jpeg, *.png, *.gif)
::
:: Refs: https://stackoverflow.com/questions/6190271/how-to-run-photoviewer-dll-in-command-line
::       https://stackoverflow.com/questions/17991937/windows-photo-viewer-via-command-line-special-features
::
:: History
:: v1.0  2020-02-06  DJM  First release
:: v1.1  2025-02-13  DJM  Fixed for paths/filenames containing '&'  


@echo off
set "file=%~dpnx1"
:: Escape filenames with characters that need escaping
:: Note the function runs a file with no quotes and with escaped characters
:: Replace & with ^&
set "file=%file:&=^&%"
start %SystemRoot%\System32\rundll32.exe "%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll", ImageView_Fullscreen %file%
