Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DAE305699;
	Fri,  7 Aug 2026 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118316; cv=none; b=adhZ4YaRN2UOElf6ccZQzHATcACzilnbS+tYAGMLE8lsaQVMXerHzJcDFZ3A674y4mtpBvlSO2bWqd2CSRM1rj3OBXTp/w7JX9JLyNtfpsqPXwhwiyVLjgt8nGEG1OF675HcoQez3MJ9BpCNEJJGqWQH/Nj2BaTVy6DpYBW+V88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118316; c=relaxed/simple;
	bh=YypMy5HXk4uX2W1irv6ZbGKdeams1wAJhRa1YNej6jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yix0E2St/w5RxCQHVmNe9NP0rHFSLezyKISJC4OQe7XD5g31so5ZCEDMQ8VgPb0iMgQW5f084B8QJmpbvSYaItxcAXbgug3jgL0n1fe8DmsDqkR+ABxLev+DJFaVC1mth2gufRiZ12f5uOrUMQTEFeBgKcyDwliljDM2HpVyh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5HYNRu/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5HYNRu/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E391F000E9;
	Fri,  7 Aug 2026 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786118314;
	bh=01kctYk5IdKA9UkACtqBMbCGEKvDJapJg0gXo9yw/QM=;
	h=From:To:Cc:Subject:Date;
	b=h5HYNRu/hshbzDtvVTkL1jZJ5Q9JHagMTAWCEi/sBdsYi8D4eE5P64zBMcIVeUkwt
	 qrYlJ3hShlWQyPaAJNFpVRHC717aR/hIXu64DumMXnk+6VOeTI/demIvc2mBBcSF15
	 FQ8PMOUK/N1y7iECi3xzV5P37/0ZsGW1xfw0/rJMAy9epCpeVactEanJStVlsZclDv
	 gVTcbBzI2uqwRUeqU6G8vdJR1e4Dg4rE6GI0eTZRG740sk5pEwDpth8a1h4kuWpU+R
	 fph8CQjvOamToycX5oXQGYHzQK5X7nkvubbJ3iAV4xye7arbTZ7pQ2UDXbOsNQYXii
	 xdUI3p+Gnvspg==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Herman van Hazendonk <github.com@herrie.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Lin Li <zhuolin.li@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Vladimir Zapolskiy <vz@kernel.org>
Subject: [GIT PULL] Qualcomm clock updates for v7.3
Date: Fri,  7 Aug 2026 10:58:30 -0500
Message-ID: <20260807155830.603972-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-7.3

