Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D72A3FFAC6;
	Wed, 26 Aug 2026 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763391; cv=none; b=YA8F5W7DaPbw8Z7eU+x4J2PytESSk0tRFPNIL8d6+P9kN9mbXkyi8/OyHtwoY8rivDtmG3720IVwQwlzEnCVNtAbeqh5/5HesamcAmdJeKTnhtPuZAh4pPUNGl72kOJM6ThiscU/dPtAITQJ+1FzCCHlHdX48gK3szxnoa7x2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763391; c=relaxed/simple;
	bh=dNaFFS/gJcGyt1k+16jFHY6+Uj1zRSiHAfjrg3dFOXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=opa2y/WupbyLJ6c2Il4ksAkllxl1CqeVG9zzmMxLCT5m75r3tnQyyr6YMY27eXORD1fHkEafE4ky4A0jQ9yQxAIDFP3mfcRwX4pcJ04K0IQvJfHoTR0TQukRlp1CdDmwbM0EBUN0tw/TZFubWPrtrZ1ecrmEP1bKw7tsTFbqkPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaB560+d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaB560+d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2755B1F000E9;
	Wed, 26 Aug 2026 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787763373;
	bh=L+OHfAgIO1rrepgxvIpqp5MFavWD119/m0Y40lxpcyM=;
	h=From:To:Cc:Subject:Date;
	b=OaB560+dN14WBtNismvjGH3nItPBo7/GkWZiH2gJDiz1SPazc4nDFMb5ngYoQecIO
	 GRrn5vqtolDj0i2QD5OoGU6LJPpTcfh6GkoDXfZDkRx7xUMCx7Xjx4luNah4zcaW+M
	 IH1N+yX+53Qdd84EFYpo+FzAqdUq6sUDQXUWfVgMCHtQV1CcR7CaZD1A5kdlXFGgtT
	 G5dVBWMhSdT8cqriL3cumQysDHloMfe2yiEbuIRBaNfD8GZgMkn74pnZPuXN7EUP0n
	 Z0L2FmMUoeZ/3puOGxCSXETr9CRiFt2OFENsSiZf6T4zzIQTK7UcDzFNES7+xGO96L
	 Ia/wVj9RCBCmw==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for the merge window
