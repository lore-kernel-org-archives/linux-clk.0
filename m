Return-Path: <sboyd@codeaurora.org>
Date: Fri, 19 Feb 2016 15:51:58 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.5-rc4
Message-ID: <20160219235158.GT4847@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 4462b4bbfc33a44f19710ead784ff361bda2c3b3:

  clk: gpio: Really allow an optional clock= DT property (2016-02-18 19:10:22 -0800)

----------------------------------------------------------------
An assortment of vendor specific clk drivers fixes, most notably
fallout from adding Tegra210 and rockchip rk3036/rk3368 drivers
this cycle. There's also the random smattering of sparse/checker
fixes, a build "fix" to get the Tango clk driver to compile
because the Kconfig symbol was renamed after the fact, and a clk
gpio fix for a patch mismerge.

----------------------------------------------------------------
Amitoj Kaur Chawla (1):
      clk: tegra: Add missing of_node_put()

Andrew Bresticker (1):
      clk: tegra: pll: Fix potential sleeping-while-atomic

Axel Lin (1):
      clk: scpi: Fix checking return value of platform_device_register_simple()

Jianqun xu (1):
      clk: rockchip: rk3368: fix some clock gates

Jon Hunter (7):
      clk: tegra: Add the APB2APE audio clock on Tegra210
      clk: tegra: Fix clock sources for Tegra210 EMC
      clk: tegra: Fix warning caused by pll_u failing to lock
      clk: tegra: Use definition for pll_u override bit
      clk: tegra: Fix sparse warning for pll_m
      clk: tegra: Fix sparse warnings for functions not declared as static
      clk: tegra: super: Fix sparse warnings for functions not declared as static

Linus Walleij (1):
      clk: versatile: mask VCO bits before writing

Marc Gonzalez (1):
      clk: tango4: rename ARCH_TANGOX to ARCH_TANGO

Mark Kuo (2):
      clk: tegra: Do not disable PLLE when under hardware control
      clk: tegra: Fix PLLE SS coefficients

Rhyland Klein (6):
      clk: tegra: Fix divider on VI_I2C
      clk: tegra: Remove improper flags for lock_enable
      clk: tegra: Fix naming of MISC registers
      clk: tegra: Fix the misnaming of nvenc from msenc
      clk: tegra: Fix pllx dyn step calculation
      clk: tegra: Fix typos around clearing PLLE bits during enable

Stephen Boyd (5):
      clk: mvebu: Mark ioremapped memory as __iomem
      Merge tag 'v4.5-rockchip-clkfixes1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-fixes
      Merge tag 'tegra-for-4.5-clk-fixes' of git://git.kernel.org/.../tegra/linux into clk-fixes
      Revert "clk: qcom: Specify LE device endianness"
      clk: gpio: Really allow an optional clock= DT property

Xing Zheng (4):
      clk: rockchip: rk3036: fix the FLAGs for clock mux
      clk: rockchip: rk3036: fix uarts clock error
      clk: rockchip: rk3036: fix the div offset for emac clock
      clk: rockchip: rk3036: rename emac ext source clock

 .../bindings/clock/rockchip,rk3036-cru.txt         |   2 +-
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/clk-gpio.c                             |   2 +-
 drivers/clk/clk-scpi.c                             |   2 +-
 drivers/clk/mvebu/dove-divider.c                   |   2 +-
 drivers/clk/qcom/gcc-apq8084.c                     |   1 -
 drivers/clk/qcom/gcc-ipq806x.c                     |   1 -
 drivers/clk/qcom/gcc-msm8660.c                     |   1 -
 drivers/clk/qcom/gcc-msm8916.c                     |   1 -
 drivers/clk/qcom/gcc-msm8960.c                     |   2 -
 drivers/clk/qcom/gcc-msm8974.c                     |   1 -
 drivers/clk/qcom/lcc-ipq806x.c                     |   1 -
 drivers/clk/qcom/lcc-msm8960.c                     |   1 -
 drivers/clk/qcom/mmcc-apq8084.c                    |   1 -
 drivers/clk/qcom/mmcc-msm8960.c                    |   2 -
 drivers/clk/qcom/mmcc-msm8974.c                    |   1 -
 drivers/clk/rockchip/clk-rk3036.c                  |  26 ++--
 drivers/clk/rockchip/clk-rk3368.c                  |  26 ++--
 drivers/clk/tegra/clk-emc.c                        |   6 +-
 drivers/clk/tegra/clk-id.h                         |   1 +
 drivers/clk/tegra/clk-pll.c                        |  50 +++++---
 drivers/clk/tegra/clk-tegra-periph.c               |   5 +-
 drivers/clk/tegra/clk-tegra-super-gen4.c           |   6 +-
 drivers/clk/tegra/clk-tegra210.c                   | 132 ++++++++++-----------
 drivers/clk/versatile/clk-icst.c                   |   3 +
 include/dt-bindings/clock/tegra210-car.h           |   2 +-
 26 files changed, 138 insertions(+), 142 deletions(-)
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
