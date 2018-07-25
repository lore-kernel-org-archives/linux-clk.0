Return-Path: <sboyd@kernel.org>
From: sboyd@kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.18-rc6
Date: Wed, 25 Jul 2018 10:08:07 -0700
Message-Id: <20180725170807.12780-1-sboyd@kernel.org>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

From: Stephen Boyd <sboyd@kernel.org>

The following changes since commit 9cc63791fad6d2624878c93f3415da77780e68a7:

  Merge branch 'clk-fix-imx6ul-defs' into clk-fixes (2018-06-29 11:40:29 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 565b9937f44d5ab7956339b6c105c03471ce3243:

  clk: aspeed: Support HPLL strapping on ast2400 (2018-07-11 09:34:25 -0700)

----------------------------------------------------------------
One more round of updates for problems seen this -rc series. Drivers fixes
are:

 - Amlogic Meson audio divider fix and CPU clk critical marking

 - Qualcomm multimedia GDSC marked as 'always on' to keep display working

 - Aspeed fixes for critical clks, resets causing clks to stay disabled, and
   an incorrect HPLL frequency calculation

 - Marvell Armada 3700 cpu clks would undervolt when switching from low
   frequencies to high frequencies because the voltage didn't stabilize in
   time so now we switch to an intermediate frequency

Plus we have a core framework thinko that messed up the debugfs flag
printing logic to make it not very useful.

----------------------------------------------------------------
Benjamin Herrenschmidt (1):
      clk: aspeed: Treat a gate in reset as disabled

Geert Uytterhoeven (1):
      clk: Really show symbolic clock flags in debugfs

Gregory CLEMENT (1):
      clk: mvebu: armada-37xx-periph: Fix switching CPU rate from 300Mhz to 1.2GHz

Jerome Brunet (1):
      clk: meson: audio-divider is one based

Joel Stanley (2):
      clk: aspeed: Mark bclk (PCIe) and dclk (VGA) as critical
      clk: aspeed: Support HPLL strapping on ast2400

Neil Armstrong (1):
      clk: meson-gxbb: set fclk_div2 as CLK_IS_CRITICAL

Stephen Boyd (1):
      Merge tag 'meson-clk-fixes-4.18-1' of https://github.com/BayLibre/clk-meson into clk-fixes

Vinod Koul (1):
      clk: qcom: gcc-msm8996: Disable halt check on UFS tx clock

Vivek Gautam (1):
      clk/mmcc-msm8996: Make mmagic_bimc_gdsc ALWAYS_ON

 drivers/clk/clk-aspeed.c               | 59 +++++++++++++++++++++++++---------
 drivers/clk/clk.c                      |  3 +-
 drivers/clk/meson/clk-audio-divider.c  |  2 +-
 drivers/clk/meson/gxbb.c               |  1 +
 drivers/clk/mvebu/armada-37xx-periph.c | 38 ++++++++++++++++++++++
 drivers/clk/qcom/gcc-msm8996.c         |  1 +
 drivers/clk/qcom/mmcc-msm8996.c        |  1 +
 7 files changed, 87 insertions(+), 18 deletions(-)

-- 
Sent by a computer through tubes
