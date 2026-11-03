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

## Device configuration

The connected tablet reports codename `agassi`, board platform `msm8937`, hardware
version `W09`, and an 800 × 1280 panel. The supplied firmware package is for
hardware version `L09`; recovery has already booted successfully on the connected
W09 tablet.

The stock recovery ramdisk is embedded in `Maincode/recovery.img`. Its `init.rc`
was extracted and used as a reference for the OrangeFox init and USB setup. The
existing working W09 TWRP image in `twrp-new-agassi.img` uses f2fs for `/data`;
this W09 tree follows that filesystem and exposes the partition only once. The
separate L09 firmware recovery fstab lists ext4, so it is not the filesystem
reference for the attached W09 tablet.

## Decryption and proprietary files

Data decryption is disabled. The recovery tree does not include the QSEE daemon,
QSEE/keymaster/secure-UI libraries, or Qualcomm decryption packages. Encrypted
`/data` cannot be decrypted in this recovery. The dedicated vendor partition is
configured at `/vendor`, matching the tablet GPT and working TWRP ramdisk. The stock boot kernel with its
appended DTB remains at `prebuilt/kernel.gz-dtb`; `BoardConfig.mk` uses this
combined image because Huawei's bootloader expects the DTB appended to the
gzip kernel payload. The unused split `kernel` and `kernel_dtb` copies were removed.

The stock kernel is unchanged. Removing recovery userspace libraries can avoid
QSEE/decryption-related faults, but kernel taint or a kernel panic requires
separate kernel logs to identify its cause.
