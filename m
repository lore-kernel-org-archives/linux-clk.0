Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.12-rc6
Date: Mon, 19 Jun 2017 16:59:34 -0700
Message-Id: <20170619235934.11483-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 949bdfed4b0f74215da60992e9f5e14c9ecbb064:

  Merge tag 'sunxi-clk-fixes-for-4.12' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes (2017-06-14 16:48:03 -0700)

----------------------------------------------------------------
One build fix for an Amlogic clk driver and a handful of Allwinner clk driver
fixes for some DT bindings and a randconfig build error that all came in this
merge window.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: sunxi-ng: enable SUNXI_CCU_MP for PRCM

Boris Brezillon (1):
      clk: sunxi-ng: sun5i: Fix ahb_bist_clk definition

Chen-Yu Tsai (4):
      clk: sunxi-ng: a31: Correct lcd1-ch1 clock register offset
      dt-bindings: clock: sunxi-ccu: Add pll-periph to PRCM's needed clocks
      clk: sunxi-ng: h3: Export PLL_PERIPH0 clock for the PRCM
      clk: sunxi-ng: a64: Export PLL_PERIPH0 clock for the PRCM

Michael Turquette (1):
      Merge tag 'meson-clk-fixes-for-4.12-rc2' of git://github.com/baylibre/clk-meson into clk-fixes

Stephen Boyd (1):
      Merge tag 'sunxi-clk-fixes-for-4.12' of https://git.kernel.org/.../sunxi/linux into clk-fixes

Tobias Regnery (1):
      clk: meson: gxbb: fix build error without RESET_CONTROLLER

Yong Deng (1):
      clk: sunxi-ng: v3s: Fix usb otg device reset bit

 Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 7 ++++---
 drivers/clk/meson/Kconfig                             | 1 +
 drivers/clk/sunxi-ng/Kconfig                          | 1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h                 | 4 +++-
 drivers/clk/sunxi-ng/ccu-sun5i.c                      | 2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c                  | 2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h                   | 4 +++-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c                  | 2 +-
 include/dt-bindings/clock/sun50i-a64-ccu.h            | 2 ++
 include/dt-bindings/clock/sun8i-h3-ccu.h              | 2 ++
 10 files changed, 19 insertions(+), 8 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
