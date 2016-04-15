Return-Path: <w.egorov@phytec.de>
From: Wadim Egorov <w.egorov@phytec.de>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-rockchip@lists.infradead.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com, arnd@arndb.de, k.kozlowski@samsung.com, javier@osg.samsung.com, kgene@kernel.org, olof@lixom.net, geert+renesas@glider.be, sjoerd.simons@collabora.co.uk, treding@nvidia.com, public_timo.s@silentcreek.de
Subject: [PATCH 0/6] Add RK818 PMIC support
Date: Fri, 15 Apr 2016 11:16:24 +0200
Message-Id: <1460711790-22646-1-git-send-email-w.egorov@phytec.de>
List-ID: <linux-clk.vger.kernel.org>

Hi,

I just renamed now the RK808 mfd and regulator drivers.

Patch 4 is a cosmetic patch for the regulator driver.

Unfortunately I have no hardware with a RK808 PMIC, so I can not test this part.

Regards,
Wadim


Changes since RFC:
* split up in more patches: renaming + adding new driver
* renamed rk808.c driver -> rk8xx.c
* renamed rk808-regulator.c driver -> rk8xx-regulator.c

Wadim Egorov (6):
  mfd: RK808: Make RK808 generic, rename rk808.c to rk8xx.c
  mfd: RK808: Add RK818 support
  regulator: rk808: Make rk808 generic, rename rk808-regulator.c
  regulator: rk8xx: Migrate to regulator core's simplified DT parsing
    code
  regulator: rk8xx: Add regulator driver for RK818
  mfd: dt-bindings: Add RK818 device tree bindings document

 Documentation/devicetree/bindings/mfd/rk808.txt    |  37 +-
 arch/arm/configs/multi_v7_defconfig                |   4 +-
 drivers/clk/Kconfig                                |   2 +-
 drivers/mfd/Kconfig                                |   6 +-
 drivers/mfd/Makefile                               |   2 +-
 drivers/mfd/rk808.c                                | 276 -------------
 drivers/mfd/rk8xx.c                                | 436 ++++++++++++++++++++
 drivers/regulator/Kconfig                          |   6 +-
 drivers/regulator/Makefile                         |   2 +-
 .../{rk808-regulator.c => rk8xx-regulator.c}       | 451 ++++++++++++---------
 drivers/rtc/Kconfig                                |   2 +-
 include/linux/mfd/rk808.h                          | 183 ++++++++-
 12 files changed, 906 insertions(+), 501 deletions(-)
 delete mode 100644 drivers/mfd/rk808.c
 create mode 100644 drivers/mfd/rk8xx.c
 rename drivers/regulator/{rk808-regulator.c => rk8xx-regulator.c} (57%)

-- 
1.9.1
