GuiDropFiles(hwnd, files) {	
	GuiControlGet, str,, Static1
	IniRead, shortcut, % settings.cfgPath, shortcuts, %str%
	if (shortcut="ERROR") {
		if (str) {
			GuiControl,, Static1, ???
			sleep 400
		}
		ExitApp
	}	
	shortcut := """" ShortcutReplace(shortcut) """"
	for c, file in files
		Run, % shortcut " """ file """"
	ExitApp
}