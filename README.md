vvvv chocolatey packages for vvvv_b36
=====================================

_VVVV and addonpack packages for [Chocolatey](https://chocolatey.org/)._

:guardsman: Those packages are still waiting validation from Chocolatey but have been tested in a virtual test env

## Was ist das?

Chocolatey is a package manager for windows, meaning it allows you to install/upgrade/remove applications with a simple command line rather than having to go through numerous GUIs. To install Chocolatey on Windows, check out [this link](https://chocolatey.org/install).

## Usage

After you've installed choco, go to an elevated `cmd` or `Powershell` and simply type

```
choco install vvvv -y
```

This will take care of installing vvvv itself but also its dependencies that you should normally check in `setup.exe`.

If you wanna install the addonpack at the same time, just type

```
choco install vvvv vvvv-addonpack -y
```

The installer defaults to x68, but you can add the `--forcex86` argument to install the 32bits build of vvvv.

For now, everything goes in `C:\vvvv\vvvversion`. A future update will allow you to specify a custom location for your installation.

## What's next

Right now, those packages will install b36, the packages will be updated as fast as possible soon as a new beta is out. I'm affraid I won't have time to also support alphas and rc.

Please don't hesitate to contribute to this repo if you feel you'd like to add anything :)