#!/bin/sh

case $(uname -o) in
Msys|Cygwin)
	bin2mp4="./bin2mp4.exe"
	;;
*)
	if command -v mono >/dev/null; then
		bin2mp4="mono bin2mp4.exe"
	elif command -v wine >/dev/null; then
		bin2mp4="wine bin2mp4.exe"
	else
		echo "You need to install mono or wine." >&2
		exit 1
	fi
	;;
esac

for dir; do
	[ -d "$dir" ] || continue
	# 551 is the same as 550
	for ver in 532 540 550; do
		[ "$ver" = "540" -a ! -f "code$ver.bin" ] && filever=532 || filever=$ver
		$bin2mp4 "$ver" "$dir/code$filever.bin" "$dir/payload$ver.mp4"
	done
	sed  -i 's/"payload\.php?sysver=\([0-9]*\)"/"payload\1.mp4"/' "$dir/index.html"
	rm -f "$dir"/*.php "$dir"/wiiuhaxx_loader.bin
done
