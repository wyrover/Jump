BuildTrayMenu() {
	Menu, DefaultAHK, Standard
	Menu, Tray, NoStandard
	
	Menu, Tray, Add
	Menu, Tray, Add, Default AHK Menu, :DefaultAHK
	Menu, Tray, Add
	Menu, Tray, Add, Exit
	;~ Menu, Tray, Default, 
	
	if (A_IsCompiled)
		Menu, Tray, Icon, % A_ScriptFullpath, -159
	else
		Menu, Tray, Icon, % FileExist(mIco:=A_ScriptDir "\TheCloser.ico") ? mIco : ""
}