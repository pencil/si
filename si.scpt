-- si - A System Information Script for Textual
-- Coded by Xeon3D
-- Very loosely based on KSysInfo for Linkinus by KanadaKid

-- 2 step Installation:
-- Copy this to ~/Library/Containers/com.codeux.irc.textual/Data/Library/Application Support/Textual IRC/Scripts
-- Run /si or /si help for more options.



-- | SCRIPT START | --
-- |Properties| --
property ClientName : name of current application
property scriptname : "si"
property ScriptDescription : "A System Information Script for Textual"
property ScriptHomepage : "http://emupt.com"
property ScriptAuthor : "Xeon3D"
property ScriptAuthorHomepage : "http://www.emupt.com"
property CurrentVersion : "0.4.14"
property CodeName : "pencil is nitpicky edition"
property SupportChannel : "irc://irc.freenode.org/#textual"

---  Colors
property CBlack : (ASCII character 3) & "01"
property CNBlue : (ASCII character 3) & "02"
property CGreen : (ASCII character 3) & "03"
property CRed : (ASCII character 3) & "04"
property CBrown : (ASCII character 3) & "05"
property CPurple : (ASCII character 3) & "06"
property COrange : (ASCII character 3) & "07"
property CYellow : (ASCII character 3) & "08"
property CLGreen : (ASCII character 3) & "09"
property CTeal : (ASCII character 3) & "10"
property CCyan : (ASCII character 3) & "11"
property CBlue : (ASCII character 3) & "12"
property CPink : (ASCII character 3) & "13"
property CGrey : (ASCII character 3) & "14"
property CLGrey : (ASCII character 3) & "15"
property CWhite : (ASCII character 3)
property NoColor : (ASCII character 0)

-- Defines the Bars' Colors
property UsedColor : CRed
property FreeColor : CGreen
property SeparatorColor : COrange

-- | DEBUG COMMAND | --
--set cmd to ""

