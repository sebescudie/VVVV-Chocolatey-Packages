$ErrorActionPreference = 'Stop';

# Check if user has passed a custom InstallationPath
if(!$pp.InstallationPath) { $pp.InstallationPath = "$env:SystemDrive\vvvv"}
$toolsDir   = $pp.InstallationPath

# Get correct vvvv folder name based on chosen architecture
if((Get-ProcessorBits 32) -or $env:chocolateyForceX86 -eq $true)
{
  $vvvvFolder = 'vvvv_50beta36_x86'
}
else 
{
  $vvvvFolder = 'vvvv_50beta36_x64'  
}

$uninstallerPath = [io.path]::combine($toolsDir, $vvvvFolder, 'setup.exe')
$uninstallerAgs = @("/unregister")

# Choco uninstall vvvv perform setup.exe uninstall silentely
Uninstall-ChocolateyPackage -PackageName 'vvvv36' -Path $uninstallerPath -SilentArgs $uninstallerAgs

# Delete the vvvv folder
Remove-Item $toolsDir -Force -Recurse