# meta-somlabs-desktop

## Introduction

Meta-somlabs-desktop is a layer providing the SoMLabs modules and carrier boards hardware support for NXP Ubuntu PoC system. It has to be used on top of the meta-nxp-desktop:

https://github.com/nxp-imx/meta-nxp-desktop

## System image

This layer should be used in order to build the Ubuntu PoC system image. It adds support for the SoMLabs modules based on iMX8Mmini and iMX8MPlus processors.

## Building the system image

The general description of the building process is described in the meta-nxp-desktop repository README.md file for mickledore 6.1.36-2.1.0- version:

https://github.com/nxp-imx/meta-nxp-desktop/blob/lf-6.1.36-2.1.0-mickledore/README.md

The summary of required steps including the meta-somlabs layer is shown below.

```shell
mkdir imx-yocto-ubuntu
cd imx-yocto-ubuntu
repo init -u https://github.com/SoMLabs/imx-meta-somlabs-desktop -b mickledore -m imx-somlabs-desktop-6.1.36-2.1.0.xml
repo sync
```

System building may be configured for one of the available machine configurations:

* visionsom-8mm-cb-desktop - VisionCB-8M board family with VisionSOM-8Mmini modules
* titansbc-8mmini-desktop - TitanSBC-8Mmini board
* spacesom-8mplus-cb-desktop - SpaceCB-8Mplus board with SpaceSOM-8Mplus module

System building may be started by the following commands:

```shell
DISTRO=imx-desktop-xwayland MACHINE=<SELECTED_MACHINE> source imx-somlabs-desktop-setup-release.sh -b <BUILD_DIRECTORY>
bitbake imx-image-desktop
```

The system image is located in the imx-image-desktop-<SELECTED_MACHINE>.wic.zst file in the tmp/deploy/images/<SELECTED_MACHINE> directory. It should be extracted with the command:

```shell
unzstd somlabs-image-<SELECTED_MACHINE>.wic.zst
```

The instruction for the eMMC memory image installation may be found on the wiki page for corresponding module:

* https://wiki.somlabs.com/index.php/Main_Page
