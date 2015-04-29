Return-Path: <s.nawrocki@samsung.com>
Message-id: <554105AC.8060800@samsung.com>
Date: Wed, 29 Apr 2015 18:24:12 +0200
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
MIME-version: 1.0
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Subject: [GIT PULL] clk/samsung fixes for 4.1
Content-type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>


The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-samsung-fixes-4.1

for you to fetch changes up to 6f14d70a32756551a3645efd9508f2bae44e7127:

  clk: exynos5420: Restore GATE_BUS_TOP on suspend (2015-04-29 17:44:59 +0200)

----------------------------------------------------------------
clk/samsung fixes for 4.1

Fixes of clk definitions in recently added clock controller driver for
exynos5433 SoC and enhancements for DVFS, proper system sleep and secure
monitor calls support in this SoC. The exynos5420 patch fixes a serious
system sleep regression introduced in 3.19.

----------------------------------------------------------------
Chanwoo Choi (4):
      clk: Use CONFIG_ARCH_EXYNOS instead of CONFIG_ARCH_EXYNOS5433
      clk: exynos5433: Fix wrong parent clock of sclk_apollo clock
      clk: exynos5433: Fix wrong PMS value of exynos5433_pll_rates
      clk: exynos5433: Add CLK_SET_RATE_PARENT to support DVFS for big.LITTLE core

Hyungwon Hwang (1):
      clk: exynos5433: Add DIV_CPIF to the list of stored registers on suspend

Javier Martinez Canillas (1):
      clk: exynos5420: Restore GATE_BUS_TOP on suspend

Jonghwa Lee (3):
      clk: exynos5433: Fix wrong offset of PCLK_MSCL_SECURE_SMMU_JPEG
      clk: exynos5433: Fix CLK_PCLK_MONOTONIC_CNT clk register assignment
      clk: exynos5433: Add CLK_IGNORE_UNUSED flag to clocks for SMC

Joonyoung Shim (1):
      clk: exynos5433: Add clock flag to support the DVFS of GPU

 drivers/clk/samsung/Makefile         |    2 +-
 drivers/clk/samsung/clk-exynos5420.c |    1 +
 drivers/clk/samsung/clk-exynos5433.c |   93 +++++++++++++++++-----------------
 3 files changed, 48 insertions(+), 48 deletions(-)
