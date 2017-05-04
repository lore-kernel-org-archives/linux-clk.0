Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:43733 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753132AbdEDNu0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 May 2017 09:50:26 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 00/10] Initial Allwinner R40 support
Date: Thu,  4 May 2017 21:49:56 +0800
Message-Id: <20170504135006.16483-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is the first non-RFC version of this patchset, which added basical
support including I2C, UART and MMC to the mainline Linux.

The pinctrl driver of A20 is also merged into the one of A10 before
R40 support is added into the A10 driver.

Chen-Yu Tsai (2):
  ARM: dts: sun8i: Add basic dtsi file for Allwinner R40
  ARM: dts: sun8i: Add board dts file for Banana Pi M2 Ultra

Icenowy Zheng (8):
  arm: sunxi: add support for R40 SoC
  pinctrl: sunxi: add definitions for add A20 and R40 support to A10
    driver
  pinctrl: sunxi: add A20 support to A10 driver
  pinctrl: sunxi: switch A20's pinctrl driver to use the A10 version
  dt-bindings: add compatible string for Allwinner R40 pinctrl
  pinctrl: sunxi: add support of R40 to A10 pinctrl driver
  dt-bindings: add compatible string for Allwinner R40 CCU
  clk: sunxi-ng: support R40 SoC

 Documentation/arm/sunxi/README                     |    4 +
 Documentation/devicetree/bindings/arm/sunxi.txt    |    1 +
 .../devicetree/bindings/clock/sunxi-ccu.txt        |    1 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    1 +
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  161 +++
 arch/arm/boot/dts/sun8i-r40.dtsi                   |  404 +++++++
 arch/arm/mach-sunxi/sunxi.c                        |    1 +
 drivers/clk/sunxi-ng/Kconfig                       |   10 +
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c               | 1153 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-r40.h               |   68 ++
 drivers/pinctrl/sunxi/Kconfig                      |    6 +-
 drivers/pinctrl/sunxi/Makefile                     |    1 -
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c          |  449 ++++++--
 drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c          | 1056 ------------------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |    3 +
 include/dt-bindings/clock/sun8i-r40-ccu.h          |  191 ++++
 include/dt-bindings/reset/sun8i-r40-ccu.h          |  129 +++
 19 files changed, 2495 insertions(+), 1146 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
 create mode 100644 arch/arm/boot/dts/sun8i-r40.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.h
 delete mode 100644 drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
 create mode 100644 include/dt-bindings/clock/sun8i-r40-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-r40-ccu.h

-- 
2.12.2

