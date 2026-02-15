Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7984217736;
	Sun, 15 Feb 2026 01:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771120408; cv=none; b=CC2lAgvRySAGIx5KalGOosWQz4G9yONdK3sQy6jYOc0weOrYolUwLh/cLC1XTs727WMNtwR8iOImEY1WUjMju1dcOVrmgR9punHQCyWDv65U3K4cW4fCPi9Ave/TYrJQmi1bBg4JHRJyqJ1DV24Ixs/Wnx4XlvzAzqDDsqvIt+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771120408; c=relaxed/simple;
	bh=ImnwUIDFxGcO3VzJftV0cIHBEvxZco+0n7SWqfwcm1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QeCMtcjz9EBbLum2kwPQ1PNM7tqWDjcRjXjtkhD99AUF9wuC1ywOjdMamSa/j+y/aXXspzsHLyKEDQPaoh4rYUcvoy2Miw+4fuBb3K1vawCZZsjzKbNsrOiqdLIN+vpX9JUgVxPOLn0zz16eZ0hdVs3IFAhdO5GHnkVfHboVKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kc4Zgoj4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kc4Zgoj4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9ECC16AAE;
	Sun, 15 Feb 2026 01:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771120408;
	bh=ImnwUIDFxGcO3VzJftV0cIHBEvxZco+0n7SWqfwcm1A=;
	h=From:To:Cc:Subject:Date:From;
	b=Kc4Zgoj4uKeh1A9kxS/GT2ReTckqu749AoA8bsTVBERhCFYP4d8Oml3HhB8RpyC10
	 SAsvilpleXycxW6nlXCfhl8NTMZZ+ZPwN0wZrTguvf8fDUWayaHa/QT1cFv5pQHm/T
	 JIDldZenKpOResrLBM44lNEc3PuIoRPfSAvljOImWVVkOiFtvYcRcpTMiS9SWY3yiw
	 qONwp317Z1vOSmQAG3d9jliVl7HvRMOMRkHPjpsoQuXuRBSUS1flOpqpj789GRT65X
	 /fQAwH5XcIibfxNkgPAUdw5roxYVWUKw28wTtaLfFVzs5k2CTInuL71YzWpiQIQMUU
	 pDlbN6IjJIBNA==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for the merge window
