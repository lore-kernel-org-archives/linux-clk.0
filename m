Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C3C38DF9;
	Wed, 22 Jan 2025 00:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737505426; cv=none; b=sCQLbtboqojVibr6BAHnHbkRD64TX7buuH5TFbBPwG35a3x9PAyaUuHzDCDNnL+nQ1fzEk6AJEcJxU8HiMR+Mm4yBPBh+b2w2Lo4Mms226FxJb4yBIhGBPkEHkrUwde5j7fM+maHLuvbYUwKYlF1F6EiZ0Jw3agTtzKRu5IiaK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737505426; c=relaxed/simple;
	bh=ib8i+rN+7uFVCVWgiW/I+di/8Knk5LB2ltAP0obAuUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iph4BZM06k89I447jNi0XWgjpdTjatN7ZQZS4qcBLIuxY75bjK52q2XBhxx5mqVZQzsKcBCyBuaeyZ2hcZgkJXYMv/9xJCgV5U964Zi1areKyiAkRcobt2qaM+n2VcKTD4prVCZLzUuxByeRQ19qkCGfdmuXBweA8QYKJYvb+xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vNKxoFTv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vNKxoFTv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22527C4CEDF;
	Wed, 22 Jan 2025 00:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737505425;
	bh=ib8i+rN+7uFVCVWgiW/I+di/8Knk5LB2ltAP0obAuUA=;
	h=From:To:Cc:Subject:Date:From;
	b=vNKxoFTvsAROdkqzMHxdMWn1TxN+s+IdXI7MdgHmv8z1eK6/fF7vCL5Q2eGUoKm6+
	 Jew8L/gBQTbVvb7ATfcckg59ES1H6NRv96KC5kDsdnmnhLZNqE409zB48BhPBjJ51B
	 2ejhCf84qOk8S75pqVaYj70j0gXJ6ezEcez1/vBGkzQvMHuA8YqvpEzG4Brkw2NPus
	 ziZSE/Bv3qlnG8C1JNuAILQUlJ4/dDBrtZHOQN4ETaGB0eawzypQ9Tbm49Mej0rJar
	 t7xtgWL77GcYpJWfTLApOZ+AtudpbML/aDKzxRMMURPqf6kF4jy7xyNCSVEA5F7odz
	 wOuvQ/LWVf+Mw==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for the merge window
