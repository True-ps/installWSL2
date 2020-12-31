
$kernelUpdateURL = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$kernelUpdateTemp = "c:\KernelUpdateTemp"
$msi = "$($kernelUpdateTemp)\wsl64.msi"
Import-Module BitsTransfer
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
if (Test-Path $kernelUpdateTemp) {
  
    Start-BitsTransfer $kernelUpdateURL $msi

}
else {
    New-Item -ItemType "directory" $kernelUpdateTemp
    Start-BitsTransfer $kernelUpdateURL $msi 
}

Start-Process $msi -ArgumentList /qn

wsl --set-default-version 2