Date: Wed, 26 Aug 2026 09:56:10 -0700
Message-ID: <20260826165611.236321-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 618949bb99d72561e36e1373d504d891d0117cd7:

  dt-bindings: clock: qcom: Add Glymur camera clock controller (2026-07-11 10:19:09 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to dd8eb789f18c4c600f28e61176a02bcf3b790117:

  Merge branches 'clk-pile' and 'clk-microchip' into clk-next (2026-08-20 16:51:47 -0700)

----------------------------------------------------------------
Mostly the usual clk driver updates and new SoC additions plus non-critical
data fixes for things that weren't used yet. One thing that's new here in the
core is SSC spread spectrum support (SSC) in the clk provider API. The idea is
that DT authors will configure SSC for certain clks and they'll be configured
at clk provider registration time or when a consumer device is probed, similar
to how we handle assigned clk rates or parents.

On the clk driver side we have Qualcomm adding almost half the diff because
they add support for 4 different SoCs and then a long tail of other SoCs like
Mediatek, Renesas, Rockchip, SpaceMiT, etc. add more SoC support this time
around. Luckily it's mostly clk data for these new SoCs because the actual
clk_ops are already there. Beyond the new drivers we get all the little fixups
for more compilation coverage or usage of more modern APIs. That all looks
normal.

Finally, I kinda buried the lead, I'm bringing on Brian and Jerome to help out
with maintaining the clk subsystem. The current working model is already
semi-distributed in that silicon vendors typically take care of their drivers
and send me pull requests but I'm becoming a bottleneck for new drivers and
core framework review because this has become a 100% volunteer effort on my
part. Mike is stepping down after all these years (thanks Mike!) and that jump
started the conversation around finding co-maintainers. Brian and Jerome have
graciously offered to help me with the work load, meaning in the future they'll
be sending pull requests and committing directly to the clk.git tree. They've
both been around on the list for a while, I've met them both in person, and
they've been making changes to the core clk framework along with helping review
patches so I'm pretty confident this will work well.

Core:
 - devm_clk_bulk_get_enable() consumer API
 - devm_clk_hw_register_composite_pdata() provider API
 - Spread Spectrum Clock (SSC) support via DT bindings and provider APIs
 - Divider clk rounding improved (and tested)

New Drivers:
 - Cix Sky1 audio subsystem (AUDSS)
 - UltraRISC DP1000
 - MediaTek MT8173 MFG_TOP
 - Si549
 - Aspeed AST2700 PECI
 - Airoha EN7523 PCIe
 - Rockchip RV1106
 - Mobileye EyeQ7H
 - Qualcomm Maili GCC, TCSR, RPMh, and video clks
 - Qualcomm Shikra GCC, RPM, GPU, display, and audio clks
 - Qualcomm Nord display and graphics clks
 - Qualcomm Glymur camera and EVA clks
 - Qualcomm Hawi video clks
 - Amlogic A9 AO and peripheral clks
 - Renesas R-Car X5H (R8A78000) CPG

----------------------------------------------------------------
Abel Vesa (2):
      dt-bindings: clock: qcom: glymur-gcc: Add missing CX power domain
      clk: qcom: gcc-glymur: Enable runtime PM

Akari Tsuyukusa (2):
      clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
      clk: mediatek: mt8135: Fix inverted gate control for devapc_ck

Alexander A. Klimov (1):
      clk: moxart: remove unused variables, fix refcount leak

Alexey Charkov (3):
      clk: rockchip: Fix the fractional part denominator on RK3588/RK3576 PLLs
      clk: rockchip: Fractional PLL coefficient on RK3588/RK3576 is two's complement
      clk: rockchip: rk3576: fix source muxes for SPI0..SPI4

Babanpreet Singh (1):
      clk: zynq: pll: Fix kernel-doc after determine_rate() conversion

Benoît Monin (9):
      dt-bindings: soc: mobileye: Add EyeQ7H OLB
      reset: eyeq: Add EyeQ7H compatibles
      clk: fixed-factor: Rework initialization with parent clocks
      clk: fixed-factor: Export __clk_hw_register_fixed_factor()
      clk: eyeq: Prefix the PLL registers with the PLL type
      clk: eyeq: Introduce a generic clock type
      clk: eyeq: Convert clocks declaration to eqc_clock
      clk: eyeq: Drop PLL, dividers, and fixed factors structs
      clk: eyeq: Add EyeQ7H compatibles

Bhargav Joshi (2):
      dt-bindings: clock: ti,clockdomain: Convert to DT schema
      dt-bindings: clock: ti,keystone-gate: Convert to DT schema

Biju Das (4):
      clk: renesas: r9a08g046: Add clock and reset entries for SDHI
      clk: renesas: r9a08g046: Add clock and reset entries for GE3D
      clk: renesas: r9a08g046: Add USB2.0 clock and reset entries
      dt-bindings: clock: renesas,versaclock7: Update maintainer

Bjorn Andersson (4):
      Merge branch '20260617-evacc_glymur-v2-2-905108dacaaa@oss.qualcomm.com' into clk-for-7.3
      Merge branch '20260608-shikra-gcc-rpmcc-clks-v5-2-94cefe092ee3@oss.qualcomm.com' into clk-for-7.3
      Merge branch '20260624-glymur_camcc-v5-1-a321df74b1a1@oss.qualcomm.com' into clk-for-7.3
      Merge branch '20260707-b4-ipq9650_refgen_clocks-v1-1-e070624d03d2@oss.qualcomm.com' into clk-for-7.3

Brian Masney (21):
      clk: add kernel docs for the core flags
      clk: add kernel docs for struct clk_core
      docs: clk: include some identifiers to keep documentation up to date
      clk: test: convert constants to use HZ_PER_MHZ
      clk: imx: scu: drop redundant init.ops variable assignment
      clk: add clk_determine_rate_noop()
      clk: hisilicon: hi3660-stub: use clk_determine_rate_noop()
      clk: imx: scu: use clk_determine_rate_noop()
      clk: qcom: rpm: use clk_determine_rate_noop()
      clk: qcom: rpmh: use clk_determine_rate_noop()
      clk: qcom: smd-rpm: use clk_determine_rate_noop()
      clk: renesas: rzg2l-cpg: use clk_determine_rate_noop()
      clk: rp1: use clk_determine_rate_noop()
      clk: samsung: acpm: use clk_determine_rate_noop()
      clk: scpi: use clk_determine_rate_noop()
      clk: sprd: use clk_determine_rate_noop()
      phy: mediatek: phy-mtk-hdmi-mt2701: use clk_determine_rate_noop()
      pmdomain: mediatek: airoha: use clk_determine_rate_noop()
      pmdomain: mediatek: mtk-mfg: use clk_determine_rate_noop()
      clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
      MAINTAINERS: Add Brian Masney and Jerome Brunet as co-maintainers for clk subsystem

Chen Ni (2):
      clk: mmp: pxa1908-apbc: Remove unneeded semicolon
      clk: mmp: pxa1908-apbcp: Remove unneeded semicolon

Chen-Yu Tsai (2):
      dt-bindings: clock: mediatek: Add mt8173 mfgtop
      clk: mediatek: Add mt8173-mfgtop driver

Christian Marangi (3):
      clk: en7523: reset PCIE HB on init for AN7581
      dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
      clk: en7523: add support for dedicated PCIe PERSTOUT reset

Claudiu Beznea (1):
      clk: r9a08g045: Add clocks and resets for CAN-FD

Colin Foster (3):
      clk: clocking-wizard: fix clock difference detection
      clk: clocking-wizard: optimize clock search
      clk: clocking-wizard: remove 20kHz restriction

Dan Carpenter (1):
      clk: document that clk_get_parent() returns NULL

David Carlier (1):
      clk: canaan: Clear rate fields before reprogramming dividers

David Laight (1):
      drivers/clk/clk_test: Use strscpy() to copy the test description

Denzeel Oliva (3):
      dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
      clk: samsung: exynos990: Fix PERIS gate clock parents

Dmitry Baryshkov (2):
      clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video GDSC
      clk: qcom: gcc-qcm2290: don't park QUP RCGs upon registration

Dmitry Osipenko (1):
      clk: tegra: support 48MHz clock for pll_p_out1

Eduard Bostina (1):
      dt-bindings: clock: ti: Convert APLL clock to DT schema

Geert Uytterhoeven (6):
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag7' into renesas-clk-for-v7.3
      dt-bindings: clock: Document Renesas R-Car X5H Clock Pulse Generator
      Merge tag 'renesas-r8a78000-dt-binding-defs-tag2' into renesas-clk-for-v7.3
      clk: renesas: Add R-Car X5H CPG driver
      clk: ti: Make sure clk_init_data is fully initialized
      clk: visconti: Make sure clk_init_data is fully initialized

Guangshuo Li (1):
      clk: tegra: tegra124-emc: put EMC node on register failure

Heiko Stuebner (2):
      clk: rockchip: rk3588: Don't change PLL rates when setting dclk_vop2_src
      clk: rockchip: rk3588: Allow VP2 the same sourcing options as other VPs

Herman van Hazendonk (3):
      clk: qcom: gdsc: propagate gdsc_check_status() errors from gdsc_poll_status
      clk: qcom: gdsc: propagate gdsc_enable() failure for ALWAYS_ON domains
      clk: qcom: gdsc: tear down per-domain genpds in gdsc_unregister()

Herve Codina (1):
      clk: lan966x: Add MCHP_LAN966X_PCI dependency

Imran Shaik (20):
      clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2 clocks support on Agatti
      clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC
      clk: qcom: gcc-shikra: Add additional frequencies for EMAC RGMII clocks
      clk: qcom: Fix test_ctl_hi field for DEFAULT_EVO PLLs
      dt-bindings: clock: qcom: Add Qualcomm Shikra AudioCoreCC and AudioCoreCSR
      clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
      dt-bindings: clock: qcom,qcm2290-dispcc: Add missing power-domains property
      clk: qcom: gcc-qcm2290: Keep the critical clocks always-on from probe
      clk: qcom: dispcc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: dispcc-qcm2290: Enable runtime PM support
      clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for DISPCC and GPUCC GDSCs
      clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs
      clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC *wait_val values
      clk: qcom: gpucc-qcm2290: Drop pm_clk handling
      clk: qcom: gpucc-qcm2290: Move to the latest common qcom_cc_probe() model
      clk: qcom: gpucc-qcm2290: Keep the critical clocks always-on from probe
      clk: qcom: gpucc-qcm2290: Park RCG's clk source at XO during disable
      dt-bindings: clock: qcom: Add Qualcomm Shikra Display clock controller
      dt-bindings: clock: qcom: Add Qualcomm Shikra GPU clock controller
      clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra

Jacky Bai (1):
      clk: imx: Add audio PLL debugfs for K-divider control

Jagadeesh Kona (5):
      clk: qcom: gdsc: Add custom disable callback for GX GDSC
      clk: qcom: camcc-glymur: Add camera clock controller driver
      clk: qcom: camcc-glymur: Add const qualifier for driver_data & CBCRs list
      dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
      clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

Jerome Brunet (13):
      dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: fix ccu probe clock unregister on error
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: mux: remove unneeded export
      clk: sunxi-ng: mux: fix determine helper rate propagation
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate
      clk: sunxi-ng: sun6i-rtc: add a733 support
      clk: mvebu: clean-up simple provider misuse of the consumer API
      clk: st: clean-up simple provider misuse of the consumer API
      clk: tegra: clean-up simple provider misuse of the consumer API
      clk: qcom: clean-up simple provider misuse of the consumer API

Jia Wang (3):
      clk: composite: Export devm composite pdata helper
      dt-bindings: clock: ultrarisc: Add DP1000 Clock Controller
      clk: ultrarisc: Add DP1000 clock driver

Jian Hu (4):
      dt-bindings: clock: Add Amlogic A9 AO clock controller
      clk: amlogic: Add A9 AO clock controller driver
      dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      clk: amlogic: Add A9 peripherals clock controller driver

Joakim Zhang (4):
      dt-bindings: soc: cix: add sky1 audss cru controller
      clk: cix: add sky1 audss clock controller
      reset: cix: add sky1 audss auxiliary reset driver
      arm64: dts: cix: sky1: add audss cru

Joey Lu (3):
      clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
      clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
      clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic

John Madieu (2):
      dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
      clk: renesas: r9a09g047: Add audio clock and reset support

Jon Hunter (1):
      clk: tegra: Support unique names for multi-socket platforms

Junhui Liu (1):
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration

Kathiravan Thirumoorthy (3):
      clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
      dt-bindings: clock: qcom: Add IPQ9650 REFGEN clock IDs
      clk: qcom: ipq9650: Add clocks for the REFGEN block

Kostas Damaskinakis (1):
      clk: eswin: Zero-initialize stack-allocated clk_init_data

Krzysztof Kozlowski (11):
      clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
      clk: qcom: Make important ARM64 drivers default
      clk: qcom: Make important ARM32 drivers default
      clk: qcom: Add defaults for desired arm64 drivers
      clk: qcom: camcc-x1p42100: Constify qcom_cc_driver_data and list of critical CBCR registers
      clk: qcom: videocc-x1p42100: Constify qcom_cc_driver_data and list of critical CBCR registers
      dt-bindings: clock: qcom,sm8450-camcc: Drop qcom,sc8280xp-camcc from "if" block
      dt-bindings: clock: qcom,sm8450-camcc: Require required-opps on SM8750
      dt-bindings: clock: qcom,sm8450-video: Require required-opps on X1E80100
      dt-bindings: clock: Correct white-space style

Lad Prabhakar (9):
      dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
      dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC clock ID
      clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX handling
      clk: divider: Fix clk_divider_bestdiv() returning min rate for large rate requests
      clk: renesas: cpg-mssr: Implement dedicated MSTP delay logic for RZ/T2H LCDC and RTC
      clk: renesas: r9a09g077: Add RTC clocks
      clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculations
      clk: renesas: rzv2h-cpg: Extract PLL calculation helpers into shared library
      clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H display pipeline

Lin Li (2):
      dt-bindings: clock: qcom: Add Hawi video clock controller
      clk: qcom: Add support for VideoCC driver for Hawi

Loic Poulain (2):
      clk: qcom: gcc-qcs8300: Use retention for PCIe power domains
      clk: qcom: gcc-qcs8300: Use retention for USB power domains

Louis-Alexis Eyraud (1):
      clk: mediatek: pllfh: Fix IO remapping leak in register_pllfhs error path

Luca Weiss (1):
      clk: qcom: Don't use all caps for Glymur GPUCC

Martin Blumenstingl (1):
      clk: meson: align gxbb_32k_clk_sel number of parents with actual count

Mathieu Dubois-Briand (2):
      clk: ti: mux: resolve parent clocks by DT index, not by name
      clk: ti: composite: resolve parent clocks by DT index, not by name

Min zhang (1):
      clk: hisilicon: reset: Use devm_kzalloc to initialize hisi_reset_controller

Myeonghun Pak (4):
      clk: versaclock7: Fix APLL clock leak on probe failure
      clk: mediatek: mt6735: Unregister PLLs on probe failure
      clk: palmas: Manage external-control prepare with devm
      clk: palmas: Use devm_of_clk_add_hw_provider()

Onur Özkan (1):
      clk: devres: fix cleanup in devm_clk_get_optional_enabled_with_rate()

Pavel Löbl (3):
      clk: clocking-wizard: fix integer overflow in rate calculation
      dt-bindings: clock: si544: add si549 compatible
      clk: si544: add support for si549

Pedro Kopper (1):
      clk: microchip: mpfs: fix regmap_update_bits() mask/val order

Peng Fan (6):
      dt-bindings: clock: Add spread spectrum definition
      clk: Introduce clk_hw_set_spread_spectrum
      clk: conf: Support assigned-clock-sscs
      clk: Add KUnit tests for assigned-clock-sscs
      clk: scmi: Introduce common header for SCMI clock interface
      clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver

Pengpeng Hou (4):
      clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
      clk: imx: imx8qxp: add missing MODULE_DEVICE_TABLE()
      clk: mediatek: mt6735-vdecsys: add missing MODULE_DEVICE_TABLE()
      clk: mediatek: mt6735-vencsys: add missing MODULE_DEVICE_TABLE()

Qiang Yu (5):
      dt-bindings: clock: qcom: Move glymur TCSR to own binding
      dt-bindings: clock: qcom,glymur-tcsr: Add mahua support
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Add regulator supplies and migrate to clk_ref helper
      clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator support

Randy Dunlap (1):
      clk: add missing function short descriptions for kernel-doc

Richard Zhu (2):
      clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
      clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95

Rob Herring (Arm) (2):
      clk: at91: Read "reg" with helper
      clk: at91: Read "reg" with helper

Rosen Penev (10):
      clk: kirkwood: use kzalloc_flex
      clk: stm32: add missing bitfield.h header
      clk: hisilicon: allow COMPILE_TEST builds
      clk: thead: allow COMPILE_TEST builds
      clk: samsung: use kzalloc_flex
      clk: samsung: cpu: use kzalloc_flex
      clk: samsung: pll: use kzalloc_flex
      clk: stm32: add missing bitfield.h header
      clk: stm32: allow STM32MP COMPILE_TEST builds
      clk: hisilicon: hi3660-stub: use devm_platform_ioremap_resource

Ryan Chen (2):
      dt-bindings: clock: ast2700: add PECI clock
      clk: aspeed: add AST2700 PECI clock

Sang-Heon Jeon (1):
      clk: remove conditional return with no effect

Shubhrajyoti Datta (1):
      clk: clocking-wizard: Program PLL CP/RES and lock parameters on reconfig

Simon Glass (2):
      dt-bindings: clock: rockchip: Add RV1106 CRU support
      clk: rockchip: Add clock controller for the RV1106

Stephan Gerhold (12):
      clk: qcom: gcc-msm8916: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-msm8939: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-mdm9607: Fix enable_reg for gcc_blsp1_sleep_clk
      clk: qcom: gcc-mdm9607: Fix halt_reg for gcc_apss_axi_clk
      clk: qcom: gcc-mdm9607: Increase delay for USB PHY reset
      clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src
      clk: qcom: gcc-mdm9607: Drop incorrect system_noc_bfdcd_clk_src
      clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL and related clocks
      dt-bindings: clock: qcom: gcc-mdm9607: Drop SYSTEM_NOC_BFDCD_CLK_SRC
      dt-bindings: clock: qcom: gcc-mdm9607: Add missing "clocks" property
      dt-bindings: clock: qcom: gcc-mdm9607: Use proper address in example
      clk: qcom: gcc-mdm9607: Drop redundant register update during probe

Stephen Boyd (17):
      Merge tag 'renesas-clk-for-v7.3-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'renesas-clk-for-v7.3-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'thead-clk-for-v7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux into clk-thead
      Merge tag 'clk-eyeq7h-7.3' of ssh://github.com/benoitmonin/linux into clk-mobileye
      Merge tag 'clk-meson-v7.3-1' of ssh://github.com/BayLibre/clk-meson into clk-amlogic
      Merge tag 'spacemit-clk-for-7.3-1' of https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux into clk-spacemit
      Merge tag 'clk-imx-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux into clk-imx
      Merge tag 'v7.3-rockchip-clk1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-rockchip
      Merge tag 'samsung-clk-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-samsung
      Merge tag 'qcom-clk-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-qcom
      Merge tag 'sunxi-clk-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-allwinner
      Merge tag 'clk-microchip-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into clk-microchip
      Merge tag 'clk-misc-for-v7.3' of ssh://github.com/masneyb/linux into clk-pile
      Merge tag 'clk-misc-round-two-for-v7.3' of ssh://github.com/masneyb/linux into clk-pile
      Merge branches 'clk-renesas', 'clk-thead', 'clk-mobileye', 'clk-amlogic' and 'clk-spacemit' into clk-next
      Merge branches 'clk-imx', 'clk-rockchip', 'clk-samsung', 'clk-qcom' and 'clk-allwinner' into clk-next
      Merge branches 'clk-pile' and 'clk-microchip' into clk-next

Suraj Gupta (1):
      clk: Add devm_clk_bulk_get_enable()

Svyatoslav Ryhel (1):
      clk: tegra: set up proper EMC clock implementation for Tegra114

Taniya Das (17):
      clk: qcom: gxclkctl: Use custom disable callback for gx_gdsc
      clk: qcom: common: ensure runtime PM suspend completes on probe
      clk: qcom: gxclkctl: Remove GX/GMxC rail votes to align with IFPC
      clk: qcom: gcc-glymur: Move EVA clocks to critical clock list
      clk: qcom: Add EVA clock controller driver for Glymur SoC
      dt-bindings: clock: qcom-rpmhcc: Add RPMH clock controller for Maili
      dt-bindings: clock: qcom: Add Maili TCSR clock controller
      dt-bindings: clock: qcom: Add Maili global clock controller
      clk: qcom: gcc-hawi: Add support for global clock controller on Maili
      clk: qcom: nord: use BRANCH_HALT_SKIP for PHY pipe clocks
      clk: qcom: negcc-nord: use clk_regmap_phy_mux for USB3 pipe clock srcs
      clk: qcom: gcc-nord: mark PCIe link clocks as critical
      clk: qcom: negcc-nord: keep GPU2 CFG clock enabled via critical CBCR
      dt-bindings: clock: qcom: Document Nord display clock controller
      clk: qcom: Add Nord display clock controller support
      dt-bindings: clock: qcom: Document Nord GPU clock controllers
      clk: qcom: gpucc: Add Nord graphics clock controller support

Tommaso Merciai (1):
      clk: renesas: r9a09g047: Add LVDS clocks and resets

Troy Mitchell (3):
      dt-bindings: soc: spacemit: k3: add i2s_sysclk, i2s_bclk_factor and i2s1_sysclk_src IDs
      clk: spacemit: k3: fix i2s clock topology
      clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers

Uwe Kleine-König (1):
      Drop Michael Turquette's clk maintainer entry

Uwe Kleine-König (The Capable Hub) (6):
      clk: clk-lmk04832: Simplify device abstraction
      clk: Use named initializers for platform_device_id arrays
      clk: si5341: Drop unused i2c driver_data
      clk: Use named initializers for arrays of i2c_device_data
      clk: qcom: Drop inclusions of <linux/mod_devicetable.h>
      clk: samsung: Don't include <linux/mod_devicetable.h>

Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

Vladimir Zapolskiy (1):
      clk: qcom: Return expected ENOMEM error on dynamic allocation failure

William Theesfeld (1):
      clk: zynq: handle kasprintf() failure in periph_clk registration

Wolfram Sang (1):
      clk: mediatek: remove unneeded 'fast_io' parameter in regmap_config

Xuyang Dong (4):
      clk: eswin: Add CLK_IGNORE_UNUSED to NoC clock
      dt-bindings: clock: Add ESWIN eic7700 HSP clock and reset generator
      clk: eswin: Add eic7700 HSP clock driver
      reset: eswin: Add eic7700 HSP reset driver

Yixun Lan (3):
      clk: spacemit: k3: fix parent clock of UFS aclk
      dt-bindings: soc: spacemit: k3: Add clock ID for UFS refclk
      clk: spacemit: k3: Add UFS refclk clock

Yu-Chun Lin (1):
      clk: bcm: kona: Stop defaulting to parent index 0 on error

longlong yan (1):
      clk/x86: pmc_atom: add kasprintf return value check


 CREDITS                                          |    4 +
 .../bindings/clock/amlogic,a9-aoclkc.yaml        |   76 +
 .../clock/amlogic,a9-peripherals-clkc.yaml       |  164 +
 .../bindings/clock/eswin,eic7700-hspcrg.yaml     |   63 +
 .../devicetree/bindings/clock/keystone-gate.txt  |   27 -
 .../bindings/clock/mediatek,mt8173-mfgtop.yaml   |   70 +
 .../bindings/clock/mediatek,pericfg.yaml         |    2 +-
 .../devicetree/bindings/clock/qcom,a53pll.yaml   |    1 +
 .../bindings/clock/qcom,gcc-mdm9607.yaml         |   18 +-
 .../bindings/clock/qcom,glymur-gcc.yaml          |    8 +
 .../bindings/clock/qcom,glymur-tcsr.yaml         |  146 +
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml |   11 +-
 .../bindings/clock/qcom,qcm2290-dispcc.yaml      |   15 +-
 .../bindings/clock/qcom,qcm2290-gpucc.yaml       |    4 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml   |   65 +-
 .../bindings/clock/qcom,shikra-audiocorecc.yaml  |   55 +
 .../bindings/clock/qcom,sm8450-camcc.yaml        |   12 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml        |    4 +
 .../bindings/clock/qcom,sm8450-videocc.yaml      |   17 +-
 .../bindings/clock/qcom,sm8550-dispcc.yaml       |    3 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml         |   34 +-
 .../bindings/clock/renesas,r8a78000-cpg.yaml     |   55 +
 .../bindings/clock/renesas,rzv2h-cpg.yaml        |    6 +
 .../bindings/clock/renesas,versaclock7.yaml      |    2 +-
 .../bindings/clock/rockchip,rv1106-cru.yaml      |   60 +
 .../devicetree/bindings/clock/silabs,si544.yaml  |   10 +-
 .../bindings/clock/st,stm32mp21-rcc.yaml         |  140 +-
 .../bindings/clock/st,stm32mp25-rcc.yaml         |  160 +-
 .../bindings/clock/ti,keystone,psc-clock.yaml    |   60 +
 .../devicetree/bindings/clock/ti/apll.txt        |   43 -
 .../devicetree/bindings/clock/ti/clockdomain.txt |   25 -
 .../bindings/clock/ti/ti,apll-clock.yaml         |   89 +
 .../bindings/clock/ti/ti,clockdomain.yaml        |   44 +
 .../bindings/clock/ti/ti,gate-clock.yaml         |    2 +-
 .../bindings/clock/ultrarisc,dp1000-clk.yaml     |   60 +
 .../bindings/clock/xlnx,clocking-wizard.yaml     |    2 +-
 .../bindings/remoteproc/ti,keystone-rproc.txt    |    2 +-
 .../reset/qcom,shikra-audiocore-csr.yaml         |   42 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml    |   13 +
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml     |   92 +
 .../soc/mobileye/mobileye,eyeq7h-olb.yaml        |  192 ++
 Documentation/driver-api/clk.rst                 |   60 +-
 Documentation/driver-api/driver-model/devres.rst |    1 +
 MAINTAINERS                                      |   23 +-
 arch/arm64/boot/dts/cix/sky1.dtsi                |   18 +
 drivers/clk/.kunitconfig                         |    1 +
 drivers/clk/Kconfig                              |   18 +-
 drivers/clk/Makefile                             |   22 +-
 drivers/clk/aspeed/clk-ast2700.c                 |   10 +
 drivers/clk/at91/dt-compat.c                     |    5 +-
 drivers/clk/bcm/clk-kona.c                       |    3 +-
 drivers/clk/cix/Kconfig                          |   16 +
 drivers/clk/cix/Makefile                         |    3 +
 drivers/clk/cix/clk-sky1-audss.c                 | 1206 +++++++
 drivers/clk/clk-bd718x7.c                        |   12 +-
 drivers/clk/clk-cdce706.c                        |    2 +-
 drivers/clk/clk-cdce925.c                        |    8 +-
 drivers/clk/clk-composite.c                      |    1 +
 drivers/clk/clk-conf.c                           |   76 +
 drivers/clk/clk-cs2000-cp.c                      |   10 +-
 drivers/clk/clk-devres.c                         |   19 +-
 drivers/clk/clk-divider.c                        |   25 +-
 drivers/clk/clk-divider_test.c                   |  153 +
 drivers/clk/clk-en7523.c                         |   43 +-
 drivers/clk/clk-eyeq.c                           | 1292 ++++---
 drivers/clk/clk-fixed-factor.c                   |   78 +-
 drivers/clk/clk-k230.c                           |    4 +
 drivers/clk/clk-lmk04832.c                       |   39 +-
 drivers/clk/clk-max77686.c                       |    8 +-
 drivers/clk/clk-moxart.c                         |   14 -
 drivers/clk/clk-palmas.c                         |   24 +-
 drivers/clk/clk-renesas-pcie.c                   |    6 +-
 drivers/clk/clk-rp1.c                            |    8 +-
 drivers/clk/clk-s2mps11.c                        |   12 +-
 drivers/clk/clk-scmi-oem.c                       |  108 +
 drivers/clk/clk-scmi.c                           |   44 +-
 drivers/clk/clk-scmi.h                           |   51 +
 drivers/clk/clk-scpi.c                           |   14 +-
 drivers/clk/clk-si514.c                          |    2 +-
 drivers/clk/clk-si521xx.c                        |    6 +-
 drivers/clk/clk-si5341.c                         |   10 +-
 drivers/clk/clk-si5351.c                         |    8 +-
 drivers/clk/clk-si544.c                          |   82 +-
 drivers/clk/clk-si570.c                          |    8 +-
 drivers/clk/clk-versaclock5.c                    |   16 +-
 drivers/clk/clk-versaclock7.c                    |    6 +-
 drivers/clk/clk.c                                |  112 +-
 drivers/clk/clk_test.c                           |  214 +-
 drivers/clk/eswin/Kconfig                        |   13 +
 drivers/clk/eswin/Makefile                       |    1 +
 drivers/clk/eswin/clk-eic7700-hsp.c              |  345 ++
 drivers/clk/eswin/clk-eic7700.c                  |    3 +-
 drivers/clk/eswin/clk.c                          |    4 +-
 drivers/clk/hisilicon/Kconfig                    |   14 +
 drivers/clk/hisilicon/clk-hi3660-stub.c          |   22 +-
 drivers/clk/hisilicon/reset.c                    |    2 +-
 drivers/clk/imx/clk-imx8mm.c                     |    6 +
 drivers/clk/imx/clk-imx8qxp-lpcg.c               |    1 +
 drivers/clk/imx/clk-imx8qxp.c                    |    1 +
 drivers/clk/imx/clk-imx95-blk-ctl.c              |   21 +-
 drivers/clk/imx/clk-pll14xx.c                    |  119 +-
 drivers/clk/imx/clk-scu.c                        |   24 +-
 drivers/clk/imx/clk.h                            |    1 +
 drivers/clk/kunit_clk_assigned_rates.h           |   10 +
 .../kunit_clk_assigned_rates_u64_multiple.dtso   |    6 +
 ...clk_assigned_rates_u64_multiple_consumer.dtso |    6 +
 .../clk/kunit_clk_assigned_rates_u64_one.dtso    |    3 +
 ...unit_clk_assigned_rates_u64_one_consumer.dtso |    3 +
 ...tso => kunit_clk_assigned_sscs_multiple.dtso} |    8 +-
 ...nit_clk_assigned_sscs_multiple_consumer.dtso} |    8 +-
 ...ne.dtso => kunit_clk_assigned_sscs_null.dtso} |    6 +-
 ...> kunit_clk_assigned_sscs_null_consumer.dtso} |    6 +-
 ...one.dtso => kunit_clk_assigned_sscs_one.dtso} |    4 +-
 ...=> kunit_clk_assigned_sscs_one_consumer.dtso} |    4 +-
 ...dtso => kunit_clk_assigned_sscs_without.dtso} |    5 +-
 ...unit_clk_assigned_sscs_without_consumer.dtso} |    5 +-
 ...ne.dtso => kunit_clk_assigned_sscs_zero.dtso} |    4 +-
 ...> kunit_clk_assigned_sscs_zero_consumer.dtso} |    4 +-
 drivers/clk/mediatek/Kconfig                     |   11 +
 drivers/clk/mediatek/Makefile                    |    1 +
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c     |    5 +-
 drivers/clk/mediatek/clk-mt6735-vdecsys.c        |    1 +
 drivers/clk/mediatek/clk-mt6735-vencsys.c        |    1 +
 drivers/clk/mediatek/clk-mt8135.c                |    5 +-
 drivers/clk/mediatek/clk-mt8173-mfgtop.c         |  242 ++
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c       |    1 -
 drivers/clk/mediatek/clk-pllfh.c                 |   98 +-
 drivers/clk/meson/Kconfig                        |   27 +
 drivers/clk/meson/Makefile                       |    2 +
 drivers/clk/meson/a9-aoclk.c                     |  489 +++
 drivers/clk/meson/a9-peripherals.c               | 2089 +++++++++++
 drivers/clk/meson/gxbb.c                         |    2 +-
 drivers/clk/microchip/clk-mpfs.c                 |    2 +-
 drivers/clk/mmp/clk-pxa1908-apbc.c               |    2 +-
 drivers/clk/mmp/clk-pxa1908-apbcp.c              |    2 +-
 drivers/clk/mvebu/clk-cpu.c                      |    2 +-
 drivers/clk/mvebu/kirkwood.c                     |   21 +-
 drivers/clk/nuvoton/clk-ma35d1-pll.c             |   38 +-
 drivers/clk/qcom/Kconfig                         |  274 +-
 drivers/clk/qcom/Makefile                        |    9 +
 drivers/clk/qcom/apss-ipq-pll.c                  |   19 +
 drivers/clk/qcom/audiocorecc-shikra.c            |  810 +++++
 .../qcom/{camcc-x1p42100.c => camcc-glymur.c}    | 1169 ++++---
 drivers/clk/qcom/camcc-sc8280xp.c                |   19 -
 drivers/clk/qcom/camcc-x1p42100.c                |    6 +-
 drivers/clk/qcom/clk-hfpll.c                     |    4 +-
 drivers/clk/qcom/clk-krait.c                     |    2 +-
 drivers/clk/qcom/clk-rcg.c                       |    4 +-
 drivers/clk/qcom/clk-rcg2.c                      |    2 +-
 drivers/clk/qcom/clk-ref.c                       |  205 ++
 drivers/clk/qcom/clk-rpm.c                       |   15 +-
 drivers/clk/qcom/clk-rpmh.c                      |    8 +-
 drivers/clk/qcom/clk-smd-rpm.c                   |   18 +-
 drivers/clk/qcom/common.c                        |    6 +-
 drivers/clk/qcom/dispcc-qcm2290.c                |   44 +-
 drivers/clk/qcom/dispcc0-nord.c                  | 2004 +++++++++++
 drivers/clk/qcom/dispcc1-nord.c                  | 2004 +++++++++++
 drivers/clk/qcom/evacc-glymur.c                  |  454 +++
 drivers/clk/qcom/gcc-glymur.c                    |   33 +-
 drivers/clk/qcom/gcc-hawi.c                      |  201 ++
 drivers/clk/qcom/gcc-ipq5424.c                   |   11 -
 drivers/clk/qcom/gcc-ipq9650.c                   |   89 +
 drivers/clk/qcom/gcc-mdm9607.c                   |  193 +-
 drivers/clk/qcom/gcc-msm8916.c                   |    5 +-
 drivers/clk/qcom/gcc-msm8939.c                   |    5 +-
 drivers/clk/qcom/gcc-nord.c                      |   45 +-
 drivers/clk/qcom/gcc-qcm2290.c                   |  131 +-
 drivers/clk/qcom/gcc-qcs8300.c                   |    8 +-
 drivers/clk/qcom/{gcc-sm6115.c => gcc-shikra.c}  | 3259 +++++++++++-------
 drivers/clk/qcom/gcc-sm6115.c                    |    7 +-
 drivers/clk/qcom/gdsc.c                          |   47 +-
 drivers/clk/qcom/gdsc.h                          |    1 +
 drivers/clk/qcom/gpu2cc-nord.c                   |  545 +++
 drivers/clk/qcom/gpucc-nord.c                    |  593 ++++
 drivers/clk/qcom/gpucc-qcm2290.c                 |  102 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c            |   12 +-
 drivers/clk/qcom/negcc-nord.c                    |   75 +-
 drivers/clk/qcom/tcsrcc-glymur.c                 |  471 +--
 drivers/clk/qcom/videocc-hawi.c                  |  839 +++++
 drivers/clk/qcom/videocc-maili.c                 |  660 ++++
 drivers/clk/qcom/videocc-x1p42100.c              |    4 +-
 drivers/clk/renesas/Kconfig                      |   10 +
 drivers/clk/renesas/Makefile                     |    2 +
 drivers/clk/renesas/r8a78000-cpg.c               |  166 +
 drivers/clk/renesas/r9a08g045-cpg.c              |    9 +
 drivers/clk/renesas/r9a08g046-cpg.c              |  130 +
 drivers/clk/renesas/r9a09g047-cpg.c              |  123 +-
 drivers/clk/renesas/r9a09g077-cpg.c              |  375 +-
 drivers/clk/renesas/renesas-cpg-mssr.c           |   20 +-
 drivers/clk/renesas/rzg2l-cpg.c                  |    8 +-
 drivers/clk/renesas/rzv2h-cpg-lib.c              |  217 ++
 drivers/clk/renesas/rzv2h-cpg.c                  |  203 --
 drivers/clk/rockchip/Kconfig                     |    7 +
 drivers/clk/rockchip/Makefile                    |    1 +
 drivers/clk/rockchip/clk-pll.c                   |   16 +-
 drivers/clk/rockchip/clk-rk3576.c                |   15 +-
 drivers/clk/rockchip/clk-rk3588.c                |    6 +-
 drivers/clk/rockchip/clk-rv1106.c                | 1099 ++++++
 drivers/clk/rockchip/clk.h                       |    8 +-
 drivers/clk/samsung/clk-acpm.c                   |   18 +-
 drivers/clk/samsung/clk-cpu.c                    |   34 +-
 drivers/clk/samsung/clk-exynos990.c              |   24 +-
 drivers/clk/samsung/clk-pll.c                    |   56 +-
 drivers/clk/samsung/clk.c                        |   11 +-
 drivers/clk/samsung/clk.h                        |    6 +-
 drivers/clk/spacemit/ccu-k3.c                    |   41 +-
 drivers/clk/sprd/pll.c                           |    8 +-
 drivers/clk/st/clkgen-pll.c                      |   20 +-
 drivers/clk/stm32/clk-stm32mp21.c                |    1 +
 drivers/clk/stm32/clk-stm32mp25.c                |    1 +
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c             |  127 +-
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h             |    3 +-
 drivers/clk/sunxi-ng/ccu_common.c                |   12 +-
 drivers/clk/sunxi-ng/ccu_common.h                |    1 +
 drivers/clk/sunxi-ng/ccu_div.c                   |   31 +-
 drivers/clk/sunxi-ng/ccu_div.h                   |    1 +
 drivers/clk/sunxi-ng/ccu_mux.c                   |   58 +-
 drivers/clk/tegra/clk-bpmp.c                     |   10 +-
 drivers/clk/tegra/clk-pll.c                      |    1 +
 drivers/clk/tegra/clk-tegra114.c                 |   39 +-
 drivers/clk/tegra/clk-tegra124-emc.c             |    1 +
 drivers/clk/tegra/clk-tegra210.c                 |    2 +-
 drivers/clk/ti/adpll.c                           |    4 +-
 drivers/clk/ti/composite.c                       |   26 +-
 drivers/clk/ti/divider.c                         |    2 +-
 drivers/clk/ti/mux.c                             |   22 +-
 drivers/clk/ultrarisc/Kconfig                    |   18 +
 drivers/clk/ultrarisc/Makefile                   |    4 +
 drivers/clk/ultrarisc/clk-dp1000.c               |  154 +
 drivers/clk/ultrarisc/clk-ultrarisc.c            |  399 +++
 drivers/clk/ultrarisc/clk-ultrarisc.h            |   71 +
 drivers/clk/visconti/clkc.c                      |    2 +-
 drivers/clk/x86/clk-pmc-atom.c                   |    3 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c       |  146 +-
 drivers/clk/zynq/clkc.c                          |    8 +
 drivers/clk/zynq/pll.c                           |    8 +-
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c       |    8 +-
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c  |    8 +-
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c     |   23 +-
 drivers/reset/Kconfig                            |   24 +
 drivers/reset/Makefile                           |    2 +
 drivers/reset/reset-eic7700-hsp.c                |  113 +
 drivers/reset/reset-eyeq.c                       |  271 +-
 drivers/reset/reset-sky1-audss.c                 |  127 +
 include/dt-bindings/clock/amlogic,a9-aoclkc.h    |   76 +
 .../clock/amlogic,a9-peripherals-clkc.h          |  351 ++
 include/dt-bindings/clock/aspeed,ast2700-scu.h   |    2 +
 include/dt-bindings/clock/cix,sky1-audss-cru.h   |   60 +
 include/dt-bindings/clock/clock.h                |   14 +
 include/dt-bindings/clock/eswin,eic7700-hspcrg.h |   33 +
 include/dt-bindings/clock/mobileye,eyeq7h-clk.h  |  119 +
 include/dt-bindings/clock/mt8173-clk.h           |    7 +
 include/dt-bindings/clock/qcom,gcc-mdm9607.h     |    1 -
 include/dt-bindings/clock/qcom,hawi-videocc.h    |   64 +
 include/dt-bindings/clock/qcom,ipq9650-gcc.h     |    5 +
 include/dt-bindings/clock/qcom,maili-gcc.h       |   21 +
 include/dt-bindings/clock/qcom,maili-videocc.h   |   50 +
 include/dt-bindings/clock/qcom,nord-dispcc.h     |  115 +
 include/dt-bindings/clock/qcom,nord-gpu2cc.h     |   47 +
 include/dt-bindings/clock/qcom,nord-gpucc.h      |   48 +
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h  |   49 +
 include/dt-bindings/clock/renesas,r8a78000-cpg.h |   14 +
 .../clock/renesas,r9a09g077-cpg-mssr.h           |    2 +
 .../clock/renesas,r9a09g087-cpg-mssr.h           |    2 +
 include/dt-bindings/clock/rockchip,rv1106-cru.h  |  306 ++
 include/dt-bindings/clock/samsung,exynos990.h    |    1 +
 include/dt-bindings/clock/spacemit,k3-clocks.h   |    4 +
 include/dt-bindings/clock/sun6i-rtc.h            |    4 +
 include/dt-bindings/clock/ultrarisc,dp1000-clk.h |   27 +
 include/dt-bindings/reset/airoha,en7581-reset.h  |    4 +
 include/dt-bindings/reset/cix,sky1-audss-cru.h   |   25 +
 include/dt-bindings/reset/eswin,eic7700-hspcrg.h |   21 +
 include/linux/clk-provider.h                     |  136 +-
 include/linux/clk.h                              |   27 +-
 include/linux/clk/qcom.h                         |   67 +
 include/linux/clk/renesas.h                      |   34 +-
 include/soc/spacemit/k3-syscon.h                 |    3 +-
 277 files changed, 25657 insertions(+), 4357 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a9-aoclkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/keystone-gate.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/apll.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/clockdomain.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,apll-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,shikra-audiocore-csr.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml
 create mode 100644 drivers/clk/cix/Kconfig
 create mode 100644 drivers/clk/cix/Makefile
 create mode 100644 drivers/clk/cix/clk-sky1-audss.c
 create mode 100644 drivers/clk/clk-divider_test.c
 create mode 100644 drivers/clk/clk-scmi-oem.c
 create mode 100644 drivers/clk/clk-scmi.h
 create mode 100644 drivers/clk/eswin/clk-eic7700-hsp.c
 copy drivers/clk/{kunit_clk_assigned_rates_u64_multiple.dtso => kunit_clk_assigned_sscs_multiple.dtso} (51%)
 copy drivers/clk/{kunit_clk_assigned_rates_u64_multiple_consumer.dtso => kunit_clk_assigned_sscs_multiple_consumer.dtso} (57%)
 copy drivers/clk/{kunit_clk_assigned_rates_u64_one.dtso => kunit_clk_assigned_sscs_null.dtso} (57%)
 copy drivers/clk/{kunit_clk_assigned_rates_u64_one_consumer.dtso => kunit_clk_assigned_sscs_null_consumer.dtso} (64%)
 copy drivers/clk/{kunit_clk_assigned_rates_u64_one.dtso => kunit_clk_assigned_sscs_one.dtso} (65%)
 copy drivers/clk/{kunit_clk_assigned_rates_u64_one_consumer.dtso => kunit_clk_assigned_sscs_one_consumer.dtso} (70%)
 copy drivers/clk/{kunit_clk_assigned_rates_u64_one.dtso => kunit_clk_assigned_sscs_without.dtso} (61%)
 copy drivers/clk/{kunit_clk_assigned_rates_u64_one_consumer.dtso => kunit_clk_assigned_sscs_without_consumer.dtso} (68%)
 copy drivers/clk/{kunit_clk_assigned_rates_u64_one.dtso => kunit_clk_assigned_sscs_zero.dtso} (63%)
 copy drivers/clk/{kunit_clk_assigned_rates_u64_one_consumer.dtso => kunit_clk_assigned_sscs_zero_consumer.dtso} (70%)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
 create mode 100644 drivers/clk/meson/a9-aoclk.c
 create mode 100644 drivers/clk/meson/a9-peripherals.c
 create mode 100644 drivers/clk/qcom/audiocorecc-shikra.c
 copy drivers/clk/qcom/{camcc-x1p42100.c => camcc-glymur.c} (70%)
 create mode 100644 drivers/clk/qcom/clk-ref.c
 create mode 100644 drivers/clk/qcom/dispcc0-nord.c
 create mode 100644 drivers/clk/qcom/dispcc1-nord.c
 create mode 100644 drivers/clk/qcom/evacc-glymur.c
 copy drivers/clk/qcom/{gcc-sm6115.c => gcc-shikra.c} (52%)
 create mode 100644 drivers/clk/qcom/gpu2cc-nord.c
 create mode 100644 drivers/clk/qcom/gpucc-nord.c
 create mode 100644 drivers/clk/qcom/videocc-hawi.c
 create mode 100644 drivers/clk/qcom/videocc-maili.c
 create mode 100644 drivers/clk/renesas/r8a78000-cpg.c
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c
 create mode 100644 drivers/clk/rockchip/clk-rv1106.c
 create mode 100644 drivers/clk/ultrarisc/Kconfig
 create mode 100644 drivers/clk/ultrarisc/Makefile
 create mode 100644 drivers/clk/ultrarisc/clk-dp1000.c
 create mode 100644 drivers/clk/ultrarisc/clk-ultrarisc.c
 create mode 100644 drivers/clk/ultrarisc/clk-ultrarisc.h
 create mode 100644 drivers/reset/reset-eic7700-hsp.c
 create mode 100644 drivers/reset/reset-sky1-audss.c
 create mode 100644 include/dt-bindings/clock/amlogic,a9-aoclkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,a9-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/clock/clock.h
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
 create mode 100644 include/dt-bindings/clock/mobileye,eyeq7h-clk.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,maili-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,maili-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-gpu2cc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,shikra-audiocorecc.h
 create mode 100644 include/dt-bindings/clock/renesas,r8a78000-cpg.h
 create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h
 create mode 100644 include/dt-bindings/clock/ultrarisc,dp1000-clk.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-audss-cru.h
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h
 create mode 100644 include/linux/clk/qcom.h

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
