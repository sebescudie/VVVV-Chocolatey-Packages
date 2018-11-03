$ErrorActionPreference = 'Stop';

# Find if user forces x86 or not and set $toolsDir accordingly
if((Get-ProcessorBits 32) -or $env:chocolateyForceX86 -eq $true)
{
    $toolsDir = Join-Path $env:SystemDrive 'vvvv\vvvv_50beta37_x86'
}
else
{
    $toolsDir = Join-Path $env:SystemDrive 'vvvv\vvvv_50beta37_x64'
}

$url        = 'https://vvvv.org/sites/all/modules/general/pubdlcnt/pubdlcnt.php?file=https://vvvv.org/sites/default/files/addons_50beta37_x86_0.zip&nid=1'
$url64      = 'https://vvvv.org/sites/all/modules/general/pubdlcnt/pubdlcnt.php?file=https://vvvv.org/sites/default/files/addons_50beta37_x64.zip&nid=1'

$packageArgs = @{
  packageName   = 'vvvv-addonpack37.1'
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  softwareName  = 'vvvv-addonpack'

  checksum      = 'dfe590ea243517dc2dbda7591f037431f66336adf8fea395fe9ba2785f099f06'
  checksumType  = 'sha256'
  checksum64    = 'dacb6d09ddf2d2f53bd24ebaa44fd985539b4876865fbc5b77eba5ffbb7b526f'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs