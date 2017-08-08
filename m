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
Subject: [RFC v2 00/12] Misc patches for QCOM clocks
Date: Tue,  8 Aug 2017 23:54:05 +0530
Message-Id: <1502216657-3342-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

* v2:

1. Discussion is going on with HW team to fix the offset issue in next chip
   version so removed the RCG patch
2. Made “fix 16 bit alpha support calculation” generic to support all cases.

3. Clubbed the [1] and Patch [2] for "support for dynamic updating the PLL"
   a. The PLL_LATCH_INTERFACE bit is not available in every Alpha PLL and it
      will be turned off after default power on. If the PLL user want to turn
      off the LATCH_INTERFACE then they can directly set this bit in
      PLL_USER_CTL_U during alpha_pll_configure and clear the dynamic update
      flag bit
   b. The latching procedure is only required if PLL is enabled
   c. The handling is different according to PLL_UPDATE_BYPASS bit

4. Added the patch for “2 bit PLL post divider”

[1] https://www.spinics.net/lists/linux-arm-msm/msg24569.html
[2] https://www.spinics.net/lists/kernel/msg2566714.html

* v1:

https://www.spinics.net/lists/kernel/msg2566710.html

Abhishek Sahu (12):
  clk: qcom: flag for 64 bit CONFIG_CTL
  clk: qcom: support for alpha mode configuration
  clk: qcom: use offset from alpha pll node
  clk: qcom: fix 16 bit alpha support calculation
  clk: qcom: support for dynamic updating the PLL
  clk: qcom: add flag for VCO operation
  clk: qcom: support for Huayra PLL
  clk: qcom: support for Brammo PLL
  clk: qcom: support for 2 bit PLL post divider
  clk: qcom: add read-only alpha pll post divider operations
  clk: qcom: add read-only divider operations
  clk: qcom: add parent map for regmap mux

 drivers/clk/qcom/clk-alpha-pll.c      | 507 +++++++++++++++++++++++++++-------
 drivers/clk/qcom/clk-alpha-pll.h      |  49 +++-
 drivers/clk/qcom/clk-rcg.h            |  10 -
 drivers/clk/qcom/clk-regmap-divider.c |  29 ++
 drivers/clk/qcom/clk-regmap-divider.h |   1 +
 drivers/clk/qcom/clk-regmap-mux.c     |   6 +
 drivers/clk/qcom/clk-regmap-mux.h     |   2 +
 drivers/clk/qcom/common.h             |  11 +-
 drivers/clk/qcom/gcc-ipq8074.c        |   6 +-
 drivers/clk/qcom/gcc-msm8994.c        |  12 +-
 drivers/clk/qcom/gcc-msm8996.c        |  12 +-
 drivers/clk/qcom/mmcc-msm8996.c       |  48 ++--
 12 files changed, 554 insertions(+), 139 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
