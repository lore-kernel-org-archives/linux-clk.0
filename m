Return-Path: <w.egorov@phytec.de>
From: Wadim Egorov <w.egorov@phytec.de>
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
Subject: [PATCH v4 0/7] Add support for rk818
Date: Tue, 26 Apr 2016 16:54:03 +0200
Message-Id: <1461682450-22173-1-git-send-email-w.egorov@phytec.de>
List-ID: <linux-clk.vger.kernel.org>

Hello,

I dropped the patch which renamed the rk808 struct.

The regulator patches are based on top of
commit 4a5ed8c1adc3 ("regulator: rk808: remove unused rk808_reg_ops_ranges")

Changes since v3:
- dropped rename patch
- rebased patch 4: renamed rk8xx struct back to rk808
- File comment description shows now RK808/RK818
- Module descriptions show now RK808/RK818


Wadim Egorov (7):
  regulator: rk808: Add rk808_reg_ops_ranges for LDO3
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
 drivers/mfd/rk808.c                             | 229 +++++++++++---
 drivers/regulator/Kconfig                       |   4 +-
 drivers/regulator/rk808-regulator.c             | 393 ++++++++++++++----------
 drivers/rtc/Kconfig                             |   4 +-
 include/linux/mfd/rk808.h                       | 162 +++++++++-
 8 files changed, 618 insertions(+), 219 deletions(-)

-- 
1.9.1
