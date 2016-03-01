Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 00/41] Remove CLK_IS_ROOT from drivers/clk
Date: Tue,  1 Mar 2016 10:59:45 -0800
Message-Id: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

There are still some CLK_IS_ROOT users outside of the clk directory,
but this series removes all the CLK_IS_ROOT users in clk-next
as of commit 811a498e5e9a (clk: qcom: Fix pre-divider usage for pixel
RCG, 2016-02-28).

Stephen Boyd (41):
  clk: at91: Remove CLK_IS_ROOT
  clk: bcm: Remove CLK_IS_ROOT
  clk: hisilicon: Remove CLK_IS_ROOT
  clk: imx: Remove CLK_IS_ROOT
  clk: mediatek: Remove CLK_IS_ROOT
  clk: meson: Remove CLK_IS_ROOT
  clk: mmp: Remove CLK_IS_ROOT
  clk: mvebu: Remove CLK_IS_ROOT
  clk: mxs: Remove CLK_IS_ROOT
  clk: nxp: Remove CLK_IS_ROOT
  clk: pxa: Remove CLK_IS_ROOT
  clk: qcom: Remove CLK_IS_ROOT
  clk: samsung: Remove CLK_IS_ROOT
  clk: sirf: Remove CLK_IS_ROOT
  clk: spear: Remove CLK_IS_ROOT
  clk: sunxi: Remove CLK_IS_ROOT
  clk: tegra: Remove CLK_IS_ROOT
  clk: ti: Remove CLK_IS_ROOT
  clk: ux500: Remove CLK_IS_ROOT
  clk: versatile: Remove CLK_IS_ROOT
  clk: x86: Remove CLK_IS_ROOT
  clk: x86: Remove clkdev.h and clk.h includes
  clk: zte: Remove CLK_IS_ROOT
  clk: zynq: Remove CLK_IS_ROOT
  clk: clps711x: Remove CLK_IS_ROOT
  clk: efm32gg: Remove CLK_IS_ROOT
  clk: fixed-rate: Remove CLK_IS_ROOT
  clk: ls1x: Remove CLK_IS_ROOT
  clk: max77{686,802}: Remove CLK_IS_ROOT
  clk: mb86s7x: Remove CLK_IS_ROOT
  clk: nspire: Remove CLK_IS_ROOT
  clk: palmas: Remove CLK_IS_ROOT
  clk: pwm: Remove CLK_IS_ROOT
  clk: qoriq: Remove CLK_IS_ROOT
  clk: rk808: Remove CLK_IS_ROOT
  clk: s2mps11: Remove CLK_IS_ROOT
  clk: scpi: Remove CLK_IS_ROOT
  clk: si5{14,351,70}: Remove CLK_IS_ROOT
  clk: twl6040: Remove CLK_IS_ROOT
  clk: wm831x: Remove CLK_IS_ROOT
  clk: xgene: Remove CLK_IS_ROOT

 drivers/clk/at91/clk-main.c              |  2 +-
 drivers/clk/at91/clk-slow.c              |  2 +-
 drivers/clk/bcm/clk-bcm2835.c            |  9 ++--
 drivers/clk/clk-clps711x.c               | 19 ++++----
 drivers/clk/clk-efm32gg.c                |  2 +-
 drivers/clk/clk-fixed-rate.c             |  3 +-
 drivers/clk/clk-ls1x.c                   |  3 +-
 drivers/clk/clk-max77686.c               |  3 --
 drivers/clk/clk-max77802.c               |  2 -
 drivers/clk/clk-mb86s7x.c                |  4 +-
 drivers/clk/clk-nspire.c                 |  3 +-
 drivers/clk/clk-palmas.c                 |  4 +-
 drivers/clk/clk-pwm.c                    |  2 +-
 drivers/clk/clk-qoriq.c                  |  2 +-
 drivers/clk/clk-rk808.c                  |  1 -
 drivers/clk/clk-s2mps11.c                |  3 --
 drivers/clk/clk-scpi.c                   |  2 +-
 drivers/clk/clk-si514.c                  |  2 +-
 drivers/clk/clk-si5351.c                 |  2 +-
 drivers/clk/clk-si570.c                  |  2 +-
 drivers/clk/clk-twl6040.c                |  1 -
 drivers/clk/clk-wm831x.c                 |  1 -
 drivers/clk/clk-xgene.c                  |  2 +-
 drivers/clk/hisilicon/clk-hi3620.c       | 18 +++----
 drivers/clk/hisilicon/clk-hi6220-stub.c  |  2 +-
 drivers/clk/hisilicon/clk-hi6220.c       | 26 +++++------
 drivers/clk/hisilicon/clk-hip04.c        |  6 +--
 drivers/clk/hisilicon/clk-hix5hd2.c      | 60 ++++++++++++------------
 drivers/clk/imx/clk.h                    |  2 +-
 drivers/clk/mediatek/clk-mtk.c           |  4 +-
 drivers/clk/meson/meson8b-clkc.c         |  6 +--
 drivers/clk/mmp/clk-mmp2.c               | 14 ++----
 drivers/clk/mmp/clk-of-mmp2.c            | 10 ++--
 drivers/clk/mmp/clk-of-pxa168.c          |  8 ++--
 drivers/clk/mmp/clk-of-pxa1928.c         | 12 ++---
 drivers/clk/mmp/clk-of-pxa910.c          |  8 ++--
 drivers/clk/mmp/clk-pxa168.c             |  8 ++--
 drivers/clk/mmp/clk-pxa910.c             |  8 ++--
 drivers/clk/mvebu/common.c               | 11 ++---
 drivers/clk/mvebu/dove-divider.c         |  3 +-
 drivers/clk/mxs/clk.h                    |  2 +-
 drivers/clk/nxp/clk-lpc18xx-cgu.c        |  2 +-
 drivers/clk/pxa/clk-pxa25x.c             |  8 ++--
 drivers/clk/pxa/clk-pxa27x.c             |  6 +--
 drivers/clk/pxa/clk-pxa3xx.c             |  8 ++--
 drivers/clk/qcom/common.c                |  1 -
 drivers/clk/qcom/gcc-ipq806x.c           | 37 ---------------
 drivers/clk/qcom/gcc-msm8660.c           | 32 -------------
 drivers/clk/qcom/gcc-msm8960.c           | 42 -----------------
 drivers/clk/qcom/gcc-msm8974.c           |  1 -
 drivers/clk/qcom/gcc-msm8996.c           |  6 +--
 drivers/clk/qcom/mmcc-msm8960.c          | 35 --------------
 drivers/clk/samsung/clk-exynos4.c        | 12 ++---
 drivers/clk/samsung/clk-exynos4415.c     |  2 +-
 drivers/clk/samsung/clk-exynos5250.c     | 10 ++--
 drivers/clk/samsung/clk-exynos5260.c     | 36 +++++++-------
 drivers/clk/samsung/clk-exynos5420.c     | 12 ++---
 drivers/clk/samsung/clk-exynos5433.c     | 74 ++++++++++++++---------------
 drivers/clk/samsung/clk-exynos5440.c     | 12 ++---
 drivers/clk/samsung/clk-exynos7.c        | 12 ++---
 drivers/clk/samsung/clk-s3c2410.c        |  2 +-
 drivers/clk/samsung/clk-s3c2412.c        |  4 +-
 drivers/clk/samsung/clk-s3c2443.c        |  8 ++--
 drivers/clk/samsung/clk-s3c64xx.c        |  8 ++--
 drivers/clk/samsung/clk-s5pv210.c        | 10 ++--
 drivers/clk/sirf/clk-atlas6.c            |  7 ++-
 drivers/clk/sirf/clk-prima2.c            |  7 ++-
 drivers/clk/spear/spear1310_clock.c      | 21 ++++-----
 drivers/clk/spear/spear1340_clock.c      | 16 +++----
 drivers/clk/spear/spear3xx_clock.c       |  8 ++--
 drivers/clk/spear/spear6xx_clock.c       |  6 +--
 drivers/clk/sunxi/clk-a10-hosc.c         |  3 +-
 drivers/clk/tegra/clk-audio-sync.c       |  2 +-
 drivers/clk/tegra/clk-dfll.c             |  1 -
 drivers/clk/tegra/clk-tegra-fixed.c      |  6 +--
 drivers/clk/tegra/clk-tegra114.c         |  3 +-
 drivers/clk/tegra/clk-tegra20.c          | 10 ++--
 drivers/clk/ti/clk.c                     |  4 +-
 drivers/clk/ux500/abx500-clk.c           |  5 +-
 drivers/clk/ux500/u8500_of_clk.c         | 74 ++++++++++++++---------------
 drivers/clk/ux500/u8540_clk.c            | 80 +++++++++++++++-----------------
 drivers/clk/versatile/clk-icst.c         |  2 +-
 drivers/clk/versatile/clk-impd1.c        |  3 +-
 drivers/clk/versatile/clk-realview.c     |  8 ++--
 drivers/clk/versatile/clk-vexpress-osc.c |  2 +-
 drivers/clk/x86/clk-lpt.c                |  4 +-
 drivers/clk/zte/clk-zx296702.c           |  3 +-
 drivers/clk/zynq/clkc.c                  |  3 +-
 88 files changed, 355 insertions(+), 587 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
