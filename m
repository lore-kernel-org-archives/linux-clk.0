Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5062F3195FC;
	Thu, 25 Jun 2026 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400481; cv=none; b=AF9bLFtUMfQwrQlaNPFSZ7A9mZy0cJOmvVIsc9GOpBPZhejqcpHlTrbbxiP1Io0U/fBDZvUC7qHalEK48MHwGA3LCmF6xClSzkMAOus4rBCjWBPcBbUcwKLjmOicOEnWiNZfz9c/jsI5yLelsMFdJq7S/kDOyBA8GA7QGaR9zrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400481; c=relaxed/simple;
	bh=Jjt8U8ofuSZqv5OngRLnbHRf82grX7BZGe1exgOQG8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nuwJs+rPR/dGva0AKSSnyi7I2vhtmpsmrAJoCACB3oS7oMhQqFgBS3c9LZdNiykC3TL8muEXf42ybFCnTSPy2AzsjvBv/UDLrC8EhmhUOWdkj/ZgTbq5+587hdYfx/qnseghipFnMZK4IU3uC7G5Iv+6qpgTFFTuYeEkUR7lxsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJ/4SUVf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJ/4SUVf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B915A1F000E9;
	Thu, 25 Jun 2026 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782400480;
	bh=571X13goNIV23GNakcWysEy1hr0vU8iaJjWi03FJwJg=;
	h=From:To:Cc:Subject:Date;
	b=VJ/4SUVf2fpNPpIsRGV9Dj2rtMxWs8JowwPW5CVm7AAnHtvqNayDjHbjvW4mejDCf
	 H3XdwqnObyWV9IQ/dP77Ozgw87+uDW35AHQjGtvRc4YVYDY2p2XM776mpgexSU13Yf
	 a4oC42/uwNdSpmqtL3O/Ke+h8RvjiGfcGKxi2+B+XWi2MtXCWL8pfrO7J15Xq9har8
	 8m+rSStVoiHL0vhF4nhTbgjqgxGlGkYr80mciqNVo24i4Ivz1OxHT2ZN1NqyvJuA+8
	 zs/dCY/E8CZ+vVPq40+Ri0fKFWUy3Up5iw+RAzJhhMdmHb9+uObaHswbmtlgtxAXXQ
	 AW0NHBMXbMZdQ==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for the merge window
