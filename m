Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9645BE3;
	Sun,  7 Dec 2025 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765140080; cv=none; b=AfuZ8fgdJ8Ly2kvIJKfUQ1I3p7poEM4qokuB1r8qoIcW4kw3syTP3asV1rK6AbxsjrYagEg17bFoOAqnlC1jj7w6Dw5GtIXmHyFujHsPJjoY7wC4uPjF0Z6ENiiUwbGogNmefwbHVQGgMtzXCmDE2OGiuOZarPhiy1ZCyopyUnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765140080; c=relaxed/simple;
	bh=465TQel4NJuEF8au98DYsHjpzY4hOPoLYeufhufT43c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l8SSA01mUAgWFBAi7PxbqcoHdu89+SzWIKE2Y82yEkRbiSAxO478B58BNQuSrsbTT0n3zRAgMzd1K10HjMNy2/eDstLEbtKZCONNoLrfjhg9wDiPXScVLgUw0s3dVo+b21NHlrjuBLuI8+1dKyswy339QnTabt6YMT5mf6Zk8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPqBC+PG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPqBC+PG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10617C4CEFB;
	Sun,  7 Dec 2025 20:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765140079;
	bh=465TQel4NJuEF8au98DYsHjpzY4hOPoLYeufhufT43c=;
	h=From:To:Cc:Subject:Date:From;
	b=cPqBC+PG497vdCoNKh2Gm9mr3VKfdgnbPtTtYtPQuPEpx7Hw13hltRKabE0VAk2Uf
	 0RXcyujLVKjb1NXc3BKH0zcIAHyNF9fSYB6mXdmGKJB0PG/r55k8nELCvW5w08OyDJ
	 dTkDRq0n152yLeHmP2qq+92UOqYLfm/wGykqQiEpi5cvEOPfTHLpesAfcQsfvgea1n
	 N753FrVKCwqeethshe6qqULbdJXhmuBfBokhhBEho9Aup5GRxnpUk/x8G+e1jYAG51
	 4rjwMdxW7FTGvV4olggqaXUcuiS8hY+DrkKk4yDMqdO2UiR2e38kCfW0sLQ96vmeNl
	 dQNl+bU6ySj4g==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for the merge window
