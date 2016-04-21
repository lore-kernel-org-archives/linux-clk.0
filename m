Return-Path: <w.egorov@phytec.de>
From: Wadim Egorov <w.egorov@phytec.de>
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
Subject: [PATCH v2 0/5] Add support for rk818
Date: Thu, 21 Apr 2016 15:12:34 +0200
Message-Id: <1461244361-45686-1-git-send-email-w.egorov@phytec.de>
List-ID: <linux-clk.vger.kernel.org>

Hopefully, this is the right approach now.

Changes since v1:
- dropped the renaming of the drivers
- renamed the rk808 struct in mfd/rk808.h

Patch 3 is a cosmetic patch for the regulator driver.

Wadim Egorov (7):
  drivers: mfd: rk808: rename rk808 struct to rk8xx
  mfd: RK808: Add RK818 support
  regulator: rk808: Migrate to regulator core's simplified DT parsing
    code
  regulator: rk808: Add regulator driver for RK818
  mfd: dt-bindings: Add RK818 device tree bindings document
  clk: Kconfig: Name RK818 in Kconfig for COMMON_CLK_RK808
  rtc: Kconfig: Name RK818 in Kconfig for RTC_DRV_RK808

 Documentation/devicetree/bindings/mfd/rk808.txt |  37 ++-
 drivers/clk/Kconfig                             |   4 +-
 drivers/clk/clk-rk808.c                         |  20 +-
 drivers/mfd/Kconfig                             |   4 +-
 drivers/mfd/rk808.c                             | 253 +++++++++++---
 drivers/regulator/Kconfig                       |   4 +-
 drivers/regulator/rk808-regulator.c             | 425 +++++++++++++-----------
 drivers/rtc/Kconfig                             |   4 +-
 drivers/rtc/rtc-rk808.c                         |  50 +--
 include/linux/mfd/rk808.h                       | 164 ++++++++-
 10 files changed, 674 insertions(+), 291 deletions(-)

-- 
1.9.1