for you to fetch changes up to c7d44572a85ae1b897e0bf95357439ee75ddbcc7:

  clk: qcom: Add support for Qualcomm GPU Clock Controller on Shikra (2026-08-04 10:39:11 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v7.3

Add global, TCSR, RPMh, and video clock controller support for Maili.
Add global, RPM, GPU, display, and audio core clock controller support for
Shikra. Add display and graphics clock controllers for Nord.

Add Glymur camera and EVA clock controllers, the IPQ9650 REFGEN clocks, and
Hawi video clock controller support. Extend the IPQ5210 APSS PLL and RPM
clock support for Agatti.

Enable runtime PM and regulator-backed reference clock handling where needed.
Update QCM2290 clock and power-domain handling, critical clock definitions,
and arm architecture Kconfig defaults.

Correct MDM9607, MSM8916, MSM8939, SM6115, QCS8300, Kaanapali, and Glymur
clock and power-domain handling. Improve GDSC error propagation and teardown.

Update bindings for the added controllers and required power and OPP
properties.

----------------------------------------------------------------
Abel Vesa (2):
      dt-bindings: clock: qcom: glymur-gcc: Add missing CX power domain
      clk: qcom: gcc-glymur: Enable runtime PM

Bjorn Andersson (4):
      Merge branch '20260617-evacc_glymur-v2-2-905108dacaaa@oss.qualcomm.com' into clk-for-7.3
      Merge branch '20260608-shikra-gcc-rpmcc-clks-v5-2-94cefe092ee3@oss.qualcomm.com' into clk-for-7.3
      Merge branch '20260624-glymur_camcc-v5-1-a321df74b1a1@oss.qualcomm.com' into clk-for-7.3
      Merge branch '20260707-b4-ipq9650_refgen_clocks-v1-1-e070624d03d2@oss.qualcomm.com' into clk-for-7.3

Brian Masney (1):
      clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK

Dmitry Baryshkov (2):
      clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video GDSC
      clk: qcom: gcc-qcm2290: don't park QUP RCGs upon registration

Herman van Hazendonk (3):
      clk: qcom: gdsc: propagate gdsc_check_status() errors from gdsc_poll_status
      clk: qcom: gdsc: propagate gdsc_enable() failure for ALWAYS_ON domains
      clk: qcom: gdsc: tear down per-domain genpds in gdsc_unregister()

Imran Shaik (22):
      dt-bindings: clock: qcom,rpmcc: Add Qualcomm Shikra SoC RPMCC
      dt-bindings: clock: qcom: Add Qualcomm Shikra SoC Global Clock Controller
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

Jagadeesh Kona (6):
      clk: qcom: gdsc: Add custom disable callback for GX GDSC
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      clk: qcom: camcc-glymur: Add const qualifier for driver_data & CBCRs list
      dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
      clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

Jerome Brunet (1):
      clk: qcom: clean-up simple provider misuse of the consumer API

Kathiravan Thirumoorthy (3):
      clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
      dt-bindings: clock: qcom: Add IPQ9650 REFGEN clock IDs
      clk: qcom: ipq9650: Add clocks for the REFGEN block

Krzysztof Kozlowski (10):
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

Lin Li (2):
      dt-bindings: clock: qcom: Add Hawi video clock controller
      clk: qcom: Add support for VideoCC driver for Hawi

Loic Poulain (2):
      clk: qcom: gcc-qcs8300: Use retention for PCIe power domains
      clk: qcom: gcc-qcs8300: Use retention for USB power domains

Luca Weiss (1):
      clk: qcom: Don't use all caps for Glymur GPUCC

Qiang Yu (5):
      dt-bindings: clock: qcom: Move glymur TCSR to own binding
      dt-bindings: clock: qcom,glymur-tcsr: Add mahua support
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Add regulator supplies and migrate to clk_ref helper
      clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator support

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

Taniya Das (18):
      clk: qcom: gxclkctl: Use custom disable callback for gx_gdsc
      clk: qcom: common: ensure runtime PM suspend completes on probe
      clk: qcom: gxclkctl: Remove GX/GMxC rail votes to align with IFPC
      dt-bindings: clock: qcom: Add EVA clock and reset controller for Glymur SoC
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

Uwe Kleine-König (The Capable Hub) (1):
      clk: qcom: Drop inclusions of <linux/mod_devicetable.h>

Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

Vladimir Zapolskiy (1):
      clk: qcom: Return expected ENOMEM error on dynamic allocation failure

 .../devicetree/bindings/clock/qcom,a53pll.yaml     |    1 +
 .../bindings/clock/qcom,gcc-mdm9607.yaml           |   18 +-
 .../bindings/clock/qcom,glymur-evacc.yaml          |   72 +
 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml |    8 +
 .../bindings/clock/qcom,glymur-tcsr.yaml           |  146 +
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   11 +-
 .../bindings/clock/qcom,qcm2290-dispcc.yaml        |   15 +-
 .../bindings/clock/qcom,qcm2290-gpucc.yaml         |    4 +-
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   65 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |   65 +-
 .../bindings/clock/qcom,shikra-audiocorecc.yaml    |   55 +
 .../devicetree/bindings/clock/qcom,shikra-gcc.yaml |   70 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   12 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    4 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |   17 +-
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    3 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   34 +-
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 .../bindings/reset/qcom,shikra-audiocore-csr.yaml  |   42 +
 drivers/clk/qcom/Kconfig                           |  274 +-
 drivers/clk/qcom/Makefile                          |    9 +
 drivers/clk/qcom/apss-ipq-pll.c                    |   19 +
 drivers/clk/qcom/audiocorecc-shikra.c              |  810 ++++
 drivers/clk/qcom/camcc-glymur.c                    | 2279 ++++++++++
 drivers/clk/qcom/camcc-sc8280xp.c                  |   19 -
 drivers/clk/qcom/camcc-x1p42100.c                  |    6 +-
 drivers/clk/qcom/clk-hfpll.c                       |    4 +-
 drivers/clk/qcom/clk-krait.c                       |    2 +-
 drivers/clk/qcom/clk-rcg.c                         |    4 +-
 drivers/clk/qcom/clk-rcg2.c                        |    2 +-
 drivers/clk/qcom/clk-ref.c                         |  205 +
 drivers/clk/qcom/clk-smd-rpm.c                     |    5 +
 drivers/clk/qcom/common.c                          |    6 +-
 drivers/clk/qcom/dispcc-qcm2290.c                  |   44 +-
 drivers/clk/qcom/dispcc0-nord.c                    | 2004 +++++++++
 drivers/clk/qcom/dispcc1-nord.c                    | 2004 +++++++++
 drivers/clk/qcom/evacc-glymur.c                    |  454 ++
 drivers/clk/qcom/gcc-glymur.c                      |   33 +-
 drivers/clk/qcom/gcc-hawi.c                        |  201 +
 drivers/clk/qcom/gcc-ipq5424.c                     |   11 -
 drivers/clk/qcom/gcc-ipq9650.c                     |   89 +
 drivers/clk/qcom/gcc-mdm9607.c                     |  193 +-
 drivers/clk/qcom/gcc-msm8916.c                     |    5 +-
 drivers/clk/qcom/gcc-msm8939.c                     |    5 +-
 drivers/clk/qcom/gcc-nord.c                        |   45 +-
 drivers/clk/qcom/gcc-qcm2290.c                     |  131 +-
 drivers/clk/qcom/gcc-qcs8300.c                     |    8 +-
 drivers/clk/qcom/gcc-shikra.c                      | 4432 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sm6115.c                      |    7 +-
 drivers/clk/qcom/gdsc.c                            |   47 +-
 drivers/clk/qcom/gdsc.h                            |    1 +
 drivers/clk/qcom/gpu2cc-nord.c                     |  545 +++
 drivers/clk/qcom/gpucc-nord.c                      |  593 +++
 drivers/clk/qcom/gpucc-qcm2290.c                   |  102 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   12 +-
 drivers/clk/qcom/negcc-nord.c                      |   75 +-
 drivers/clk/qcom/tcsrcc-glymur.c                   |  471 +--
 drivers/clk/qcom/videocc-hawi.c                    |  839 ++++
 drivers/clk/qcom/videocc-maili.c                   |  660 +++
 drivers/clk/qcom/videocc-x1p42100.c                |    4 +-
 include/dt-bindings/clock/qcom,gcc-mdm9607.h       |    1 -
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 +
 include/dt-bindings/clock/qcom,glymur-evacc.h      |   38 +
 include/dt-bindings/clock/qcom,hawi-videocc.h      |   64 +
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |    5 +
 include/dt-bindings/clock/qcom,maili-gcc.h         |   21 +
 include/dt-bindings/clock/qcom,maili-videocc.h     |   50 +
 include/dt-bindings/clock/qcom,nord-dispcc.h       |  115 +
 include/dt-bindings/clock/qcom,nord-gpu2cc.h       |   47 +
 include/dt-bindings/clock/qcom,nord-gpucc.h        |   48 +
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    |   49 +
 include/dt-bindings/clock/qcom,shikra-gcc.h        |  263 ++
 include/linux/clk/qcom.h                           |   67 +
 73 files changed, 17310 insertions(+), 884 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,shikra-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,shikra-audiocore-csr.yaml
 create mode 100644 drivers/clk/qcom/audiocorecc-shikra.c
 create mode 100644 drivers/clk/qcom/camcc-glymur.c
 create mode 100644 drivers/clk/qcom/clk-ref.c
 create mode 100644 drivers/clk/qcom/dispcc0-nord.c
 create mode 100644 drivers/clk/qcom/dispcc1-nord.c
 create mode 100644 drivers/clk/qcom/evacc-glymur.c
 create mode 100644 drivers/clk/qcom/gcc-shikra.c
 create mode 100644 drivers/clk/qcom/gpu2cc-nord.c
 create mode 100644 drivers/clk/qcom/gpucc-nord.c
 create mode 100644 drivers/clk/qcom/videocc-hawi.c
 create mode 100644 drivers/clk/qcom/videocc-maili.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-evacc.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,maili-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,maili-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-gpu2cc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,shikra-audiocorecc.h
 create mode 100644 include/dt-bindings/clock/qcom,shikra-gcc.h
 create mode 100644 include/linux/clk/qcom.h
