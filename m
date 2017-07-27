Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: andy.gross@linaro.org,
	david.brown@linaro.org,
	rnayak@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [RFC 00/12] Misc patches for QCOM clocks
Date: Thu, 27 Jul 2017 16:40:13 +0530
Message-Id: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This patch series does the miscellaneous changes in different
types of Qualcomm clock nodes which are required for IPQ8074 SoC.
Following are the major changes in IPQ8074 for which the existing
code does not have support.

1. Some of the IPQ8074 RCG2 has CFG_RCGR at offset 8 from
   CMD_RCGR instead of offset 4. Following are the register
   offsets of UBI RCG2 in Qualcomm IPQ8074.

	GCC_NSS_UBI0_CMD_RCGR: 0x1868100
	GCC_NSS_UBI0_CFG_RCGR: 0x1868108

2. It uses Brammo and Huayra PLL’s for which the support is
   not available in existing alpha PLL code.
3. Its APSS and UBI PLL offsets are different although both
   are Huayra PLLs.
4. Some of the its divider should not be changed during
   frequency change.

These code changes are generic and it can be used by other
Qualcomm SoCs.  The major change is taking the register offsets
from PLL and RCG2 clock node.  Since this patch series is
touching common code so this has been raised as RFC.

Abhishek Sahu (12):
  clk: qcom: support for register offsets from rcg2 clock node
  clk: qcom: flag for 64 bit CONFIG_CTL
  clk: qcom: support for alpha mode configuration
  clk: qcom: use offset from alpha pll node
  clk: qcom: fix 16 bit alpha support calculation
  Clk: qcom: support for dynamic updating the PLL
  clk: qcom: add flag for VCO operation
  clk: qcom: support for Huayra PLL
  clk: qcom: support for Brammo PLL
  clk: qcom: add read-only divider operations
  clk: qcom: add read-only alpha pll post divider operations
  clk: qcom: add parent map for regmap mux

 drivers/clk/qcom/clk-alpha-pll.c      | 464 +++++++++++++++++++++++++++-------
 drivers/clk/qcom/clk-alpha-pll.h      |  49 +++-
 drivers/clk/qcom/clk-rcg.h            |  21 +-
 drivers/clk/qcom/clk-rcg2.c           |  78 +++---
 drivers/clk/qcom/clk-regmap-divider.c |  29 +++
 drivers/clk/qcom/clk-regmap-divider.h |   1 +
 drivers/clk/qcom/clk-regmap-mux.c     |   6 +
 drivers/clk/qcom/clk-regmap-mux.h     |   2 +
 drivers/clk/qcom/common.h             |  11 +-
 drivers/clk/qcom/gcc-ipq8074.c        |   6 +-
 drivers/clk/qcom/gcc-msm8994.c        |  12 +-
 drivers/clk/qcom/gcc-msm8996.c        |  12 +-
 drivers/clk/qcom/mmcc-msm8996.c       |  48 ++--
 13 files changed, 574 insertions(+), 165 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
