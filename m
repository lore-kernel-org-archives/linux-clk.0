Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6812A54281D;
	Tue, 13 Oct 2026 19:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920720; cv=none; b=FygIJwyxDRaCN2NIaTWCwIwUmKRAYn5DJl3NTisSuJxrMkpqUKZpkHCCvUMIqwX6ziQ+4zG79RT5PdpGqZNV+ntljlTZs6PsUhnKxNlkrWKLYjGzOc7nh4s0YEtQMvhwzEDwXjl/xCHWs/+0gYt/GgH7cB1Y4a0+UM88fQ05wTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920720; c=relaxed/simple;
	bh=Rl/vvXOgPN2cpKV/ic8+ml59bElJXFJaVYNw6k1i3kU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GXxTLSEfyJACJmewnTUq8m2Eiz99oGMBB+exRoTOeU22xAMmhjvZR42tG07wMzJhi7+3HV3cpeGJZV8TSfPR+REfdDNcwZ8Xjx0a4FKNFVB4jXgr5Vyj9HQDZVN6+FsqQ3BoTanv+LMLyiy8KfTvw0VRH4GEAYfH65nNWoNDSpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwQz1Z5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwQz1Z5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1384B1F000FF;
	Tue, 13 Oct 2026 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791920718;
	bh=xvCxa34QocNonBUKVF/2IX4B6V3PtNHW2jKWeSfdOM4=;
	h=From:To:Cc:Subject:Date;
	b=OwQz1Z5I14C7NDpNgJzIWdeH/52McgzpTBXaRJfAMkGV+lhJE+3CKJLa/FXH9Nj6p
	 YDhXKPm07iuHWyNodeqGdjIn7FHp76Q2thW7IgPWtD/EN0MD8Wjc7IwaU9dMgyT+C7
	 PMUJqmF5JDzCoeXccL9t2u2i5lJmRTSj1upbVkYHYBgK8s8T28VkMIZsxOTZ74ubu3
	 CWpsw9u6jbVoWs+8IJgvvOc0+TozchrOClDWQXnjYWTuCdbK/pW6bTmgZVEY902V1j
	 5ZaoaJzbwI02Hs/atihF/LFIVj4lxPOyMOcdw7Xa8w3fU0XN816choSZSXyEaoVSe7
	 omrOOrx8IbLHA==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Luo Jie <jie.luo@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Esteban Urrutia <esteuwu@proton.me>,
	Muzaffer Kadir <muzafferkadir@mainlining.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
	Aamir Ahmed <elb12345@hotmail.co.uk>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm clock updates for v7.4 (second attempt)
Date: Tue, 13 Oct 2026 14:45:13 -0500
Message-ID: <20261013194514.325658-1-andersson@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same content as qcom-clk-for-7.4 [1], but with the one Fixes hash corrected.

Regards,
Bjorn

[1] https://lore.kernel.org/all/20261012220017.65733-1-andersson@kernel.org/

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-7.4-2

