Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v4.17-rc1
Date: Fri, 16 Mar 2018 15:21:39 +0100
Message-Id: <20180316142139.5347-1-thierry.reding@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Michael, Stephen,

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.17-clk

for you to fetch changes up to c35b518f9ba06c9de79fb3ff62eed7462d804995:

  clk: tegra: Fix pll_u rate configuration (2018-03-12 13:59:06 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Updates for v4.17-rc1

This contains preliminary work for the MBIST workaround implemented in
the Tegra PMC driver. There's also some fixes to various clocks for bugs
that went unnoticed for a long time.

----------------------------------------------------------------
Dmitry Osipenko (3):
      clk: tegra: Mark HCLK, SCLK and EMC as critical
      clk: tegra20: Correct PLL_C_OUT1 setup
      clk: tegra: Specify VDE clock rate

Marcel Ziswiler (1):
      clk: tegra: Fix pll_u rate configuration

Peter De Schrijver (3):
      clk: tegra: Add la clock for Tegra210
      clk: tegra: add fence_delay for clock registers
      clk: tegra: MBIST work around for Tegra210

 drivers/clk/tegra/clk-emc.c              |   2 +-
 drivers/clk/tegra/clk-pll.c              |   2 +
 drivers/clk/tegra/clk-tegra-periph.c     |   2 +-
 drivers/clk/tegra/clk-tegra-super-gen4.c |   8 +-
 drivers/clk/tegra/clk-tegra114.c         |   4 +-
 drivers/clk/tegra/clk-tegra124.c         |   9 +-
 drivers/clk/tegra/clk-tegra20.c          |  24 +-
 drivers/clk/tegra/clk-tegra210.c         | 361 ++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk-tegra30.c          |  15 +-
 drivers/clk/tegra/clk.h                  |   7 +
 include/dt-bindings/clock/tegra210-car.h |   2 +-
 include/linux/clk/tegra.h                |   1 +
 12 files changed, 397 insertions(+), 40 deletions(-)