Date: Thu, 25 Jun 2026 08:14:37 -0700
Message-ID: <20260625151438.8471-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2abdc3dcf9780d070e55a99fdf8f93440c798b84:

  dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6 (2026-05-15 11:26:26 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 92010229c4b38897f1319d260162d2f96925ed17:

  Merge branches 'clk-microchip' and 'clk-qcom' into clk-next (2026-06-25 07:55:47 -0700)

----------------------------------------------------------------
This is all clk driver updates. Mostly new SoC support for
various Qualcomm chips and Canaan K230. Otherwise there's
non-critical fixes and updates to clk data such as adding missing
clks to existing drivers or marking clks critical. Nothing looks
especially exciting.

----------------------------------------------------------------
Adrian Ng Ho Yin (1):
      clk: socfpga: agilex: implement l3_main_free_clk

Alexander Koskovich (1):
      clk: qcom: clk-rpmh: Make all VRMs optional

Alexander Stein (1):
      clk: bulk: Use dev_err_probe() helper in of_clk_bulk_get()

Alexey Klimov (1):
      clk: samsung: exynos850: mark APM I3C clocks as critical

Bartosz Golaszewski (2):
      dt-bindings: clock: qcom: add the definition for the USB2 PHY reset
      clk: qcom: nord: negcc: add support for the USB2 PHY reset

Biju Das (17):
      clk: renesas: rzg2l: Drop always-false check in rzg3s_cpg_pll_clk_recalc_rate()
      clk: renesas: rzg2l: Add support for enabling PLLs
      clk: renesas: r8a08g046: Add support for PLL6
      clk: renesas: r9a08g046: Add GBETH clocks and resets
      clk: renesas: r9a08g046: Add GPIO clocks/resets
      clk: renesas: r9a08g046: Add CA55 core clocks
      clk: renesas: r9a08g046: Add WDT clocks and reset
      clk: renesas: r9a08g046: Add SCIF{1..5} clocks and resets
      clk: renesas: r9a08g046: Add I2C clocks and resets
      clk: renesas: r9a08g046: Add IA55_PCLK to critical module clocks
      clk: renesas: r9a08g046: Add RSCI clocks and resets
      clk: renesas: r9a08g046: Add SSIF-2 clocks and resets
      clk: renesas: r9a08g046: Add RSPI clocks and resets
      clk: renesas: rzg2l: Simplify SAM PLL configuration macro
      clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
      clk: renesas: rzg2l: Rename RZG3L-prefixed PLL macros to CPG-prefixed ones
      clk: renesas: r9a08g045: Drop unused pm_domain header file

Biswapriyo Nath (1):
      dt-bindings: clock: qcom,sm6125-dispcc: reference qcom,gcc.yaml

Bjorn Andersson (2):
      Merge branch '20260507-ipq9650_boot_to_shell-v3-1-62742b49c991@oss.qualcomm.com' into clk-for-7.2
      Merge branch '20260106-qcom_ipq5332_cmnpll-v2-2-f9f7e4efbd79@oss.qualcomm.com' into clk-for-7.2

Conor Dooley (2):
      clk: microchip: rename clk-core to clk-pic32
      clk: microchip: mpfs-ccc: fix peripheral driver registration failures after oob fix

Cosmin Tanislav (1):
      clk: renesas: r9a09g077: Add MTU3 module clock

Daniel Golle (3):
      clk: mediatek: add MUX_CLR_SET macro
      clk: mediatek: mt8192: use MUX_CLR_SET
      clk: mediatek: mt7988: use MUX_CLR_SET for gate-less muxes

Daniele Briguglio (5):
      dt-bindings: clock: rockchip,rk3588-cru: add I2S MCLK output to IO clock IDs
      clk: rockchip: allow grf_type_sys lookup in aux_grf_table
      clk: rockchip: add helper to register auxiliary GRFs
      soc: rockchip: rk3588: add SYS_GRF SOC_CON6 register offset
      clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO

Denzeel Oliva (1):
      clk: samsung: exynos990: Fix PERIC0/1 USI clock types

Duje Mihanović (3):
      dt-bindings: clock: marvell,pxa1908: Add #reset-cells
      clk: mmp: pxa1908-apbc: Add reset cells
      clk: mmp: pxa1908-apbcp: Add reset cells

Durai Manickam KR (1):
      clk: at91: sama7d65: add peripheral clock for I3C

Geert Uytterhoeven (6):
      Merge tag 'renesas-r8a7740-dt-binding-defs-tag1' into renesas-clk-for-v7.2
      Merge tag 'clk-renesas-rzg3e-plldsi-tag' into renesas-clk-for-v7.2
      clk: renesas: rzg2l: Consolidate DEF_MUX() and DEF_MUX_FLAGS()
      clk: renesas: rzg2l: Refactor rzg3l_cpg_pll_clk_endisable()
      clk: renesas: cpg-mssr: Add number of clock cells check
      Merge tag 'renesas-r8a73a4-dt-binding-defs-tag1' into renesas-clk-for-v7.2

Heiko Stuebner (1):
      Merge branch 'v7.2-shared/socids' into v7.2-clk/next

J. Neuschäfer (1):
      clk: hisilicon: Improve deallocation in error path

Jagadeesh Kona (5):
      dt-bindings: clock: qcom: Add X1P42100 video clock controller
      dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      clk: qcom: videocc-x1p42100: Add support for video clock controller
      clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      clk: qcom: camcc-x1p42100: Add support for camera clock controller

Jian Hu (2):
      dt-bindings: clock: amlogic: Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
      dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock

Jing Yangyang (1):
      clk: keystone: sci-clk: fix application of sizeof to pointer

Kathiravan Thirumoorthy (1):
      clk: qcom: add Global Clock controller (GCC) driver for IPQ9650 SoC

Konrad Dybcio (1):
      clk: qcom: regmap-phy-mux: Rework the implementation

Krzysztof Kozlowski (3):
      clk: qcom: dispcc-x1e80100: Fix (possibly) dumping regmap
      clk: qcom: Constify qcom_cc_driver_data and list of critical CBCR registers
      dt-bindings: clock: qcom,kaanapali-gxclkctl: Correctly use additionalProperties

Lad Prabhakar (2):
      clk: renesas: r9a08g045: Drop unused DEF_G3S_MUX macro
      clk: renesas: rzg2l: Rename iterator in for_each_mod_clock() to avoid shadowing

Luca Weiss (6):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      interconnect: Add devm_of_icc_get_by_index() as exported API for users
      dt-bindings: clock: qcom,milos-camcc: Document interconnect path
      clk: qcom: gdsc: Support enabling interconnect path for power domain
      clk: qcom: camcc-milos: Declare icc path dependency for CAMSS_TOP_GDSC

Luo Jie (3):
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5332 SoC
      clk: qcom: cmnpll: Account for reference clock divider
      clk: qcom: cmnpll: Add IPQ5332 SoC support

Marek Vasut (3):
      clk: renesas: r8a7740: Add ZT/ZTR trace clocks
      clk: renesas: r8a73a4: Add ZT/ZTR trace clocks
      clk: renesas: r8a779g0: Add DSC clock

Michael Walle (1):
      clk: keystone: don't cache clock rate

Mihai Sain (3):
      clk: at91: sam9x7: Remove gmac peripheral clock with ID 67
      clk: at91: sam9x7: Rename macb0_clk to gmac_clk
      clk: at91: sam9x7: Fix gmac_gclk clock definition

Nuno Sá (1):
      clk: clk-axi-clkgen: Add support versal timings

Phillip Varney (1):
      clk: qcom: a53: Corrected frequency multiplier for 1152MHz

Rosen Penev (7):
      clk: mvebu: use kzalloc_flex
      clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
      clk: visconti: pll: use kzalloc_flex
      clk: clk-max77686: kzalloc + kcalloc to kzalloc
      clk: bcm: iproc-asiu: simplify allocation
      clk-lpc18xx-ccu: kzalloc + kcalloc to kzalloc_flex
      clk: rockchip: allow COMPILE_TEST builds

Stephen Boyd (16):
      Merge tag 'renesas-clk-for-v7.2-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'socfpga_clk_update_for_v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into clk-socfpga
      Merge tag 'clk-meson-v7.2-1' of ssh://github.com/BayLibre/clk-meson into clk-amlogic
      Merge tag 'renesas-clk-for-v7.2-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'clk-canaan-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into clk-canaan
      Merge tag 'ti-k3-sci-clk-for-v7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into clk-ti
      Merge tag 'samsung-clk-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-samsung
      Merge tag 'v7.2-rockchip-clk1' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-rockchip
      Merge tag 'spacemit-clk-for-7.2-1' of ssh://github.com/spacemit-com/linux into clk-spacemit
      Merge tag 'clk-microchip-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into clk-microchip
      Merge tag 'clk-microchip-fixes-7.1' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into clk-microchip
      Merge tag 'qcom-clk-for-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-qcom
      Merge branches 'clk-cleanup', 'clk-mediatek', 'clk-marvell' and 'clk-versal' into clk-next
      Merge branches 'clk-renesas', 'clk-socfpga', 'clk-amlogic' and 'clk-canaan' into clk-next
      Merge branches 'clk-ti', 'clk-samsung', 'clk-rockchip' and 'clk-spacemit' into clk-next
      Merge branches 'clk-microchip' and 'clk-qcom' into clk-next

Tommaso Merciai (8):
      clk: renesas: rzv2h: Add PLLDSI clk mux support
      clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
      clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
      clk: renesas: r9a09g047: Add support for DSI clocks and resets
      clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets

Vivek Aknurwar (7):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      dt-bindings: clock: qcom: Add Hawi global clock controller
      clk: qcom: rpmh: Add support for Hawi RPMH clocks
      clk: qcom: Add Hawi TCSR clock controller driver
      clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      clk: qcom: Add support for global clock controller on Hawi

Xukai Wang (2):
      dt-bindings: clock: Add Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230

Yixun Lan (4):
      clk: spacemit: k3: Switch to pll2_d6 as parent for PCIe clock
      clk: spacemit: k3: Fix PCIe clock register offset
      dt-bindings: soc: spacemit: k3: Add PCIe DBI clock IDs
      clk: spacemit: k3: Add PCIe DBI clock

Yuho Choi (1):
      clk: at91: keep securam node alive while mapping it

 .../clock/amlogic,t7-peripherals-clkc.yaml   |   12 +-
 .../bindings/clock/amlogic,t7-pll-clkc.yaml  |    2 +-
 .../bindings/clock/canaan,k230-clk.yaml      |   59 +
 .../bindings/clock/marvell,pxa1908.yaml      |   34 +-
 .../bindings/clock/qcom,dispcc-sm6125.yaml   |   17 +-
 .../bindings/clock/qcom,hawi-gcc.yaml        |   63 +
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml |    1 +
 .../clock/qcom,kaanapali-gxclkctl.yaml       |    2 +-
 .../bindings/clock/qcom,milos-camcc.yaml     |    8 +
 ...xclkctl.yaml => qcom,milos-gxclkctl.yaml} |   22 +-
 .../bindings/clock/qcom,rpmhcc.yaml          |    1 +
 .../bindings/clock/qcom,sm8450-videocc.yaml  |    3 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml     |    2 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml  |    1 +
 drivers/clk/Kconfig                          |    6 +
 drivers/clk/Makefile                         |    3 +-
 drivers/clk/at91/pmc.c                       |    2 +-
 drivers/clk/at91/sam9x7.c                    |   21 +-
 drivers/clk/at91/sama7d65.c                  |    1 +
 drivers/clk/bcm/clk-iproc-asiu.c             |   27 +-
 drivers/clk/clk-axi-clkgen.c                 |    5 +-
 drivers/clk/clk-bulk.c                       |   14 +-
 drivers/clk/clk-k230.c                       | 2452 +++++++++++
 drivers/clk/clk-max77686.c                   |   32 +-
 drivers/clk/hisilicon/clk.c                  |    4 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c    |   26 +-
 drivers/clk/keystone/sci-clk.c               |   10 +-
 drivers/clk/mediatek/clk-mt7988-infracfg.c   |   80 +-
 drivers/clk/mediatek/clk-mt8192.c            |    4 +-
 drivers/clk/mediatek/clk-mux.h               |    5 +
 drivers/clk/microchip/Makefile               |    2 +-
 drivers/clk/microchip/clk-mpfs-ccc.c         |   15 +-
 .../microchip/{clk-core.c => clk-pic32.c}    |    2 +-
 .../microchip/{clk-core.h => clk-pic32.h}    |    0
 drivers/clk/microchip/clk-pic32mzda.c        |    2 +-
 drivers/clk/mmp/clk-pxa1908-apbc.c           |   58 +-
 drivers/clk/mmp/clk-pxa1908-apbcp.c          |   31 +-
 drivers/clk/mvebu/common.c                   |   21 +-
 drivers/clk/nxp/clk-lpc18xx-ccu.c            |   14 +-
 drivers/clk/qcom/Kconfig                     |   48 +
 drivers/clk/qcom/Makefile                    |    7 +-
 drivers/clk/qcom/a53-pll.c                   |    2 +-
 drivers/clk/qcom/camcc-milos.c               |    7 +
 drivers/clk/qcom/camcc-x1e80100.c            |   64 +
 .../{camcc-x1e80100.c => camcc-x1p42100.c}   |  566 +--
 drivers/clk/qcom/clk-alpha-pll.h             |    6 +
 drivers/clk/qcom/clk-regmap-phy-mux.c        |   52 +-
 drivers/clk/qcom/clk-rpmh.c                  |   41 +-
 drivers/clk/qcom/dispcc-x1e80100.c           |    2 +-
 drivers/clk/qcom/gcc-hawi.c                  | 3657 ++++++++++++++++
 drivers/clk/qcom/gcc-ipq9650.c               | 3445 +++++++++++++++
 drivers/clk/qcom/gcc-nord.c                  |    2 +-
 drivers/clk/qcom/gdsc.c                      |   33 +
 drivers/clk/qcom/gdsc.h                      |    5 +
 drivers/clk/qcom/gpucc-sm8750.c              |    4 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c        |    1 +
 drivers/clk/qcom/ipq-cmn-pll.c               |   30 +-
 drivers/clk/qcom/negcc-nord.c                |    3 +-
 drivers/clk/qcom/nwgcc-nord.c                |    4 +-
 drivers/clk/qcom/segcc-nord.c                |    2 +-
 drivers/clk/qcom/tcsrcc-hawi.c               |  158 +
 drivers/clk/qcom/videocc-x1p42100.c          |  585 +++
 drivers/clk/renesas/clk-r8a73a4.c            |    2 +
 drivers/clk/renesas/clk-r8a7740.c            |    2 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c      |    1 +
 drivers/clk/renesas/r9a07g043-cpg.c          |    2 +-
 drivers/clk/renesas/r9a07g044-cpg.c          |    2 +-
 drivers/clk/renesas/r9a08g045-cpg.c          |   13 +-
 drivers/clk/renesas/r9a08g046-cpg.c          |  355 ++
 drivers/clk/renesas/r9a09g011-cpg.c          |    7 +-
 drivers/clk/renesas/r9a09g047-cpg.c          |   84 +
 drivers/clk/renesas/r9a09g077-cpg.c          |    1 +
 drivers/clk/renesas/renesas-cpg-mssr.c       |    3 +
 drivers/clk/renesas/rzg2l-cpg.c              |   88 +-
 drivers/clk/renesas/rzg2l-cpg.h              |   18 +-
 drivers/clk/renesas/rzv2h-cpg.c              |  181 +
 drivers/clk/renesas/rzv2h-cpg.h              |   12 +
 drivers/clk/rockchip/Kconfig                 |    2 +-
 .../clock/amlogic,t7-peripherals-clkc.yaml   |   12 +-
 .../bindings/clock/amlogic,t7-pll-clkc.yaml  |    2 +-
 .../bindings/clock/canaan,k230-clk.yaml      |   59 +
 .../bindings/clock/marvell,pxa1908.yaml      |   34 +-
 .../bindings/clock/qcom,dispcc-sm6125.yaml   |   17 +-
 .../bindings/clock/qcom,hawi-gcc.yaml        |   63 +
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml |    1 +
 .../clock/qcom,kaanapali-gxclkctl.yaml       |    2 +-
 .../bindings/clock/qcom,milos-camcc.yaml     |    8 +
 ...xclkctl.yaml => qcom,milos-gxclkctl.yaml} |   22 +-
 .../bindings/clock/qcom,rpmhcc.yaml          |    1 +
 .../bindings/clock/qcom,sm8450-videocc.yaml  |    3 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml     |    2 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml  |    1 +
 drivers/clk/Kconfig                          |    6 +
 drivers/clk/Makefile                         |    3 +-
 drivers/clk/at91/pmc.c                       |    2 +-
 drivers/clk/at91/sam9x7.c                    |   21 +-
 drivers/clk/at91/sama7d65.c                  |    1 +
 drivers/clk/bcm/clk-iproc-asiu.c             |   27 +-
 drivers/clk/clk-axi-clkgen.c                 |    5 +-
 drivers/clk/clk-bulk.c                       |   14 +-
 drivers/clk/clk-k230.c                       | 2452 +++++++++++
 drivers/clk/clk-max77686.c                   |   32 +-
 drivers/clk/hisilicon/clk.c                  |    4 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c    |   26 +-
 drivers/clk/keystone/sci-clk.c               |   10 +-
 drivers/clk/mediatek/clk-mt7988-infracfg.c   |   80 +-
 drivers/clk/mediatek/clk-mt8192.c            |    4 +-
 drivers/clk/mediatek/clk-mux.h               |    5 +
 drivers/clk/microchip/Makefile               |    2 +-
 drivers/clk/microchip/clk-mpfs-ccc.c         |   15 +-
 .../microchip/{clk-core.c => clk-pic32.c}    |    2 +-
 .../microchip/{clk-core.h => clk-pic32.h}    |    0
 drivers/clk/microchip/clk-pic32mzda.c        |    2 +-
 drivers/clk/mmp/clk-pxa1908-apbc.c           |   58 +-
 drivers/clk/mmp/clk-pxa1908-apbcp.c          |   31 +-
 drivers/clk/mvebu/common.c                   |   21 +-
 drivers/clk/nxp/clk-lpc18xx-ccu.c            |   14 +-
 drivers/clk/qcom/Kconfig                     |   48 +
 drivers/clk/qcom/Makefile                    |    7 +-
 drivers/clk/qcom/a53-pll.c                   |    2 +-
 drivers/clk/qcom/camcc-milos.c               |    7 +
 drivers/clk/qcom/camcc-x1e80100.c            |   64 +
 .../{camcc-x1e80100.c => camcc-x1p42100.c}   |  566 +--
 drivers/clk/qcom/clk-alpha-pll.h             |    6 +
 drivers/clk/qcom/clk-regmap-phy-mux.c        |   52 +-
 drivers/clk/qcom/clk-rpmh.c                  |   41 +-
 drivers/clk/qcom/dispcc-x1e80100.c           |    2 +-
 drivers/clk/qcom/gcc-hawi.c                  | 3657 ++++++++++++++++
 drivers/clk/qcom/gcc-ipq9650.c               | 3445 +++++++++++++++
 drivers/clk/qcom/gcc-nord.c                  |    2 +-
 drivers/clk/qcom/gdsc.c                      |   33 +
 drivers/clk/qcom/gdsc.h                      |    5 +
 drivers/clk/qcom/gpucc-sm8750.c              |    4 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c        |    1 +
 drivers/clk/qcom/ipq-cmn-pll.c               |   30 +-
 drivers/clk/qcom/negcc-nord.c                |    3 +-
 drivers/clk/qcom/nwgcc-nord.c                |    4 +-
 drivers/clk/qcom/segcc-nord.c                |    2 +-
 drivers/clk/qcom/tcsrcc-hawi.c               |  158 +
 drivers/clk/qcom/videocc-x1p42100.c          |  585 +++
 drivers/clk/renesas/clk-r8a73a4.c            |    2 +
 drivers/clk/renesas/clk-r8a7740.c            |    2 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c      |    1 +
 drivers/clk/renesas/r9a07g043-cpg.c          |    2 +-
 drivers/clk/renesas/r9a07g044-cpg.c          |    2 +-
 drivers/clk/renesas/r9a08g045-cpg.c          |   13 +-
 drivers/clk/renesas/r9a08g046-cpg.c          |  355 ++
 drivers/clk/renesas/r9a09g011-cpg.c          |    7 +-
 drivers/clk/renesas/r9a09g047-cpg.c          |   84 +
 drivers/clk/renesas/r9a09g077-cpg.c          |    1 +
 drivers/clk/renesas/renesas-cpg-mssr.c       |    3 +
 drivers/clk/renesas/rzg2l-cpg.c              |   88 +-
 drivers/clk/renesas/rzg2l-cpg.h              |   18 +-
 drivers/clk/renesas/rzv2h-cpg.c              |  181 +
 drivers/clk/renesas/rzv2h-cpg.h              |   12 +
 drivers/clk/rockchip/Kconfig                 |    2 +-
 drivers/clk/rockchip/clk-rk3588.c            |   16 +
 drivers/clk/rockchip/clk.c                   |   25 +-
 drivers/clk/rockchip/clk.h                   |    3 +
 drivers/clk/samsung/clk-exynos850.c          |    5 +-
 drivers/clk/samsung/clk-exynos990.c          |  307 +-
 drivers/clk/socfpga/clk-agilex.c             |    2 +
 drivers/clk/spacemit/ccu-k3.c                |   30 +-
 drivers/clk/visconti/pll.c                   |   17 +-
 drivers/interconnect/core.c                  |   20 +
 include/dt-bindings/clock/canaan,k230-clk.h  |  220 +
 include/dt-bindings/clock/qcom,hawi-gcc.h    |  253 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h |   16 +
 .../dt-bindings/clock/qcom,ipq5332-cmn-pll.h |   19 +
 include/dt-bindings/clock/qcom,nord-negcc.h  |    1 +
 include/dt-bindings/clock/qcom,rpmh.h        |    2 +
 .../dt-bindings/clock/qcom,x1e80100-camcc.h  |    3 +
 .../clock/qcom,x1p42100-videocc.h            |   48 +
 .../dt-bindings/clock/rockchip,rk3588-cru.h  |    4 +
 .../dt-bindings/clock/spacemit,k3-clocks.h   |    5 +
 include/linux/adi-axi-common.h               |    2 +
 include/linux/clk/renesas.h                  |   20 +
 include/linux/interconnect.h                 |    6 +
 include/soc/rockchip/rk3588_grf.h            |    2 +
 include/soc/spacemit/k3-syscon.h             |    4 +-
 102 files changed, 12691 insertions(+), 900 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
 copy Documentation/devicetree/bindings/clock/{qcom,kaanapali-gxclkctl.yaml => qcom,milos-gxclkctl.yaml} (73%)
 create mode 100644 drivers/clk/clk-k230.c
 rename drivers/clk/microchip/{clk-core.c => clk-pic32.c} (99%)
 rename drivers/clk/microchip/{clk-core.h => clk-pic32.h} (100%)
 copy drivers/clk/qcom/{camcc-x1e80100.c => camcc-x1p42100.c} (82%)
 create mode 100644 drivers/clk/qcom/gcc-hawi.c
 create mode 100644 drivers/clk/qcom/gcc-ipq9650.c
 create mode 100644 drivers/clk/qcom/tcsrcc-hawi.c
 create mode 100644 drivers/clk/qcom/videocc-x1p42100.c
 create mode 100644 include/dt-bindings/clock/canaan,k230-clk.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-tcsrcc.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,x1p42100-videocc.h

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
