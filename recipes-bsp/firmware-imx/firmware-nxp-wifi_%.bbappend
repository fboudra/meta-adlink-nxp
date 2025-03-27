FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"

SRC_URI:append = " file://sdsd8997_combo_v4.bin"

do_install:append() {
    install -m 0644 ${WORKDIR}/sdsd8997_combo_v4.bin ${D}${nonarch_base_libdir}/firmware/nxp

    rm -f ${D}${nonarch_base_libdir}/firmware/nxp/sd_iw610.bin.se \
        ${D}${nonarch_base_libdir}/firmware/nxp/sduart_iw610.bin.se \
        ${D}${nonarch_base_libdir}/firmware/nxp/uart_iw610_bt.bin.se \
        ${D}${nonarch_base_libdir}/firmware/nxp/uartspi_iw610.bin.se
}

PACKAGES:remove = "${PN}-nxpiw610-sdio"

RDEPENDS:${PN}-all-sdio:remove = "${PN}-nxpiw610-sdio"

FILES:${PN}-nxp-common += " \
    ${nonarch_base_libdir}/firmware/nxp/sdsd8997_combo_v4.bin \
"