Date: Tue, 21 Jan 2025 16:23:42 -0800
Message-ID: <20250122002344.3107447-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit c384481006476ac65478fa3584c7245782e52f34:

  clk: clk-imx8mp-audiomix: fix function signature (2024-12-20 15:43:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 53c9c27672bb0241998ddf2d1588106920d4064b:

  Merge branch 'clk-fixes' into clk-next (2025-01-21 11:22:46 -0800)

----------------------------------------------------------------
A pretty quiet cycle this time around. We have a bunch of new Qualcomm clk
drivers, per usual, and then a handful of drivers for other SoCs. Then the
usual pile of cleanups is fairly small data fixes or converting DT bindings to
YAML so they can be validated. No changes to the core framework besides an OF
node refcount bump that never got decremented.

New Drivers:
 - 5L35023 variant of Versa 3 clock generator
 - Various Qualcomm clk controllers: IPQ CMN PLL, SM6115 LPASS, SM750 global,
   tcsr, rpmh, and display. X Plus GPU and global. QCS615 rpmh and MSM8937 and
   MSM8940 RPM.
 - Qualcomm Pongo and Taycan Alpha PLLs
 - Qualcomm IPQ5424 NoC-related interconnect clks
 - Renesas RZ/G3E (R9A09G047) SoC clk driver
 - SAMA7D65 SoC clk driver
 - Samsung Exynos990 SoC clk driver

----------------------------------------------------------------
Abel Vesa (1):
      clk: qcom: gcc-x1e80100: Do not turn off usb_2 controller GDSC

Amit Pundir (1):
      clk: qcom: gcc-sdm845: Do not use shared clk_ops for QUPs

Anastasia Belova (1):
      clk: qcom: clk-rpmh: prevent integer overflow in recalc_rate

Andre Przywara (1):
      clk: sunxi-ng: h616: Reparent CPU clock during frequency changes

Andreas Kemnade (2):
      dt-bindings: clock: ti: Convert gate.txt to json-schema
      dt-bindings: clock: ti: Convert composite.txt to json-schema

Bartosz Golaszewski (1):
      clk: davinci: remove platform data struct

Biju Das (7):
      dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
      dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II EVK
      dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
      clk: renesas: rzv2h: Add MSTOP support
      clk: renesas: rzv2h: Add support for RZ/G3E SoC
      clk: renesas: r9a09g047: Add CA55 core clocks
      clk: renesas: r9a09g047: Add I2C clocks/resets

Binbin Zhou (2):
      clk: clk-loongson2: Switch to use devm_clk_hw_register_fixed_rate_parent_data()
      clk: clk-loongson2: Fix the number count of clk provider

Bjorn Andersson (5):
      Merge branch '20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com' into clk-for-6.14
      Merge branch '20241221-topic-x1p4_clk-v1-2-dbaeccb74884@oss.qualcomm.com' into clk-for-6.14
      Merge branch '20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com' into clk-for-6.14
      Merge branch '20250106-sm8750-dispcc-v2-1-6f42beda6317@linaro.org' into clk-for-6.14
      Merge branch '20250103-qcom_ipq_cmnpll-v8-1-c89fb4d4849d@quicinc.com' into clk-for-6.14

Bo Gan (1):
      clk: analogbits: Fix incorrect calculation of vco rate delta

Bryan O'Donoghue (2):
      clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the parent GDSC of subordinate GDSCs
      dt-bindings: clock: move qcom,x1e80100-camcc to its own file

Changhuang Liang (1):
      clk: starfive: Make _clk_get become a common helper function

Christian Marangi (4):
      clk: en7523: Rework clock handling for different clock numbers
      dt-bindings: clock: drop NUM_CLOCKS define for EN7581
      dt-bindings: clock: add ID for eMMC for EN7581
      clk: en7523: Add clock for eMMC for EN7581

Claudiu Beznea (8):
      clk: renesas: r9a08g045: Add clocks, resets and power domains support for SSI
      clk: renesas: r9a08g045: Add clock, reset and power domain for the remaining SCIFs
      dt-bindings: clk: at91: Add clock IDs for the slow clock controller
      clk: at91: sckc: Use SCKC_{TD, MD}_SLCK IDs for clk32k clocks
      clk: renesas: r9a08g045: Add clocks, resets and power domain support for the ADC IP
      clk: versaclock3: Prepare for the addition of 5L35023 device
      dt-bindings: clock: versaclock3: Document 5L35023 Versa3 clock generator
      clk: versaclock3: Add support for the 5L35023 variant

Cody Eksal (1):
      clk: sunxi-ng: a100: enable MMC clock reparenting

Colin Ian King (2):
      clk: lmk04832: make read-only const arrays static
      clk: ep93xx: make const read-only arrays static

Cristian Ciocaltea (3):
      soc: mediatek: pwrap: Switch to devm_clk_bulk_get_all_enabled()
      PCI: exynos: Switch to devm_clk_bulk_get_all_enabled()
      clk: Drop obsolete devm_clk_bulk_get_all_enable() helper

Dan Carpenter (3):
      clk: mmp: pxa1908-mpmu: Fix a NULL vs IS_ERR() check
      clk: mmp: pxa1908-apbcp: Fix a NULL vs IS_ERR() check
      clk: mmp: pxa1908-apbc: Fix NULL vs IS_ERR() check

Daniel Golle (5):
      clk: mediatek: mt2701-vdec: fix conversion to mtk_clk_simple_probe
      clk: mediatek: mt2701-aud: fix conversion to mtk_clk_simple_probe
      clk: mediatek: mt2701-bdp: add missing dummy clk
      clk: mediatek: mt2701-mm: add missing dummy clk
      clk: mediatek: mt2701-img: add missing dummy clk

Daniil Titov (4):
      dt-bindings: clock: qcom,rpmcc: Add MSM8937 compatible
      clk: qcom: smd-rpm: Add clocks for MSM8937
      dt-bindings: clock: qcom,rpmcc: Add MSM8940 compatible
      clk: qcom: smd-rpm: Add clocks for MSM8940

Dario Binacchi (6):
      dt-bindings: clock: st,stm32mp1-rcc: fix reference paths
      dt-bindings: clock: st,stm32mp1-rcc: complete the reference path
      dt-bindings: clock: convert stm32 rcc bindings to json-schema
      dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
      clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
      clk: stm32f4: support spread spectrum clock generation

Dharma Balasubiramani (2):
      dt-bindings: clocks: atmel,at91sam9x5-sckc: add sama7d65
      dt-bindings: clock: Add SAMA7D65 PMC compatible string

Dmitry Baryshkov (4):
      dt-bindings: clock: qcom,mmcc: support LVDS PLL input for apq8064
      dt-bindings: clock: qcom,mmcc-msm8960: add LCDC-related clocks
      clk: qcom: rcg: add 1/1 pixel clock ratio
      clk: qcom: mmcc-msm8960: handle LVDS clock

Dom Cobley (3):
      clk: bcm: rpi: Add ISP to exported clocks
      clk: bcm: rpi: Allow cpufreq driver to also adjust gpu clocks
      clk: bcm: rpi: Enable minimize for all firmware clocks

Drew Fustini (3):
      clk: thead: Fix clk gate registration to pass flags
      clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot
      clk: thead: Fix cpu2vp_clk for TH1520 AP_SUBSYS clocks

Dzmitry Sankouski (3):
      clk: qcom: clk-rcg2: document calc_rate function
      clk: qcom: clk-rcg2: split __clk_rcg2_configure function
      clk: qcom: gcc-sdm845: Add general purpose clock ops

Ethan Carter Edwards (1):
      clk: ti: use kcalloc() instead of kzalloc()

Gabor Juhos (6):
      clk: qcom: apss-ipq-pll: drop 'alpha_en_mask' from IPQ5018 PLL config
      clk: qcom: apps-ipq-pll: drop 'alpha_en_mask' from IPQ5332 PLL config
      clk: qcom: gcc-ipq6018: remove alpha values from NSS Crypto PLL's config
      clk: qcom: dispcc-qcm2290: remove alpha values from disp_cc_pll0_config
      clk: qcom: dispcc-sm6115: remove alpha values from disp_cc_pll0_config
      clk: qcom: clk-alpha-pll: fix alpha mode configuration

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag1' into renesas-clk-for-v6.14
      dt-bindings: clock: renesas,r9a08g045-vbattb: Fix include guard

Heiko Stuebner (1):
      clk: rockchip: rk3588: make refclko25m_ethX critical

Igor Belwon (3):
      dt-bindings: clock: samsung: Add Exynos990 SoC CMU bindings
      clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
      clk: samsung: Introduce Exynos990 clock controller driver

Jacopo Mondi (2):
      clk: renesas: r8a779g0: Add FCPVX clocks
      clk: renesas: r8a779g0: Add VSPX clocks

Javier Carrasco (1):
      clk: renesas: cpg-mssr: Fix 'soc' node handling in cpg_mssr_reserved_init()

Joe Hattori (1):
      clk: fix an OF node reference leak in of_clk_get_parent_name()

Konrad Dybcio (6):
      dt-bindings: clock: qcom,x1e80100-gpucc: Extend for X1P42100
      dt-bindings: clock: qcom,x1e80100-gcc: Add X1P42100
      clk: qcom: Add X1P42100 GPUCC driver
      clk: qcom: Make GCC_8150 depend on QCOM_GDSC
      dt-bindings: clock: Add Qualcomm SM6115 LPASS clock controller
      clk: qcom: Add SM6115 LPASSCC

Krzysztof Kozlowski (9):
      dt-bindings: clock: qcom,sc7280-lpasscorecc: order properties to match convention
      dt-bindings: clock: qcom,sc7280-lpasscorecc: add top-level constraints
      clk: qcom: rpm: simplify locking with guard()
      clk: qcom: smd-rpm: simplify locking with guard()
      clk: qcom: spmi-pmic-div: simplify locking with guard()
      dt-bindings: clock: qcom,sm8550-dispcc: Add SM8750 DISPCC
      clk: qcom: clk-alpha-pll: Add Pongo PLL
      clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller
      clk: Use str_enable_disable-like helpers

Lad Prabhakar (4):
      clk: renesas: rzv2h: Add selective Runtime PM support for clocks
      clk: renesas: r9a09g057: Add support for PLLVDO, CRU clocks, and resets
      clk: renesas: r9a09g057: Add reset entry for SYS
      clk: renesas: r9a09g057: Add clock and reset entries for GIC

Lubomir Rintel (1):
      clk: mmp2: call pm_genpd_init() only after genpd.name is set

Luca Weiss (2):
      clk: qcom: gcc-sm6350: Add missing parent_map for two clocks
      clk: qcom: dispcc-sm6350: Add missing parent_map for a clock

Lukas Bulwahn (1):
      clk: qcom: Select CLK_X1E80100_GCC in config CLK_X1P42100_GPUCC

Luo Jie (2):
      dt-bindings: clock: qcom: Add CMN PLL clock controller for IPQ SoC
      clk: qcom: Add CMN PLL clock controller driver for IPQ SoC

Manikanta Mylavarapu (4):
      clk: qcom: ipq5424: remove apss_dbg clock
      dt-bindings: clock: qcom: gcc-ipq5424: remove apss_dbg clock macro
      dt-bindings: clock: qcom: gcc-ipq5424: add gcc_xo_clk macro
      clk: qcom: ipq5424: add gcc_xo_clk

Manivannan Sadhasivam (2):
      clk: qcom: gcc-sm8550: Do not turn off PCIe GDSCs during gdsc_disable()
      clk: qcom: gcc-sm8650: Do not turn off PCIe GDSCs during gdsc_disable()

Marek Vasut (2):
      clk: imx8mp: Fix clkout1/2 support
      clk: imx: pll14xx: Add 208 MHz and 416 MHz entries for PLL1416x

Maxime Ripard (2):
      clk: bcm: rpi: Create helper to retrieve private data
      clk: bcm: rpi: Add disp clock

Peng Fan (1):
      clk: imx: Apply some clks only for i.MX93

Richard Acayan (1):
      dt-bindings: clock: qcom,sdm845-camcc: add sdm670 compatible

Rohit Visavalia (2):
      dt-bindings: clock: xilinx: Convert VCU bindings to dtschema
      dt-bindings: clock: xilinx: Add reset GPIO for VCU

Ryan Wanner (1):
      clk: at91: sama7d65: add sama7d65 pmc driver

Satya Priya Kakitapalli (1):
      clk: qcom: gcc-mdm9607: Fix cmd_rcgr offset for blsp1_uart6 rcg

Sebastian Reichel (5):
      clk: rockchip: support clocks registered late
      clk: rockchip: rk3588: register GATE_LINK later
      clk: rockchip: expose rockchip_clk_set_lookup
      clk: rockchip: implement linked gate clock support
      clk: rockchip: rk3588: drop RK3588_LINKED_CLK

Sergio Paracuellos (1):
      clk: ralink: mtmips: remove duplicated 'xtal' clock for Ralink SoC RT3883

Shengjiu Wang (3):
      dt-bindings: clock: imx93: Add SPDIF IPG clk
      clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
      arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as SPDIF IPG clock

Shubhrajyoti Datta (1):
      clk: clocking-wizard: calculate dividers fractional parts

Stephen Boyd (14):
      Merge tag 'renesas-clk-for-v6.14-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'samsung-clk-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-samsung
      Merge tag 'socfpga_clk_update_for_v6.14' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into clk-socfpga
      Merge tag 'clk-microchip-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into clk-microchip
      Merge tag 'renesas-clk-for-v6.14-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'sunxi-clk-fixes-for-6.13' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes
      Merge tag 'sunxi-clk-for-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-allwinner
      Merge tag 'clk-imx-6.14' of git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux into clk-imx
      Merge tag 'qcom-clk-for-6.14' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-qcom
      Merge tag 'v6.14-rockchip-clk1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-rockchip
      Merge branches 'clk-cleanup', 'clk-renesas', 'clk-mediatek', 'clk-samsung' and 'clk-socfpga' into clk-next
      Merge branches 'clk-microchip', 'clk-xilinx', 'clk-allwinner', 'clk-imx' and 'clk-qcom' into clk-next
      Merge branches 'clk-airoha', 'clk-rockchip', 'clk-stm', 'clk-thead' and 'clk-bcm' into clk-next
      Merge branch 'clk-fixes' into clk-next

Taniya Das (12):
      dt-bindings: clock: qcom: Add QCS615 GCC clocks
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS615
      clk: qcom: rpmhcc: Add support for QCS615 Clocks
      clk: qcom: gcc: Add support for QCS615 GCC clocks
      dt-bindings: clock: qcom: Add SM8750 GCC
      dt-bindings: clock: qcom: Document the SM8750 TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for SM8750
      clk: qcom: rpmh: Sort the match table alphabetically
      clk: qcom: rpmh: Add support for SM8750 rpmh clocks
      clk: qcom: clk-alpha-pll: Add support for controlling Taycan PLLs
      clk: qcom: Add support for GCC on SM8750
      clk: qcom: Add TCSR clock driver for SM8750

Thorsten Blum (1):
      clk: socfpga: arria10: Optimize local variables in clk_pll_recalc_rate()

Tomi Valkeinen (1):
      clk: renesas: r8a779h0: Add display clocks

Varadarajan Narayanan (2):
      dt-bindings: interconnect: Add Qualcomm IPQ5424 support
      clk: qcom: ipq5424: Use icc-clk for enabling NoC related clocks

Vasily Khoruzhick (3):
      dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
      clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
      clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent

Wolfram Sang (2):
      clk: renesas: r9a06g032: Add restart handler
      clk: renesas: r9a06g032: Use BIT macro consistently

 .../bindings/clock/atmel,at91rm9200-pmc.yaml       |    2 +
 .../bindings/clock/atmel,at91sam9x5-sckc.yaml      |    1 +
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   77 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml       |    4 +
 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |   59 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    4 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |   27 +-
 .../bindings/clock/qcom,sdm845-camcc.yaml          |    6 +-
 .../bindings/clock/qcom,sm6115-lpasscc.yaml        |   46 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    2 -
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    1 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    4 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |   62 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |   74 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |    6 +-
 .../devicetree/bindings/clock/renesas,5p35023.yaml |    1 +
 .../bindings/clock/renesas,rzv2h-cpg.yaml          |   15 +-
 .../bindings/clock/samsung,exynos990-clock.yaml    |  121 +
 .../devicetree/bindings/clock/st,stm32-rcc.txt     |  138 -
 .../devicetree/bindings/clock/st,stm32-rcc.yaml    |  144 +
 .../devicetree/bindings/clock/st,stm32mp1-rcc.yaml |    6 +-
 .../devicetree/bindings/clock/ti/composite.txt     |   55 -
 .../devicetree/bindings/clock/ti/gate.txt          |  105 -
 .../bindings/clock/ti/ti,composite-clock.yaml      |   82 +
 .../bindings/clock/ti/ti,gate-clock.yaml           |  125 +
 .../devicetree/bindings/clock/xlnx,vcu.yaml        |   59 +
 .../devicetree/bindings/reset/st,stm32-rcc.txt     |    2 +-
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   17 +
 .../devicetree/bindings/soc/xilinx/xlnx,vcu.txt    |   26 -
 arch/arm64/boot/dts/freescale/imx93.dtsi           |    2 +-
 drivers/clk/analogbits/wrpll-cln28hpc.c            |    2 +-
 drivers/clk/at91/Makefile                          |    1 +
 drivers/clk/at91/clk-master.c                      |    2 +-
 drivers/clk/at91/clk-sam9x60-pll.c                 |    2 +-
 drivers/clk/at91/pmc.c                             |    1 +
 drivers/clk/at91/sama7d65.c                        | 1375 ++++++++
 drivers/clk/at91/sckc.c                            |   24 +-
 drivers/clk/bcm/clk-kona.c                         |    3 +-
 drivers/clk/bcm/clk-raspberrypi.c                  |   33 +-
 drivers/clk/clk-en7523.c                           |   24 +-
 drivers/clk/clk-ep93xx.c                           |    6 +-
 drivers/clk/clk-lmk04832.c                         |    4 +-
 drivers/clk/clk-loongson2.c                        |    9 +-
 drivers/clk/clk-nomadik.c                          |    5 +-
 drivers/clk/clk-stm32f4.c                          |  155 +-
 drivers/clk/clk-versaclock3.c                      |   67 +-
 drivers/clk/clk-xgene.c                            |    4 +-
 drivers/clk/clk.c                                  |    4 +-
 drivers/clk/davinci/pll.c                          |   32 +-
 drivers/clk/imx/clk-imx8mp.c                       |    5 +-
 drivers/clk/imx/clk-imx93.c                        |   32 +-
 drivers/clk/imx/clk-pll14xx.c                      |    2 +
 drivers/clk/mediatek/clk-mt2701-aud.c              |   10 +
 drivers/clk/mediatek/clk-mt2701-bdp.c              |    1 +
 drivers/clk/mediatek/clk-mt2701-img.c              |    1 +
 drivers/clk/mediatek/clk-mt2701-mm.c               |    1 +
 drivers/clk/mediatek/clk-mt2701-vdec.c             |    1 +
 drivers/clk/mmp/clk-pxa1908-apbc.c                 |    4 +-
 drivers/clk/mmp/clk-pxa1908-apbcp.c                |    4 +-
 drivers/clk/mmp/clk-pxa1908-mpmu.c                 |    4 +-
 drivers/clk/mmp/pwr-island.c                       |    2 +-
 drivers/clk/qcom/Kconfig                           |   65 +
 drivers/clk/qcom/Makefile                          |    7 +
 drivers/clk/qcom/apss-ipq-pll.c                    |    3 +-
 drivers/clk/qcom/camcc-x1e80100.c                  |    7 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  181 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   13 +
 drivers/clk/qcom/clk-rcg.c                         |    1 +
 drivers/clk/qcom/clk-rcg.h                         |    1 +
 drivers/clk/qcom/clk-rcg2.c                        |  198 +-
 drivers/clk/qcom/clk-rpm.c                         |   27 +-
 drivers/clk/qcom/clk-rpmh.c                        |   50 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |   81 +-
 drivers/clk/qcom/clk-spmi-pmic-div.c               |   13 +-
 drivers/clk/qcom/dispcc-qcm2290.c                  |    2 -
 drivers/clk/qcom/dispcc-sm6115.c                   |    2 -
 drivers/clk/qcom/dispcc-sm6350.c                   |    7 +-
 drivers/clk/qcom/dispcc-sm8750.c                   | 1963 ++++++++++++
 drivers/clk/qcom/gcc-ipq5424.c                     |   57 +-
 drivers/clk/qcom/gcc-ipq6018.c                     |    4 +-
 drivers/clk/qcom/gcc-mdm9607.c                     |    2 +-
 drivers/clk/qcom/gcc-qcs615.c                      | 3034 ++++++++++++++++++
 drivers/clk/qcom/gcc-sdm845.c                      |   43 +-
 drivers/clk/qcom/gcc-sm6350.c                      |   22 +-
 drivers/clk/qcom/gcc-sm8550.c                      |    8 +-
 drivers/clk/qcom/gcc-sm8650.c                      |    8 +-
 drivers/clk/qcom/gcc-sm8750.c                      | 3274 ++++++++++++++++++++
 drivers/clk/qcom/gcc-x1e80100.c                    |    2 +-
 drivers/clk/qcom/gpucc-x1p42100.c                  |  587 ++++
 drivers/clk/qcom/ipq-cmn-pll.c                     |  435 +++
 drivers/clk/qcom/lpasscc-sm6115.c                  |   85 +
 drivers/clk/qcom/mmcc-msm8960.c                    |   61 +-
 drivers/clk/qcom/tcsrcc-sm8750.c                   |  141 +
 drivers/clk/ralink/clk-mtmips.c                    |    1 -
 drivers/clk/renesas/Kconfig                        |    7 +-
 drivers/clk/renesas/Makefile                       |    1 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |    4 +
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            |    4 +
 drivers/clk/renesas/r9a06g032-clocks.c             |   29 +-
 drivers/clk/renesas/r9a08g045-cpg.c                |   47 +
 drivers/clk/renesas/r9a09g047-cpg.c                |  150 +
 drivers/clk/renesas/r9a09g057-cpg.c                |  181 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |    2 +-
 drivers/clk/renesas/rzv2h-cpg.c                    |  198 +-
 drivers/clk/renesas/rzv2h-cpg.h                    |   39 +-
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-rk3588.c                  |  126 +-
 drivers/clk/rockchip/clk.c                         |  102 +-
 drivers/clk/rockchip/clk.h                         |   40 +
 drivers/clk/rockchip/gate-link.c                   |   85 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos990.c                | 1343 ++++++++
 drivers/clk/samsung/clk-pll.c                      |   14 +-
 drivers/clk/samsung/clk-pll.h                      |    3 +
 drivers/clk/socfpga/clk-pll-a10.c                  |    2 +-
 drivers/clk/starfive/clk-starfive-jh7100-audio.c   |   14 +-
 drivers/clk/starfive/clk-starfive-jh7110-aon.c     |   14 +-
 drivers/clk/starfive/clk-starfive-jh7110-isp.c     |   14 +-
 drivers/clk/starfive/clk-starfive-jh7110-stg.c     |   14 +-
 drivers/clk/starfive/clk-starfive-jh7110-sys.c     |   14 +-
 drivers/clk/starfive/clk-starfive-jh7110-vout.c    |   14 +-
 drivers/clk/starfive/clk-starfive-jh71x0.c         |   12 +
 drivers/clk/starfive/clk-starfive-jh71x0.h         |    4 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c             |    6 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c              |   13 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h              |    2 -
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c             |   28 +-
 drivers/clk/thead/clk-th1520-ap.c                  |   13 +-
 drivers/clk/ti/mux.c                               |    2 +-
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c         |  121 +-
 drivers/pci/controller/dwc/pci-exynos.c            |    2 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c               |    4 +-
 include/dt-bindings/clock/at91.h                   |    8 +
 include/dt-bindings/clock/en7523-clk.h             |    2 +-
 include/dt-bindings/clock/imx93-clock.h            |    1 +
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |   22 +
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |    2 +-
 include/dt-bindings/clock/qcom,mmcc-msm8960.h      |    2 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |  211 ++
 include/dt-bindings/clock/qcom,sm6115-lpasscc.h    |   15 +
 include/dt-bindings/clock/qcom,sm8750-dispcc.h     |  112 +
 include/dt-bindings/clock/qcom,sm8750-gcc.h        |  226 ++
 include/dt-bindings/clock/qcom,sm8750-tcsr.h       |   15 +
 include/dt-bindings/clock/qcom,x1e80100-gpucc.h    |   13 +
 .../dt-bindings/clock/renesas,r9a08g045-vbattb.h   |    6 +-
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h  |   21 +
 include/dt-bindings/clock/samsung,exynos990.h      |  236 ++
 include/dt-bindings/clock/stm32fx-clock.h          |    2 +-
 include/dt-bindings/clock/sun50i-a64-ccu.h         |    2 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |   24 +
 include/linux/clk.h                                |    9 -
 include/linux/platform_data/clk-davinci-pll.h      |   21 -
 include/soc/bcm2835/raspberrypi-firmware.h         |    1 +
 155 files changed, 16176 insertions(+), 927 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-lpasscc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/composite.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/gate.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
 create mode 100644 drivers/clk/at91/sama7d65.c
 create mode 100644 drivers/clk/qcom/dispcc-sm8750.c
 create mode 100644 drivers/clk/qcom/gcc-qcs615.c
 create mode 100644 drivers/clk/qcom/gcc-sm8750.c
 create mode 100644 drivers/clk/qcom/gpucc-x1p42100.c
 create mode 100644 drivers/clk/qcom/ipq-cmn-pll.c
 create mode 100644 drivers/clk/qcom/lpasscc-sm6115.c
 create mode 100644 drivers/clk/qcom/tcsrcc-sm8750.c
 create mode 100644 drivers/clk/renesas/r9a09g047-cpg.c
 create mode 100644 drivers/clk/rockchip/gate-link.c
 create mode 100644 drivers/clk/samsung/clk-exynos990.c
 create mode 100644 include/dt-bindings/clock/qcom,ipq-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs615-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-lpasscc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-tcsr.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g047-cpg.h
 create mode 100644 include/dt-bindings/clock/samsung,exynos990.h
 create mode 100644 include/dt-bindings/interconnect/qcom,ipq5424.h
 delete mode 100644 include/linux/platform_data/clk-davinci-pll.h

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