on textualcmd(cmd)
	-- |Variables| --
	
	-- Defines the version of Textual where it's being run from.
	set ClientVersion to version of application ClientName
	
	-- Defines the POSIX path to the "Textual" application
	set TextualPath to POSIX path of (path to current application)
	
	-- Defines the path to the Mac Models plist (also used by the /sysinfo plugin)
	set MachinesPlist to TextualPath & "Contents/Resources/Extensions/SystemProfiler.bundle/Contents/Resources/MacintoshModels.plist"
	
	-- Defines the path for the Scripts folder inside the Textual executable.
	set InternalScriptsPath to the quoted form of (TextualPath & "Contents/Resources/Scripts/")
	
	-- Defines Text Formatting
	
	--- Initializes the Simple variable.
	set Simple to ""
	
	
	--- Formatting
	set FBold to (ASCII character 2)
	set FItalic to (ASCII character 1)
	set NewLine to (ASCII character 10)
	
	if (cmd contains "simple") or (Simple is true or Simple is "True") then
		set UsedColor to ""
		set FreeColor to ""
		set SeparatorColor to ""
		set CWhite to ""
		set FBold to ""
		set FItalic to ""
	end if
	
	--- User Options --
	
	-- This regards showing the final delimiter.
	try
		set HideLastDelimiter to do shell script "defaults read xeon3d.si HideLastDelimiter"
	on error
		try
			do shell script ("defaults write xeon3d.si HideLastDelimiter True")
			set HideLastDelimiter to "True"
		on error
			set msg to "/echo There was an error writing defaults HideLastDelimiter"
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
	
	-- This sets the item delimiter.
	set ItemDelimiter to " • "
	
	if cmd is "all" then
		set cmd to "mac cpu speed cap cache ram bar disk gpu bus res audio power osx osxbuild osxarch kernel kerneltag uptime client clientbuild script"
	end if
	
	-- Defines default runtime options.
	
	if cmd is "" or cmd is "simple" then
		---- Default output when no options or just "simple" is supplied at runtime.
		set ViewMac to true
		set ViewCPU to true
		set ViewCurrentCPUSpeed to true
		set ViewCPUCapabilities to false
		set ViewCPUCache to false
		set ViewRam to true
		set ViewBars to true
		set ViewDisk to true
		set ViewDisplay to true
		set ViewGFXBus to false
		set ViewResolutions to true
		set ViewAudio to true
		set ViewPower to false
		set ViewOSXVersion to true
		set ViewOSXArch to true
		set ViewOSXBuild to true
		set ViewKernel to false
		set ViewKernelTag to false
		set ViewUptime to true
		set ViewClient to true
		set ViewClientBuild to false
		set ViewScriptVersion to true
	else
		---- Checks which options the user supplied at runtime and acts accordingly.
		set ViewMac to (cmd contains "mac")
		set ViewCPU to (cmd contains "cpu")
		if ViewCPU then
			set ViewCurrentCPUSpeed to (cmd contains "speed")
			set ViewCPUCapabilities to (cmd contains "cap")
			set ViewCPUCache to (cmd contains "cache")
		end if
		set ViewRam to (cmd contains "ram")
		set ViewBars to (cmd contains "bar")
		set ViewDisk to (cmd contains "disk" or cmd contains "hd")
		set ViewDisplay to (cmd contains "gpu" or cmd contains "graphics" or cmd contains "video")
		if ViewDisplay then
			set ViewGFXBus to (cmd contains "bus")
			set ViewResolutions to (cmd contains "res")
		end if
		set ViewAudio to (cmd contains "audio" or cmd contains "sound")
		set ViewPower to (cmd contains "power")
		set ViewOSXVersion to (cmd contains "osx")
		set ViewOSXBuild to (cmd contains "osxbuild")
		set ViewOSXArch to (cmd contains "osxarch")
		set ViewKernel to (cmd contains "kernel")
		set ViewKernelTag to (cmd contains "kerneltag")
		set ViewUptime to (cmd contains "uptime")
		set ViewClient to (cmd contains "client")
		if ViewClient then
			set ViewClientBuild to (cmd contains "clientbuild")
		end if
		set ViewScriptVersion to (cmd contains "script")
	end if
	
	if cmd is "version" then
		set msg to "Script Version: " & scriptname & space & CurrentVersion & "(Codename: " & CodeName & ") for " & ClientName & " by " & ScriptAuthor & ". Get it @ " & ScriptHomepage
		return msg
	end if
	
	if cmd is "options" then
		set msg to "/echo Possible Options:" & NewLine & ¬
			"/echo To change an option type '/" & scriptname & " <option name> toggle'. Example: /" & scriptname & " simple toggle " & NewLine & ¬
			"/echo • HideLastDelimiter - Defines if the script should hide the final delimiter (as there are no more fields after." & FBold & " - Current Status: " & FBold & CRed & HideLastDelimiter & NewLine & ¬
			"/echo • UseAllMountpoints - Defines if the script considers every mounted disk / net share as available disk space or not." & FBold & " - Current Status: " & FBold & CRed & UseAllMountpoints & NewLine & ¬
			"/echo • Simple - Defines if the formatting is removed from the output of the script." & FBold & " - Current Status: " & FBold & CRed & Simple & NewLine
		return msg
		
	end if
	
	if cmd is "HideLastDelimiter" then
		if HideLastDelimiter is "True" then
			set msg to "/echo The last dot (delimiter) is currently " & FBold & "NOT" & FBold & " being shown. To change this type '/" & scriptname & " HideLastDelimiter toggle'"
			return msg
		else if HideLastDelimiter is "False" then
			set msg to "/echo The last dot (delimiter) is currently " & FBold & "BEING" & FBold & " shown. To change this type '/" & scriptname & " HideLastDelimiter toggle'"
			return msg
		end if
	end if
	
	if cmd is "HideLastDelimiter toggle" then
		if HideLastDelimiter is "True" then
			do shell script "defaults write xeon3d.si HideLastDelimiter False"
			return "/echo The final delimiter is now being SHOWN!"
		else if HideLastDelimiter is "False" then
			do shell script "defaults write xeon3d.si HideLastDelimiter True"
			return "/echo The final delimiter is now being HIDDEN!"
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
	
	--Network
	if cmd contains "network" then
		set adapter to cmd's last word
		set InitialTraffic to do shell script "netstat -b -I " & adapter & " | tail -n1 | awk {'print $(NF-1),$(NF-4)'}"
		set AppleScript's text item delimiters to space
		set InitialUploadedBytes to (text item 1 of InitialTraffic) / 1048576
		set InitialDownloadedBytes to (text item 2 of InitialTraffic) / 1048576
		set AppleScript's text item delimiters to ""
		delay 1
		set FinalTraffic to do shell script "netstat -b -I " & adapter & " | tail -n1 | awk {'print $(NF-1),$(NF-4)'}"
		set AppleScript's text item delimiters to space
		set FinalUploadedBytes to (text item 1 of FinalTraffic) / 1048576
		set FinalDownloadedBytes to (text item 2 of FinalTraffic) / 1048576
		set AppleScript's text item delimiters to ""
		set DownloadedTraffic to roundThis(FinalDownloadedBytes / 1024, 3)
		set UploadedTraffic to roundThis(FinalUploadedBytes / 1024, 3)
		if DownloadedTraffic > 1 then
			set DownloadedTrafficUnit to "GB"
			set DownloadedTraffic to roundThis(DownloadedTraffic, 2) & DownloadedTrafficUnit
		else
			set DownloadedTrafficUnit to "MB"
			set DownloadedTraffic to (DownloadedTraffic * 1000 as integer) & DownloadedTrafficUnit
		end if
		if UploadedTraffic > 1 then
			set UploadedTrafficUnit to "GB"
			set UploadedTraffic to roundThis(UploadedTraffic, 2) & UploadedTrafficUnit
		else
			set UploadedTrafficUnit to "MB"
			set UploadedTraffic to (UploadedTraffic * 1000 as integer) & UploadedTrafficUnit
		end if
		set DifferenceBetweenUploadedBytes to (FinalUploadedBytes - InitialUploadedBytes)
		set DifferenceBetweenDownloadedBytes to (FinalDownloadedBytes - InitialDownloadedBytes)
		set DownloadSpeed to roundThis(DifferenceBetweenDownloadedBytes, 3)
		set UploadSpeed to roundThis(DifferenceBetweenUploadedBytes, 3)
		if DownloadSpeed > 1 then
			set DownloadSpeedUnit to "MB/s"
			set DownloadSpeed to roundThis(DownloadSpeed, 2)
			set DownloadSpeed to DownloadSpeed & DownloadSpeedUnit
		else
			set DownloadSpeedUnit to "KB/s"
			set DownloadSpeed to DownloadSpeed * 1000 as integer
			set DownloadSpeed to DownloadSpeed & DownloadSpeedUnit
		end if
		if UploadSpeed > 1 then
			set UploadedSpeedUnit to "MB/s"
			set UploadSpeed to roundThis(UploadSpeed, 2)
			set UploadSpeed to UploadSpeed & UploadedSpeedUnit
		else
			set UploadedSpeedUnit to "KB/s"
			set UploadSpeed to UploadSpeed * 1000 as integer
			set UploadSpeed to UploadSpeed & UploadedSpeedUnit
		end if
		set msg to FBold & "Net:" & FBold & " [" & adapter & "] D:" & DownloadSpeed & " [" & DownloadedTraffic & "] - U:" & UploadSpeed & " [" & UploadedTraffic & "]" & ItemDelimiter
		return msg
	end if
	
	
	
	if cmd is "help" then
		set msg to ¬
			"/echo " & FBold & "Usage:" & FBold & " /" & scriptname & " [labels] [simple]" & NewLine & ¬
			"/echo If run without arguments, it'll show a predefined set of system details that can be customized by typing '/" & scriptname & " options'" & NewLine & ¬
			"/echo Possible labels:" & NewLine & "/echo mac, cpu, speed, cap, cache, fsb, temp, ram, bar, mem, hd, gpu, res, audio, power, osx, osxbuild, osxarch, kernel, kerneltag, uptime, client." & NewLine & ¬
			"/echo There are also some special labels: 'about' shows some info about the script; " & NewLine & ¬
			"/echo The 'simple' label makes the script output without any formatting (colors, bold, etc...); " & NewLine & ¬
			"/echo The 'update' label updates the script and the 'version' label displays the current version."
		return msg
	end if
	
	if cmd is "about" then
		set msg to ¬
			"/echo " & FBold & scriptname & " " & CurrentVersion & FBold & " - " & ScriptDescription & NewLine & ¬
			"/echo Homepage: " & ScriptHomepage & NewLine & ¬
			"/echo Coded by " & ScriptAuthor & " - " & ScriptAuthorHomepage & NewLine
		return msg
	end if
	
	-- Initializes the msg (output) variable.
	set msg to ""
	--Mac Model
	if ViewMac then
		set MachineModel to do shell script "sysctl -n hw.model"
		
		if MachineModel is "VMware7,1" then
			set machineName to "Virtualized"
		else
			try
				set machineName to do shell script "defaults read " & MachinesPlist & " | grep " & MachineModel & " | awk -F\\\" {'print $4'}"
			on error
				set machineName to ""
			end try
			if machineName is not "" then
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
	
	
	if ViewCPU then
		set NRofCPUs to do shell script "sysctl hw.packages | awk '{print $2}'"
		set CPUModel to do shell script "sysctl machdep.cpu.brand_string | awk '{ print $2,$3,$4,$5,$6,$7,$8,$9 }'"
		set CPUModel to my removetext(CPUModel, "(R)")
		set CPUModel to my removetext(CPUModel, "(TM)")
		set CPUModel to my removetext(CPUModel, "Processor")
		set CPUModel to my removetext(CPUModel, " CPU")
		set CPUModel to my removetext(CPUModel, "GHz")
		set CPUModel to my removetext(CPUModel, "  ")
		set CPUModel to my cutforward(CPUModel, " @")
		if NRofCPUs is "1" then
			set msg to msg & FBold & "CPU: " & FBold & CPUModel
		else
			set msg to msg & FBold & "CPU: 2x " & FBold & CPUModel
		end if
		
		
		if ViewCurrentCPUSpeed then
			set CPUFrequency to CPU speed of (system info)
			set CPUFrequency to CPUFrequency * 1000000
			if CPUFrequency / 1000000 ≥ 990 then
				set CPUFrequency to (CPUFrequency / 100000000) / 10
				set msg to msg & " @ " & "" & roundThis(CPUFrequency, 2) & "GHz"
			else
				set temp to (CPUFrequency / 1000000)
				set msg to msg & " @ " & "" & roundThis(CPUFrequency, 2) & "MHz"
			end if
		end if
		
		if ViewCPUCapabilities then
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
		if ViewCPUCache then
			set coreicheck to do shell script "sysctl machdep.cpu.brand_string"
			if coreicheck contains "Core(TM) i" then
				set cpucache to do shell script "sysctl -n hw.l3cachesize"
				set msg to msg & FBold & " L3: " & FBold & (round (cpucache / 1024 / 1024)) & "MB"
			else
				set cpucache to do shell script "sysctl -n hw.l2cachesize"
				set msg to msg & FBold & " L2: " & FBold & (round (cpucache / 1024 / 1024)) & "MB"
			end if
		end if
		set msg to msg & ItemDelimiter
	end if
	
	--Ram
	if ViewRam then
		set TotalMemory to (round (do shell script "sysctl -n hw.memsize") / 1048576)
		set free to roundThis((the (last word of (do shell script "vm_stat | grep free")) * 4096) / (1048576), 2) as integer
		set UsedMemory to (TotalMemory - free)
		set UsedMemoryBar to round ((UsedMemory / TotalMemory) * 100) / 10 as integer
		if TotalMemory ≥ 1024 then
			set TotalMemory to roundThis((TotalMemory / 1024), 2)
			set TotalMemoryUnit to "GB"
		else
			set TotalMemoryUnit to "MB"
		end if
		if UsedMemory ≥ 1024 then
			set UsedMemory to roundThis((UsedMemory / 1024), 2)
			set UsedMemoryUnit to "GB"
		else
			set UsedMemoryUnit to "MB"
		end if
		set msg to msg & FBold & "RAM: " & FBold & UsedMemory & UsedMemoryUnit & "/" & TotalMemory & TotalMemoryUnit
		if ViewBars then
			set OutputBar to MakeBars(UsedMemoryBar)
			set msg to msg & " " & OutputBar
		end if
		set msg to msg & ItemDelimiter
	end if
	
	--HDD
	if ViewDisk then
		set DiskFree to 0
		set DiskUsed to 0
		set DiskCapacity to 0
		set AllFree to 0
		set AllUsed to 0
		set AllCapacity to 0
		set AllStats to the paragraphs of (do shell script "df -Hhk -T nodevfs | grep -v Mounted | grep -v \\/net | grep -v \\/home | awk {'print $2,$3,$4'}")
		repeat with eachline in AllStats
			set DiskCapacity to (first word of eachline) / 1024 as integer
			set DiskUsed to (second word of eachline) / 1024 as integer
			set DiskFree to (third word of eachline) / 1024 as integer
			set AllCapacity to AllCapacity + DiskCapacity
			set AllUsed to AllUsed + DiskUsed
			set AllFree to AllFree + DiskFree
		end repeat
		set AResult to "Resultado:" & (AllUsed + AllFree) & " - " & AllCapacity
		
		
		set AllDisksUsedPercentage to round (((AllCapacity - AllFree) / AllCapacity) * 100)
		set AllUsed to roundThis(((AllUsed) / 1024), 2)
		set AllCapacity to roundThis((AllCapacity / 1024), 2)
		set AllFree to roundThis((AllFree / 1024), 2)
		if AllUsed is greater than 1024 then
			set AllUsed to roundThis((AllUsed / 1024), 2)
			set UsedSpaceUnit to "TB"
		else
			set UsedSpaceUnit to "GB"
		end if
		if AllCapacity is greater than 1024 then
			set AllCapacity to roundThis((AllCapacity / 1024), 2)
			set TotalSpaceUnit to "TB"
		else
			set TotalSpaceUnit to "GB"
		end if
		set msg to msg & FBold & "HDD: " & FBold & AllUsed & UsedSpaceUnit & "/" & AllCapacity & TotalSpaceUnit
		if ViewBars then
			set UsedHDDBar to round (AllDisksUsedPercentage / 10) rounding to nearest
			set OutputBar to MakeBars(UsedHDDBar)
			set msg to msg & " " & OutputBar
		end if
		set msg to msg & ItemDelimiter
	end if
	
	--Display
	if ViewDisplay then
		set SPGraphicsInfo to the paragraphs of (do shell script "system_profiler SPDisplaysDataType | awk -F: ' /Chipset|Bus|Resolution|VRAM/ {print $NF}' | sed 's/^.//g' | awk -F' @' '{print $1}'") as list
		--set SPGraphicsInfo to the paragraphs of (do shell script "cat /Users/xeon3d/Documents/si/SPLogs/contigpu.txt | awk -F: ' /Chipset|Bus|Resolution|VRAM/ {print $NF}' | sed 's/^.//g' | awk -F' @' '{print $1}'") as list
		--set SPGraphicsInfo to the paragraphs of (do shell script "cat /Users/xeon3d/Documents/si/SPLogs/imac2009gpu.txt | awk -F: ' /Chipset|Bus|Resolution|VRAM/ {print $NF}' | sed 's/^.//g' | awk -F' @' '{print $1}'") as list
		--set SPGraphicsInfo to the paragraphs of (do shell script "cat /Users/xeon3d/Documents/si/SPLogs/macpro41dualgpu.txt | awk -F: ' /Chipset|Bus|Resolution|VRAM/ {print $NF}' | sed 's/^.//g' | awk -F' @' '{print $1}'") as list
		--set SPGraphicsInfo to the paragraphs of (do shell script "cat /Users/xeon3d/Documents/si/SPLogs/mbp55gpu.txt | awk -F: ' /Chipset|Bus|Resolution|VRAM/ {print $NF}' | sed 's/^.//g' | awk -F' @' '{print $1}'") as list
		--set SPGraphicsInfo to the paragraphs of (do shell script "cat /Users/xeon3d/Documents/si/SPLogs/mbp82amdgpu.txt | awk -F: ' /Chipset|Bus|Resolution|VRAM/ {print $NF}' | sed 's/^.//g' | awk -F' @' '{print $1}'") as list
		--set SPGraphicsInfo to the paragraphs of (do shell script "cat /Users/xeon3d/Documents/si/SPLogs/mbp82intgpu.txt | awk -F: ' /Chipset|Bus|Resolution|VRAM/ {print $NF}' | sed 's/^.//g' | awk -F' @' '{print $1}'") as list
		set GPU1 to {}
		set GPU2 to {}
		set GPUone to 0
		set GPUtwo to 0
		set GPUItemLoop to 0
		set ActiveGPU to 0
		repeat with i in SPGraphicsInfo
			set GPUItemLoop to GPUItemLoop + 1
			if i contains "AMD" or i contains "ATI" or i contains "NVIDIA" or i contains "INTEL" then
				if GPUone is 0 then
					set GPUone to GPUItemLoop
				else
					set GPUtwo to GPUItemLoop
				end if
			end if
		end repeat
		if GPUtwo is 0 then
			set GPU1 to items 1 thru (count of items of SPGraphicsInfo) of SPGraphicsInfo
			set VideoCard1 to item 1 of GPU1
			set VideoCardBus1 to ", " & item 2 of GPU1
			if ViewGFXBus then
				set VideoMemory1 to " [" & item 3 of GPU1 & VideoCardBus1 & "]"
			else
				set VideoMemory1 to " [" & item 3 of GPU1 & "]"
			end if
			set ScreensGPU1 to ((count of items of GPU1) - 3)
			set ScreensGPU2 to 0
			set VideoCard to VideoCard1 & VideoMemory1
		else
			set GPU1 to items 1 thru (GPUtwo - 1) of SPGraphicsInfo
			set VideoCard1 to item 1 of GPU1
			set VideoCardBus1 to ", " & item 2 of GPU1
			if ViewGFXBus then
				set VideoMemory1 to " [" & item 3 of GPU1 & VideoCardBus1 & "]"
			else
				set VideoMemory1 to " [" & item 3 of GPU1 & "]"
			end if
			set ScreensGPU1 to ((count of items of GPU1) - 3)
			set GPU2 to items GPUtwo thru (count of items of SPGraphicsInfo) of SPGraphicsInfo
			set VideoCard2 to item 1 of GPU2
			set VideoCardBus2 to ", " & item 2 of GPU2
			if ViewGFXBus then
				set VideoMemory2 to " [" & item 3 of GPU2 & VideoCardBus2 & "]"
			else
				set VideoMemory2 to " [" & item 3 of GPU2 & "]"
			end if
			set ScreensGPU2 to ((count of items of GPU2) - 3)
			set NrOfScreens to ScreensGPU1 + ScreensGPU2
			if GPUtwo is 0 then
				set VideoCard to VideoCard1 & VideoMemory1
				set ActiveGPU to 1
			else
				if ScreensGPU2 is 0 then
					set VideoCard to VideoCard1 & VideoMemory1 & " & " & CGrey & VideoCard2 & VideoMemory2 & CWhite
					set ActiveGPU to 1
				else if ScreensGPU1 is 0 then
					set VideoCard to CGrey & VideoCard1 & VideoMemory1 & CWhite & " & " & VideoCard2 & VideoMemory2
					set ActiveGPU to 2
				else
					set VideoCard to VideoCard1 & VideoMemory1 & " & " & VideoCard2 & VideoMemory2
				end if
				if VideoCard1 is equal to VideoCard2 then
					set VideoCard to "2x" & VideoCard1 & VideoMemory1
				end if
			end if
		end if
		set msg to msg & FBold & "GPU: " & FBold & VideoCard & " "
		
		--Resolutions
		if ViewResolutions then
			set msg to msg & FBold & "Res: " & FBold
			if ScreensGPU1 is 1 then
				set ResolutionMonitor1 to item 4 of GPU1
				set ResolutionsGPU1 to ResolutionMonitor1
			else if ScreensGPU1 is 2 then
				set ResolutionMonitor1 to item 4 of GPU1
				set ResolutionMonitor2 to item 5 of GPU1
				set ResolutionsGPU1 to ResolutionMonitor1 & " & " & ResolutionMonitor2
			else if ScreensGPU1 is 3 then
				set ResolutionMonitor1 to item 4 of GPU1
				set ResolutionMonitor2 to item 5 of GPU1
				set ResolutionMonitor3 to item 6 of GPU1
				set ResolutionsGPU1 to ResolutionMonitor1 & " & " & ResolutionMonitor2 & " & " & ResolutionMonitor3
			else
				set ResolutionsGPU1 to ""
			end if
			if ScreensGPU1 is not 0 and ScreensGPU2 is not 0 then
				set msg to msg & ResolutionsGPU1 & " & "
			else
				set msg to msg & ResolutionsGPU1
			end if
			if ScreensGPU2 is 1 then
				set ResolutionMonitor4 to item 4 of GPU2
				set ResolutionsGPU2 to ResolutionMonitor4
			else if ScreensGPU2 is 2 then
				set ResolutionMonitor4 to item 4 of GPU2
				set ResolutionMonitor5 to item 5 of GPU2
				set ResolutionsGPU2 to ResolutionMonitor4 & " & " & ResolutionMonitor5
			else if ScreensGPU2 is 3 then
				set ResolutionMonitor4 to item 4 of GPU2
				set ResolutionMonitor5 to item 5 of GPU2
				set ResolutionMonitor6 to item 6 of GPU2
				set ResolutionsGPU2 to ResolutionMonitor4 & " & " & ResolutionMonitor5 & " & " & ResolutionMonitor6
			else
				set ResolutionsGPU2 to ""
			end if
			set msg to msg & ResolutionsGPU2
		end if
		set msg to msg & ItemDelimiter
	end if
	
	--Audio
	if ViewAudio then
		set AudioCard to do shell script "kextstat | grep HDA"
		if AudioCard contains "VoodooHDA" then
			set AudioCard to "VoodooHDA"
		else if AudioCard contains "AppleHDA" then
			set AudioCard to "AppleHDA"
		else
			set AudioCard to "Unknown"
		end if
		set msg to msg & FBold & "Audio: " & FBold & AudioCard & ItemDelimiter
	end if
	
	--Power
	if ViewPower then
		try
			--	set PowerInfo to do shell script "cat /Users/xeon3d/reports/dischargingnoestimate.txt| head -n2 | tail -n1 | awk {'print $2,$3,$4'}"
			set PowerInfo to do shell script "pmset -g ps | head -n2 | tail -n1 | awk {'print $2,$3,$4'}"
			set AppleScript's text item delimiters to "; "
			set BatteryCapacity to text item 1 of PowerInfo
			set BatteryStatus to text item 2 of PowerInfo
			if BatteryStatus is "charging" then
				set BatteryCapacity to CGreen & BatteryCapacity & CWhite
			else if BatteryStatus is "discharging" then
				set BatteryCapacity to CRed & BatteryCapacity & CWhite
			else
				set BatteryCapacity to BatteryCapacity
			end if
			set TimeLeft to text item 3 of PowerInfo
			if TimeLeft contains "(no" then
				set TimeLeft to space & "[-:--]"
			else if TimeLeft is "0:00" then
				set TimeLeft to ""
			else
				set TimeLeft to space & "[" & text item 3 of PowerInfo & "]"
			end if
			set msg to msg & FBold & "Power: " & FBold & BatteryCapacity & TimeLeft & ItemDelimiter
		on error
			set msg to msg
		end try
	end if
	
	
	--OS Version
	if ViewOSXVersion then
		set AppleScript's text item delimiters to space
		set OSXInfo to the paragraphs of (do shell script "sw_vers | awk -F\"\\t\" '/BuildVersion:|ProductVersion|ProductName/ {print $2}'")
		set msg to msg & FBold & "OS: " & FBold & "OS X " & item 2 of OSXInfo & " "
		set AppleScript's text item delimiters to ""
		if ViewOSXBuild then
			set OSXBuild to "[" & item 3 of OSXInfo & "] "
			set msg to msg & OSXBuild
		end if
		if ViewOSXArch then
			if (do shell script "uname -m") is "x86_64" then
				set OSXArch to "x64"
			else
				set OSXArch to "i386"
			end if
			set msg to msg & OSXArch
		end if
		set msg to msg & ItemDelimiter
	end if
	
	--Kernel Version
	if ViewKernel then
		set KernelInfo to (do shell script "uname -a | awk {'print $1,$3,$14'} | awk -F':' {'print $1,$2'} | awk -F'/' {'print $1'}")
		set AppleScript's text item delimiters to space
		set KernelVersion to text items 1 thru 2 of KernelInfo as string
		set KernelTag to text item 4 of KernelInfo as string
		set AppleScript's text item delimiters to ""
		set msg to msg & FBold & "Kernel: " & FBold & KernelVersion
		if ViewKernelTag then
			set msg to msg & " (" & KernelTag & ")"
		end if
		set msg to msg & ItemDelimiter
	end if
	
	--Uptime
	if ViewUptime then
		set uptime to do shell script "uptime | awk '{sub(/.*up[ ]+/,\"\",$0) ; sub(/,[ ]+[0-9]+ user.*/,\"\",$0);sub(/,/,\"\",$0) ;print $0}'"
		repeat
			if uptime contains "  " then
				set AppleScript's text item delimiters to "  "
				set temp1 to text item 1 of uptime
				set temp2 to text items 2 thru end of uptime
				set uptime to temp1 & " " & temp2
			else
				exit repeat
			end if
		end repeat
		set msg to msg & FBold & "Up: " & FBold & uptime & ItemDelimiter
	end if
	
	--Client
	if ViewClient then
		set msg to msg & FBold & "Client: " & FBold & ClientName & " " & ClientVersion
		if ViewClientBuild then
			set TextualBuild to do shell script "cat " & TextualPath & "Contents/Info.plist | grep Reference -A 1 | tail -n 1 | awk -F'>' {'print $2'} | awk -F'<' {'print $1'}"
			set msg to msg & " [" & TextualBuild & "]"
		end if
		set msg to msg & ItemDelimiter
	end if
	
	--Script Version
	if ViewScriptVersion then
		set msg to msg & FBold & "Script: " & FBold & scriptname & " " & CurrentVersion & ItemDelimiter
	end if
	
	--Remove last separator
	if HideLastDelimiter is "True" then
		repeat until msg does not end with " "
			set msg to text 1 thru -2 of msg
		end repeat
		repeat until msg does not end with "•"
			set msg to text 1 thru -2 of msg
		end repeat
	end if
	
	set NumberOfChars to count characters of msg
	if NumberOfChars > 450 then
		-- Uses "OS:" as a delimiter.
		set AppleScript's text item delimiters to "OS:"
		-- Divides output into two separate variables
		set msg1 to text item 1 of msg
		set msg2 to FBold & "OS:" & text item 2 of msg
		-- Clear the field delimiter so next command won't be garbled.
		set AppleScript's text item delimiters to ""
		-- Removes last separator from 1st line of output
		set msg1 to characters 1 thru -4 of msg1 as string
		set msg to msg1 & return & msg2
	end if
	
	-- Debug
	--return msg & "[" & (count of characters of msg) & "]"
	
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

on MakeBars(PercentageFull)
	set PercentageLeft to 10 - PercentageFull
	set OutputBar to "[" & my UsedColor
	repeat PercentageFull times
		set OutputBar to OutputBar & "❙"
	end repeat
	set OutputBar to OutputBar & my SeparatorColor & "|" & my FreeColor
	repeat PercentageLeft times
		set OutputBar to OutputBar & "❙"
	end repeat
	set OutputBar to OutputBar & my CWhite & "]"
end MakeBars

on roundThis(n, numDecimals)
	set x to 10 ^ numDecimals
	(((n * x) + 0.5) div 1) / x
end roundThis
