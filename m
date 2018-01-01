Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: [PATCH v3 00/34] change clk_ops->round_rate to scale past LONG_MAX
Date: Mon,  1 Jan 2018 19:42:39 +0000
Message-Id: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

v3:
- No change. Sending email from outside of my usual geographic location
  Google servers suspended this account mid-way through the send.

  Resending original v2 as v3

v2:
- Added change for vc5_dbl_round_rate
  kbuild found this

- rename patch vc5_mux_round_rate -> vc5_pfd_round_rate
  bod

v1:
Working with a 32 bit MIPS system on a 4.11 kernel its has been noticed
that passing a 2.4GHz clock value to clk_ops->round_rate() is resulting in
an error.

Looking into this a bit it seems its currently possible to pass an unsigned
long with a value larger than LONG_MAX but not possible to return a value
higher than LONG_MAX because the return type is a signed long and that
return type is checked for negative error numbers.

Interestingly inside of clk.c when dealing with clk_ops->round_rate()
return values, error numbers aren't fed up the call chain, so changing the
interpretation of error from <=0 to simply 0 appears to be low-enough
impact.

This series aims to modify clk_ops->round_rate(); such that it will be
possible to return the full range of a ULONG on 32 bit systems when doing
round_rate(). There are various references to doing this in some of the
commits for example the following for clk_round_rate().

