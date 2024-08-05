FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://01-background \
            file://01-logo \
            file://gdm_db \
            file://local_db \
            file://resize2fs_1.47.1 \
            file://somlabs_desktop.jpg \
            file://somlabs_logo.png \
            file://gdm_profile \
            file://user_profile \
           "

fakeroot do_somlabs_utils() {
    install -d ${D}/usr/sbin
    install -m 0755 ${WORKDIR}/resize2fs_1.47.1 ${D}/usr/sbin

    install -d ${D}/usr/share/backgrounds/gnome
    install -m 0644 ${WORKDIR}/somlabs_desktop.jpg ${D}/usr/share/backgrounds/

    install -d ${D}/usr/share/greeter-logos/
    install -m 0644 ${WORKDIR}/somlabs_logo.png ${D}/usr/share/greeter-logos/

    install -d ${D}/etc/dconf/db/
    install -m 0644 ${WORKDIR}/gdm_db ${D}/etc/dconf/db/gdm
    install -m 0644 ${WORKDIR}/local_db ${D}/etc/dconf/db/local

    install -d ${D}/etc/dconf/db/gdm.d/
    install -m 0644 ${WORKDIR}/01-logo ${D}/etc/dconf/db/gdm.d/

    install -d ${D}/etc/dconf/db/local.d/
    install -m 0644 ${WORKDIR}/01-background ${D}/etc/dconf/db/local.d/

    install -d ${D}/etc/dconf/profile/
    install -m 0644 ${WORKDIR}/gdm_profile ${D}/etc/dconf/profile/gdm
    install -m 0644 ${WORKDIR}/user_profile ${D}/etc/dconf/profile/user
}

do_install:append() {
    bb.build.exec_func("do_somlabs_utils", d)
}

