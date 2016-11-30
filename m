Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.9-rc7
Date: Wed, 30 Nov 2016 13:52:26 -0800
Message-Id: <20161130215226.5570-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit ac95330b96376550ae7a533d1396272d675adfa2:

  clk: sunxi: Fix M factor computation for APB1 (2016-11-04 08:49:46 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to b7d79eb4615e3eb5947355f7b4354818cba037f7:

  clk: bcm: Fix unmet Kconfig dependencies for CLK_BCM_63XX (2016-11-23 14:31:11 -0800)

----------------------------------------------------------------
Two small fixes for MIPI PLLs on sunxi devices and a build fix
for a Broadcom clk driver having unmet dependencies.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: sun6i-a31: Enable PLL-MIPI LDOs when ungating it

Florian Fainelli (1):
      clk: bcm: Fix unmet Kconfig dependencies for CLK_BCM_63XX

Icenowy Zheng (1):
      clk: sunxi-ng: enable so-said LDOs for A33 SoC's pll-mipi clock

 drivers/clk/bcm/Kconfig              | 2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c | 2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