Date: Sat, 14 Feb 2026 17:53:24 -0800
Message-ID: <20260215015325.34211-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 52300cd894b3167d6206e266e341a089e87124b9:

  dt-bindings: clock: google,gs101-clock: Add DPU clock management unit (2026-01-17 20:29:38 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 5921ae27ea7b0e8cda621f8951ca79b34c36ce49:

  Merge branches 'clk-aspeed' and 'clk-qcom' into clk-next (2026-02-14 10:23:59 -0800)

----------------------------------------------------------------
Not much changed in the clk framework this time except the clk.h consumer API
moved the context saving APIs around to fix a build error in certain
configurations. There was a change to the core framework for
CLK_OPS_PARENT_ENABLE behavior during registration, but it wrecked existing
drivers that didn't expect things to be turned off during clk registration so
it got reverted.

This cycle is really a large collection of new clk drivers, primarily for
Qualcomm SoCs but also for Amlogic, SpacemiT, Google, and Aspeed. Another big
change in here is support for automatic hardware clock gating on Samsung SoCs
where the clks turn on and off when needed. Ideally more vendors move to this
method for better power savings. The highlights are in the updates section
below.

Beyond all the new drivers we have a bunch of cleanups like converting drivers
from divider_round_rate() to divider_determine_rate() and using scoped for each
OF child loops. Otherwise it's the usual data fixes and plugging reference
leaks, etc. that's all pretty ordinary but not critical enough to fix until the
next release.

New Drivers:
 - Qualcomm Kaanapali global, tcsr, rpmh, display, gpu, camera, and video clk
   controllers
 - Qualcomm SM8750 camera clk controllers
 - Qualcomm MSM8940 and SDM439 global clk controllers
 - Google GS101 Display Process Unit (DPU) clk controllers
 - SpacemiT K3 clk controllers
 - Amlogic t7 clk controllers
 - Aspeed AST2700 clk controllers

Updates:
 - Convert clock dividers from round_rate() to determine_rate()
 - Fix sparse warnings, kernel-doc warnings, and plug leaked OF refs
 - Automatic hardware clk gating on Google GS101 SoCs
 - Amlogic s4 video clks
 - CAN-FD clks and resets on Renesas RZ/T2H, RZ/N2H, RZ/V2H, and RZ/V2N
 - Expanded Serial Peripheral Interface (xSPI) clocks and resets on Renesas
   RZ/T21H and RZ/N2H
 - DMAC, interrupt controller (ICU), SPI, and thermal (TSU) clocks and resets
   on Renesas RZ/V2N
 - More serial (RSCI) clocks and resets on Renesas RZ/V2H and RZ/V2N
 - CPU frequency scaling on T-HEAD TH1520

----------------------------------------------------------------
André Draszik (2):
      clk: samsung: avoid warning message on legacy Exynos (auto clock gating)
      clk: samsung: fix sysreg save/restore when PM is enabled for CMU

AngeloGioacchino Del Regno (1):
      dt-bindings: clock: mediatek,mt7622-pciesys: Remove syscon compatible

Barnabás Czémán (5):
      clk: qcom: gcc-msm8917: Add missing MDSS reset
      dt-bindings: clock: qcom: Add MSM8940 Global Clock Controller
      dt-bindings: clock: qcom: Add SDM439 Global Clock Controller
      clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from cpp_gdsc
      clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from cpp_gdsc

Bartosz Golaszewski (1):
      clk: mediatek: don't select clk-mt8192 for all ARM64 builds

Biju Das (2):
      clk: renesas: rzg2l: Deassert reset on assert timeout
      clk: renesas: rzv2h: Deassert reset on assert timeout

Bjorn Andersson (4):
      Merge branch '20251117-mdss-resets-msm8917-msm8937-v2-1-a7e9bbdaac96@mainlining.org' into clk-for-6.20
      Merge branch '20260103-ufs_symbol_clk-v2-1-51828cc76236@oss.qualcomm.com' into clk-for-6.20
      Merge branch '20251202-sm8750_camcc-v1-2-b3f7ef6723f1@oss.qualcomm.com' into clk-for-6.20
      Merge branch '20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com' into clk-for-6.20

Brian Masney (26):
      clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
      clk: microchip: core: remove duplicate determine_rate on pic32_sclk_ops
      clk: microchip: core: correct return value on *_get_parent()
      clk: microchip: core: remove unused include asm/traps.h
      clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: sophgo: cv18xx-ip: convert from divider_round_rate() to divider_determine_rate()
      clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()
      clk: actions: owl-composite: convert from owl_divider_helper_round_rate() to divider_determine_rate()
      clk: actions: owl-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: bm1880: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: bm1880: convert from divider_round_rate() to divider_determine_rate()
      clk: hisilicon: clkdivider-hi6220: convert from divider_round_rate() to divider_determine_rate()
      clk: loongson1: convert from divider_round_rate() to divider_determine_rate()
      clk: milbeaut: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()
      clk: nuvoton: ma35d1-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: nxp: lpc32xx: convert from divider_round_rate() to divider_determine_rate()
      clk: sophgo: sg2042-clkgen: convert from divider_round_rate() to divider_determine_rate()
      clk: sprd: div: convert from divider_round_rate() to divider_determine_rate()
      clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: stm32: stm32-core: convert from divider_round_rate_parent() to divider_determine_rate()
      clk: versaclock3: convert from divider_round_rate() to divider_determine_rate()
      clk: x86: cgu: convert from divider_round_rate() to divider_determine_rate()
      clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate()
      rtc: ac100: convert from divider_round_rate() to divider_determine_rate()

Chris Brandt (3):
      clk: renesas: rzg2l: Fix intin variable size
      clk: renesas: rzg2l: Select correct div round macro
      clk: renesas: rzg2l: Remove DSI clock rate restrictions

Chuan Liu (3):
      dt-bindings: clock: add video clock indices for Amlogic S4 SoC
      clk: amlogic: add video-related clocks for S4 SoC
      clk: amlogic: remove potentially unsafe flags from S4 video clocks

Conor Dooley (1):
      clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE

Cosmin Tanislav (2):
      clk: renesas: cpg-mssr: Simplify pointer math in cpg_rzt2h_mstp_read()
      clk: renesas: cpg-mssr: Handle RZ/T2H register layout in PM callbacks

Daniil Titov (2):
      clk: qcom: gcc: Add support for Global Clock controller found on MSM8940
      clk: qcom: gcc: Add support for Global Clock controller found on SDM439

David Heidelberg (1):
      clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk1_clk_src

Dmitry Baryshkov (1):
      clk: qcom: gfx3d: add parent to parent request map

Geert Uytterhoeven (7):
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag5' into renesas-clk-for-v6.20
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag6' into renesas-clk-for-v6.20
      clk: Move clk_{save,restore}_context() to COMMON_CLK section
      clk: Merge prepare and unprepare sections
      clk: Annotate #else and #endif
      clk: renesas: Add missing log message terminators
      clk: rs9: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

George Moussalem (1):
      clk: qcom: gcc-ipq5018: flag sleep clock as critical

Haotian Zhang (1):
      clk: mediatek: Fix error handling in runtime PM setup

Haoxiang Li (1):
      clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()

Inochi Amaoto (2):
      clk: spacemit: Respect Kconfig setting when building modules
      clk: spacemit: Hide common clock driver from user controller

Jagadeesh Kona (8):
      clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-x1e80100: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use shared_floor_ops
      clk: qcom: gcc-glymur: Update the SDCC RCGs to use shared_floor_ops

Jammy Huang (2):
      dt-bindings: clock: aspeed: Add VIDEO reset definition
      clk: aspeed: Add reset for HACE/VIDEO

Janne Grunau (1):
      clk: clk-apple-nco: Add "apple,t8103-nco" compatible

Jian Hu (5):
      dt-bindings: clock: add Amlogic T7 PLL clock controller
      dt-bindings: clock: add Amlogic T7 SCMI clock controller
      dt-bindings: clock: add Amlogic T7 peripherals clock controller
      clk: meson: t7: add support for the T7 SoC PLL clock
      clk: meson: t7: add t7 clock peripherals controller driver

Johan Hovold (1):
      clk: tegra: tegra124-emc: fix device leak on set_rate()

Krzysztof Kozlowski (11):
      clk: qcom: gcc-kaanapali: Fix double array initializer
      clk: qcom: rpmh: Fix double array initializer on Kaanapali
      clk: qcom: videocc-sm8750: Constify qcom_cc_desc
      clk: lmk04832: Simplify with scoped for each OF child loop
      clk: scpi: Simplify with scoped for each OF child loop
      clk: versatile: impd1: Simplify with scoped for each OF child loop
      clk: tegra: tegra124-emc: Simplify with scoped for each OF child loop
      Merge branch 'for-v6.20/dt-bindings-clk' into next/clk
      clk: zynqmp: divider: Fix zynqmp_clk_divider_determine_rate kerneldoc
      clk: zynqmp: pll: Fix zynqmp_clk_divider_determine_rate kerneldoc
      clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750 camcc

Lad Prabhakar (11):
      clk: renesas: r9a09g077: Add xSPI core and module clocks
      clk: renesas: r9a09g077: Propagate rate changes through mux parents
      clk: renesas: r9a09g056: Add entries for the DMACs
      clk: renesas: r9a09g056: Add entries for ICU
      clk: renesas: r9a09g056: Add entries for the RSPIs
      clk: renesas: r9a09g056: Add entries for RSCIs
      clk: renesas: r9a09g057: Add entries for RSCIs
      clk: renesas: r9a09g077: Add CANFD clocks
      clk: renesas: r9a09g057: Add entries for CANFD
      clk: renesas: r9a09g056: Add entries for CANFD
      clk: renesas: cpg-mssr: Unlock before reset verification

Marco Felsch (2):
      clk: imx: fracn-gppll: Add 332.60 MHz Support
      clk: imx: fracn-gppll: Add 241.90 MHz Support

Marek Vasut (2):
      clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
      dt-bindings: clk: rs9: Fix DIF pattern match

Martin Blumenstingl (3):
      clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
      clk: meson: g12a: Limit the HDMI PLL OD to /4
      clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro

Miaoqian Lin (1):
      clk: rockchip: Fix error pointer check after rockchip_clk_register_gate_link()

Nicolas Frattaroli (5):
      clk: Respect CLK_OPS_PARENT_ENABLE during recalc
      clk: mediatek: Refactor pll registration to pass device
      clk: mediatek: Pass device to clk_hw_register for PLLs
      clk: mediatek: Refactor pllfh registration to pass device
      clk: mediatek: Add mfg_eb as parent to mt8196 mfgpll clocks

Ovidiu Panait (1):
      clk: renesas: r9a09g056: Add clock and reset entries for TSU

Peng Fan (1):
      clk: Disable KUNIT_UML_PCI

Peter Griffin (5):
      dt-bindings: clock: google,gs101-clock: add samsung,sysreg property as required
      clk: samsung: Implement automatic clock gating mode for CMUs
      clk: samsung: gs101: Enable auto_clock_gate mode for each gs101 CMU
      dt-bindings: samsung: exynos-sysreg: add gs101 dpu compatible
      clk: samsung: gs101: add support for Display Process Unit (DPU) clocks

Petr Hodina (1):
      clk: qcom: dispcc-sdm845: Enable parents for pixel clocks

Pierre-Henry Moussay (2):
      dt-bindings: clock: mpfs-ccc: Add pic64gx compatibility
      dt-bindings: clock: mpfs-clkcfg: Add pic64gx compatibility

Rafael J. Wysocki (1):
      clk: tegra: Adjust callbacks in tegra_clock_pm

Raghav Sharma (2):
      dt-bindings: clock: exynosautov920: add MFD clock definitions
      clk: samsung: exynosautov920: add clock support

Ryan Chen (3):
      clk: aspeed: Move the existing ASPEED clk drivers into aspeed subdirectory.
      MAINTAINERS: Add entry for ASPEED clock drivers.
      clk: aspeed: add AST2700 clock driver

Sjoerd Simons (1):
      clk: mediatek: Drop __initconst from gates

Stephen Boyd (17):
      Merge tag 'renesas-clk-for-v6.20-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'renesas-clk-for-v6.20-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'spacemit-clk-for-6.20-1' of https://github.com/spacemit-com/linux into clk-spacemit
      Merge tag 'for-6.20-clk' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into clk-tegra
      Merge tag 'thead-clk-for-v6.20' of https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux into clk-thead
      Merge tag 'clk-meson-v6.20-1' of https://github.com/BayLibre/clk-meson into clk-amlogic
      Merge tag 'samsung-clk-6.20' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-samsung
      Merge tag 'clk-divider-round-rate-v6.20-v2' of https://github.com/masneyb/linux into clk-divider
      Merge tag 'clk-imx-6.20' of git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux into clk-imx
      Merge tag 'v6.20-rockchip-clk-1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-rockchip
      Merge tag 'clk-microchip-6.20' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into clk-microchip
      Revert "clk: Respect CLK_OPS_PARENT_ENABLE during recalc"
      Merge tag 'qcom-clk-for-6.20' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-qcom
      Merge branches 'clk-renesas', 'clk-cleanup', 'clk-spacemit' and 'clk-tegra' into clk-next
      Merge branches 'clk-amlogic', 'clk-thead', 'clk-mediatek' and 'clk-samsung' into clk-next
      Merge branches 'clk-imx', 'clk-divider', 'clk-rockchip' and 'clk-microchip' into clk-next
      Merge branches 'clk-aspeed' and 'clk-qcom' into clk-next

Svyatoslav Ryhel (3):
      clk: tegra20: Reparent dsi clock to pll_d_out0
      clk: tegra: Set CSUS as vi_sensor's gate for Tegra20, Tegra30 and Tegra114
      clk: tegra30: Add CSI pad clock gates

Taniya Das (19):
      clk: qcom: rpmh: Update the clock suffix for Glymur
      clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      clk: qcom: Add TCSR clock driver for Kaanapali
      clk: qcom: Add support for Global clock controller on Kaanapali
      clk: qcom: gcc-x1e80100: Add missing UFS symbol mux clocks
      clk: qcom: rcg2: compute 2d using duty fraction directly
      dt-bindings: clock: qcom: Add camera clock controller for SM8750 SoC
      dt-bindings: clock: qcom: document Kaanapali DISPCC clock controller
      dt-bindings: clock: qcom: Add support for CAMCC for Kaanapali
      dt-bindings: clock: qcom: Add Kaanapali video clock controller
      dt-bindings: clock: qcom: document the Kaanapali GPU Clock Controller
      clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
      clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC
      clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
      clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
      clk: qcom: dispcc: Add support for display clock controller Kaanapali
      clk: qcom: camcc: Add support for camera clock controller for Kaanapali
      clk: qcom: Add support for VideoCC driver for Kaanapali
      clk: qcom: Add support for GPUCC and GXCLK for Kaanapali

Vladimir Zapolskiy (2):
      clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
      clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs

Yao Zi (6):
      dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
      clk: thead: th1520-ap: Poll for PLL lock and wait for stability
      clk: thead: th1520-ap: Add C910 bus clock
      clk: thead: th1520-ap: Support setting PLL rates
      clk: thead: th1520-ap: Add macro to define multiplexers with flags
      clk: thead: th1520-ap: Support CPU frequency scaling

Yixun Lan (9):
      Merge tag 'spacemit-clkrst-v6.20-1' into spacemit-clk-for-6.20
      clk: spacemit: extract common ccu functions
      clk: spacemit: add platform SoC prefix to reset name
      Merge tag 'spacemit-clkrst-v6.20-2' into spacemit-clk-for-6.20
      dt-bindings: soc: spacemit: k3: add clock support
      clk: spacemit: ccu_mix: add inverted enable gate clock
      clk: spacemit: ccu_pll: add plla type clock
      Merge tag 'spacemit-clkrst-v6.20-3' into spacemit-clk-for-6.20
      clk: spacemit: k3: add the clock tree

 .../clock/amlogic,t7-peripherals-clkc.yaml         |  116 +
 .../bindings/clock/amlogic,t7-pll-clkc.yaml        |  114 +
 .../bindings/clock/google,gs101-clock.yaml         |   19 +-
 .../bindings/clock/mediatek,mt7622-pciesys.yaml    |   10 +-
 .../bindings/clock/microchip,mpfs-ccc.yaml         |    6 +-
 .../bindings/clock/microchip,mpfs-clkcfg.yaml      |   16 +-
 .../bindings/clock/qcom,gcc-msm8953.yaml           |    6 +-
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   63 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   11 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    2 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |    8 +-
 .../devicetree/bindings/clock/renesas,9series.yaml |   11 +-
 .../clock/samsung,exynosautov920-clock.yaml        |   19 +
 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |    9 +-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |    2 +
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   14 +-
 MAINTAINERS                                        |    9 +
 drivers/clk/.kunitconfig                           |    2 +-
 drivers/clk/Kconfig                                |   13 +-
 drivers/clk/Makefile                               |    3 +-
 drivers/clk/actions/owl-composite.c                |   11 +-
 drivers/clk/actions/owl-divider.c                  |   17 +-
 drivers/clk/actions/owl-divider.h                  |    5 -
 drivers/clk/aspeed/Kconfig                         |   21 +
 drivers/clk/aspeed/Makefile                        |    4 +
 drivers/clk/{ => aspeed}/clk-aspeed.c              |    2 +
 drivers/clk/{ => aspeed}/clk-aspeed.h              |    0
 drivers/clk/{ => aspeed}/clk-ast2600.c             |    0
 drivers/clk/aspeed/clk-ast2700.c                   | 1055 ++++++
 drivers/clk/clk-apple-nco.c                        |    1 +
 drivers/clk/clk-bm1880.c                           |   13 +-
 drivers/clk/clk-lmk04832.c                         |    4 +-
 drivers/clk/clk-loongson1.c                        |    5 +-
 drivers/clk/clk-milbeaut.c                         |   15 +-
 drivers/clk/clk-renesas-pcie.c                     |   10 +-
 drivers/clk/clk-scpi.c                             |    5 +-
 drivers/clk/clk-versaclock3.c                      |    7 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c          |    6 +-
 drivers/clk/imx/clk-fracn-gppll.c                  |    4 +-
 drivers/clk/mediatek/Kconfig                       |    2 +-
 drivers/clk/mediatek/clk-mt2701.c                  |    2 +-
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c       |    4 +-
 drivers/clk/mediatek/clk-mt6765.c                  |    2 +-
 drivers/clk/mediatek/clk-mt6779.c                  |    2 +-
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt6797.c                  |    2 +-
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt7629.c                  |    2 +-
 drivers/clk/mediatek/clk-mt7981-apmixed.c          |    2 +-
 drivers/clk/mediatek/clk-mt7981-eth.c              |    6 +-
 drivers/clk/mediatek/clk-mt7986-apmixed.c          |    2 +-
 drivers/clk/mediatek/clk-mt7988-apmixed.c          |    2 +-
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c       |    3 +-
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c       |   14 +-
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c       |    3 +-
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c       |    3 +-
 drivers/clk/mediatek/clk-mt8196-mcu.c              |    2 +-
 drivers/clk/mediatek/clk-mt8196-mfg.c              |   15 +-
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c         |    2 +-
 drivers/clk/mediatek/clk-mt8365-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c       |    2 +-
 drivers/clk/mediatek/clk-mt8516.c                  |    2 +-
 drivers/clk/mediatek/clk-mtk.c                     |   12 +-
 drivers/clk/mediatek/clk-pll.c                     |   19 +-
 drivers/clk/mediatek/clk-pll.h                     |   15 +-
 drivers/clk/mediatek/clk-pllfh.c                   |   13 +-
 drivers/clk/mediatek/clk-pllfh.h                   |    2 +-
 drivers/clk/meson/Kconfig                          |   28 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/g12a.c                           |   17 +-
 drivers/clk/meson/gxbb.c                           |   23 +-
 drivers/clk/meson/s4-peripherals.c                 |  206 +-
 drivers/clk/meson/t7-peripherals.c                 | 1271 +++++++
 drivers/clk/meson/t7-pll.c                         | 1074 ++++++
 drivers/clk/microchip/Kconfig                      |    4 +-
 drivers/clk/microchip/clk-core.c                   |   36 +-
 drivers/clk/nuvoton/clk-ma35d1-divider.c           |    7 +-
 drivers/clk/nxp/clk-lpc32xx.c                      |    6 +-
 drivers/clk/qcom/Kconfig                           |   71 +-
 drivers/clk/qcom/Makefile                          |    7 +
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |  437 +++
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |  454 +++
 drivers/clk/qcom/camcc-kaanapali.c                 | 2661 +++++++++++++++
 drivers/clk/qcom/camcc-sm8750.c                    | 2710 +++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   41 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/clk-rcg2.c                        |    7 +-
 drivers/clk/qcom/clk-regmap-divider.c              |   16 +-
 drivers/clk/qcom/clk-rpmh.c                        |   60 +-
 drivers/clk/qcom/dispcc-kaanapali.c                | 1956 +++++++++++
 drivers/clk/qcom/dispcc-sdm845.c                   |    4 +-
 drivers/clk/qcom/dispcc-sm7150.c                   |    2 +-
 drivers/clk/qcom/gcc-glymur.c                      |    4 +-
 drivers/clk/qcom/gcc-ipq5018.c                     |    1 +
 drivers/clk/qcom/gcc-kaanapali.c                   | 3540 ++++++++++++++++++++
 drivers/clk/qcom/gcc-milos.c                       |    6 +-
 drivers/clk/qcom/gcc-msm8917.c                     |  282 +-
 drivers/clk/qcom/gcc-msm8953.c                     |    1 -
 drivers/clk/qcom/gcc-qdu1000.c                     |    4 +-
 drivers/clk/qcom/gcc-sdx75.c                       |    4 +-
 drivers/clk/qcom/gcc-sm4450.c                      |    6 +-
 drivers/clk/qcom/gcc-sm8450.c                      |    4 +-
 drivers/clk/qcom/gcc-sm8550.c                      |    4 +-
 drivers/clk/qcom/gcc-sm8650.c                      |    4 +-
 drivers/clk/qcom/gcc-sm8750.c                      |    4 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   76 +-
 drivers/clk/qcom/gpucc-kaanapali.c                 |  482 +++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   76 +
 drivers/clk/qcom/tcsrcc-kaanapali.c                |  141 +
 drivers/clk/qcom/videocc-kaanapali.c               |  821 +++++
 drivers/clk/qcom/videocc-sm8750.c                  |    2 +-
 drivers/clk/renesas/clk-vbattb.c                   |    4 +-
 drivers/clk/renesas/r9a09g056-cpg.c                |  188 ++
 drivers/clk/renesas/r9a09g057-cpg.c                |  136 +
 drivers/clk/renesas/r9a09g077-cpg.c                |  206 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   54 +-
 drivers/clk/renesas/rzg2l-cpg.c                    |  189 +-
 drivers/clk/renesas/rzv2h-cpg.c                    |   15 +-
 drivers/clk/rockchip/clk.c                         |    2 +-
 drivers/clk/samsung/clk-exynos-arm64.c             |   92 +-
 drivers/clk/samsung/clk-exynos4.c                  |   12 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |    4 +-
 drivers/clk/samsung/clk-exynos5250.c               |    2 +-
 drivers/clk/samsung/clk-exynos5420.c               |    4 +-
 drivers/clk/samsung/clk-exynosautov920.c           |   40 +
 drivers/clk/samsung/clk-gs101.c                    |  338 ++
 drivers/clk/samsung/clk-s3c64xx.c                  |    4 +-
 drivers/clk/samsung/clk-s5pv210.c                  |    2 +-
 drivers/clk/samsung/clk.c                          |  207 +-
 drivers/clk/samsung/clk.h                          |   56 +-
 drivers/clk/sophgo/clk-cv18xx-ip.c                 |  154 +-
 drivers/clk/sophgo/clk-sg2042-clkgen.c             |   15 +-
 drivers/clk/spacemit/Kconfig                       |   20 +-
 drivers/clk/spacemit/Makefile                      |   12 +-
 drivers/clk/spacemit/ccu-k1.c                      |  192 +-
 drivers/clk/spacemit/ccu-k3.c                      | 1487 ++++++++
 drivers/clk/spacemit/ccu_common.c                  |  177 +
 drivers/clk/spacemit/ccu_common.h                  |   11 +
 drivers/clk/spacemit/ccu_ddn.c                     |    1 +
 drivers/clk/spacemit/ccu_mix.c                     |   21 +-
 drivers/clk/spacemit/ccu_mix.h                     |   12 +
 drivers/clk/spacemit/ccu_pll.c                     |  119 +
 drivers/clk/spacemit/ccu_pll.h                     |   57 +-
 drivers/clk/sprd/div.c                             |    6 +-
 drivers/clk/stm32/clk-stm32-core.c                 |   42 +-
 drivers/clk/sunxi-ng/ccu_div.c                     |   25 +-
 drivers/clk/sunxi-ng/ccu_mp.c                      |   26 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |   16 +-
 drivers/clk/sunxi-ng/ccu_mux.c                     |   49 +-
 drivers/clk/sunxi-ng/ccu_mux.h                     |    8 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   25 +-
 drivers/clk/tegra/clk-device.c                     |   13 +-
 drivers/clk/tegra/clk-tegra114.c                   |    7 +-
 drivers/clk/tegra/clk-tegra124-emc.c               |   10 +-
 drivers/clk/tegra/clk-tegra20.c                    |   26 +-
 drivers/clk/tegra/clk-tegra30.c                    |   20 +-
 drivers/clk/thead/clk-th1520-ap.c                  |  350 +-
 drivers/clk/versatile/clk-impd1.c                  |    7 +-
 drivers/clk/x86/clk-cgu.c                          |    6 +-
 drivers/clk/zynqmp/divider.c                       |   10 +-
 drivers/clk/zynqmp/pll.c                           |    5 +-
 drivers/reset/reset-spacemit.c                     |    2 +-
 drivers/rtc/rtc-ac100.c                            |   75 +-
 .../clock/amlogic,s4-peripherals-clkc.h            |   11 +
 .../clock/amlogic,t7-peripherals-clkc.h            |  228 ++
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h    |   56 +
 include/dt-bindings/clock/amlogic,t7-scmi.h        |   47 +
 include/dt-bindings/clock/aspeed-clock.h           |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |    2 +
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 +
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   13 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 .../dt-bindings/clock/qcom,sm8750-cambistmclkcc.h  |   30 +
 include/dt-bindings/clock/qcom,sm8750-camcc.h      |  151 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |    3 +
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |    3 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |    3 +
 include/dt-bindings/clock/samsung,exynosautov920.h |    4 +
 include/dt-bindings/clock/spacemit,k3-clocks.h     |  390 +++
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |    1 +
 include/linux/clk.h                                |  104 +-
 include/linux/clk/renesas.h                        |   11 +
 include/soc/spacemit/ccu.h                         |   21 +
 include/soc/spacemit/k1-syscon.h                   |   12 +-
 include/soc/spacemit/k3-syscon.h                   |  273 ++
 197 files changed, 23730 insertions(+), 956 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
 create mode 100644 drivers/clk/aspeed/Kconfig
 create mode 100644 drivers/clk/aspeed/Makefile
 rename drivers/clk/{ => aspeed}/clk-aspeed.c (99%)
 rename drivers/clk/{ => aspeed}/clk-aspeed.h (100%)
 rename drivers/clk/{ => aspeed}/clk-ast2600.c (100%)
 create mode 100644 drivers/clk/aspeed/clk-ast2700.c
 create mode 100644 drivers/clk/meson/t7-peripherals.c
 create mode 100644 drivers/clk/meson/t7-pll.c
 create mode 100644 drivers/clk/qcom/cambistmclkcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/cambistmclkcc-sm8750.c
 create mode 100644 drivers/clk/qcom/camcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/camcc-sm8750.c
 create mode 100644 drivers/clk/qcom/dispcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/gcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/gpucc-kaanapali.c
 create mode 100644 drivers/clk/qcom/gxclkctl-kaanapali.c
 create mode 100644 drivers/clk/qcom/tcsrcc-kaanapali.c
 create mode 100644 drivers/clk/qcom/videocc-kaanapali.c
 create mode 100644 drivers/clk/spacemit/ccu-k3.c
 create mode 100644 drivers/clk/spacemit/ccu_common.c
 create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-camcc.h
 create mode 100644 include/dt-bindings/clock/spacemit,k3-clocks.h
 create mode 100644 include/soc/spacemit/ccu.h
 create mode 100644 include/soc/spacemit/k3-syscon.h

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
