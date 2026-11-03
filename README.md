# Huawei MediaPad T3 10 (agassi)

OrangeFox R10 device configuration for the Qualcomm MSM8937 / Adreno 308 MediaPad T3 10.

## Build

From the OrangeFox R10 source checkout:

```sh
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
. build/envsetup.sh
lunch omni_agassi-eng
mka recoveryimage
```

The final outputs are `out/target/product/agassi/OrangeFox-Unofficial-agassi.img`
and `out/target/product/agassi/OrangeFox-Unofficial-agassi.zip`. This trimmed
source checkout also needs the VTS and BPF fallback defaults in `test/vts/Android.bp`
and `external/bcc/Android.bp`; the OrangeFox manifest omits their original providers.

## Device evidence and variant note

The connected tablet reports codename `agassi`, board platform `msm8937`, hardware version `W09`, Android 7.0 (SDK 24), and an 800 × 1280 panel at density 200. The supplied GPT lists 80 MiB boot and recovery partitions and a 3.47 GiB system partition. ADB reports a 9.65 GB userdata block partition on the attached 16 GB unit; the firmware layout grows userdata to fill the remaining device space.

The supplied `LLD0058_SPF.2.0_2.0.201.1_T37C0215/Maincode` package identifies itself as Android 7.0 and hardware version `L09`. Its `recovery.img` contains the same kernel and DTB binaries already in this device directory. The tree keeps those supplied prebuilt assets, but the connected tablet reports `W09`; confirm recovery boot compatibility for that hardware variant before flashing. The firmware package and attached device do not report Android 7.1.2.

The stock boot image stores the Qualcomm DTB appended to the gzip kernel payload. `prebuilt/kernel.gz-dtb` preserves that exact stock payload; the tree does not pass a separate `--dt` image. The filesystem table includes the distinct `vendor`, `product`, and `cust` partitions from the GPT and keeps data-encryption-footer support enabled for the stock FDE layout.
