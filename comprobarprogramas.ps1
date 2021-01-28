Write-Output "######### Programas instalados ###############################" >> evidencias\software.txt

Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize >> software.txt

Write-Output "######### Windows Store ###############################" >> evidencias\software.txt

Get-AppxPackage | Select-Object Name, PackageFullName |Format-Table -AutoSize >> evidencias\software.txt

try {
    
    Write-Output "########## Chocolatey Apps ######################################"
    choco list --local-only >> evidencias\software.txt
    
}
catch {
   Write-Output "Chocolatey no está instalado o se requieren privilegios de administrador"
}

Write-Output "##########Directiorios Comunes######################" >> evidencias\archivos_programa.txt
dir -Force "C:\Program Files" >> evidencias\archivos_programa.txt

Write-Output "##### Archivos programa x86 ########3"
dir -Force "C:\Program Files (x86)" >> evidencias\archivos_programa.txt

dir -Force "C:\Users\$Env:USERNAME\AppData\Local" >> evidencias\archivos_programa.txt


Write-Output "######## Lista variables de entorno del usuario ###########" >> evidencias\envars.txt
Get-ChildItem Env: | Sort Name >> envars.txt

Write-Output "######## Lista de servicios ###########" >> evidencias\servicios.txt
Get-Service | Format-Table >> evidencias\servicios.txt

Write-Output "################ Lista de procesos en ejecución ###############" >> evidencias\listaprocesos.txt

Get-Process | Format-Table  >> evidencias\listaprocesos.txt