Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 00/45] Remove clk.h from clk-provider.h (clk drivers part)
Date: Fri, 10 Jul 2015 16:32:58 -0700
Message-Id: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This is the third set in a series of patches that removes
clk.h from clk-provider.h. This allows us to clearly see what
provider drivers are using the consumer API (clk.h) by
checking the includes. Currently clk.h is included by
clk-provider.h even though it doesn't need to, so quite a few
clk provider drivers are relying on the implicit include.

Stephen Boyd (45):
  clk: axi-clkgen: Remove clk.h include
  clk: cdce706: Include clk.h
  clk: clps711x: Remove clk.h include
  clk: efm32gg: Remove clk.h include
  clk: mux: Remove clk.h include
  clk: nomadik: Remove clk.h and clkdev.h includes
  clk: palmas: Remove clkdev.h includes
  clk: rk808: Remove clk.h include
  clk: si5351: Include clk.h
  clk: twl6040: Remove clk.h include
  clk: u300: Remove clk.h include
  clk: wm831x: Remove clk.h include
  clk: hisilicon: Remove clk.h include
  clk: keystone: Remove clk.h include
  clk: mediatek: Properly include clk.h
  clk: meson8b: Properly include clk.h
  clk: mmp: Remove clk.h include
  clk: mvebu: Remove clk.h include
  clk: mxs: Include clk.h in C files that use it
  clk: nxp: Remove clk.h include
  clk: rockchip: Properly include clk.h
  clk: samsung: Properly include clk.h and clkdev.h
  clk: sirf: Properly include clk.h
  clk: socfpga: Remove clk.h and clkdev.h includes
  clk: socfpga: Remove clk.h include
  clk: tegra: Properly include clk.h
  clk: ux500: Remove clk.h and clkdev.h includes
  clk: versatile: Remove clk.h and clkdev.h includes
  clk: bcm: Include clk.h
  clk: highbank: Include clk.h
  clk: qcom: Include clk.h
  clk: st: Include clk.h
  clk: sunxi: Include clk.h
  clk: ti: Include clk.h
  clk: zynq: Include clk.h
  clk: Include clk.h in clk.c
  clk: cdce925: Include clk.h
  clk: moxart: Include clk.h
  clk: si570: Include clk.h
  clk: ingenic: Include clk.h
  clk: pistachio: Include clk.h
  clk: samsung: s5pv210-audss: Include clk.h
  clk: ti: Switch clk-provider.h include to clk.h
  clk: at91: Include clk.h and slab.h
  clk: Remove clk.h from clk-provider.h

 drivers/clk/at91/clk-slow.c               | 2 ++
 drivers/clk/bcm/clk-kona.c                | 1 +
 drivers/clk/clk-axi-clkgen.c              | 1 -
 drivers/clk/clk-cdce706.c                 | 1 +
 drivers/clk/clk-cdce925.c                 | 1 +
 drivers/clk/clk-clps711x.c                | 1 -
 drivers/clk/clk-efm32gg.c                 | 1 -
 drivers/clk/clk-highbank.c                | 1 +
 drivers/clk/clk-moxart.c                  | 1 +
 drivers/clk/clk-mux.c                     | 1 -
 drivers/clk/clk-nomadik.c                 | 3 +--
 drivers/clk/clk-palmas.c                  | 1 -
 drivers/clk/clk-rk808.c                   | 1 -
 drivers/clk/clk-si5351.c                  | 2 +-
 drivers/clk/clk-si570.c                   | 1 +
 drivers/clk/clk-twl6040.c                 | 1 -
 drivers/clk/clk-u300.c                    | 2 +-
 drivers/clk/clk-wm831x.c                  | 1 -
 drivers/clk/clk.c                         | 1 +
 drivers/clk/hisilicon/clk-hi3620.c        | 2 --
 drivers/clk/hisilicon/clk-hip04.c         | 2 --
 drivers/clk/hisilicon/clk.c               | 3 +--
 drivers/clk/hisilicon/clkgate-separated.c | 2 --
 drivers/clk/ingenic/cgu.c                 | 1 +
 drivers/clk/keystone/gate.c               | 1 -
 drivers/clk/keystone/pll.c                | 1 -
 drivers/clk/mediatek/clk-gate.h           | 3 ++-
 drivers/clk/mediatek/clk-mt8135.c         | 1 +
 drivers/clk/mediatek/clk-mt8173.c         | 1 +
 drivers/clk/mediatek/clk-mtk.h            | 3 ++-
 drivers/clk/meson/clk-cpu.c               | 1 +
 drivers/clk/meson/clkc.c                  | 1 -
 drivers/clk/mmp/clk-apbc.c                | 1 -
 drivers/clk/mmp/clk-apmu.c                | 1 -
 drivers/clk/mmp/clk.c                     | 3 +--
 drivers/clk/mvebu/clk-cpu.c               | 3 ++-
 drivers/clk/mvebu/common.c                | 2 +-
 drivers/clk/mxs/clk-div.c                 | 1 -
 drivers/clk/mxs/clk-frac.c                | 1 -
 drivers/clk/mxs/clk-imx23.c               | 3 +--
 drivers/clk/mxs/clk-imx28.c               | 2 +-
 drivers/clk/mxs/clk-pll.c                 | 1 -
 drivers/clk/mxs/clk-ref.c                 | 1 -
 drivers/clk/mxs/clk.h                     | 3 ++-
 drivers/clk/nxp/clk-lpc18xx-cgu.c         | 1 -
 drivers/clk/pistachio/clk.c               | 1 +
 drivers/clk/qcom/mmcc-msm8960.c           | 1 +
 drivers/clk/rockchip/clk-cpu.c            | 1 +
 drivers/clk/rockchip/clk-mmc-phase.c      | 1 +
 drivers/clk/rockchip/clk-pll.c            | 1 -
 drivers/clk/rockchip/clk-rk3188.c         | 1 +
 drivers/clk/rockchip/clk.h                | 4 ++--
 drivers/clk/samsung/clk-cpu.c             | 3 +++
 drivers/clk/samsung/clk-exynos-audss.c    | 3 ++-
 drivers/clk/samsung/clk-exynos-clkout.c   | 2 +-
 drivers/clk/samsung/clk-exynos3250.c      | 2 --
 drivers/clk/samsung/clk-exynos4.c         | 2 +-
 drivers/clk/samsung/clk-exynos4415.c      | 2 --
 drivers/clk/samsung/clk-exynos5250.c      | 2 --
 drivers/clk/samsung/clk-exynos5260.c      | 2 --
 drivers/clk/samsung/clk-exynos5410.c      | 2 --
 drivers/clk/samsung/clk-exynos5420.c      | 3 +--
 drivers/clk/samsung/clk-exynos5433.c      | 2 --
 drivers/clk/samsung/clk-exynos5440.c      | 2 --
 drivers/clk/samsung/clk-exynos7.c         | 2 --
 drivers/clk/samsung/clk-pll.c             | 2 ++
 drivers/clk/samsung/clk-s3c2410.c         | 2 --
 drivers/clk/samsung/clk-s3c2412.c         | 2 --
 drivers/clk/samsung/clk-s3c2443.c         | 2 --
 drivers/clk/samsung/clk-s3c64xx.c         | 2 --
 drivers/clk/samsung/clk-s5pv210-audss.c   | 2 +-
 drivers/clk/samsung/clk-s5pv210.c         | 2 --
 drivers/clk/samsung/clk.c                 | 4 ++++
 drivers/clk/samsung/clk.h                 | 3 ++-
 drivers/clk/sirf/clk-atlas6.c             | 1 -
 drivers/clk/sirf/clk-common.c             | 2 ++
 drivers/clk/sirf/clk-prima2.c             | 1 -
 drivers/clk/socfpga/clk-gate-a10.c        | 1 +
 drivers/clk/socfpga/clk-gate.c            | 3 +--
 drivers/clk/socfpga/clk-periph-a10.c      | 1 +
 drivers/clk/socfpga/clk-periph.c          | 3 +--
 drivers/clk/socfpga/clk-pll-a10.c         | 1 +
 drivers/clk/socfpga/clk-pll.c             | 3 +--
 drivers/clk/socfpga/clk.h                 | 1 -
 drivers/clk/spear/spear1310_clock.c       | 1 -
 drivers/clk/spear/spear1340_clock.c       | 1 -
 drivers/clk/spear/spear3xx_clock.c        | 1 -
 drivers/clk/spear/spear6xx_clock.c        | 1 -
 drivers/clk/st/clk-flexgen.c              | 1 +
 drivers/clk/st/clkgen-fsyn.c              | 1 +
 drivers/clk/st/clkgen-mux.c               | 1 +
 drivers/clk/st/clkgen-pll.c               | 1 +
 drivers/clk/sunxi/clk-mod0.c              | 3 ++-
 drivers/clk/sunxi/clk-sun8i-mbus.c        | 2 +-
 drivers/clk/sunxi/clk-sun9i-core.c        | 2 +-
 drivers/clk/sunxi/clk-sun9i-mmc.c         | 3 ++-
 drivers/clk/sunxi/clk-sunxi.c             | 2 ++
 drivers/clk/sunxi/clk-usb.c               | 3 ++-
 drivers/clk/tegra/clk-divider.c           | 1 -
 drivers/clk/tegra/clk-periph-gate.c       | 1 -
 drivers/clk/tegra/clk-periph.c            | 1 -
 drivers/clk/tegra/clk-pll-out.c           | 1 -
 drivers/clk/tegra/clk-pll.c               | 2 +-
 drivers/clk/tegra/clk-super.c             | 1 -
 drivers/clk/tegra/clk-tegra-audio.c       | 1 -
 drivers/clk/tegra/clk-tegra-fixed.c       | 1 -
 drivers/clk/tegra/clk-tegra-periph.c      | 1 -
 drivers/clk/tegra/clk-tegra-pmc.c         | 1 -
 drivers/clk/tegra/clk-tegra-super-gen4.c  | 1 -
 drivers/clk/tegra/clk-tegra114.c          | 2 --
 drivers/clk/tegra/clk-tegra124.c          | 1 -
 drivers/clk/tegra/clk-tegra20.c           | 1 -
 drivers/clk/tegra/clk-tegra30.c           | 1 -
 drivers/clk/tegra/clk.c                   | 1 +
 drivers/clk/ti/apll.c                     | 1 +
 drivers/clk/ti/clk-2xxx.c                 | 2 +-
 drivers/clk/ti/clk-33xx.c                 | 1 +
 drivers/clk/ti/clk-3xxx-legacy.c          | 1 +
 drivers/clk/ti/clk-3xxx.c                 | 1 +
 drivers/clk/ti/clk-43xx.c                 | 1 +
 drivers/clk/ti/clk-dra7-atl.c             | 1 +
 drivers/clk/ti/clk.c                      | 1 +
 drivers/clk/ti/clockdomain.c              | 1 +
 drivers/clk/ti/dpll.c                     | 1 +
 drivers/clk/ti/fapll.c                    | 1 +
 drivers/clk/ux500/abx500-clk.c            | 1 -
 drivers/clk/ux500/clk.h                   | 3 ++-
 drivers/clk/ux500/u8500_clk.c             | 1 -
 drivers/clk/ux500/u8500_of_clk.c          | 2 --
 drivers/clk/ux500/u8540_clk.c             | 1 -
 drivers/clk/ux500/u9540_clk.c             | 2 --
 drivers/clk/versatile/clk-icst.c          | 5 +++--
 drivers/clk/versatile/clk-impd1.c         | 1 -
 drivers/clk/versatile/clk-realview.c      | 1 -
 drivers/clk/versatile/clk-sp810.c         | 3 ++-
 drivers/clk/versatile/clk-versatile.c     | 2 --
 drivers/clk/zynq/clkc.c                   | 1 +
 include/linux/clk-provider.h              | 2 +-
 include/linux/clk/tegra.h                 | 3 ++-
 139 files changed, 99 insertions(+), 128 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
