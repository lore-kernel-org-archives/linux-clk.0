Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF63B19C2;
	Mon, 20 Apr 2026 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776709930; cv=none; b=iTsVvEnTX1CFPNdnZ4TyZaj/ke+61w0om9CrZ6QLW4L3wAU/0qmCE6/0+dYqqI2Biw2iRxO4mn413LN7Rn2rYHt7M7D5bQZ3fvHd7m0xBH94sH/c1xa5YIw4KIdjdWmqhkT7TsNValKDSe8ULPY5bXnldtkDewaFTnhMo1icMyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776709930; c=relaxed/simple;
	bh=s9QCsaPVGj9TE/Q3Yw1U0FSIy9S0TNHCFHKEbiNMl7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tIDW8aVWbNTD1RIG8aubhzy2ZPIlbnYQs51XG273iVcA4qPZwhVWSwyCgEGkdiQn2pONbAF5C0/AfNHdQ1wuz4OMGh5m/Nxj+r7KNSPfhI+HuOhseKl/R95rWf4EKlorHXM7ZeU+YAB23m7FlMudUTHtpOIOkq7VakzvAQSfIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOz22grQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOz22grQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26709C19425;
	Mon, 20 Apr 2026 18:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776709930;
	bh=s9QCsaPVGj9TE/Q3Yw1U0FSIy9S0TNHCFHKEbiNMl7s=;
	h=From:To:Cc:Subject:Date:From;
	b=iOz22grQThrtIggD+bTRq7fKdEAGBVXtSo84gnneN1zkW/eS9PPM2Mfbm7WZ68hNN
	 ud13HDlCNLfMqSA/UUzqPLhySNnSDl3Ie2azLPu+KUZKK5gvY86WeVQizrPhPgY+lw
	 J9drvBDSEoR+MB9VgTxnnDzHMMXfUDos5j12H0etQlRHHqhv8BjrI8OPUzstgqUSN8
	 TLNmzsiAgLEonKT+fOZh0wqUtXGRD/WMooduvtvWUPTFcSRjTQ0qF0A/6K+kC54K4W
	 E3uFC6j2o3Dj+t8HUDnuSWHsEgZPDqxPmrdtkAdtkyBwKe9BV6MDUrEcuxrbnxVZRg
	 GKp7u9hxeYKqw==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for the merge window
