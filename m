Return-Path: <w.egorov@phytec.de>
From: Wadim Egorov <w.egorov@phytec.de>
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
Subject: [PATCH v5 0/6] Add support for rk818
Date: Tue, 10 May 2016 15:18:54 +0200
Message-Id: <1462886340-7893-1-git-send-email-w.egorov@phytec.de>
List-ID: <linux-clk.vger.kernel.org>

Hello,

patches are based on top of

commit d5623161accb ("mfd: rk808: Use devm_mfd_add_devices() for mfd_device registration")

in linux-next.

Changes since v4:
- Added Acked-by from Mark Brown in patch 1
- Dropped a patch from this series which was applied by Mark Brown
  commit 129d7cf98f5c ("regulator: rk808: Add rk808_reg_ops_ranges for LDO3")

Wadim Egorov (6):
  regulator: rk808: Migrate to regulator core's simplified DT parsing
    code
  mfd: RK808: Add RK818 support
  regulator: rk808: Add regulator driver for RK818
  mfd: dt-bindings: Add RK818 device tree bindings document
  clk: Kconfig: Name RK818 in Kconfig for COMMON_CLK_RK808
  rtc: Kconfig: Name RK818 in Kconfig for RTC_DRV_RK808

 Documentation/devicetree/bindings/mfd/rk808.txt |  37 ++-
 drivers/clk/Kconfig                             |   4 +-
 drivers/mfd/Kconfig                             |   4 +-
 drivers/mfd/rk808.c                             | 231 ++++++++++++---
 drivers/regulator/Kconfig                       |   4 +-
 drivers/regulator/rk808-regulator.c             | 363 +++++++++++++-----------
 drivers/rtc/Kconfig                             |   4 +-
 include/linux/mfd/rk808.h                       | 162 ++++++++++-
 8 files changed, 590 insertions(+), 219 deletions(-)

-- 
1.9.1
