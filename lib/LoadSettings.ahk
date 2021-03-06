LoadSettings(fPath="") {
	initW  := 96
	incPix := 8
	dir := ExpandEnv(GetConfigDir(fPath?fPath:"", fPath?1:""))
	
	settings := { cfgDir:   dir
				, cfgPath:  dir "\Settings.ini"
				, initGuiW: initW
				, incPix:   incPix
				, limit:    ((initW/incPix)-Round(initW/incPix)=0 ? (initW/incPix) : (initW/incPix-1))
				, guiWidth: (2*incPix+initW) }
	
	defaults := { DefaultBrowser: "iexplore.exe"
				, FadeOnShow:     1
				, FadeOnExit:     1
				, FadeSpeed:      2
				, Transparency:   210
				, BackColor:      "Black"
				, TextColor:      "Aqua"
				, Font:           "Arial"
				, DClickAction:   "S"
				, NoInputAction:  "L" }
	
	if (!FileExist(settings.cfgPath))
		CreateConfig()
	
	for settingName, defaultVal in defaults {
		IniRead, %settingName%, % settings.cfgPath, GlobalSettings, %settingName%, %defaultVal%
		settings.Insert(settingName, %settingName%)
	}
}