Date: Mon, 20 Apr 2026 11:32:08 -0700
Message-ID: <20260420183208.2287306-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b822fb82505af4cc3f14fed05b8069c67d2ed5fb:

  dt-bindings: clock: renesas,rzg2l-cpg: Document RZ/G3L SoC (2026-03-26 19:44:48 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 6b701fde9b31f085f39fc2a371cb33212fab6f68:

  Merge branches 'clk-samsung', 'clk-qcom', 'clk-round', 'clk-sai' and 'clk-cleanup' into clk-next (2026-04-16 10:12:43 -0700)

----------------------------------------------------------------
We've finally gotten rid of the struct clk_ops::round_rate() code after months
of effort from Brian Masney. Now the only option is to use determine_rate(),
which is good because that takes a struct argument instead of just a couple
unsigned longs, allowing us to easily modify the way we determine and set rates
in the clk tree.

Beyond that core framework change we've got the typical pile of new SoC clk
driver additions, fixes for clk data and/or adding missing clks because the
consumer driver using those clks wasn't ready, etc. The usual suspects are all
here: Qualcomm, Samsung, Mediatek, and Rockchip along with some newcomers
making RISC-V SoCs like ESWIN's eic700 and Tenstorrent's Atlantis. The clk
driver side of this looks pretty normal.

Core:
 - Remove the round_rate() clk op (yay!)

New Drivers:
 - ESWIN eic700 SoC clk support
 - Econet EN751221 SoC clock/reset support
 - Global TCSR, RPMh, and display clock controller support for
   the Qualcomm Eliza platform
 - TCSR, the multiple global, and the RPMh clock controller
   support for the Qualcomm Nord platform
 - GPU clock controller support for Qualcomm SM8750
 - Video and GPU clock controller support for Qualcomm Glymur
 - Global clock controller support for Qualcomm IPQ5210
 - Axis ARTPEC-9: Add new PLL clocks and new drivers for eight clock
   controllers on the SoC
 - ExynosAutov920: Add G3D (GPU) clock controller
 - Clock driver for the Rockchip RV1103B SoC
 - Initial support for the Renesas RZ/G3L (R9A08G046) SoC
 - Clock and reset controllers (e.g. PRCM) in the Tenstorrent Atlantis SoC

----------------------------------------------------------------
Abel Vesa (3):
      clk: qcom: Add TCSR clock driver for Eliza
      clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS AXI PHY clock
      dt-bindings: clock: qcom: Add missing power-domains property

Alexander Stein (3):
      clk: imx: pll14xx: Use unsigned format specifier
      clk: imx: fracn-gppll: Add 333.333333 MHz support
      clk: imx: fracn-gppll: Add 477.4MHz support

Alexey Klimov (2):
      dt-bindings: clock: exynos850: Add APM_AP MAILBOX clock
      clk: samsung: exynos850: Add APM-to-AP mailbox clock

André Draszik (1):
      clk: samsung: gs101: harmonise symbol names (clock arrays)

Andy Shevchenko (1):
      clk: baikal-t1: Remove not-going-to-be-supported code for Baikal SoC

Anirudh Srinivasan (3):
      dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm-rcpu
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

Arnd Bergmann (1):
      clk: qoriq: avoid format string warning

Ben Dooks (1):
      clk: mvebu: armada-37xx-periph: fix __iomem casts in structure init

Biju Das (6):
      clk: renesas: rzg2l: Add support for critical resets
      clk: renesas: r9a0{7g04[34],8g045}: Add critical reset entries
      clk: renesas: rzg2l: Add helper for mod clock enable/disable
      clk: renesas: rzg2l: Add rzg2l_mod_clock_init_mstop_helper()
      clk: renesas: rzg2l: Re-enable critical module clocks during resume
      clk: renesas: Add support for RZ/G3L SoC

Bjorn Andersson (5):
      Merge branch '20260311-eliza-clocks-v6-1-453c4cf657a2@oss.qualcomm.com' into clk-for-7.1
      Merge branch '20260303034847.13870-2-val@packett.cool' into clk-for-7.1
      Merge branch '20260318-ipq5210_boot_to_shell-v2-1-a87e27c37070@oss.qualcomm.com' into clk-for-7.1
      Merge branch '20260319-clk-qcom-dispcc-eliza-v3-1-d1f2b19a6e6b@oss.qualcomm.com' into clk-for-7.1
      Merge branch '20260120-topic-7180_dispcc_bcr-v1-1-0b1b442156c3@oss.qualcomm.com' into clk-for-7.1

Brian Masney (6):
      clk: test: remove references to clk_ops.round_rate
      clk: composite: convert from round_rate() to determine_rate()
      clk: remove round_rate() clk ops
      clk: divider: remove divider_ro_round_rate_parent()
      clk: divider: remove divider_round_rate() and divider_round_rate_parent()
      clk: visconti: pll: initialize clk_init_data to zero

Caleb James DeLisle (2):
      dt-bindings: clock, reset: Add econet EN751221
      clk: airoha: Add econet EN751221 clock/reset support to en7523-scu

Chen-Yu Tsai (1):
      clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock

Conor Dooley (1):
      clk: microchip: mpfs-ccc: fix out of bounds access during output registration

Dmitry Baryshkov (2):
      clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX clock source
      clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source

Fabio Estevam (1):
      clk: rockchip: Add clock controller for the RV1103B

Fabrizio Castro (2):
      clk: renesas: r9a09g057: Remove entries for WDT{0,2,3}
      clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}

Felix Gu (2):
      clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
      clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()

Frank Li (1):
      dt-bindings: clock: imx6q[ul]-clock: add optional clock enet[1]_ref_pad

Geert Uytterhoeven (3):
      clk: Simplify clk_is_match()
      clk: xgene: Fix mapping leak in xgene_pllclk_init()
      Merge tag 'renesas-r9a08g046-dt-binding-defs-tag1' into renesas-clk-for-v7.1

