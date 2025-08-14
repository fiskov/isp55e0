ISP-55e0 - An ISP flashing tool for the WCH CH55x, CH57x and CH32Fx
===================================================================

Fork from https://github.com/frank-zago/isp55e0

Tested with ch571f with UART

- add flag WITH_USB in makefile e.g. `make WITH_USB=0 CC=/path/to/bin/gcc`


Usage
-----

Help:
```
  ./isp55e0 --help

  ISP programmer for some WinChipHead MCUs
  Options:
    --port, -p          use serial port instead of usb
    --code-flash, -f    firmware to flash
    --code-verify, -c   verify existing firwmare
    --data-flash, -k    data to flash
    --data-verify, -l   verify existing data
    --data-dump, -m     dump the data flash to a file
    --debug, -d         turn debug traces on
    --speed, -s         UART speed [115200,230400,460800,500000,921600,1000000,2000000]
    --user-config, -u   User-level Configuration, e.g. 4d
    --write-protection-config, -w Write-Protection Cfg., e.g. ffffffff
    --help, -h          this help
```

Query the device:

>  ./isp55e0

Flash some firmware, which will also read back to verify it:

>  ./isp55e0 --port /dev/ttyS1 -f fw.bin

On flashing iHex files
----------------------

iHex is not supported, but objcopy can be used to convert an iHex file
to a regular raw file:

>  objcopy -I ihex -O binary xxx.hex xxx.bin

Caveats
-------

Setting options is not implemented.
The program will make no attempt to recover from an error and will
just exit.
