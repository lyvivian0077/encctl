help:
	@echo To install programs:
	@echo
	@echo \	${MAKE} install
	@echo
	@echo To reload udev rules:
	@echo
	@echo \	${MAKE} reload
	@echo

install:
	install -m 755 encctl /usr/local/bin
	install -m 755 vdev_id_auto /etc/udev
	install -m 644 69-vdev-auto.rules /etc/udev/rules.d
	if [ -d /etc/systemd/system ]; then install -m 644 zfs-multipath-detect.service /etc/systemd/system; systemctl enable zfs-multipath-detect.service; fi

reload:
	udevadm trigger