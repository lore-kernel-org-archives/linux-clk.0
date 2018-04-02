Return-Path: <tdas@codeaurora.org>
From: Taniya Das <tdas@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 0/3] Update reset and poll logic for GDSCs
Date: Mon,  2 Apr 2018 16:15:42 +0530
Message-Id: <1522665945-28147-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This series implements the below logic for the GDSCs

1. logic to reset the AON logic before or assert/deassert the block
   control reset removing the clamp io for few GDSCs on SDM845 SoC.
2. It also introduces the requirement to poll for higher timeout values
   for few of the GDSCs.
3. There is a new poll register for the GDSCs on SDM845 SoCs which needs
   to be polled for the correct hardware status of the GDSCs.

Amit Nischal (3):
  clk: qcom: gdsc: Add support to reset AON and block reset logic
  clk: qcom: gdsc: Add support to poll for higher timeout value
  clk: qcom: gdsc: Add support to poll CFG register to check GDSC state

 drivers/clk/qcom/gdsc.c | 77 +++++++++++++++++++++++++++++++++++++++++++++----
 drivers/clk/qcom/gdsc.h |  6 +++-
 2 files changed, 76 insertions(+), 7 deletions(-)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
