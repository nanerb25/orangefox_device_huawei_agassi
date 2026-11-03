# Huawei MediaPad T3 10 (agassi)

OrangeFox R10 device configuration for the Qualcomm MSM8937 / Adreno 308 MediaPad T3 10.

## Status

The recovery image built from this tree successfully booted on the connected Huawei MediaPad T3 10 (codename `agassi`, hardware version W09). The supplied firmware identifies itself as L09; the recovery was confirmed working on the attached W09 unit.

## Build

From an OrangeFox R10 source checkout:

```sh
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
. build/envsetup.sh
lunch omni_agassi-eng
mka recoveryimage
```

The local trimmed checkout also needed compatibility defaults for the VTS and BPF packages in `test/vts/Android.bp` and `external/bcc/Android.bp`; those source-checkout adjustments are outside this device tree.

The output files are `out/target/product/agassi/OrangeFox-Unofficial-agassi.img` and `out/target/product/agassi/OrangeFox-Unofficial-agassi.zip`.

## Kernel and DTB

`prebuilt/kernel.gz-dtb` preserves the stock gzip kernel payload with its Qualcomm DTB appended. BoardConfig passes it as one prebuilt kernel image; do not provide a separate DT image.