commit 4408c26bc37f ("ARM: davinci: clock: return 0 upon error from
clk_round_rate()")

This series has been run through a few compilations and tested it on the
afore mentioned (unreleased MIPS SoC) an i.MX7Solo WaRP7 board, an x86
Quark X1000 with the original error on the MIPS getting fixed - we can now
do a round_rate() on a 2.4 GHz clock and there's no obvious breakage with
the compilations run nor on the other boards tested.

Bryan O'Donoghue (34):
  clk_ops: change round_rate() to return unsigned long
  clk: core: update divider_round_rate functions to return unsigned long
  clk: composite: allow round_rate to scale past LONG_MAX on 32 bit
    systems
  clk: omap2: change omap2_round_to_table_rate return logic
  clk: at91: update clk_pll_get_best_div_mul to return unsigned long
  clk: at91: change clk_pll_get_best_div_mul() return logic
  clk: axs10x: change i2s_pll_round_rate return logic
  clk: bcm2835: change bcm2835_pll_rate_from_divisors to return unsigned
    long
  clk: bcm2835: change clk_get_rate() helper return type
  clk: bcm: iproc: change iproc_asiu_clk_round_rate() return logic
  clk: bcm: iproc: change iproc_pll_round_rate() return logic
  clk: cdce925: remove unnecessary long casts on return
  clk: si514: change si514_round_rate() return logic
  clk: vc5: change vc5_pfd_round_rate() return logic
  clk: vc5: change vc5_dbl_round_rate() return logic
  clk: vt8500: change vtwm_pll_round_rate() return logic
  clk: vt8500: match temp holder variable to fn return type
  clk: mvebu: change dove_round_rate() return logic
  clk: mxs: change clk_frac_round_rate() return logic
  clk: nxp: change lpc18xx_pll0_round_rate() return logic
  clk: lpc32xx: change clk_hclk_pll_round_rate() return logic
  clk: qcom: ipq4019: change clk_cpu_div_round_rate() return logic
  clk: sirf: remove unnecessary long cast on return
  clk: tegra: change clk_sync_source_round_rate() return logic
  clk: tegra: bpmp: change tegra_bpmp_clk_round_rate() return logic
  clk: tegra: pll: change clk_pll_round_rate() return logic
  clk: ti: composite: change clk_pll_round_rate() return logic
  clk: ti: fapll: change round_rate() return logic
  clk: zte: change zx_audio_round_rate() return logic
  clk: axs10x: change axs10x_pll_round_rate return logic
  clk: at91: change round_rate() return logic
  clk: ARC: change hsdk_pll_round_rate () return logic
  clk: lpc32xx: change round_rate() return logic
  clk: change handling of round_rate() such that only zero is an error

 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c    |  8 +++----
 arch/arm/mach-omap2/clock2xxx.h                 |  4 ++--
 arch/arm/mach-vexpress/spc.c                    |  4 ++--
 arch/mips/alchemy/common/clock.c                |  2 +-
 drivers/clk/at91/clk-audio-pll.c                | 14 +++++++-----
 drivers/clk/at91/clk-h32mx.c                    |  5 +++--
 drivers/clk/at91/clk-peripheral.c               |  6 ++---
 drivers/clk/at91/clk-pll.c                      | 29 +++++++++++++------------
 drivers/clk/at91/clk-plldiv.c                   |  5 +++--
 drivers/clk/at91/clk-smd.c                      |  5 +++--
 drivers/clk/at91/clk-usb.c                      |  5 +++--
 drivers/clk/axs10x/i2s_pll_clock.c              |  8 +++----
 drivers/clk/axs10x/pll_clock.c                  |  7 +++---
 drivers/clk/bcm/clk-bcm2835.c                   | 22 ++++++++++---------
 drivers/clk/bcm/clk-iproc-asiu.c                |  7 +++---
 drivers/clk/bcm/clk-iproc-pll.c                 | 12 +++++-----
 drivers/clk/clk-axi-clkgen.c                    |  5 +++--
 drivers/clk/clk-cdce706.c                       | 15 ++++++++-----
 drivers/clk/clk-cdce925.c                       | 21 ++++++++++--------
 drivers/clk/clk-composite.c                     | 13 ++++++-----
 drivers/clk/clk-cs2000-cp.c                     |  4 ++--
 drivers/clk/clk-divider.c                       | 15 ++++++++-----
 drivers/clk/clk-fixed-factor.c                  |  5 +++--
 drivers/clk/clk-fractional-divider.c            |  4 ++--
 drivers/clk/clk-gemini.c                        |  5 +++--
 drivers/clk/clk-highbank.c                      | 10 +++++----
 drivers/clk/clk-hsdk-pll.c                      |  6 ++---
 drivers/clk/clk-multiplier.c                    |  5 +++--
 drivers/clk/clk-scpi.c                          |  8 +++----
 drivers/clk/clk-si514.c                         |  6 ++---
 drivers/clk/clk-si5351.c                        | 15 ++++++++-----
 drivers/clk/clk-si570.c                         |  4 ++--
 drivers/clk/clk-stm32f4.c                       | 15 ++++++++-----
 drivers/clk/clk-u300.c                          |  4 ++--
 drivers/clk/clk-versaclock5.c                   | 22 +++++++++----------
 drivers/clk/clk-vt8500.c                        | 17 ++++++++-------
 drivers/clk/clk-wm831x.c                        |  5 +++--
 drivers/clk/clk-xgene.c                         |  9 ++++----
 drivers/clk/clk.c                               | 15 +++----------
 drivers/clk/h8300/clk-h8s2678.c                 |  4 ++--
 drivers/clk/hisilicon/clk-hi6220-stub.c         |  5 +++--
 drivers/clk/hisilicon/clkdivider-hi6220.c       |  5 +++--
 drivers/clk/imx/clk-busy.c                      |  5 +++--
 drivers/clk/imx/clk-cpu.c                       |  4 ++--
 drivers/clk/imx/clk-fixup-div.c                 |  5 +++--
 drivers/clk/imx/clk-pfd.c                       |  4 ++--
 drivers/clk/imx/clk-pllv2.c                     |  4 ++--
 drivers/clk/imx/clk-pllv3.c                     | 19 +++++++++-------
 drivers/clk/ingenic/cgu.c                       |  4 ++--
 drivers/clk/ingenic/jz4780-cgu.c                |  5 +++--
 drivers/clk/mediatek/clk-pll.c                  |  4 ++--
 drivers/clk/meson/clk-audio-divider.c           |  6 ++---
 drivers/clk/meson/clk-cpu.c                     |  5 +++--
 drivers/clk/meson/clk-pll.c                     |  5 +++--
 drivers/clk/meson/gxbb-aoclk-32k.c              |  5 +++--
 drivers/clk/microchip/clk-core.c                | 12 +++++-----
 drivers/clk/mmp/clk-frac.c                      |  5 +++--
 drivers/clk/mvebu/clk-corediv.c                 |  5 +++--
 drivers/clk/mvebu/clk-cpu.c                     |  5 +++--
 drivers/clk/mvebu/dove-divider.c                |  6 ++---
 drivers/clk/mxs/clk-div.c                       |  4 ++--
 drivers/clk/mxs/clk-frac.c                      |  8 +++----
 drivers/clk/mxs/clk-ref.c                       |  4 ++--
 drivers/clk/nxp/clk-lpc18xx-cgu.c               |  9 ++++----
 drivers/clk/nxp/clk-lpc32xx.c                   | 27 +++++++++++++----------
 drivers/clk/pistachio/clk-pll.c                 |  4 ++--
 drivers/clk/qcom/clk-alpha-pll.c                |  7 +++---
 drivers/clk/qcom/clk-regmap-divider.c           |  4 ++--
 drivers/clk/qcom/clk-rpm.c                      |  4 ++--
 drivers/clk/qcom/clk-smd-rpm.c                  |  5 +++--
 drivers/clk/qcom/gcc-ipq4019.c                  |  7 +++---
 drivers/clk/renesas/clk-div6.c                  |  5 +++--
 drivers/clk/renesas/clk-rcar-gen2.c             |  4 ++--
 drivers/clk/renesas/rcar-gen2-cpg.c             |  4 ++--
 drivers/clk/renesas/rcar-gen3-cpg.c             |  5 +++--
 drivers/clk/rockchip/clk-ddr.c                  |  6 ++---
 drivers/clk/rockchip/clk-pll.c                  |  5 +++--
 drivers/clk/samsung/clk-cpu.c                   |  5 +++--
 drivers/clk/samsung/clk-pll.c                   |  5 +++--
 drivers/clk/sirf/clk-atlas7.c                   |  4 ++--
 drivers/clk/sirf/clk-common.c                   | 14 ++++++------
 drivers/clk/spear/clk-aux-synth.c               |  4 ++--
 drivers/clk/spear/clk-frac-synth.c              |  4 ++--
 drivers/clk/spear/clk-gpt-synth.c               |  4 ++--
 drivers/clk/spear/clk-vco-pll.c                 | 13 ++++++-----
 drivers/clk/spear/clk.c                         |  7 +++---
 drivers/clk/spear/clk.h                         |  7 +++---
 drivers/clk/st/clk-flexgen.c                    |  4 ++--
 drivers/clk/st/clkgen-fsyn.c                    | 10 ++++-----
 drivers/clk/st/clkgen-pll.c                     | 10 +++++----
 drivers/clk/sunxi-ng/ccu_nk.c                   |  4 ++--
 drivers/clk/sunxi-ng/ccu_nkmp.c                 |  4 ++--
 drivers/clk/sunxi-ng/ccu_nm.c                   |  4 ++--
 drivers/clk/tegra/clk-audio-sync.c              |  7 +++---
 drivers/clk/tegra/clk-bpmp.c                    |  7 +++---
 drivers/clk/tegra/clk-divider.c                 |  5 +++--
 drivers/clk/tegra/clk-periph.c                  |  5 +++--
 drivers/clk/tegra/clk-pll.c                     | 15 +++++++------
 drivers/clk/tegra/clk-super.c                   |  4 ++--
 drivers/clk/ti/clk-dra7-atl.c                   |  4 ++--
 drivers/clk/ti/composite.c                      |  7 +++---
 drivers/clk/ti/divider.c                        |  5 +++--
 drivers/clk/ti/fapll.c                          | 15 +++++++------
 drivers/clk/ux500/clk-prcmu.c                   |  4 ++--
 drivers/clk/versatile/clk-icst.c                |  4 ++--
 drivers/clk/versatile/clk-vexpress-osc.c        |  5 +++--
 drivers/clk/zte/clk.c                           | 15 +++++++------
 drivers/clk/zynq/pll.c                          |  4 ++--
 drivers/gpu/drm/imx/imx-tve.c                   |  5 +++--
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c          |  5 +++--
 drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c  |  5 +++--
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c           |  5 +++--
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h           |  5 +++--
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c      |  6 ++---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c |  5 +++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c        |  6 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c        |  4 ++--
 drivers/gpu/drm/msm/mdp/mdp4/mdp4_lvds_pll.c    |  5 +++--
 drivers/gpu/drm/pl111/pl111_display.c           |  5 +++--
 drivers/gpu/drm/sun4i/sun4i_dotclock.c          |  5 +++--
 drivers/media/platform/omap3isp/isp.c           |  4 ++--
 drivers/rtc/rtc-ac100.c                         |  5 +++--
 drivers/rtc/rtc-ds1307.c                        |  5 +++--
 drivers/rtc/rtc-hym8563.c                       |  5 +++--
 drivers/rtc/rtc-m41t80.c                        |  5 +++--
 drivers/rtc/rtc-pcf8563.c                       |  5 +++--
 include/linux/clk-provider.h                    | 23 +++++++++++---------
 127 files changed, 506 insertions(+), 421 deletions(-)

-- 
2.7.4