GyoungBo Min (2):
      clk: samsung: Add clock PLL support for ARTPEC-9 SoC
      clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC

Herve Codina (Schneider Electric) (1):
      clk: renesas: r9a06g032: Enable watchdog reset sources

Jagadeesh Kona (1):
      clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON

John Crispin (5):
      clk: qcom: gcc-ipq6018: mark gcc_xo_clk_src as critical
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ6018
      clk: qcom: ipq-cmn-pll: Add IPQ6018 SoC support
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ8074
      clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support

John Madieu (1):
      clk: renesas: r9a09g047: Add PCIe clocks and reset

Kathiravan Thirumoorthy (1):
      clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC

Konrad Dybcio (9):
      clk: qcom: dispcc-glymur: Fix DSI byte clock rate setting
      clk: qcom: dispcc-kaanapali: Fix DSI byte clock rate setting
      clk: qcom: dispcc-milos: Fix DSI byte clock rate setting
      clk: qcom: dispcc-sm4450: Fix DSI byte clock rate setting
      clk: qcom: dispcc[01]-sa8775p: Fix DSI byte clock rate setting
      dt-bindings: clock: qcom,dispcc-sc7180: Define MDSS resets
      clk: qcom: dispcc-sc7180: Add missing MDSS resets
      dt-bindings: clock: qcom: Add SM8750 GPU clocks
      clk: qcom: Add a driver for SM8750 GPU clocks

Krzysztof Kozlowski (15):
      dt-bindings: clock: qcom,glymur-dispcc: De-acronymize SoC name
      clk: qcom: De-acronymize Glymur SoC name
      clk: samsung: pll: Fix possible truncation in a9fraco recalc rate
      clk: samsung: Use %pe format to simplify
      clk: qcom: kaanapali: Cleanup redundant header includes
      clk: qcom: glymur: Cleanup redundant header includes
      clk: qcom: sm8750: Cleanup redundant header includes
      clk: qcom: milos: Cleanup redundant header includes
      clk: qcom: eliza: Cleanup redundant header includes
      dt-bindings: clock: qcom,eliza-dispcc: Add Eliza SoC display CC
      clk: qcom: dispcc-eliza: Add Eliza display clock controller support
      Merge branch 'for-v7.1/dt-bindings-clk' into next/clk
      clk: qcom: videocc-glymur: Constify qcom_cc_desc
      clk: qcom: Constify qcom_cc_driver_data
      clk: qcom: Constify list of critical CBCR registers

Lad Prabhakar (2):
      clk: renesas: r9a09g056: Add PCIe clocks and reset
      clk: renesas: r9a09g057: Add PCIe clocks and reset

Lukasz Majewski (4):
      clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
      dt-bindings: clock: vf610: Drop VF610_CLK_END define
      dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
      clk: vf610: Add support for the Ethernet switch clocks

Marek Vasut (6):
      dt-bindings: clock: fsl-sai: Document i.MX8M support
      clk: fsl-sai: Sort the headers
      clk: fsl-sai: Add i.MX8M support with 8 byte register offset
      dt-bindings: clock: fsl-sai: Document clock-cells = <1> support
      clk: fsl-sai: Extract clock setup into fsl_sai_clk_register()
      clk: fsl-sai: Add MCLK generation support

Maíra Canal (1):
      clk: bcm: rpi: Manage clock rate in prepare/unprepare callbacks

Ovidiu Panait (3):
      clk: renesas: r9a09g057: Fix ordering of module clocks array
      clk: renesas: r9a09g056: Fix ordering of module clocks array
      clk: renesas: r9a09g056: Add clock and reset entries for RTC

Pengyu Luo (2):
      clk: qcom: videocc-sm8350: use depend on instead of select
      clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src

Prasanna Tolety (1):
      clk: qcom: rpmh: Add support for Nord rpmh clocks

Raghav Sharma (2):
      dt-bindings: clock: exynosautov920: add G3D clock definitions
      clk: samsung: exynosautov920: add block G3D clock support

