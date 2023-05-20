LIVE_IMAGE="YUKKURI_LINUX_`date +%Y%m%d`"
CHROOT_DIR="config/includes.chroot_after_packages"
RESOURCES="resources"
PACKAGE_LISTS="config/package-lists"

buildconfig:
	# create Live Build config 
	lb config \
	--apt apt \
	--architecture amd64 \
	--distribution bullesye  \
	--parent-distribution bullesye \
	--parent-debian-installer-distribution bullesye \
	--archive-areas "main contrib non-free" \
	--mirror-bootstrap "http://deb.debian.org/debian" \
	--mirror-chroot "http://deb.debian.org/debian" \
	--mirror-binary "http://deb.debian.org/debian" \
	--bootappend-live "boot=live components debug=1" \
	--image-name "${LIVE_IMAGE}"

	echo "copy resource files."
	cp -pr ${RESOURCES}/rootfs/* ${CHROOT_DIR}
	cp -pr ${RESOURCES}/package-lists/* ${PACKAGE_LISTS}
	
bootstrap: buildconfig
	sudo lb bootstrap

chroot: bootstrap
	sudo lb chroot

binary: chroot
	sudo lb binary

build: buildconfig
	sudo lb build

clean:
	sudo lb clean
	rm -rf config local auto 
