$ErrorActionPreference = 'Stop'; # stop on all errors

$url        = 'https://vvvv.org/sites/all/modules/general/pubdlcnt/pubdlcnt.php?file=https://vvvv.org/sites/default/files/vvvv_50beta36_x86.zip&nid=1'
$url64      = 'https://vvvv.org/sites/all/modules/general/pubdlcnt/pubdlcnt.php?file=https://vvvv.org/sites/default/files/vvvv_50beta36_x64.zip&nid=1'
$pp         = Get-PackageParameters
$regKey = 'HKLM:\Software\vvvvChocolatey'

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

# Join vvvv's exe path for this installation
$executablePath = [io.path]::combine($toolsDir, $vvvvFolder, 'vvvv.exe')

$packageArgs = @{
  packageName   = 'vvvv36'
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'vvvv'

  checksum      = '54645F17A79B633CB19BFCB246F8825F8DB636232F9B803FED0E8E8BCC54E8F5'
  checksumType  = 'sha256'
  checksum64    = '6FA2A6DF21A0EF1E35A485E732898DBA4E9F413F20300ED046CA84F2A560CFDB'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Silentely start setup.exe
$setupPath = [io.path]::combine($toolsDir, $vvvvFolder, 'setup.exe')
$arg = '/silent'
Start-Process $setupPath $arg