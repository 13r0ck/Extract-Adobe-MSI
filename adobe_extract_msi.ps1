#Requires -RunAsAdministrator
"`n`n`nThis script must be launched in the same location as the adobe reader file that needs to be extracted.`nIt needs to be the Adobe Distrubution file. It will have a name like AcroRdrDC1901220036_en_US.exe.`nYou must apply to download this file at https://acrobat.adobe.com/us/en/acrobat/pdf-reader/volume-distribution.html .`nOnce you have applied, and been accepted, go to https://get.adobe.com/reader/enterprise/ to download the file.`n`n`n"

"Get-Location" | Out-File get-location.txt
$file = Get-ChildItem get-location.txt
Remove-Item get-location.txt
$location = $file.Directory.FullName

$adobe = Get-ChildItem $location\A*exe

$expression = $adobe.FullName + ' -sfx_o"' + $location + '\adobe_extract" -sfx_ne'
Invoke-Expression $expression