#########
#Powershell code that removes initial CBC installation
#Please enter dereg code where applicable
#########

$startpath = pwd
$oriapp = Get-WmiObject -Class Win32_Product | Select-Object -Property Name | Where-Object{$_.Name -CLike "Carbon Black*"}
$cbapp = Get-WmiObject -Class Win32_Product | Select-Object -Property Name | Where-Object{$_.Name -CLike "Carbon Black*"}
$folder = 'C:\Program Files\Confer\scanner'

if (Test-Path -Path $Folder) {
    write-host "Starting uninstallation"
    Set-Location "\Program Files\Confer"
    .\uninstall.exe /uninstall #<dereg code>
} else {
    write-host "Seems that Carbon Black has been uninstalled"
	Exit
}

DO {
    write-host "Waiting for uninstallation to finish"
    Start-Sleep -Seconds 2
    $cbapp = Get-WmiObject -Class Win32_Product | Select-Object -Property Name | Where-Object{$_.Name -CLike "Carbon Black*"}
} UNTIL ($cbapp -ne $oriapp)

write-host ""
write-host "Uninstall complete"
write-host ""
cd $startpath
