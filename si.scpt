-- si - A System Information Script for Textual
-- Coded by Xeon3D
--  Very loosely based on KSysInfo for Linkinus by KanadaKid

-- 2 step Installation:
-- Copy this to ~/Library/Application Support/Textual IRC/Scripts/
-- Run /si or /si help for more options.



-- | SCRIPT START | --
-- |Properties| --

property ScriptName : "si"
property ScriptDescription : "A System Information Script for Textual"
property ScriptHomepage : "http://xeon3d.net/si/"
property ScriptAuthor : "Xeon3D"
property ScriptAuthorHomepage : "http://www.xeon3d.net"
property CurrentVersion : "0.1.0"
property SupportChannel : "irc://irc.wyldryde.org/#textual-extras"

-- | DEBUG COMMAND | --
--set cmd to ""

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
	set SeparatorColor to COrange
	
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
			"/echo • Simple - Defines if the formatting is removed from the output of the script." & FBold & " - Current Status: " & FBold & CRed & Simple & NewLine
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
		return msg
	end if
	
	if cmd is "about" then
		set msg to ¬
			"/echo " & FBold & ScriptName & " " & CurrentVersion & FBold & " - " & ScriptDescription & NewLine & ¬
			"/echo Homepage: " & ScriptHomepage & NewLine & ¬
			"/echo Coded by " & ScriptAuthor & " - " & ScriptAuthorHomepage & NewLine
		return msg
	end if
	
	-- Initializes the msg (output) variable.
	set msg to ""
	
	--Mac Model
	if ViewMac is true then
		set MachineModel to do shell script "sysctl -n hw.model"
		
		if MachineModel is "VMware7,1" then
			set machineName to "Virtualized"
		else
			try
				set machineName to do shell script "cat " & MachinesPlist & " | grep -A1 " & MachineModel
			on error
				set machineName to ""
			end try
			if machineName is not "" then
				set machineName to 2nd paragraph of machineName
				set AppleScript's text item delimiters to ">"
				set machineName to text item 2 of machineName
				set AppleScript's text item delimiters to "<"
				set machineName to text item 1 of machineName
				if machineName contains "-inch" then
					set AppleScript's text item delimiters to "-inch"
					set machineName to text item 1 of machineName & "\"" & text item 2 of machineName
				end if
			end if
			if machineName is "" then
				set machineName to "Unknown"
			end if
		end if
		set msg to msg & FBold & "Mac: " & FBold & machineName & ItemDelimiter
		
	end if
	
	
	if ViewCPU is true then
		set CPUModel to do shell script "sysctl machdep.cpu.brand_string | awk '{ print $2,$3,$4,$5,$6,$7,$8,$9 }'"
		set CPUModel to my removetext(CPUModel, "(R)")
		set CPUModel to my removetext(CPUModel, "(TM)")
		set CPUModel to my removetext(CPUModel, "Processor")
		set CPUModel to my removetext(CPUModel, " CPU")
		set CPUModel to my removetext(CPUModel, "GHz")
		set CPUModel to my removetext(CPUModel, "  ")
		set CPUModel to my cutforward(CPUModel, " @")
		set msg to msg & FBold & "CPU: " & FBold & CPUModel
		
		
		if ViewCurrentCPUSpeed is true then
			set CPUFrequency to CPU speed of (system info)
			set CPUFrequency to CPUFrequency * 1000000
			if CPUFrequency / 1000000 ≥ 990 then
				set CPUFrequency to (CPUFrequency / 100000000) / 10
				set msg to msg & " @ " & "" & (round CPUFrequency * 100) / 100 & "GHz"
			else
				set temp to (CPUFrequency / 1000000)
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
	
	--Ram
	if ViewRam is true then
		set TotalMemory to do shell script "sysctl -n hw.memsize"
		set TotalMemory to TotalMemory / 1024 / 1024 as integer
		set FreeMemory to do shell script "top -l1 | grep 'PhysMem' | awk '{print $10}'"
		if FreeMemory contains "G" then
			set AppleScript's text item delimiters to "G"
			set FreeMemory to text item 1 of FreeMemory
			set FreeMemory to FreeMemory * 1024
			set AppleScript's text item delimiters to ""
		else
			set AppleScript's text item delimiters to "M"
			set FreeMemory to text item 1 of FreeMemory
			set AppleScript's text item delimiters to ""
		end if
		set UsedMemory to TotalMemory - FreeMemory
		set UsedMemoryBar to (UsedMemory / TotalMemory) * 100 as integer
		set UsedMemoryBar to round (UsedMemoryBar / 10) rounding to nearest
		if TotalMemory ≥ 1024 then
			set TotalMemory to (TotalMemory round) / 1024
			set TotalMemoryUnit to "GiB"
		else
			set TotalMemoryUnit to "MiB"
		end if
		if UsedMemory ≥ 1024 then
			set UsedMemory to UsedMemory / 1024
			set UsedMemory to (round (UsedMemory * 100)) / 100
			set UsedMemoryUnit to "GiB"
		else
			set UsedMemory to (round (UsedMemory * 100)) / 100
			set UsedMemoryUnit to "MiB"
		end if
		
		set msg to msg & FBold & "RAM: " & FBold & UsedMemory & UsedMemoryUnit & "/" & TotalMemory & TotalMemoryUnit
		if ViewBars is true then
			set FreeMemoryBar to 10 - UsedMemoryBar
			set OutputBar to "[" & UsedColor
			repeat UsedMemoryBar times
				set OutputBar to OutputBar & "❙"
			end repeat
			set OutputBar to OutputBar & SeparatorColor & "|" & FreeColor
			repeat FreeMemoryBar times
				set OutputBar to OutputBar & "❙"
			end repeat
			set OutputBar to OutputBar & CWhite & "]"
			set msg to msg & " " & OutputBar
		end if
		set msg to msg & ItemDelimiter
	end if
	
	--HDD
	if ViewDisk is true then
		tell application "Finder"
			set StartupDiskName to the name of (startup disk)
			if UseAllMountpoints is "True" then
				set DiskList to list disks
			else
				set DiskList to {StartupDiskName}
			end if
			set TotalFreeSpace to 0
			set TotalDiskSpace to 0
			repeat with CurrentDisk in DiskList
				set CurrentDiskName to (CurrentDisk as string)
				try
					set DiskFreeSpace to round (the (free space of disk CurrentDiskName) / 1024 / 1024)
					set DiskCapacity to round (the (capacity of disk CurrentDiskName) / 1024 / 1024)
					set TotalFreeSpace to TotalFreeSpace + DiskFreeSpace
					set TotalDiskSpace to TotalDiskSpace + DiskCapacity
				end try
			end repeat
		end tell
		set DiskUsedPercentage to round (((TotalDiskSpace - TotalFreeSpace) / TotalDiskSpace) * 100)
		set TotalUsedSpace to (round ((TotalDiskSpace - TotalFreeSpace) / 1024) * 100) / 100
		set TotalDiskSpace to (round (TotalDiskSpace / 1024) * 100) / 100
		if TotalUsedSpace is greater than 1024 then
			set TotalUsedSpace to (round (TotalUsedSpace / 1024) * 100) / 100
			set UsedSpaceUnit to "TiB"
		else
			set UsedSpaceUnit to "GiB"
		end if
		if TotalDiskSpace is greater than 1024 then
			set TotalDiskSpace to (round (TotalDiskSpace / 1024) * 100) / 100
			set TotalSpaceUnit to "TiB"
		else
			set TotalSpaceUnit to "GiB"
		end if
		set msg to msg & FBold & "HDD: " & FBold & TotalUsedSpace & UsedSpaceUnit & "/" & TotalDiskSpace & TotalSpaceUnit
		if ViewBars is true then
			set UsedHDDBar to round (DiskUsedPercentage / 10) rounding to nearest
			set FreeHDDBar to 10 - UsedHDDBar
			set OutputBar to "[" & UsedColor
			repeat UsedHDDBar times
				set OutputBar to OutputBar & "❙"
			end repeat
			set OutputBar to OutputBar & SeparatorColor & "|" & FreeColor
			repeat FreeHDDBar times
				set OutputBar to OutputBar & "❙"
			end repeat
			set OutputBar to OutputBar & CWhite & "]"
			set msg to msg & " " & OutputBar
		end if
		set msg to msg & ItemDelimiter
	end if
	
	--Display
	if ViewDisplay is true then
		set SPGraphicsInfo to the paragraphs of (do shell script "system_profiler SPDisplaysDataType | awk -F: ' /Chipset|Bus|Resolution|VRAM/ {print $NF}'") as list
		set VideoCard to item 1 of SPGraphicsInfo
		set VideoCardBus to item 2 of SPGraphicsInfo
		set VideoMemory to trim(item 3 of SPGraphicsInfo)
		set NrOfMonitors to ((count of items of SPGraphicsInfo) - 3)
		if (count items of SPGraphicsInfo) ≥ 6 then
			set VideoCard to "2x" & trim(item 1 of SPGraphicsInfo)
			set VideoMemory to "2x" & trim(item 3 of SPGraphicsInfo)
			set NrOfMonitors to ((count of items of SPGraphicsInfo) - 6)
		end if
		set msg to msg & FBold & "GPU: " & FBold & VideoCard & " "
		--GFXBus
		if ViewGFXBus is true then
			set msg to msg & "[" & removetext(VideoCardBus, " ") & "] "
		end if
		--VRAM
		set msg to msg & "[" & VideoMemory & "] "
		--Resolutions
		if ViewResolutions is true then
			if NrOfMonitors is 1 then
				set ResolutionMonitor1 to removetext(item 4 of SPGraphicsInfo, " ")
				set msg to msg & FBold & "Res: " & FBold & ResolutionMonitor1
			else if NrOfMonitors is 2 then
				set ResolutionMonitor1 to cutforward(removetext(item 4 of SPGraphicsInfo, " "), "@")
				set ResolutionMonitor2 to cutforward(removetext(item 5 of SPGraphicsInfo, " "), "@")
				set msg to msg & FBold & "Res: " & FBold & ResolutionMonitor1 & " & " & ResolutionMonitor2
			else if NrOfMonitors is 3 then
				set ResolutionMonitor1 to cutforward(removetext(item 4 of SPGraphicsInfo, " "), "@")
				set ResolutionMonitor2 to cutforward(removetext(item 5 of SPGraphicsInfo, " "), "@")
				set ResolutionMonitor3 to cutforward(removetext(item 9 of SPGraphicsInfo, " "), "@")
				set msg to msg & FBold & "Res: " & FBold & ResolutionMonitor1 & " & " & ResolutionMonitor2 & " & " & ResolutionMonitor3
			else if NrOfMonitors is 4 then
				set ResolutionMonitor1 to cutforward(removetext(item 4 of SPGraphicsInfo, " "), "@")
				set ResolutionMonitor2 to cutforward(removetext(item 5 of SPGraphicsInfo, " "), "@")
				set ResolutionMonitor3 to cutforward(removetext(item 9 of SPGraphicsInfo, " "), "@")
				set ResolutionMonitor4 to cutforward(removetext(item 10 of SPGraphicsInfo, " "), "@")
				set msg to msg & FBold & "Res: " & FBold & ResolutionMonitor1 & " & " & ResolutionMonitor2 & " & " & ResolutionMonitor3 & " & " & ResolutionMonitor4
			end if
		end if
	end if
	set msg to msg & ItemDelimiter
	
	
	return msg
end textualcmd

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

on trim(orig)
	repeat until orig does not start with " "
		set orig to text 2 thru -1 of orig
	end repeat
	
	repeat until orig does not end with " "
		set orig to text 1 thru -2 of orig
	end repeat
	return orig
end trim

on removetext(orig, texttoremove)
	set AppleScript's text item delimiters to texttoremove
	set theTextItems to text items of orig
	set AppleScript's text item delimiters to ""
	set orig to theTextItems as string
	set AppleScript's text item delimiters to {""}
	return orig
end removetext