Date: Sun,  7 Dec 2025 12:41:14 -0800
Message-ID: <20251207204116.2011176-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1de3d9e2cd3a3c6f503cd31ec1f552c9dd8cf8ca:

  dt-bindings: clock: r8a779a0: Add ZG core clock (2025-11-10 10:56:47 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 6f172175b6f3fe35b5d519fc314f7a0b603a9af9:

  Merge branches 'clk-visconti', 'clk-imx', 'clk-microchip', 'clk-rockchip' and 'clk-qcom' into clk-next (2025-12-03 10:22:37 -0800)

----------------------------------------------------------------
This pull request is entirely SoC clk drivers, not for lack of trying to modify
the core clk framework. The majority diff wise is for the new Rockchip and
Qualcomm clk drivers which is mostly lines and lines of data structures to
describe the clk hardware in these SoCs. Beyond those two, Renesas continues to
incrementally add clks to their SoC drivers, causing them to show up higher in
the diffstat this time because they added quite a few clks all over the place.
Overall it is a semi-quiet release that has some new clk drivers and the usual
fixes for clock data that was wrong or missing and non-critical cleanups that
plug error paths or fix typos.

New Drivers:
 - Qualcomm IPQ5424 Network Subsystem Clock Controller
 - Qualcomm SM8750 Video Clock Controller
 - Rockchip RV1126B and RK3506 clock drivers
 - i.MX8ULP SIM LPAV clock driver
 - Samsung ACPM (firmware interface) clock driver
 - Altera Agilex5 clock driver

----------------------------------------------------------------
Adrian Barnaś (2):
      clk: keystone: Fix discarded const qualifiers
      clk: actions: Fix discarding const qualifier by 'container_of' macro

Alexey Minnekhanov (2):
      dt-bindings: clock: mmcc-sdm660: Add missing MDSS reset
      clk: qcom: mmcc-sdm660: Add missing MDSS reset

André Draszik (2):
      dt-bindings: clock: google,gs101-clock: add power-domains
      clk: samsung: clk-pll: simplify samsung_pll_lock_wait()

Biju Das (1):
      clk: renesas: r9a09g047: Add RSCI clocks/resets

Bjorn Andersson (5):
      Merge branch '20251003-topic-hamoa_gcc_usb4-v2-1-61d27a14ee65@oss.qualcomm.com' into clk-for-6.19
      Merge branch '20250919-sm6350-mdss-reset-v1-1-48dcac917c73@fairphone.com' into clk-for-6.19
      Merge branch '20250919-sm7150-dispcc-fixes-v1-1-308ad47c5fce@mainlining.org' into clk-for-6.19
      Merge branch '20251014-qcom_ipq5424_nsscc-v7-2-081f4956be02@quicinc.com' into clk-for-6.19
      Merge branch '20251030-gcc_kaanapali-v2-v2-3-a774a587af6f@oss.qualcomm.com' into clk-for-6.19

Charles Mirabile (1):
      clk: spacemit: Set clk_hw_onecell_data::num before using flex array

Conor Dooley (3):
      dt-bindings: clk: microchip: mpfs: remove first reg region
      clk: microchip: mpfs: use regmap for clocks
      reset: mpfs: add non-auxiliary bus probing

Cosmin Tanislav (3):
      clk: renesas: r9a09g077: Add ADC module clocks
      clk: renesas: r9a09g077: Add TSU module clock
      clk: renesas: r9a09g077: Add SPI module clocks

Daniel Scally (1):
      clk: renesas: r9a09g057: Add clock and reset entries for ISP

Elaine Zhang (4):
      clk: rockchip: Implement rockchip_clk_register_armclk_multi_pll()
      dt-bindings: clock, reset: Add support for rv1126b
      clk: rockchip: Add clock controller for the RV1126B
      clk: rockchip: Add clock and reset driver for RK3506

Encrow Thorne (1):
      clk: spacemit: fix comment typo

Finley Xiao (1):
      dt-bindings: clock: rockchip: Add RK3506 clock and reset unit

Gabor Juhos (2):
      clk: qcom: apss-ipq5424: remove unused 'apss_clk' structure
      clk: qcom: use different Kconfig prompts for APSS IPQ5424/6018 drivers

Geert Uytterhoeven (7):
      clk: renesas: cpg-lib: Remove unneeded semicolon
      clk: renesas: Use IS_ERR() for pointers that cannot be NULL
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag5' into renesas-clk-for-v6.19
      clk: renesas: cpg-mssr: Spelling s/offets/offsets/
      Merge tag 'clk-renesas-rzv2h-plldsi-tag' into renesas-clk-for-v6.19
      Merge tag 'renesas-r8a779a0-dt-binding-defs-tag2' into renesas-clk-for-v6.19
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag5' into renesas-clk-for-v6.19

Haotian Zhang (1):
      clk: renesas: r9a06g032: Fix memory leak in error path

Heiko Stuebner (2):
      clk: rockchip: rk3568: Drop CLK_NR_CLKS usage
      dt-bindings: clock: rk3568: Drop CLK_NR_CLKS define

Jacky Bai (1):
      clk: imx: Add some delay before deassert the reset

Jens Reidel (3):
      dt-bindings: clock: sm7150-dispcc: Add MDSS_CORE reset
      clk: qcom: dispcc-sm7150: Add MDSS_CORE reset
      clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk0_clk_src

Johan Hovold (2):
      clk: keystone: syscon-clk: fix regmap leak on probe failure
      clk: keystone: fix compile testing

Khairul Anuar Romli (1):
      clk: socfpga: agilex5: add clock driver for Agilex5

Konrad Dybcio (7):
      clk: qcom: gcc-x1e80100: Add missing USB4 clocks/resets
      clk: qcom: rpmh: Define RPMH_IPA_CLK on QCS615
      clk: qcom: gcc-sc8280xp: Remove 85.71 MHz USB4 master clock frequency
      clk: qcom: gcc-x1e80100: Remove 85.71 MHz USB4 master clock frequency
      clk: qcom: gcc-glymur: Remove 85.71 MHz USB4 master clock frequency
      dt-bindings: clock: qcom: x1e80100-dispcc: Add USB4 router link resets
      clk: qcom: x1e80100-dispcc: Add USB4 router link resets

Krzysztof Kozlowski (1):
      clk: sprd: sc9860: Simplify with of_device_get_match_data()

Lad Prabhakar (16):
      clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
      clk: renesas: cpg-mssr: Add read-back and delay handling for RZ/T2H MSTP
      clk: renesas: rzv2h: Add instance field to struct pll
      clk: renesas: rzv2h: Use GENMASK for PLL fields
      clk: renesas: rzv2h: Add support for DSI clocks
      clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
      clk: renesas: r9a09g056: Add clocks and resets for DSI and LCDC modules
      clk: renesas: r9a09g056: Add support for PLLVDO, CRU clocks, and resets
      clk: renesas: r9a09g056: Add clock and reset entries for ISP
      clk: renesas: r9a09g077: Propagate rate changes to parent clocks
      clk: renesas: r9a09g077: Remove stray blank line
      clk: renesas: r9a09g077: Use devm_ helpers for divider clock registration
      dt-bindings: clock: renesas,r9a09g057-cpg: Add USB3.0 core clocks
      dt-bindings: clock: renesas,r9a09g056-cpg: Add USB3.0 core clocks
      clk: renesas: r9a09g057: Add USB3.0 clocks/resets
      clk: renesas: r9a09g056: Add USB3.0 clocks/resets

Laurentiu Mihalcea (2):
      dt-bindings: clock: document 8ULP's SIM LPAV
      clk: imx: add driver for imx8ulp's sim lpav

Luca Weiss (3):
      clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC resets
      clk: qcom: camcc-sm6350: Fix PLL config of PLL2
      clk: qcom: camcc-sm7150: Fix PLL config of PLL2

Luo Jie (4):
      clk: qcom: gcc-ipq5424: Correct the icc_first_node_id
      clk: qcom: gcc-ipq5424: Enable NSS NoC clocks to use icc-clk
      clk: qcom: gcc-ipq5424: Add gpll0_out_aux clock
      clk: qcom: Add NSS clock controller driver for IPQ5424

Marek Vasut (2):
      clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
      clk: renesas: cpg-mssr: Read back reset registers to assure values latched

Mikhail Kshevetskiy (2):
      dt-bindings: clock: airoha: Add reset support to EN7523 clock binding
      clk: en7523: Add reset-controller support for EN7523 SoC

Nathan Chancellor (3):
      clk: qcom: Fix SM_VIDEOCC_6350 dependencies
      clk: qcom: Fix dependencies of QCS_{DISP,GPU,VIDEO}CC_615
      clk: samsung: exynos-clkout: Assign .num before accessing .hws

Niklas Söderlund (3):
      clk: renesas: rcar-gen4: Add support for clock dividers in FRQCRB
      clk: renesas: r8a779a0: Add ZG Core clock
      clk: renesas: r8a779a0: Add 3DGE module clock

Ovidiu Panait (2):
      clk: renesas: r9a09g057: Add clock and reset entries for TSU
      clk: renesas: r9a09g057: Add clock and reset entries for RTC

Peng Fan (1):
      clk: imx: imx8mp-audiomix: use devm_auxiliary_device_create() to simple code

Raghav Sharma (4):
      dt-bindings: clock: exynosautov920: add m2m clock definitions
      dt-bindings: clock: exynosautov920: add mfc clock definitions
      clk: samsung: exynosautov920: add clock support
      clk: samsung: exynosautov920: add block mfc clock support

Robert Marko (1):
      clk: lan966x: remove unused dt-bindings include

Stephen Boyd (12):
      Merge tag 'socfpga_clk_for_v6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into clk-socfpga
      Merge tag 'renesas-clk-for-v6.19-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'samsung-drivers-firmware-clk-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-samsung
      Merge tag 'samsung-clk-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-samsung
      Merge tag 'renesas-clk-for-v6.19-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'clk-imx-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux into clk-imx
      Merge tag 'clk-microchip-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into clk-microchip
      Merge tag 'v6.19-rockchip-clk1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-rockchip
      Merge tag 'qcom-clk-for-6.19' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-qcom
      clk: qcom: Mark camcc_sm7150_hws static
      Merge branches 'clk-socfpga', 'clk-renesas', 'clk-cleanup', 'clk-samsung' and 'clk-mediatek' into clk-next
      Merge branches 'clk-visconti', 'clk-imx', 'clk-microchip', 'clk-rockchip' and 'clk-qcom' into clk-next

Taniya Das (12):
      clk: qcom: gcc-sm8750: Add a new frequency for sdcc2 clock
      clk: qcom: gcc-glymur: Update the halt check flags for pipe clocks
      clk: qcom: gcc-qcs615: Update the SDCC clock to use shared_floor_ops
      clk: qcom: tcsrcc-glymur: Update register offsets for clock refs
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Kaanapali
      dt-bindings: clock: qcom: Document the Kaanapali TCSR Clock Controller
      dt-bindings: clock: qcom: Add Kaanapali Global clock controller
      clk: qcom: clk_mem_branch: add enable mask and invert flags
      clk: qcom: ecpricc-qdu100: Add mem_enable_mask to the clock memory branch
      clk: qcom: branch: Extend invert logic for branch2 mem clocks
      dt-bindings: clock: qcom: Add SM8750 video clock controller
      clk: qcom: videocc-sm8750: Add video clock controller driver for SM8750

Tommaso Merciai (2):
      dt-bindings: clock: renesas,r9a09g047-cpg: Add USB2 PHY core clocks
      clk: renesas: r9a09g047: Add clock and reset entries for USB2

Tudor Ambarus (5):
      firmware: exynos-acpm: add DVFS protocol
      firmware: exynos-acpm: register ACPM clocks pdev
      clk: samsung: add Exynos ACPM clock driver
      MAINTAINERS: add ACPM clock bindings and driver
      firmware: exynos-acpm: add empty method to allow compile test

Vladimir Zapolskiy (6):
      clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
      clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
      clk: qcom: camcc-sdm845: Specify Titan GDSC power domain as a parent to other
      clk: qcom: camcc-sm7150: Specify Titan GDSC power domain as a parent to IPEx and BPS
      clk: qcom: camcc-sm8250: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI
      clk: qcom: camcc-sm8450: Specify Titan GDSC power domain as a parent to IPE/BPS/SBI

Yuji Ishikawa (4):
      clk: visconti: Do not define number of clocks in bindings
      dt-bindings: clock: tmpv770x: Remove definition of number of clocks
      dt-bindings: clock: tmpv770x: Add VIIF clocks
      clk: visconti: Add VIIF clocks

 .../bindings/clock/airoha,en7523-scu.yaml          |    3 +-
 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml       |   72 ++
 .../bindings/clock/google,gs101-clock.yaml         |    3 +
 .../bindings/clock/microchip,mpfs-clkcfg.yaml      |   36 +-
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   63 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    5 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    8 +-
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |   62 +-
 .../bindings/clock/rockchip,rk3506-cru.yaml        |   55 +
 .../bindings/clock/rockchip,rv1126b-cru.yaml       |   52 +
 .../clock/samsung,exynosautov920-clock.yaml        |   42 +
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |   11 +
 MAINTAINERS                                        |    3 +-
 drivers/clk/Makefile                               |    3 +-
 drivers/clk/actions/owl-common.h                   |    2 +-
 drivers/clk/actions/owl-composite.h                |    2 +-
 drivers/clk/actions/owl-divider.h                  |    2 +-
 drivers/clk/actions/owl-factor.h                   |    2 +-
 drivers/clk/actions/owl-gate.h                     |    2 +-
 drivers/clk/actions/owl-mux.h                      |    2 +-
 drivers/clk/actions/owl-pll.h                      |    2 +-
 drivers/clk/clk-en7523.c                           |   64 +-
 drivers/clk/clk-lan966x.c                          |    2 -
 drivers/clk/imx/Kconfig                            |    1 +
 drivers/clk/imx/Makefile                           |    1 +
 drivers/clk/imx/clk-composite-7ulp.c               |   13 +
 drivers/clk/imx/clk-imx8mp-audiomix.c              |   39 +-
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c             |  156 +++
 drivers/clk/keystone/sci-clk.c                     |    4 +-
 drivers/clk/keystone/syscon-clk.c                  |    2 +-
 drivers/clk/microchip/Kconfig                      |    2 +
 drivers/clk/microchip/clk-mpfs.c                   |  227 +++-
 drivers/clk/qcom/Kconfig                           |   32 +-
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/apss-ipq5424.c                    |    7 -
 drivers/clk/qcom/camcc-sdm845.c                    |    3 +
 drivers/clk/qcom/camcc-sm6350.c                    |   13 +-
 drivers/clk/qcom/camcc-sm7150.c                    |   11 +-
 drivers/clk/qcom/camcc-sm8250.c                    |    3 +
 drivers/clk/qcom/camcc-sm8450.c                    |    3 +
 drivers/clk/qcom/camcc-sm8550.c                    |   10 +
 drivers/clk/qcom/clk-branch.c                      |    8 +-
 drivers/clk/qcom/clk-branch.h                      |    4 +
 drivers/clk/qcom/clk-rpmh.c                        |    1 +
 drivers/clk/qcom/dispcc-sm6350.c                   |    7 +
 drivers/clk/qcom/dispcc-sm7150.c                   |    9 +-
 drivers/clk/qcom/dispcc-x1e80100.c                 |    3 +
 drivers/clk/qcom/ecpricc-qdu1000.c                 |   30 +
 drivers/clk/qcom/gcc-glymur.c                      |   25 +-
 drivers/clk/qcom/gcc-ipq5424.c                     |   28 +-
 drivers/clk/qcom/gcc-qcs615.c                      |    6 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |    1 -
 drivers/clk/qcom/gcc-sm8750.c                      |    1 +
 drivers/clk/qcom/gcc-x1e80100.c                    |  699 +++++++++-
 drivers/clk/qcom/mmcc-sdm660.c                     |    1 +
 drivers/clk/qcom/nsscc-ipq5424.c                   | 1340 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   |   54 +-
 drivers/clk/qcom/videocc-sm8750.c                  |  463 +++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |    7 +-
 drivers/clk/renesas/r9a06g032-clocks.c             |    6 +-
 drivers/clk/renesas/r9a09g047-cpg.c                |  144 ++-
 drivers/clk/renesas/r9a09g056-cpg.c                |  118 +-
 drivers/clk/renesas/r9a09g057-cpg.c                |  102 +-
 drivers/clk/renesas/r9a09g077-cpg.c                |   57 +-
 drivers/clk/renesas/rcar-cpg-lib.c                 |    2 +-
 drivers/clk/renesas/rcar-gen4-cpg.c                |    9 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |  181 ++-
 drivers/clk/renesas/rzg2l-cpg.c                    |    2 +-
 drivers/clk/renesas/rzv2h-cpg.c                    |  514 +++++++-
 drivers/clk/renesas/rzv2h-cpg.h                    |   31 +-
 drivers/clk/rockchip/Kconfig                       |   14 +
 drivers/clk/rockchip/Makefile                      |    2 +
 drivers/clk/rockchip/clk-cpu.c                     |  165 +++
 drivers/clk/rockchip/clk-rk3506.c                  |  869 +++++++++++++
 drivers/clk/rockchip/clk-rk3568.c                  |    5 +-
 drivers/clk/rockchip/clk-rv1126b.c                 | 1117 ++++++++++++++++
 drivers/clk/rockchip/clk.c                         |   24 +
 drivers/clk/rockchip/clk.h                         |   96 ++
 drivers/clk/rockchip/rst-rk3506.c                  |  226 ++++
 drivers/clk/rockchip/rst-rv1126b.c                 |  443 +++++++
 drivers/clk/samsung/Kconfig                        |   10 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-acpm.c                     |  185 +++
 drivers/clk/samsung/clk-exynos-clkout.c            |    2 +-
 drivers/clk/samsung/clk-exynosautov920.c           |   90 ++
 drivers/clk/samsung/clk-pll.c                      |   41 +-
 drivers/clk/socfpga/Kconfig                        |    2 +-
 drivers/clk/socfpga/Makefile                       |    2 +-
 drivers/clk/socfpga/clk-agilex5.c                  |  561 ++++++++
 drivers/clk/socfpga/clk-gate-s10.c                 |   53 +
 drivers/clk/socfpga/clk-periph-s10.c               |   41 +
 drivers/clk/socfpga/clk-pll-s10.c                  |   36 +
 drivers/clk/socfpga/stratix10-clk.h                |   43 +
 drivers/clk/spacemit/ccu-k1.c                      |    4 +-
 drivers/clk/spacemit/ccu_mix.h                     |    2 +-
 drivers/clk/sprd/sc9860-clk.c                      |    8 +-
 drivers/clk/visconti/clkc-tmpv770x.c               |   79 +-
 drivers/clk/visconti/pll-tmpv770x.c                |    5 +-
 drivers/firmware/samsung/Makefile                  |    4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   80 ++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |   21 +
 drivers/firmware/samsung/exynos-acpm.c             |   26 +
 drivers/reset/Kconfig                              |    1 +
 drivers/reset/reset-mpfs.c                         |   91 +-
 include/dt-bindings/clock/google,gs101-acpm.h      |   26 +
 include/dt-bindings/clock/imx8ulp-clock.h          |    5 +
 include/dt-bindings/clock/qcom,dispcc-sm6350.h     |    4 +
 include/dt-bindings/clock/qcom,ipq5424-gcc.h       |    3 +-
 include/dt-bindings/clock/qcom,ipq5424-nsscc.h     |   65 +
 include/dt-bindings/clock/qcom,kaanapali-gcc.h     |  241 ++++
 include/dt-bindings/clock/qcom,mmcc-sdm660.h       |    1 +
 include/dt-bindings/clock/qcom,sm7150-dispcc.h     |    3 +
 include/dt-bindings/clock/qcom,sm8750-videocc.h    |   40 +
 include/dt-bindings/clock/qcom,x1e80100-dispcc.h   |    3 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |   61 +
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h  |    2 +
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h  |    2 +
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h  |    4 +
 include/dt-bindings/clock/rk3568-cru.h             |    6 +-
 include/dt-bindings/clock/rockchip,rk3506-cru.h    |  285 +++++
 include/dt-bindings/clock/rockchip,rv1126b-cru.h   |  392 ++++++
 include/dt-bindings/clock/samsung,exynosautov920.h |   10 +
 include/dt-bindings/clock/toshiba,tmpv770x.h       |   14 +-
 include/dt-bindings/interconnect/qcom,ipq5424.h    |   33 +
 include/dt-bindings/reset/airoha,en7523-reset.h    |   61 +
 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h   |   16 +
 include/dt-bindings/reset/qcom,ipq5424-nsscc.h     |   46 +
 include/dt-bindings/reset/rockchip,rk3506-cru.h    |  211 +++
 include/dt-bindings/reset/rockchip,rv1126b-cru.h   |  405 ++++++
 include/dt-bindings/reset/toshiba,tmpv770x.h       |    9 +-
 include/linux/clk/renesas.h                        |  145 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   19 +
 include/soc/microchip/mpfs.h                       |    3 +-
 135 files changed, 10966 insertions(+), 380 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
 create mode 100644 drivers/clk/qcom/nsscc-ipq5424.c
 create mode 100644 drivers/clk/qcom/videocc-sm8750.c
 create mode 100644 drivers/clk/rockchip/clk-rk3506.c
 create mode 100644 drivers/clk/rockchip/clk-rv1126b.c
 create mode 100644 drivers/clk/rockchip/rst-rk3506.c
 create mode 100644 drivers/clk/rockchip/rst-rv1126b.c
 create mode 100644 drivers/clk/samsung/clk-acpm.c
 create mode 100644 drivers/clk/socfpga/clk-agilex5.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-dvfs.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-dvfs.h
 create mode 100644 include/dt-bindings/clock/google,gs101-acpm.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5424-nsscc.h
 create mode 100644 include/dt-bindings/clock/qcom,kaanapali-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-videocc.h
 create mode 100644 include/dt-bindings/clock/rockchip,rk3506-cru.h
 create mode 100644 include/dt-bindings/clock/rockchip,rv1126b-cru.h
 create mode 100644 include/dt-bindings/reset/airoha,en7523-reset.h
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5424-nsscc.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3506-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rv1126b-cru.h

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
