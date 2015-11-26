Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/6] Add support for MSM8996 GDSCs
Date: Thu, 26 Nov 2015 11:24:51 +0530
Message-Id: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This series adds support for GDSCs' which are part of gcc and mmcc
in QCOM msm8996 SoC. Series applies on top of the patches[1] which
adds support for MSM8996 clocks.

There are many more cases of gdscs within gdscs (hierarchical power
domains) in msm8996 (msm8974 has one such instance which is supported
upstream) and hence the series adds support within gdsc driver to
handle this.

Also msm8996 has gdscs with gds hw controllers within, for ensuring
slave device idleness before gdscs are powered off, hence the series
also adds support for gdscs with gds hw controllers.

ToDo: Series does not yet add support for gpu gdscs which are part
of mmcc.

Tested on apq8096 dragonboards to make sure all modelled gdscs can
be turned on/off successfully.

[1] https://lkml.org/lkml/2015/11/17/949 

Rajendra Nayak (6):
  clk: qcom: gdsc: Add support for hierarchical power domains
  clk: qcom: gdsc: Add support for gdscs with gds hw controller
  clk: qcom: gdsc: Add GDSCs in msm8996 GCC
  clk: qcom: gdsc: Add mmcc gdscs for msm8996 family
  clk: qcom: gdsc: Do not check for disabled status on votable gdscs
  clk: qcom: mmcc8974: Use gdscs .parent and remove genpd calls

 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   2 +
 drivers/clk/qcom/common.c                     |  14 ++-
 drivers/clk/qcom/gcc-msm8996.c                |  92 +++++++++++++++
 drivers/clk/qcom/gdsc.c                       |  69 ++++++++---
 drivers/clk/qcom/gdsc.h                       |  34 ++++--
 drivers/clk/qcom/mmcc-msm8974.c               |  14 +--
 drivers/clk/qcom/mmcc-msm8996.c               | 157 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8996.h  |  11 ++
 include/dt-bindings/clock/qcom,mmcc-msm8996.h |  17 +++
 9 files changed, 363 insertions(+), 47 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
