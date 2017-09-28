Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 00/13] Updates for QCOM Alpha PLL
Date: Thu, 28 Sep 2017 23:20:37 +0530
Message-Id: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This patch series does the miscellaneous changes in QCOM Alpha PLL
operation and structure to support other types of Alpha PLL’s.

1. It adds the pll_type which will be used for determining all
   the properties of Alpha PLL.
2. It adds the support for Brammo and Huayra PLL’s for which
   the support is not available in existing alpha PLL code.
3. There won’t be any change in existing users of Alpha PLL’s
   since all the newly added code will be under flag for the default
   PLL operations.

The previous RFC series can be found for this in
https://www.spinics.net/lists/linux-clk/msg19305.html

Abhishek Sahu (13):
  clk: qcom: remove redundant PLL_MODE macro offset
  clk: qcom: minor code reorganization related with offset variable
  clk: qcom: support for alpha pll properties
  clk: qcom: fix 16 bit alpha support calculation
  clk: qcom: add and use alpha register width from PLL properties
  clk: qcom: flag for 64 bit CONFIG_CTL
  clk: qcom: support for alpha mode configuration
  clk: qcom: support for dynamic updating the PLL
  clk: qcom: add flag for VCO operation
  clk: qcom: support for Huayra PLL
  clk: qcom: support for Brammo PLL
  clk: qcom: support for 2 bit PLL post divider
  clk: qcom: add read-only alpha pll post divider operations

 drivers/clk/qcom/clk-alpha-pll.c | 701 +++++++++++++++++++++++++++++++++------
 drivers/clk/qcom/clk-alpha-pll.h |  19 +-
 2 files changed, 609 insertions(+), 111 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
