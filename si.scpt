-- si - A System Information Script for Textual
-- Coded by Xeon3D
--  Very loosely based on KSysInfo for Linkinus by KanadaKid

-- 2 step Installation:
-- Copy this to ~/Library/Application Support/Textual IRC/Scripts/
-- Run /si or /si help for more options.

-- | DEBUG COMMAND | --
--set cmd to "cpu"

-- | SCRIPT START | --
-- |Properties| --

property ScriptName : "si"
property ScriptDescription : "A System Information Script for Textual"
property ScriptHomepage : "http://xeon3d.net/si/"
property ScriptAuthor : "Xeon3D"
property ScriptAuthorHomepage : "http://www.xeon3d.net"
property CurrentVersion : "0.0.2"
property SupportChannel : "irc://irc.wyldryde.org/#textual-extras"

on textualcmd(cmd)
	
	-- |Variables| --
	
	-- Defines the version of Textual where it's being run from.
	set TextualVersion to version of application "Textual"
	
	-- Defines the path for the Scripts folder inside the Textual executable.
	set InternalScriptsPath to the quoted form of (the POSIX path of (path to application id "com.codeux.irc.textual") & "Contents/Resources/Scripts/")
	
	-- Defines the path for the Scripts folder inside the ~/Library/ folder according to the version of Textual.
	if TextualVersion > "2.0.99" then
		set ExternalScriptsPath to the quoted form of (the POSIX path of (path to application support from the user domain) & "Textual IRC/Scripts")
	else
		set ExternalScriptsPath to the quoted form of (the POSIX path of (path to application support from the user domain) & "Textual/Scripts")
	end if
	
	-- Defines the temporary working directory path.
	set TempDirPath to the quoted form of (the POSIX path of (path to temporary items from the user domain))
	
	-- Defines the path where the files for the updates will be temporarily stored
	set UpdateZipPath to the quoted form of (the POSIX path of (path to temporary items from the user domain) & "update.zip")
	
	-- Defines the POSIX path to the application that is running the script
	set AppPath to path to frontmost application
	set PAppPath to POSIX path of AppPath
	
	-- Defines the POSIX path to the "Textual" application
	set TextualPath to path to application "Textual"
	set PTextualPath to POSIX path of TextualPath
	
	-- Defines the path to the Mac Models plist (also used by the /sysinfo plugin)
	set MachinesPlist to PTextualPath & "Contents/Resources/Extensions/SystemProfiler.bundle/Contents/Resources/MacintoshModels.plist"
	
	-- Defines Text Formatting
	
	--- Initializes the Simple variable.
	set Simple to ""
	
	---  Colors
	set CBlack to (ASCII character 3) & "01"
	set CNBlue to (ASCII character 3) & "02"
	set CGreen to (ASCII character 3) & "03"
	set CRed to (ASCII character 3) & "04"
	set CBrown to (ASCII character 3) & "05"
	set CPurple to (ASCII character 3) & "06"
	set COrange to (ASCII character 3) & "07"
	set CYellow to (ASCII character 3) & "08"
	set CLGreen to (ASCII character 3) & "09"
	set CTeal to (ASCII character 3) & "10"
	set CCyan to (ASCII character 3) & "11"
	set CBlue to (ASCII character 3) & "12"
	set CPink to (ASCII character 3) & "13"
	set CGrey to (ASCII character 3) & "14"
	set CLGrey to (ASCII character 3) & "15"
	set CWhite to (ASCII character 3)
	set NoColor to (ASCII character 0)
	
	--- Formatting
	set FBold to (ASCII character 2)
	set FItalic to (ASCII character 1)
	set NewLine to (ASCII character 10)
	
	-- Defines the Bars' Colors
	set UsedColor to CRed
	set FreeColor to CGreen
	set SeparatorColor to CLGrey
	
	if (cmd contains "simple") or (Simple is true or Simple is "True") then
		set UsedColor to ""
		set FreeColor to ""
		set CWhite to ""
		set FBold to ""
		set FItalic to ""
	end if
	
	--- User Options --
	-- Defines if it uses all active mountpoints for disk space calculation or not.
	try
		set UseAllMountpoints to do shell script "defaults read xeon3d.si UseAllMountpoints"
	on error
		try
			do shell script ("defaults write xeon3d.si UseAllMountpoints False")
			set UseAllMountpoints to "False"
		on error
			set msg to "/echo There was an error setting the UseAllMountpoints variable"
			return msg
		end try
	end try
	
	-- This regards if the script's output is formatted or not.
	try
		set Simple to do shell script "defaults read xeon3d.si Simple"
	on error
		try
			do shell script ("defaults write xeon3d.si Simple False")
			set Simple to "False"
		on error
			set msg to "/echo There was an error with the Simple variable"
			return msg
		end try
	end try
	
	-- This sets the item delimiter. To change on a terminal type: defaults write xeon3d.si ItemDelimiter <item> (1 char)
	try
		set ItemDelimiter to " " & (do shell script "defaults read xeon3d.si ItemDelimiter") & " "
	on error
		set ItemDelimiter to " • "
	end try
	
	
	
	-- Defines default runtime options.
	
	if cmd is "" or cmd is "simple" then
		---- Default output when no options or just "simple" is supplied at runtime.
		set ViewMac to true
		set ViewCPU to true
		set ViewCurrentCPUSpeed to true
		set ViewCPUCapabilities to false
		set ViewCPUCache to false
		set ViewFSB to false
		set ViewRam to true
		set ViewBars to true
		set ViewDisk to true
		set ViewDisplay to true
		set ViewGFXBus to false
		set ViewResolutions to true
		set ViewAudio to false
		set ViewPower to true
		set ViewOSXVersion to true
		set ViewOSXArch to true
		set ViewOSXBuild to true
		set ViewKernel to false
		set ViewKernelTag to false
		set ViewUptime to true
		set ViewClient to true
		set ViewCurrentVersion to true
	else
		---- Checks which options the user supplied at runtime and acts accordingly.
		set ViewMac to (cmd contains "mac")
		set ViewCPU to (cmd contains "cpu")
		if ViewCPU then
			set ViewCurrentCPUSpeed to (cmd contains "speed")
			set ViewCPUCapabilities to (cmd contains "cap")
			set ViewCPUCache to (cmd contains "cache")
			set ViewFSB to (cmd contains "fsb")
		end if
		set ViewRam to (cmd contains "ram")
		set ViewBars to (cmd contains "bar")
		set ViewDisk to (cmd contains "disk")
		set ViewDisplay to (cmd contains "gpu" or cmd contains "graphics" or cmd contains "video")
		set ViewGFXBus to (cmd contains "gpu" or cmd contains "graphics" or cmd contains "video" and cmd contains "bus")
		set ViewResolutions to (cmd contains "gpu" or cmd contains "graphics" or cmd contains "video" and cmd contains "res")
		set ViewAudio to (cmd contains "audio" or cmd contains "sound")
		set ViewPower to (cmd contains "power")
		set ViewOSXVersion to (cmd contains "osx")
		set ViewOSXBuild to (cmd contains "osxbuild")
		set ViewOSXArch to (cmd contains "osxarch")
		set ViewKernel to (cmd contains "kernel")
		set ViewKernelTag to (cmd contains "kerneltag")
		set ViewUptime to (cmd contains "uptime")
		set ViewClient to (cmd contains "client")
		set ViewCurrentVersion to (cmd contains "script")
	end if
	
	if cmd is "version" then
		set msg to "Script Version: " & ScriptName & space & CurrentVersion & " for Textual by " & ScriptAuthor & ". Get it @ " & ScriptHomepage
		return msg
	end if
	
	if cmd is "options" then
		set msg to "/echo Possible Options:" & NewLine & ¬
			"/echo To change an option type '/" & ScriptName & " <option name> toggle'. Example: /" & ScriptName & " simple toggle " & NewLine & ¬
			"/echo • UseAllMountpoints - Defines if the script considers every mounted disk / net share as available disk space or not." & FBold & " - Current Status: " & FBold & CRed & UseAllMountpoints & NewLine & ¬
			"/echo • Simple - Defines if the formatting is removed from the output of the script." & FBold & " - Current Status: " & FBold & CRed & Simple & NewLine & ¬
			"/echo • SBClock - Defines if the script attempts to get the real CPU clock speed for Overclocked Sandy Bridge Hackintoshes." & FBold & " - Current Status: " & FBold & CRed & SBClock & NewLine
		set chars to count characters of ("Possible Options:")
		set separator to ""
		repeat chars times
			set separator to separator & "_"
		end repeat
		set msg to "/echo " & separator & NewLine & msg
		return msg
		
	end if
	
	if cmd is "UseAllMountpoints" then
		if UseAllMountpoints is "True" then
			set msg to "/echo The script will use " & FBold & "All mounted disks" & FBold & ". To change this type '/" & ScriptName & " UseAllMountpoints toggle'"
			return msg
		else if UseAllMountpoints is "False" then
			set msg to "/echo The script will use " & FBold & "the Startup disk only" & FBold & ". To change this type '/" & ScriptName & " UseAllMountpoints toggle'"
			return msg
		end if
	end if
	
	if cmd is "UseAllMountpoints toggle" then
		if UseAllMountpoints is "True" then
			do shell script "defaults write xeon3d.si UseAllMountpoints False"
			return "/echo The script will now only use the Startup disk for HDD Space calculation!"
		else if UseAllMountpoints is "False" then
			do shell script "defaults write xeon3d.si UseAllMountpoints True"
			return "/echo The script will now use all mountpoints (including network shares) for HDD Space calculation!"
		end if
	end if
	
	if cmd is "Simple toggle" then
		if Simple is "True" then
			do shell script "defaults write xeon3d.si Simple False"
			return "/echo The script " & FBold & "won't remove" & FBold & " the formatting from the output."
		else if Simple is "False" then
			do shell script "defaults write xeon3d.si Simple True"
			return "/echo The script " & FBold & "will remove" & FBold & " the formatting from the output."
		end if
	end if
	
	-- UpdaterNG 0.1
	if cmd is "update" then
		set ScriptDownloadFolderURL to ScriptHomepage & "download/"
		
		do shell script "defaults write xeon3d.si LatestURL " & ScriptDownloadFolderURL & "latest"
		do shell script "defaults write xeon3d.si LatestMD5URL " & ScriptDownloadFolderURL & "latestmd5"
		
		set LatestVersionURL to do shell script "defaults read xeon3d.si LatestURL"
		set LatestChecksum to do shell script "defaults read xeon3d.si LatestMD5URL"
		
		--- Defines the latest available script version
		set LatestVersion to do shell script "curl " & LatestVersionURL
		
		--- Defines the latest available script version's zip file checksum
		set LatestChecksum to do shell script "curl " & LatestChecksum
		
		--- Defines the URL of the Script's Changelog
		set ChangelogURL to ScriptDownloadFolderURL & "changelog"
		
		--- Defines the zip file URL of the latest version
		set LatestZip to ScriptDownloadFolderURL & ScriptName & "-" & LatestVersion & ".zip"
		
		-- When the file isn't there, it'll get an error HTML page.
		if LatestVersion contains "DOCTYPE" then
			return "/debug echo Error getting the latest " & ScriptName & " version number. Please try again later or visit " & ScriptHomepage & " for more information."
		end if
		if LatestVersion is greater than CurrentVersion then
			--	return UpdateZipPath
			do shell script "rm -f " & UpdateZipPath
			do shell script "curl -C - " & LatestZip & " -o " & UpdateZipPath
			if LatestChecksum is not (do shell script "md5 -q " & UpdateZipPath) then
				if LatestChecksum contains "DOCTYPE" then
					return "/debug echo Error getting the online checksum for the latest  " & ScriptName & " version. Please try again later or download newest version here: http://xsysinfo.xeon3d.net "
				end if
				return "/debug echo The " & ScriptName & " download was corrupted. Local MD5: " & (do shell script "md5 -q " & UpdateZipPath) & " - Online MD5: " & LatestChecksum & " . Please try again later or visit " & ScriptHomepage & " for more info."
			end if
			set DownloadedUpdateCheck to do shell script "unzip -t " & UpdateZipPath
			if DownloadedUpdateCheck contains "No errors detected" then
				do shell script "rm -f " & ExternalScriptsPath & "/si*.scpt"
				do shell script "rm -f " & ExternalScriptsPath & "/xsys*.scpt"
				do shell script "unzip -o " & UpdateZipPath & " -d " & ExternalScriptsPath
				do shell script "rm -f " & UpdateZipPath
				set ResultMessage to "/echo Successefully updated " & ScriptName & " to version " & LatestVersion & " from " & CurrentVersion & "." & NewLine & "/echo Changelog: " & ChangelogURL
				return ResultMessage
			else if DownloadedUpdateCheck contains "cannot find" then
				set ResultMessage to "/echo Error extracting " & ScriptName & ". Try again later or download a previous version from " & ScriptHomepage
				return ResultMessage
			end if
		else if LatestVersion is equal to CurrentVersion then
			set ResultMessage to "/echo " & ScriptName & " is already up to date. (Your script version: " & CurrentVersion & "; Latest released script version: " & LatestVersion & ")"
			return ResultMessage
		else if CurrentVersion is greater than LatestVersion then
			set ResultMessage to "/echo Your copy of " & ScriptName & " is newer than the last released version. (Your script version: " & CurrentVersion & "; Latest released script version: " & LatestVersion & ")"
			return ResultMessage
		end if
	end if
	
	if cmd is "refresh" then
		tell application "Finder"
			if exists POSIX file "/tmp/SPHardwareDataType.txt" then
				do shell script "rm -rf /tmp/SPHardwareDataType.txt"
			end if
			if exists POSIX file "/tmp/SPDisplaysDataType.txt" then
				do shell script "rm -rf /tmp/SPDisplaysDataType.txt"
			end if
			if exists POSIX file "/tmp/SPPowerDataType.txt" then
				do shell script "rm -rf /tmp/SPPowerDataType.txt"
			end if
		end tell
	end if
	
	if cmd is "help" then
		set msg to ¬
			"/echo " & FBold & "Usage:" & FBold & " /" & ScriptName & " [labels] [simple]" & NewLine & ¬
			"/echo If run without arguments, it'll show a predefined set of system details that can be customized by typing '/" & ScriptName & " options'" & NewLine & ¬
			"/echo Possible labels:" & NewLine & "/echo mac, cpu, speed, cap, cache, fsb, temp, ram, bar, mem, hd, gpu, res, audio, power, osx, osxbuild, osxarch, kernel, kerneltag, uptime, client." & NewLine & ¬
			"/echo There are also some special labels: 'about' shows some info about the script; " & NewLine & ¬
			"/echo The 'simple' label makes the script output without any formatting (colors, bold, etc...); " & NewLine & ¬
			"/echo The 'update' label updates the script and the 'version' label displays the current version."
		set chars to count characters of ("Usage:" & " /" & ScriptName & " [labels] [simple]" & NewLine)
		set separator to ""
		repeat chars times
			set separator to separator & "_"
		end repeat
		set msg to "/echo " & separator & NewLine & msg
		return msg
	end if
	
	if cmd is "about" then
		set msg to ¬
			"/echo " & FBold & ScriptName & " " & CurrentVersion & FBold & " - " & ScriptDescription & NewLine & ¬
			"/echo Homepage: " & ScriptHomepage & NewLine & ¬
			"/echo Coded by " & ScriptAuthor & " - " & ScriptAuthorHomepage & NewLine
		set chars to count characters of (FBold & "Usage:" & FBold & " /" & ScriptName & " [labels] [simple]" & NewLine)
		set separator to ""
		repeat chars times
			set separator to separator & "_"
		end repeat
		set msg to "/echo " & separator & NewLine & msg
		return msg
	end if
	
	-- Initializes the msg (output) variable.
	set msg to ""
	
	--Mac Model
	if ViewMac is true then
		set MachineModel to do shell script "sysctl -n hw.model"
		
		if MachineModel is "VMware7,1" then
			set MachineName to "Virtualized"
		else
			try
				set MachineName to do shell script "cat " & MachinesPlist & " | grep -A1 " & MachineModel
			on error
				set MachineName to ""
			end try
			if MachineName is not "" then
				set MachineName to 2nd paragraph of MachineName
				set AppleScript's text item delimiters to ">"
				set MachineName to text item 2 of MachineName
				set AppleScript's text item delimiters to "<"
				set MachineName to text item 1 of MachineName
				if MachineName contains "-inch" then
					set AppleScript's text item delimiters to "-inch"
					set MachineName to text item 1 of MachineName & "\"" & text item 2 of MachineName
				end if
			end if
			if MachineName is "" then
				set MachineName to "Unknown"
			end if
		end if
		set msg to msg & FBold & "Mac: " & FBold & MachineName & ItemDelimiter
		
	end if
	
	
	if ViewCPU is true then
		set CPUModel to do shell script "sysctl machdep.cpu.brand_string | awk '{ print $2,$3,$4,$5,$6,$7,$8,$9 }'"
		set CPUModel to my remtext(CPUModel, "(R)")
		set CPUModel to my remtext(CPUModel, "(TM)")
		set CPUModel to my remtext(CPUModel, "Processor")
		set CPUModel to my remtext(CPUModel, " CPU")
		set CPUModel to my remtext(CPUModel, "GHz")
		set CPUModel to my remtext(CPUModel, "  ")
		set CPUModel to my cutforward(CPUModel, " @")
		set msg to msg & FBold & "CPU: " & FBold & CPUModel
		
		
		if ViewCurrentCPUSpeed is true then
			set CPUFrequency to do shell script "sysctl -n hw.cpufrequency"
			if CPUFrequency / 1000000 ≥ 990 then
				set CPUFrequency to (CPUFrequency / 100000000) / 10
				set msg to msg & " @ " & "" & (round CPUFrequency * 100) / 100 & "0 GHz"
			else
				set temp to (cpufreq / 1000000)
				set msg to msg & " @ " & "" & (round CPUFrequency * 100) / 100 & "MHz"
			end if
		end if
		
		if ViewCPUCapabilities is true then
			set corecheck to do shell script "sysctl -n machdep.cpu.core_count"
			set features to do shell script "sysctl -n machdep.cpu.features"
			set extfeatures to do shell script "sysctl -n machdep.cpu.extfeatures"
			set msg to msg & " ["
			if features contains "SSE4" then
				set msg to msg & "SSE4"
			end if
			if features contains "AVX" then
				set msg to msg & "" & "/AVX"
			end if
			if features contains "PAE" then
				set msg to msg & "" & "/PAE"
			end if
			if features contains "HT" then
				set msg to msg & "" & "/HT"
			end if
			if extfeatures contains "VMX" then
				set msg to msg & "" & "/VMX"
			end if
			if extfeatures contains "EM64T" then
				set msg to msg & "" & "/EM64T"
			end if
			if corecheck is "1" then
				set msg to msg & "/SingleCore"
			end if
			if corecheck is "2" then
				set msg to msg & "/DualCore"
			end if
			if corecheck is "4" then
				set msg to msg & "" & "/QuadCore"
			end if
			if corecheck is 6 then
				set msg to msg & "" & "/HexaCore"
			end if
			if corecheck is 8 then
				set msg to msg & "" & "/OctoCore"
			end if
			set msg to msg & "]"
		end if
		
		--L2 Cache
		if ViewCPUCache is true then
			set coreicheck to do shell script "sysctl machdep.cpu.brand_string"
			if coreicheck contains "Core(TM) i" then
				set cpucache to do shell script "sysctl -n hw.l3cachesize"
				set msg to msg & FBold & " L3: " & FBold & (round (cpucache / 1024 / 1024)) & "MiB"
			else
				set cpucache to do shell script "sysctl -n hw.l2cachesize"
				set msg to msg & FBold & " L2: " & FBold & (round (cpucache / 1024 / 1024)) & "MiB"
			end if
		end if
		set msg to msg & ItemDelimiter
	end if
	
	return msg
end textualcmd

on remtext(orig, remove)
	if orig contains remove then
		set AppleScript's text item delimiters to remove
		set orig to text item 1 of orig & text items 2 thru end of orig
	else
		set orig to orig
	end if
end remtext

on cutforward(orig, ponto)
	if orig contains ponto then
		set AppleScript's text item delimiters to ponto
		set orig to text item 1 of orig
	else
		set orig to orig
	end if
end cutforward

on cutbackward(orig, ponto)
	if orig contains ponto then
		set AppleScript's text item delimiters to ponto
		set orig to text items 2 thru the end of orig
	else
		set orig to orig
	end if
end cutbackward