# ISOファイル名: YUKKRI_LINUX_YYYYMMDD-amd64-hybrid.iso
LIVE_IMAGE="YUKKURI_LINUX_`date +%Y%m%d`"

RESOURCES="resources"

CHROOT_DIR="config/includes.chroot_after_packages"
PACKAGE_LISTS="config/package-lists"

buildconfig:
# Live Build の config ディレクトリを作成する．
# ベースはbullsye， 
	lb config \
	--apt apt \
	--architecture amd64 \
	--distribution bullesye  \
	--archive-areas "main contrib non-free" \
	--mirror-bootstrap "http://deb.debian.org/debian" \
	--mirror-chroot "http://deb.debian.org/debian" \
	--mirror-binary "http://deb.debian.org/debian" \
	--bootappend-live "boot=live components debug=1" \
	--image-name "${LIVE_IMAGE}"

# rootfsに適用するファイルを config にコピーする
	cp -pr ${RESOURCES}/rootfs/* ${CHROOT_DIR}
# ライブイメージに導入するパッケージのリストを config にコピーする
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