Rosen Penev (1):
      clk: renesas: cpg-mssr: Use struct_size() helper

Sebastian Krzyszkowiak (1):
      clk: imx8mq: Correct the CSI PHY sels

Shawn Lin (1):
      clk: rockchip: rk3568: Add PCIe pipe clock gates

Shuwei Wu (1):
      clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()

Stefan Eichenberger (1):
      clk: imx: imx8-acm: fix flags for acm clocks

Stephen Boyd (16):
      Merge tag 'renesas-clk-fixes-for-v7.0-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-fixes
      Merge tag 'renesas-clk-for-v7.1-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'tenstorrent-clk-for-v7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux into clk-tenstorrent
      Merge tag 'renesas-clk-for-v7.1-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'v7.1-rockchip-clk1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-rockchip
      Merge tag 'clk-imx-7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux into clk-imx
      Merge tag 'clk-microchip-fixes-7.0' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into clk-fixes
      Merge tag 'spacemit-clk-fixes-for-7.0-1' of ssh://github.com/spacemit-com/linux into clk-fixes
      Merge tag 'qcom-clk-fixes-for-7.0' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-fixes
      Merge tag 'sunxi-clk-for-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-allwinner
      Merge tag 'samsung-clk-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-samsung
      Merge tag 'qcom-clk-for-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-qcom
      Merge tag 'clk-remove-deprecated-apis-v7.1' of ssh://github.com/masneyb/linux into clk-round
      Merge branches 'clk-fixes', 'clk-renesas', 'clk-rpi', 'clk-eswin' and 'clk-mediatek' into clk-next
      Merge branches 'clk-tenstorrent', 'clk-rockchip', 'clk-imx' and 'clk-allwinner' into clk-next
      Merge branches 'clk-samsung', 'clk-qcom', 'clk-round', 'clk-sai' and 'clk-cleanup' into clk-next

Taniya Das (13):
      dt-bindings: clock: qcom: document the Glymur GPU Clock Controller
      clk: qcom: Add support for GPUCC and GXCLK for Glymur
      dt-bindings: clock: qcom: Add GCC video axi reset clock for Glymur
      dt-bindings: clock: qcom: Add video clock controller on Glymur SoC
      clk: qcom: gcc-glymur: Add video axi clock resets for glymur
      clk: qcom: videocc-glymur: Add video clock controller driver for Glymur
      clk: qcom: rpmh: Add support for Eliza rpmh clocks
      clk: qcom: Add support for Global clock controller on Eliza
      dt-bindings: clock: qcom: Document the Nord SoC TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add support for Nord SoCs
      dt-bindings: clock: qcom: Add Nord Global Clock Controller
      clk: qcom: Add TCSR clock driver for Nord SoC
      clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC

Tommaso Merciai (1):
      clk: renesas: r9a09g047: Add entries for the RSPIs

Val Packett (11):
      clk: qcom: dispcc-sm6115: Add missing MDSS resets
      clk: qcom: dispcc-sm6125: Add missing MDSS resets
      dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
      clk: qcom: gcc-sc8180x: Add missing GDSCs
      clk: qcom: gcc-sc8180x: Use retention for USB power domains
      clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
      clk: qcom: gcc-sc8180x: Enable runtime PM support
      clk: qcom: gcc-sc8180x: Refactor to use qcom_cc_driver_data
      clk: qcom: dispcc-sm8250: Use shared ops on the mdss vsync clk
      clk: qcom: dispcc-sm8250: Enable parents for pixel clocks
      clk: qcom: camcc-sc8180x: Refactor to use qcom_cc_driver_data

Vladimir Zapolskiy (1):
      clk: qcom: gdsc: Fix error path on registration of multiple pm subdomains

White Lewis (1):
      clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers

