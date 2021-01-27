Write-Output "######### Programas instalados ###############################" >> software.txt

Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table >> software.txt

Write-Output "######### Windows Store ###############################" >> software.txt

Get-AppxPackage | Select-Object Name, PackageFullName |Format-Table -AutoSize >> software.txt

try {
    
    Write-Output "########## Chocolatey Apps ######################################"
    choco list --local-only >> software.txt
    
}
catch {
   Write-Output "Chocolatey no está instalado o se requieren privilegios de administrador"
}

Write-Output "##########Directiorios Comunes######################" >>archivos_programa.txt
dir -Force "C:\Program Files" >> archivos_programa.txt

Write-Output "##### Archivos programa x86 ########3"
dir -Force "C:\Program Files (x86)" >> archivos_programa.txt

Write-Output "######## Lista variables de entorno del usuario ###########" >> envars.txt
Get-ChildItem Env: | Sort Name >> envars.txt

Write-Output "######## Lista de servicios ###########" >> servicios.txt
Get-Service | Format-Table >> servicios.txt