for you to fetch changes up to 5c32769895e75914e03031b3483775dabcfac264:

  clk: qcom: Add support for camera clock controller on Maili (2026-10-13 09:49:59 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v7.4 (second attempt)

Add new clock support for Eliza, Kuno, MSM8952, Nord, Hawi, Maili, and
IPQ5210. Rework common probe and CX power-domain handling.
Add generic subsystem-init helpers and clean up the initcall setup.

- Add camera, camera BIST, GPU, and video clock controllers for Eliza,
  and complete the Milos camera and video power-domain bindings.
- Add Nord camera and video clocks, video AXI and QUSB2 PHY resets,
  EMAC interconnect clocks, and the corrected GCC GPLL enable offset.
- Add Hawi camera and GPU clock controllers, extend them for Maili,
  and correct the camera Rivian PLL configuration.
- Add global and RPMh clock controllers for Kuno.
- Add the MSM8952 global clock controller and RPM clock binding.
- Extend the IPQ common PLL driver with all IPQ5210 networking clock
  outputs, divider flags, and safe bounds handling.
- Add IPQ9650 NoC clock management through the interconnect framework,
  add 24 MHz USB UTMI rates for three IPQ SoCs, and correct IPQ5018 and
  IPQ5424 clock and reset handling.
- Add QCS8300 TSCSS clocks and resets, SM7250 RPMh clocks, and Glymur
  LNBB clocks.
- Model GCC CX power-domain dependencies and runtime PM across the
  affected application, compute, and modem platforms.
- Move always-on clock and GCC initialization into common Qualcomm
  probe handling across 47 camera, display, GPU, video, audio, and
  global clock controller drivers.
- Add generic subsys_driver and subsys_platform_driver helpers, then
  convert the Qualcomm and Renesas clock drivers to use them.
- Fix shared RCG initialization, status error propagation, and cleanup
  after failed rate changes.
- Correct clock and reset register offsets for SM6115, QCS615, MSM8996,
  SDM660, and IPQ5424.
- Correct APQ8064 PLL15 setup, MSM8939 Venus GDSC flags, SM8450 display
  clock ops, Glymur clock IDs and UFS mux ops, X1E80100 USB4 polling,
  and Lucid Ole PLL status handling.
- Split out the X1E80100 TCSR binding and use the clk_ref helper, merge
  SM7150 into the SM6375 GCC binding, sort the Nord Kconfig entries,
  and migrate the SM8450 display controller to common driver data.
- Add Abel Vesa as a reviewer for Qualcomm clock drivers.

----------------------------------------------------------------
Aamir Ahmed (1):
      clk: qcom: ipq-cmn-pll: Assign .num before accessing .hws

Abel Vesa (80):
      MAINTAINERS: add Abel as reviewer for Qualcomm clocks drivers
      clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
      dt-bindings: clock: qcom: gcc-sdm845: Require CX power domain
      dt-bindings: clock: qcom: gcc-sm8150: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8250: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8350: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm8450: Add CX power domain
      dt-bindings: clock: qcom: qcs615-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8550-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8650-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm8750-gcc: Add CX power domain
      dt-bindings: clock: qcom: sm4450-gcc: Add CX power domain
      dt-bindings: clock: qcom: gcc-sm6350: Add CX power domain
      dt-bindings: clock: qcom: qcs8300-gcc: Add CX power domain
      dt-bindings: clock: qcom: sdx75-gcc: Add CX power domain
      clk: qcom: gcc-eliza: Tie the CX power domain to controller
      clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
      clk: qcom: gcc-qcs8300: Tie the CX power domain to controller
      clk: qcom: gcc-sa8775p: Tie the CX power domain to controller
      clk: qcom: gcc-sar2130p: Tie the CX power domain to controller
      clk: qcom: gcc-sc7280: Tie the CX power domain to controller
      clk: qcom: gcc-sdx75: Tie the CX power domain to controller
      clk: qcom: gcc-sm4450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8350: Tie the CX power domain to controller
      clk: qcom: gcc-sm8450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8550: Tie the CX power domain to controller
      clk: qcom: gcc-sm8650: Tie the CX power domain to controller
      clk: qcom: gcc-sm8750: Tie the CX power domain to controller
      clk: qcom: gcc-x1e80100: Tie the CX power domain to controller
      clk: qcom: gcc-ipq5424: Fix TME reset register offsets
      clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
      clk: qcom: mmcc-sdm660: Fix MDSS AHB clock HWCG register offset
      clk: qcom: mmcc-msm8960: Configure PLL15 only on APQ8064
      clk: qcom: camcc-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: camcc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: camcc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: camcc-sm8150: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sc7280: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm4450: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm6115: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8250: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8550: Use common probe handling for always-on clocks
      clk: qcom: dispcc-sm8750: Use common probe handling for always-on clocks
      clk: qcom: dispcc-x1e80100: Use common probe handling for always-on clocks
      clk: qcom: dispcc0-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: dispcc1-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: gcc-qcs615: Use common clock controller probe data
      clk: qcom: gcc-qcs8300: Use common clock controller probe data
      clk: qcom: gcc-sa8775p: Use common clock controller probe data
      clk: qcom: gcc-sar2130p: Use common clock controller probe data
      clk: qcom: gcc-sc7180: Use common clock controller probe data
      clk: qcom: gcc-sc7280: Use common clock controller probe data
      clk: qcom: gcc-sc8280xp: Use common clock controller probe data
      clk: qcom: gcc-sdx55: Use common clock controller probe data
      clk: qcom: gcc-sdx65: Use common clock controller probe data
      clk: qcom: gcc-sdx75: Use common clock controller probe data
      clk: qcom: gcc-sm4450: Use common clock controller probe data
      clk: qcom: gcc-sm7150: Use common clock controller probe data
      clk: qcom: gcc-sm8250: Use common clock controller probe data
      clk: qcom: gcc-sm8350: Use common clock controller probe data
      clk: qcom: gcc-sm8450: Use common clock controller probe data
      clk: qcom: gcc-sm8550: Use common clock controller probe data
      clk: qcom: gcc-sm8650: Use common clock controller probe data
      clk: qcom: gcc-sm8750: Use common clock controller probe data
      clk: qcom: gcc-x1e80100: Use common clock controller probe data
      clk: qcom: gpucc-sar2130p: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sc7280: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sc8280xp: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sm4450: Use common probe handling for always-on clocks
      clk: qcom: gpucc-sm8550: Use common probe handling for always-on clocks
      clk: qcom: gpucc-x1e80100: Use common probe handling for always-on clocks
      clk: qcom: gpucc-x1p42100: Use common probe handling for always-on clocks
      clk: qcom: lpasscorecc-sc7180: Use common probe handling for always-on clocks
      clk: qcom: videocc-sa8775p: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm6350: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm7150: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm8250: Use common probe handling for always-on clocks
      clk: qcom: videocc-sm8350: Use common probe handling for always-on clocks

Bartosz Golaszewski (2):
      dt-bindings: clock: qcom: nord-negcc: Add the secondary QUSB2 PHY reset
      clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset

Bjorn Andersson (10):
      Merge branch '20260806-eliza-mm-cc-v9-v10-1-6ba52dd14343@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260730-gpucc-hawi-v2-1-7bf618ab8a34@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260805-qcs8300-tsc-clks-v1-1-e7a5101ed479@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260801-nord_videocc_camcc-v2-1-674d7718e41f@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260827-kuno-soc-support-v5-10-6d47636a8f09@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260915-camcc-hawi-v3-1-5b57f45477f1@oss.qualcomm.com' into HEAD
      Merge branch '20260921-msm8952-initial-support-v3-1-b96fd3fe298b@mainlining.org' into clk-for-7.4
      Merge branch '20260811-ipq9650_icc-v2-1-55b8efbd62c6@oss.qualcomm.com' into clk-for-7.4
      Merge branch '20260922-maili_camcc-v4-1-87704b664dde@oss.qualcomm.com' into clk-for-7.4

Brian Masney (4):
      driver: core: add subsys_driver() macro
      driver: core: platform: add subsys_platform_driver() macro
      clk: qcom: convert drivers over to use subsys_platform_driver()
      clk: renesas: convert drivers over to use subsys_platform_driver()

Dongfang Zhao (2):
      dt-bindings: clock: qcom: Add Hawi GPU clock controllers
      clk: qcom: Add support for Hawi GPUCC

Erikas Bitovtas (1):
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled

Esteban Urrutia (3):
      clk: qcom: dispcc-sm8450: Fix disp_cc_mdss_mdp_clk_src ops
      clk: qcom: dispcc-sm8450: Migrate to qcom_cc_driver_data
      clk: qcom: alpha-pll: Check Lucid Ole PLL status before configuring

Gabor Juhos (1):
      clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as critical

Hardeep Sharma (4):
      dt-bindings: clock: qcom: Add Kuno Global Clock Controller
      dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
      clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
      clk: qcom: Add Global Clock Controller driver for Kuno

Imran Shaik (2):
      dt-bindings: clock: qcom,qcs8300-gcc: Add TSCSS clocks and resets
      clk: qcom: gcc-qcs8300: Add support for TSCSS clocks and resets

Jagadeesh Kona (7):
      dt-bindings: clock: qcom: Add Maili Graphics Clock Controllers
      clk: qcom: Add Graphics clock controller support on Qualcomm Maili SoC
      dt-bindings: clock: qcom: Add Maili camera clock controllers
      clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
      clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for GCC UFS muxes
      clk: qcom: Fix camera rivian PLL configuration settings
      clk: qcom: Add support for camera clock controller on Maili

Kathiravan Thirumoorthy (5):
      dt-bindings: interconnect: Add Qualcomm IPQ9650 support
      clk: qcom: ipq5018: add 24MHz rate for USB UTMI clock
      clk: qcom: ipq5332: add 24MHz rate for USB UTMI clock
      clk: qcom: ipq5210: add 24MHz rate for USB UTMI clock
      clk: qcom: ipq9650: Use icc-clk for enabling NoC related clocks

Konrad Dybcio (4):
      clk: qcom: gcc-x1e80100: Don't poll the status bit of GCC_USB4_n_SYS_CLK
      clk: qcom: rcg2: Initialize shared floor clock state
      clk: qcom: rcg2: Propagate force-enable status errors
      clk: qcom: rcg2: Clear force enable after rate failure

Krzysztof Kozlowski (1):
      dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375

Luo Jie (10):
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5210 SoC
      clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
      clk: qcom: clk-regmap-divider: Support CLK_DIVIDER_* flags
      clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
      clk: qcom: ipq-cmn-pll: Add NSS clock support
      clk: qcom: ipq-cmn-pll: Add PPE clock support
      clk: qcom: ipq-cmn-pll: Add PON reference clock support
      clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
      clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
      clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210

Muzaffer Kadir (3):
      dt-bindings: clock: qcom: Add MSM8952 global clock controller
      clk: qcom: Add global clock controller driver for MSM8952
      dt-bindings: clock: qcom,rpmcc: Add MSM8952 compatible

Qiang Yu (2):
      dt-bindings: clock: qcom: Move x1e80100 TCSR to own binding
      clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper

Shawn Guo (1):
      clk: qcom: Sort Nord clock driver entries in Kconfig

Sivansh Gupta (1):
      clk: qcom: Fix CLK_GLYMUR_GPUCC default and CLK_GLYMUR_EVACC duplicate

Sreeshankar K (2):
      dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
      clk: qcom: rpmh: Add SM7250 rpmh clocks

Srinivas Kandagatla (1):
      clk: qcom: fix SM6115 lpasscc register offset

Taniya Das (17):
      dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
      dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
      dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      dt-bindings: clock: qcom: Add GCC video axi reset clocks for Nord
      dt-bindings: clock: qcom: Add video clock controller on Nord SoC
      dt-bindings: clock: qcom: Add support for Camera Clock Controller for Nord
      clk: qcom: nwgcc-nord: Add video axi clock resets for Nord
      clk: qcom: videocc-glymur: Add video clock controller support for Nord
      clk: qcom: camcc: Add support for camera clock controller for Nord
      clk: qcom: gcc: Fix GPLL enable register offset for Nord SoC
      dt-bindings: clock: qcom: Add EMAC CNOC APB clocks for Nord
      clk: qcom: segcc-nord: Add EMAC CNOC APB clocks for Nord SoC

Vivek Aknurwar (2):
      dt-bindings: clock: qcom: Add Hawi CAMCC compatible strings
      clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi

 .../bindings/clock/qcom,gcc-msm8952.yaml           |   65 +
 .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |    6 +-
 .../devicetree/bindings/clock/qcom,gcc-sm6350.yaml |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sm8150.yaml |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sm8350.yaml |    7 +
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |    7 +
 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml |   80 +
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |    1 +
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   23 +-
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   |   52 +
 .../bindings/clock/qcom,milos-camcc.yaml           |   39 +-
 .../bindings/clock/qcom,milos-videocc.yaml         |   29 +-
 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |    7 +
 .../bindings/clock/qcom,qcs8300-gcc.yaml           |    7 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    5 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +
 .../devicetree/bindings/clock/qcom,sdx75-gcc.yaml  |    7 +
 .../devicetree/bindings/clock/qcom,sm4450-gcc.yaml |    7 +
 .../devicetree/bindings/clock/qcom,sm6375-gcc.yaml |    9 +-
 .../devicetree/bindings/clock/qcom,sm7150-gcc.yaml |   53 -
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   47 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    2 +
 .../devicetree/bindings/clock/qcom,sm8550-gcc.yaml |    7 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 -
 .../devicetree/bindings/clock/qcom,sm8650-gcc.yaml |    7 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    7 +
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         |  114 +
 MAINTAINERS                                        |    1 +
 drivers/clk/qcom/Kconfig                           |  149 +-
 drivers/clk/qcom/Makefile                          |    9 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  464 +++
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |    7 +
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |    7 +
 drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++
 drivers/clk/qcom/camcc-glymur.c                    |    7 +
 drivers/clk/qcom/camcc-hawi.c                      | 3152 +++++++++++++++++
 drivers/clk/qcom/camcc-nord.c                      | 2941 ++++++++++++++++
 drivers/clk/qcom/camcc-sa8775p.c                   |   36 +-
 drivers/clk/qcom/camcc-sc8280xp.c                  |   13 +-
 drivers/clk/qcom/camcc-sm7150.c                    |   13 +-
 drivers/clk/qcom/camcc-sm8150.c                    |   13 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |    9 +
 drivers/clk/qcom/clk-rcg2.c                        |   35 +-
 drivers/clk/qcom/clk-regmap-divider.c              |   16 +-
 drivers/clk/qcom/clk-regmap-divider.h              |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   44 +
 drivers/clk/qcom/dispcc-sc7280.c                   |   13 +-
 drivers/clk/qcom/dispcc-sc8280xp.c                 |   18 +-
 drivers/clk/qcom/dispcc-sm4450.c                   |   15 +-
 drivers/clk/qcom/dispcc-sm6115.c                   |   13 +-
 drivers/clk/qcom/dispcc-sm7150.c                   |   13 +-
 drivers/clk/qcom/dispcc-sm8250.c                   |   13 +-
 drivers/clk/qcom/dispcc-sm8450.c                   |   40 +-
 drivers/clk/qcom/dispcc-sm8550.c                   |   13 +-
 drivers/clk/qcom/dispcc-sm8750.c                   |   19 +-
 drivers/clk/qcom/dispcc-x1e80100.c                 |   27 +-
 drivers/clk/qcom/dispcc0-sa8775p.c                 |   15 +-
 drivers/clk/qcom/dispcc1-sa8775p.c                 |   15 +-
 drivers/clk/qcom/gcc-eliza.c                       |   13 +-
 drivers/clk/qcom/gcc-glymur.c                      |   81 +-
 drivers/clk/qcom/gcc-hawi.c                        |   12 +-
 drivers/clk/qcom/gcc-ipq5018.c                     |   10 +
 drivers/clk/qcom/gcc-ipq5210.c                     |    1 +
 drivers/clk/qcom/gcc-ipq5332.c                     |    1 +
 drivers/clk/qcom/gcc-ipq5424.c                     |    4 +-
 drivers/clk/qcom/gcc-ipq9650.c                     |   22 +
 drivers/clk/qcom/gcc-kaanapali.c                   |   13 +-
 drivers/clk/qcom/gcc-kuno.c                        | 1473 ++++++++
 drivers/clk/qcom/gcc-milos.c                       |   12 +-
 drivers/clk/qcom/gcc-msm8939.c                     |    4 +
 drivers/clk/qcom/gcc-msm8952.c                     | 3548 ++++++++++++++++++++
 drivers/clk/qcom/gcc-nord.c                        |   12 +-
 drivers/clk/qcom/gcc-qcm2290.c                     |   12 +-
 drivers/clk/qcom/gcc-qcs615.c                      |   69 +-
 drivers/clk/qcom/gcc-qcs8300.c                     |  167 +-
 drivers/clk/qcom/gcc-qdu1000.c                     |   12 +-
 drivers/clk/qcom/gcc-sa8775p.c                     |   56 +-
 drivers/clk/qcom/gcc-sar2130p.c                    |   58 +-
 drivers/clk/qcom/gcc-sc7180.c                      |   60 +-
 drivers/clk/qcom/gcc-sc7280.c                      |   67 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    |   47 +-
 drivers/clk/qcom/gcc-sdx55.c                       |   43 +-
 drivers/clk/qcom/gcc-sdx65.c                       |   43 +-
 drivers/clk/qcom/gcc-sdx75.c                       |   44 +-
 drivers/clk/qcom/gcc-shikra.c                      |   12 +-
 drivers/clk/qcom/gcc-sm4450.c                      |   77 +-
 drivers/clk/qcom/gcc-sm6115.c                      |   12 +-
 drivers/clk/qcom/gcc-sm6125.c                      |   12 +-
 drivers/clk/qcom/gcc-sm6375.c                      |   12 +-
 drivers/clk/qcom/gcc-sm7150.c                      |   72 +-
 drivers/clk/qcom/gcc-sm8150.c                      |   12 +-
 drivers/clk/qcom/gcc-sm8250.c                      |   69 +-
 drivers/clk/qcom/gcc-sm8350.c                      |   65 +-
 drivers/clk/qcom/gcc-sm8450.c                      |   64 +-
 drivers/clk/qcom/gcc-sm8550.c                      |   70 +-
 drivers/clk/qcom/gcc-sm8650.c                      |   72 +-
 drivers/clk/qcom/gcc-sm8750.c                      |   89 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   80 +-
 drivers/clk/qcom/gpucc-eliza.c                     |  606 ++++
 drivers/clk/qcom/gpucc-hawi.c                      |  477 +++
 drivers/clk/qcom/gpucc-sar2130p.c                  |   13 +-
 drivers/clk/qcom/gpucc-sc7280.c                    |   22 +-
 drivers/clk/qcom/gpucc-sc8280xp.c                  |   15 +-
 drivers/clk/qcom/gpucc-sm4450.c                    |   17 +-
 drivers/clk/qcom/gpucc-sm8550.c                    |   15 +-
 drivers/clk/qcom/gpucc-x1e80100.c                  |   13 +-
 drivers/clk/qcom/gpucc-x1p42100.c                  |   17 +-
 drivers/clk/qcom/ipq-cmn-pll.c                     |  538 ++-
 drivers/clk/qcom/lpasscc-sc7280.c                  |   12 +-
 drivers/clk/qcom/lpasscc-sdm845.c                  |   12 +-
 drivers/clk/qcom/lpasscc-sm6115.c                  |    4 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c              |   31 +-
 drivers/clk/qcom/mmcc-msm8960.c                    |    3 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |    4 +-
 drivers/clk/qcom/mmcc-sdm660.c                     |    2 +-
 drivers/clk/qcom/negcc-nord.c                      |    5 +-
 drivers/clk/qcom/nwgcc-nord.c                      |    5 +-
 drivers/clk/qcom/segcc-nord.c                      |   40 +-
 drivers/clk/qcom/tcsrcc-eliza.c                    |   12 +-
 drivers/clk/qcom/tcsrcc-glymur.c                   |   12 +-
 drivers/clk/qcom/tcsrcc-kaanapali.c                |   12 +-
 drivers/clk/qcom/tcsrcc-sm8550.c                   |   12 +-
 drivers/clk/qcom/tcsrcc-sm8650.c                   |   12 +-
 drivers/clk/qcom/tcsrcc-sm8750.c                   |   12 +-
 drivers/clk/qcom/tcsrcc-x1e80100.c                 |  347 +-
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 drivers/clk/qcom/videocc-glymur.c                  |   38 +
 drivers/clk/qcom/videocc-sa8775p.c                 |   17 +-
 drivers/clk/qcom/videocc-sm6350.c                  |   13 +-
 drivers/clk/qcom/videocc-sm7150.c                  |   13 +-
 drivers/clk/qcom/videocc-sm8250.c                  |   15 +-
 drivers/clk/qcom/videocc-sm8350.c                  |   31 +-
 drivers/clk/qcom/videocc-sm8750.c                  |   12 +-
 drivers/clk/renesas/r9a06g032-clocks.c             |    8 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |    7 +-
 drivers/clk/renesas/rzg2l-cpg.c                    |    7 +-
 drivers/clk/renesas/rzv2h-cpg.c                    |    7 +-
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 +
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 include/dt-bindings/clock/qcom,gcc-msm8952.h       |  215 ++
 include/dt-bindings/clock/qcom,hawi-camcc.h        |  165 +
 include/dt-bindings/clock/qcom,hawi-gpucc.h        |   47 +
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   |   30 +
 include/dt-bindings/clock/qcom,kuno-gcc.h          |  100 +
 include/dt-bindings/clock/qcom,nord-camcc.h        |  167 +
 include/dt-bindings/clock/qcom,nord-negcc.h        |    1 +
 include/dt-bindings/clock/qcom,nord-nwgcc.h        |    3 +
 include/dt-bindings/clock/qcom,nord-segcc.h        |    2 +
 include/dt-bindings/clock/qcom,qcs8300-gcc.h       |    6 +
 include/dt-bindings/interconnect/qcom,ipq9650.h    |   28 +
 include/linux/device/driver.h                      |   31 +
 include/linux/platform_device.h                    |   30 +
 156 files changed, 19545 insertions(+), 1544 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8952.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sm7150-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
 create mode 100644 drivers/clk/qcom/cambistmclkcc-eliza.c
 create mode 100644 drivers/clk/qcom/camcc-eliza.c
 create mode 100644 drivers/clk/qcom/camcc-hawi.c
 create mode 100644 drivers/clk/qcom/camcc-nord.c
 create mode 100644 drivers/clk/qcom/gcc-kuno.c
 create mode 100644 drivers/clk/qcom/gcc-msm8952.c
 create mode 100644 drivers/clk/qcom/gpucc-eliza.c
 create mode 100644 drivers/clk/qcom/gpucc-hawi.c
 create mode 100644 drivers/clk/qcom/videocc-eliza.c
 create mode 100644 include/dt-bindings/clock/qcom,eliza-cambistmclkcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8952.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,kuno-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-camcc.h
 create mode 100644 include/dt-bindings/interconnect/qcom,ipq9650.h