Xuyang Dong (4):
      dt-bindings: clock: eswin: Documentation for eic7700 SoC
      clk: divider: Add devm_clk_hw_register_divider_parent_data
      clk: eswin: Add eic7700 clock driver
      MAINTAINERS: Add entry for ESWIN EIC7700 clock driver

 Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml              |    6 +-
 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml             |  196 ---
 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml             |  131 --
 Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml            |   46 +
 Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml                  |   43 +-
 Documentation/devicetree/bindings/clock/imx6q-clock.yaml                    |    4 +
 Documentation/devicetree/bindings/clock/imx6ul-clock.yaml                   |    4 +
 Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml              |   96 ++
 Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml             |    4 +-
 Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml           |    2 +
 Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml        |    2 +
 Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml                 |    7 +
 Documentation/devicetree/bindings/clock/qcom,nord-gcc.yaml                  |   58 +
 Documentation/devicetree/bindings/clock/qcom,nord-negcc.yaml                |   60 +
 Documentation/devicetree/bindings/clock/qcom,nord-nwgcc.yaml                |   55 +
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml                    |    1 +
 Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml              |   27 +-
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml            |    3 +
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml               |    2 +
 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml   |   21 +
 Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml |   54 +
 Documentation/devicetree/bindings/mfd/syscon.yaml                           |    2 +
 Documentation/driver-api/clk.rst                                            |    9 +-
 MAINTAINERS                                                                 |   14 +
 drivers/clk/Kconfig                                                         |   11 +-
 drivers/clk/Makefile                                                        |    3 +-
 drivers/clk/baikal-t1/Kconfig                                               |   52 -
 drivers/clk/baikal-t1/Makefile                                              |    4 -
 drivers/clk/baikal-t1/ccu-div.c                                             |  653 ---------
 drivers/clk/baikal-t1/ccu-div.h                                             |  121 --
 drivers/clk/baikal-t1/ccu-pll.c                                             |  560 --------
 drivers/clk/baikal-t1/ccu-pll.h                                             |   72 -
 drivers/clk/baikal-t1/ccu-rst.c                                             |  217 ---
 drivers/clk/baikal-t1/ccu-rst.h                                             |   67 -
 drivers/clk/baikal-t1/clk-ccu-div.c                                         |  520 -------
 drivers/clk/baikal-t1/clk-ccu-pll.c                                         |  277 ----
 drivers/clk/bcm/clk-raspberrypi.c                                           |   38 +-
 drivers/clk/clk-composite.c                                                 |   38 +-
 drivers/clk/clk-divider.c                                                   |   44 -
 drivers/clk/clk-en7523.c                                                    |  223 ++-
 drivers/clk/clk-fsl-sai.c                                                   |  148 +-
 drivers/clk/clk-qoriq.c                                                     |   17 +-
 drivers/clk/clk-xgene.c                                                     |    2 +
 drivers/clk/clk.c                                                           |   46 +-
 drivers/clk/clk_test.c                                                      |   16 +-
 drivers/clk/eswin/Kconfig                                                   |   15 +
 drivers/clk/eswin/Makefile                                                  |    8 +
 drivers/clk/eswin/clk-eic7700.c                                             | 1376 ++++++++++++++++++
 drivers/clk/eswin/clk.c                                                     |  586 ++++++++
 drivers/clk/eswin/common.h                                                  |  340 +++++
 drivers/clk/imx/clk-fracn-gppll.c                                           |    2 +
 drivers/clk/imx/clk-imx6q.c                                                 |   12 +-
 drivers/clk/imx/clk-imx8-acm.c                                              |    3 +-
 drivers/clk/imx/clk-imx8mq.c                                                |    4 +-
 drivers/clk/imx/clk-pll14xx.c                                               |    6 +-
 drivers/clk/imx/clk-vf610.c                                                 |   12 +
 drivers/clk/microchip/clk-mpfs-ccc.c                                        |    6 +-
 drivers/clk/mvebu/armada-37xx-periph.c                                      |   16 +-
 drivers/clk/qcom/Kconfig                                                    |   94 +-
 drivers/clk/qcom/Makefile                                                   |    9 +
 drivers/clk/qcom/apss-ipq5424.c                                             |    2 +-
 drivers/clk/qcom/cambistmclkcc-kaanapali.c                                  |    6 +-
 drivers/clk/qcom/cambistmclkcc-sm8750.c                                     |    4 +-
 drivers/clk/qcom/camcc-kaanapali.c                                          |    6 +-
 drivers/clk/qcom/camcc-milos.c                                              |    4 +-
 drivers/clk/qcom/camcc-qcs615.c                                             |    2 +-
 drivers/clk/qcom/camcc-sc8180x.c                                            |   67 +-
 drivers/clk/qcom/camcc-sm8450.c                                             |    4 +-
 drivers/clk/qcom/camcc-sm8550.c                                             |    4 +-
 drivers/clk/qcom/camcc-sm8650.c                                             |    4 +-
 drivers/clk/qcom/camcc-sm8750.c                                             |    4 +-
 drivers/clk/qcom/camcc-x1e80100.c                                           |    4 +-
 drivers/clk/qcom/clk-rcg2.c                                                 |    2 +
 drivers/clk/qcom/clk-rpmh.c                                                 |   46 +
 drivers/clk/qcom/common.h                                                   |    4 +-
 drivers/clk/qcom/{dispcc-kaanapali.c => dispcc-eliza.c}                     |  763 ++++++----
 drivers/clk/qcom/dispcc-glymur.c                                            |   12 +-
 drivers/clk/qcom/dispcc-kaanapali.c                                         |    8 +-
 drivers/clk/qcom/dispcc-milos.c                                             |    9 +-
 drivers/clk/qcom/dispcc-qcs615.c                                            |    4 +-
 drivers/clk/qcom/dispcc-sc7180.c                                            |    8 +
 drivers/clk/qcom/dispcc-sc8280xp.c                                          |    4 -
 drivers/clk/qcom/dispcc-sm4450.c                                            |    1 -
 drivers/clk/qcom/dispcc-sm6115.c                                            |    7 +
 drivers/clk/qcom/dispcc-sm6125.c                                            |    7 +
 drivers/clk/qcom/dispcc-sm8250.c                                            |    6 +-
 drivers/clk/qcom/dispcc-sm8450.c                                            |    2 +-
 drivers/clk/qcom/dispcc0-sa8775p.c                                          |    2 -
 drivers/clk/qcom/dispcc1-sa8775p.c                                          |    2 -
 drivers/clk/qcom/{gcc-milos.c => gcc-eliza.c}                               | 1674 ++++++++++------------
 drivers/clk/qcom/gcc-glymur.c                                               |    8 +-
 drivers/clk/qcom/gcc-ipq5210.c                                              | 2661 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gcc-ipq6018.c                                              |    2 +-
 drivers/clk/qcom/gcc-kaanapali.c                                            |    5 +-
 drivers/clk/qcom/gcc-milos.c                                                |    4 +-
 drivers/clk/qcom/gcc-nord.c                                                 | 1902 +++++++++++++++++++++++++
 drivers/clk/qcom/gcc-sc8180x.c                                              |  126 +-
 drivers/clk/qcom/gcc-x1e80100.c                                             |    1 +
 drivers/clk/qcom/gdsc.c                                                     |   12 +-
 drivers/clk/qcom/{gpucc-milos.c => gpucc-glymur.c}                          |  234 +--
 drivers/clk/qcom/gpucc-kaanapali.c                                          |    5 +-
 drivers/clk/qcom/gpucc-milos.c                                              |    4 +-
 drivers/clk/qcom/gpucc-qcs615.c                                             |    4 +-
 drivers/clk/qcom/{gpucc-kaanapali.c => gpucc-sm8750.c}                      |  211 ++-
 drivers/clk/qcom/gxclkctl-kaanapali.c                                       |    3 +-
 drivers/clk/qcom/ipq-cmn-pll.c                                              |   16 +
 drivers/clk/qcom/negcc-nord.c                                               | 1987 ++++++++++++++++++++++++++
 drivers/clk/qcom/nwgcc-nord.c                                               |  688 +++++++++
 drivers/clk/qcom/segcc-nord.c                                               | 1609 +++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                                             |  179 +++
 drivers/clk/qcom/tcsrcc-glymur.c                                            |    3 +-
 drivers/clk/qcom/tcsrcc-kaanapali.c                                         |    1 -
 drivers/clk/qcom/{tcsrcc-glymur.c => tcsrcc-nord.c}                         |  202 +--
 drivers/clk/qcom/tcsrcc-sm8750.c                                            |    2 +-
 drivers/clk/qcom/{videocc-sm8750.c => videocc-glymur.c}                     |  305 ++--
 drivers/clk/qcom/videocc-kaanapali.c                                        |    4 +-
 drivers/clk/qcom/videocc-milos.c                                            |    4 +-
 drivers/clk/qcom/videocc-qcs615.c                                           |    4 +-
 drivers/clk/qcom/videocc-sm8450.c                                           |    4 +-
 drivers/clk/qcom/videocc-sm8550.c                                           |    4 +-
 drivers/clk/qcom/videocc-sm8750.c                                           |    5 +-
 drivers/clk/renesas/Kconfig                                                 |    7 +-
 drivers/clk/renesas/Makefile                                                |    1 +
 drivers/clk/renesas/r9a06g032-clocks.c                                      |    5 +-
 drivers/clk/renesas/r9a07g043-cpg.c                                         |    9 +
 drivers/clk/renesas/r9a07g044-cpg.c                                         |   13 +
 drivers/clk/renesas/r9a08g045-cpg.c                                         |    9 +
 drivers/clk/renesas/r9a08g046-cpg.c                                         |  153 ++
 drivers/clk/renesas/r9a09g047-cpg.c                                         |   29 +
 drivers/clk/renesas/r9a09g056-cpg.c                                         |   60 +-
 drivers/clk/renesas/r9a09g057-cpg.c                                         |   60 +-
 drivers/clk/renesas/renesas-cpg-mssr.c                                      |    4 +-
 drivers/clk/renesas/rzg2l-cpg.c                                             |   91 +-
 drivers/clk/renesas/rzg2l-cpg.h                                             |    8 +
 drivers/clk/rockchip/Kconfig                                                |    7 +
 drivers/clk/rockchip/Makefile                                               |    1 +
 drivers/clk/rockchip/clk-rk3568.c                                           |    6 +
 drivers/clk/rockchip/clk-rv1103b.c                                          |  658 +++++++++
 drivers/clk/rockchip/clk.h                                                  |   49 +
 drivers/clk/samsung/Makefile                                                |    1 +
 drivers/clk/samsung/clk-artpec9.c                                           | 1224 ++++++++++++++++
 drivers/clk/samsung/clk-exynos850.c                                         |    7 +-
 drivers/clk/samsung/clk-exynosautov920.c                                    |   52 +
 drivers/clk/samsung/clk-gs101.c                                             |   52 +-
 drivers/clk/samsung/clk-pll.c                                               |  185 ++-
 drivers/clk/samsung/clk-pll.h                                               |   17 +
 drivers/clk/samsung/clk.c                                                   |    4 +-
 drivers/clk/spacemit/ccu_mix.c                                              |    2 +-
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c                                    |   17 +-
 drivers/clk/tenstorrent/Kconfig                                             |   14 +
 drivers/clk/tenstorrent/Makefile                                            |    3 +
 drivers/clk/tenstorrent/atlantis-prcm.c                                     |  870 ++++++++++++
 drivers/clk/visconti/pll.c                                                  |    2 +-
 drivers/reset/Kconfig                                                       |   11 +
 drivers/reset/Makefile                                                      |    1 +
 drivers/reset/reset-tenstorrent-atlantis.c                                  |  173 +++
 include/dt-bindings/clock/bt1-ccu.h                                         |   48 -
 include/dt-bindings/clock/econet,en751221-scu.h                             |   12 +
 include/dt-bindings/clock/eswin,eic7700-clock.h                             |  285 ++++
 include/dt-bindings/clock/exynos850.h                                       |    1 +
 include/dt-bindings/clock/qcom,dispcc-sc7180.h                              |    7 +-
 include/dt-bindings/clock/qcom,eliza-dispcc.h                               |  118 ++
 include/dt-bindings/clock/qcom,gcc-sc8180x.h                                |    5 +
 include/dt-bindings/clock/qcom,glymur-gcc.h                                 |    1 +
 include/dt-bindings/clock/qcom,glymur-gpucc.h                               |   51 +
 include/dt-bindings/clock/qcom,glymur-videocc.h                             |   45 +
 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h                            |   15 +
 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h                            |   15 +
 include/dt-bindings/clock/qcom,nord-gcc.h                                   |  147 ++
 include/dt-bindings/clock/qcom,nord-negcc.h                                 |  124 ++
 include/dt-bindings/clock/qcom,nord-nwgcc.h                                 |   69 +
 include/dt-bindings/clock/qcom,nord-segcc.h                                 |   98 ++
 include/dt-bindings/clock/qcom,nord-tcsrcc.h                                |   26 +
 include/dt-bindings/clock/qcom,sm8750-gpucc.h                               |   50 +
 include/dt-bindings/clock/samsung,exynosautov920.h                          |    6 +
 include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h                  |  103 ++
 include/dt-bindings/clock/vf610-clock.h                                     |    6 +-
 include/dt-bindings/reset/econet,en751221-scu.h                             |   49 +
 include/linux/clk-provider.h                                                |   66 +-
 179 files changed, 19422 insertions(+), 5066 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,nord-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,nord-negcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,nord-nwgcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 delete mode 100644 drivers/clk/baikal-t1/Kconfig
 delete mode 100644 drivers/clk/baikal-t1/Makefile
 delete mode 100644 drivers/clk/baikal-t1/ccu-div.c
 delete mode 100644 drivers/clk/baikal-t1/ccu-div.h
 delete mode 100644 drivers/clk/baikal-t1/ccu-pll.c
 delete mode 100644 drivers/clk/baikal-t1/ccu-pll.h
 delete mode 100644 drivers/clk/baikal-t1/ccu-rst.c
 delete mode 100644 drivers/clk/baikal-t1/ccu-rst.h
 delete mode 100644 drivers/clk/baikal-t1/clk-ccu-div.c
 delete mode 100644 drivers/clk/baikal-t1/clk-ccu-pll.c
 create mode 100644 drivers/clk/eswin/Kconfig
 create mode 100644 drivers/clk/eswin/Makefile
 create mode 100644 drivers/clk/eswin/clk-eic7700.c
 create mode 100644 drivers/clk/eswin/clk.c
 create mode 100644 drivers/clk/eswin/common.h
 create mode 100644 drivers/clk/qcom/dispcc-eliza.c
 create mode 100644 drivers/clk/qcom/gcc-eliza.c
 create mode 100644 drivers/clk/qcom/gcc-ipq5210.c
 create mode 100644 drivers/clk/qcom/gcc-nord.c
 create mode 100644 drivers/clk/qcom/gpucc-glymur.c
 create mode 100644 drivers/clk/qcom/gpucc-sm8750.c
 create mode 100644 drivers/clk/qcom/negcc-nord.c
 create mode 100644 drivers/clk/qcom/nwgcc-nord.c
 create mode 100644 drivers/clk/qcom/segcc-nord.c
 create mode 100644 drivers/clk/qcom/tcsrcc-eliza.c
 create mode 100644 drivers/clk/qcom/tcsrcc-nord.c
 create mode 100644 drivers/clk/qcom/videocc-glymur.c
 create mode 100644 drivers/clk/renesas/r9a08g046-cpg.c
 create mode 100644 drivers/clk/rockchip/clk-rv1103b.c
 create mode 100644 drivers/clk/samsung/clk-artpec9.c
 create mode 100644 drivers/clk/tenstorrent/Kconfig
 create mode 100644 drivers/clk/tenstorrent/Makefile
 create mode 100644 drivers/clk/tenstorrent/atlantis-prcm.c
 create mode 100644 drivers/reset/reset-tenstorrent-atlantis.c
 delete mode 100644 include/dt-bindings/clock/bt1-ccu.h
 create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-clock.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-negcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-nwgcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-segcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-tcsrcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-gpucc.h
 create mode 100644 include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
 create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
