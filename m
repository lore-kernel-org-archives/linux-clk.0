Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org
To: torvalds@linux-foundation.org
Message-ID: <20150520032454.9817.49687@quantum>
Subject: [GIT PULL] clk: fixes for 4.1
Date: Tue, 19 May 2015 20:24:54 -0700
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixe=
s-for-linus

for you to fetch changes up to 0cd3be6e9a46f84ef7a42e1a5645d32ad547b12e:

  clk: si5351: Do not pass struct clk in platform_data (2015-05-08 11:22:30=
 -0700)

----------------------------------------------------------------
The first set of clk fixes for 4.1 are all driver bugs, with the
exception of a single locking fix in the core code. All driver fixes are
for code that was merged recently. The Samsung stuff is mostly fixes
around suspend/resume, the Qualcomm fixes are for invalid hardware
configuration data and the Silicon Labs patches are fixes following
their move away from platform_data to Device Tree.

----------------------------------------------------------------
Chanwoo Choi (3):
      clk: Use CONFIG_ARCH_EXYNOS instead of CONFIG_ARCH_EXYNOS5433
      clk: exynos5433: Fix wrong parent clock of sclk_apollo clock
      clk: exynos5433: Fix wrong PMS value of exynos5433_pll_rates

Dong Aisheng (1):
      clk: add missing lock when call clk_core_enable in clk_set_parent

Georgi Djakov (2):
      clk: qcom: Fix MSM8916 venus divider value
      clk: qcom: Fix MSM8916 gfx3d_clk_src configuration

Javier Martinez Canillas (1):
      clk: exynos5420: Restore GATE_BUS_TOP on suspend

Jonghwa Lee (2):
      clk: exynos5433: Fix wrong offset of PCLK_MSCL_SECURE_SMMU_JPEG
      clk: exynos5433: Fix CLK_PCLK_MONOTONIC_CNT clk register assignment

Michael Turquette (1):
      Merge tag 'clk-samsung-fixes-4.1-2' of git://linuxtv.org/snawrocki/sa=
msung into clk-fixes

Sebastian Hesselbarth (2):
      clk: si5351: Mention clock-names in the binding documentation
      clk: si5351: Do not pass struct clk in platform_data

 .../devicetree/bindings/clock/silabs,si5351.txt    |  4 +-
 drivers/clk/clk-si5351.c                           | 63 +++++++++++++++---=
----
 drivers/clk/clk.c                                  |  8 +++
 drivers/clk/qcom/gcc-msm8916.c                     |  4 +-
 drivers/clk/samsung/Makefile                       |  2 +-
 drivers/clk/samsung/clk-exynos5420.c               |  1 +
 drivers/clk/samsung/clk-exynos5433.c               | 12 ++---
 include/linux/platform_data/si5351.h               |  4 --
 8 files changed, 66 insertions(+), 32 deletions(-)
