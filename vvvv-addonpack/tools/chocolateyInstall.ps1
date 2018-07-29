$ErrorActionPreference = 'Stop';

# Find if user forces x86 or not and set $toolsDir accordingly
if($PSBoundParameters.ContainsKey('forcex86') || $PSBoundParameters.ContainsKey('x86'))
{
    $toolsDir = Join-Path $env:SystemDrive 'vvvv' 'vvvv_50beta36_x86'
}
else
{
    $toolsDir = Join-Path $env:SystemDrive 'vvvv' 'vvvv_50beta36_x64'
}

$url        = 'https://vvvv.org/sites/all/modules/general/pubdlcnt/pubdlcnt.php?file=https://vvvv.org/sites/default/files/addons_50beta36_x86.zip&nid=1'
$url64      = 'https://vvvv.org/sites/all/modules/general/pubdlcnt/pubdlcnt.php?file=https://vvvv.org/sites/default/files/addons_50beta36_x64.zip&nid=1'

$packageArgs = @{
  packageName   = 'vvvv-addonpack'
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  softwareName  = 'vvvv-addonpack'

  checksum      = 'C2A3948B05B04244BCC031DBFB15DB0359631B635D6179E24C3B75E28121000C'
  checksumType  = 'sha256'
  checksum64    = '7178C1234A8A4C39CD80581C8E01763759F33975BD9DFE1DC74F29F0A270C306'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs