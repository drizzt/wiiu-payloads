Nintendo Wii U Static Payload Collection
========================================

Usage
-----

### GitHub hosted

Open http://git.io/wiiuhax on your Wii U.

### Self-Hosting

[Download](https://github.com/drizzt/wiiu-payloads/archive/www.zip) the `www` branch and copy the `wiiu-payloads-www`
on any webserver (only HTML is used, no server-side languages).

Update the payloads
-------------------

### Linux
To update the payloads, copy (overwrite) the new files from loadiine_gx2 and homebrew_launcher and launch:
```
./compile_payloads.sh www/*
```

If you have an error, you need to install `mono` (suggested) or `wine`.

### Windows

#### Easy way
Install [msys2](https://msys2.github.io/) or [Cygwin](https://www.cygwin.com/) and follow the procedure for **Linux**.

#### Hard way
Unpack the new files from [loadiine_gx2](https://github.com/dimok789/loadiine_gx2) and [homebrew_launcher](https://github.com/dimok789/homebrew_launcher) in a directory

Use [bin2mp4](https://gbatemp.net/threads/tool-bin2mp4.417414/) to convert the .bin files to .mp4 by converting the files using the following procedure:

	Target System Version: 540, Open File: code532.bin, Resulting File: payload540.mp4
	Target System Version: 550, Open File: code550.bin, Resulting File: payload550.mp4

Copy all `code*.bin` and `.html` files from the new unpacked directory and resulting `.mp4` files in the related directory:

Files generated for `loadiine_gx2`  goes into `www/loadiine_gx2` and files generated for `homebrew_launcher` goes into `www/launcher` 

Resulting Files **must** be in the same directory as `code*.bin`

Credits
-------

- @Invertex for [bin2mp4](https://gbatemp.net/threads/tool-bin2mp4.417414/)
- @dimok789 for [loadiine_gx2](https://github.com/dimok789/loadiine_gx2) and [homebrew_launcher](https://github.com/dimok789/homebrew_launcher)

Piracy and Copyright
--------------------

The maintainer of this repository does not condone or endorse piracy in any way.
