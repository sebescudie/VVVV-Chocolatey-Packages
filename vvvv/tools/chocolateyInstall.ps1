$ErrorActionPreference = 'Stop'; # stop on all errors

$url        = 'https://vvvv.org/sites/all/modules/general/pubdlcnt/pubdlcnt.php?file=https://vvvv.org/sites/default/files/vvvv_50beta37_x86_0.zip&nid=1'
$url64      = 'https://vvvv.org/sites/all/modules/general/pubdlcnt/pubdlcnt.php?file=https://vvvv.org/sites/default/files/vvvv_50beta37_x64_0.zip&nid=1'
$pp         = Get-PackageParameters
$regKey = 'HKLM:\Software\vvvvChocolatey'

# Check if user has passed a custom InstallationPath
if(!$pp.InstallationPath) { $pp.InstallationPath = "$env:SystemDrive\vvvv"}
$toolsDir   = $pp.InstallationPath

# Get correct vvvv folder name based on chosen architecture
if((Get-ProcessorBits 32) -or $env:chocolateyForceX86 -eq $true)
{
  $vvvvFolder = 'vvvv_50beta37_x86'
}
else 
{
  $vvvvFolder = 'vvvv_50beta37_x64'  
}

# Join vvvv's exe path for this installation
$executablePath = [io.path]::combine($toolsDir, $vvvvFolder, 'vvvv.exe')

$packageArgs = @{
  packageName   = 'vvvv37'
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'vvvv'

  checksum      = '3e16c93e406a9fa6205ebec6f56ef38146c7ea6484d390e30b236522344a3843'
  checksumType  = 'sha256'
  checksum64    = '1669bb30880122f648bca7ed8c2bf58d4fe57aaded2ddf23faac29eeac43f7a9'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Silentely start setup.exe
$setupPath = [io.path]::combine($toolsDir, $vvvvFolder, 'setup.exe')
$arg = '/silent'
Start-Process $setupPath $arg