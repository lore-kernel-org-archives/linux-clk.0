Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 00/26] Remove struct clk based provider APIs
Date: Fri, 31 Jul 2015 10:03:40 -0700
Message-Id: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This is the beginning of an effort to remove struct clk from
provider drivers. I've split the patches out to be per-SoC
to make review easier, except for the automated conversions
done by Coccinelle. Those go into one patch.

Stephen Boyd (26):
  clk: Add clk_hw_get_num_parents()
  clk: Replace __clk_get_num_parents with clk_hw_get_num_parents()
  clk: Remove __clk_get_num_parents()
  clk: Add clk_hw_get_flags()
  clk: Convert __clk_get_flags() to clk_hw_get_flags()
  clk: Add clk_hw_*() API for use by providers
  clk: ti: Remove CLK_IS_BASIC check
  ARM: OMAP: Convert __clk_get_rate() to provider/consumer APIs
  MIPS: alchemy: Convert to clk_hw based provider APIs
  clk: at91: Convert to clk_hw based provider APIs
  clk: bcm: Convert to clk_hw based provider APIs
  clk: Convert basic types to clk_hw based provider APIs
  clk: mmp: Convert to clk_hw based provider APIs
  clk: mvebu: Convert to clk_hw based provider APIs
  clk: stm32f4: Convert to clk_hw based provider APIs
  clk: qcom: Convert to clk_hw based provider APIs
  clk: rockchip: Convert to clk_hw based provider APIs
  clk: samsung: Convert to clk_hw based provider APIs
  clk: sirf: Convert to clk_hw based provider APIs
  clk: spear: Convert to clk_hw based provider APIs
  clk: sunxi: Convert to clk_hw based provider APIs
  clk: tegra: Convert to clk_hw based provider APIs
  clk: tegra: Convert to clk_hw based provider APIs
  clk: versatile: Convert to clk_hw based provider APIs
  drm/msm/dsi: Convert to clk_hw based provider APIs
  clk: Remove unused provider APIs

 arch/arm/mach-omap2/clkt34xx_dpll3m2.c     |  6 +-
 arch/mips/alchemy/common/clock.c           | 12 ++--
 drivers/clk/at91/clk-peripheral.c          |  6 +-
 drivers/clk/at91/clk-programmable.c        | 10 ++--
 drivers/clk/at91/clk-usb.c                 | 14 ++---
 drivers/clk/bcm/clk-kona.c                 | 20 +++----
 drivers/clk/clk-cdce706.c                  |  2 +-
 drivers/clk/clk-composite.c                | 18 +++---
 drivers/clk/clk-divider.c                  |  8 +--
 drivers/clk/clk-fixed-factor.c             |  5 +-
 drivers/clk/clk-mux.c                      |  2 +-
 drivers/clk/clk-si5351.c                   |  4 +-
 drivers/clk/clk-stm32f4.c                  |  5 +-
 drivers/clk/clk.c                          | 93 +++++++++++++++---------------
 drivers/clk/mmp/clk-gate.c                 |  3 +-
 drivers/clk/mmp/clk-mix.c                  | 43 +++++++-------
 drivers/clk/mvebu/clk-cpu.c                |  6 +-
 drivers/clk/qcom/clk-pll.c                 |  8 +--
 drivers/clk/qcom/clk-rcg.c                 | 23 ++++----
 drivers/clk/qcom/clk-rcg2.c                | 33 +++++------
 drivers/clk/qcom/common.c                  |  2 +-
 drivers/clk/qcom/mmcc-msm8960.c            | 12 ++--
 drivers/clk/rockchip/clk-pll.c             | 18 +++---
 drivers/clk/samsung/clk-cpu.c              |  4 +-
 drivers/clk/samsung/clk-s3c2410-dclk.c     |  2 +-
 drivers/clk/shmobile/clk-div6.c            |  4 +-
 drivers/clk/sirf/clk-common.c              | 12 ++--
 drivers/clk/spear/clk-vco-pll.c            |  2 +-
 drivers/clk/st/clk-flexgen.c               |  2 +-
 drivers/clk/sunxi/clk-factors.c            | 14 ++---
 drivers/clk/sunxi/clk-sun6i-ar100.c        | 10 ++--
 drivers/clk/sunxi/clk-sunxi.c              | 14 ++---
 drivers/clk/tegra/clk-emc.c                | 10 ++--
 drivers/clk/tegra/clk-pll.c                | 10 ++--
 drivers/clk/ti/autoidle.c                  | 14 ++---
 drivers/clk/ti/clk.c                       |  4 +-
 drivers/clk/ti/clkt_dpll.c                 | 11 ++--
 drivers/clk/ti/clock.h                     |  2 +-
 drivers/clk/ti/clockdomain.c               |  4 +-
 drivers/clk/ti/divider.c                   |  8 +--
 drivers/clk/ti/dpll.c                      |  4 +-
 drivers/clk/ti/dpll3xxx.c                  | 33 +++++------
 drivers/clk/ti/dpll44xx.c                  |  4 +-
 drivers/clk/ti/gate.c                      |  6 +-
 drivers/clk/ti/interface.c                 |  2 +-
 drivers/clk/ti/mux.c                       |  2 +-
 drivers/clk/versatile/clk-sp810.c          |  2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c |  4 +-
 include/linux/clk-provider.h               | 15 +++--
 49 files changed, 267 insertions(+), 285 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

