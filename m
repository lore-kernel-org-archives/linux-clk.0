Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: andy.gross@linaro.org,
	david.brown@linaro.org,
	varada@codeaurora.org,
	snlakshm@codeaurora.org,
	pradeepb@codeaurora.org,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v5] Patches for QCOM IPQ4019 clock driver
Date: Thu, 22 Dec 2016 20:10:53 +0530
Message-Id: <1482417654-2998-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

These patches are related to Qualcomm IPQ4019 GCC (Global Clock
Controller) driver code mainly adding the nodes for clock marked
as fixed in current IPQ4019 clock driver and support for multiple
CPU frequencies.

[v5]

   1. Hardcoded the safe parent index for APSS CPU frequency
      change notifier
   2. Removed all other patches which are already reviewed and
      applied

[V4]

   1. Addressed the review comments given in v3 patches.
   2. Removed the intermediate VCO clocks and make VCO as
      part of final divider clock.
   3. Changed some variable and structure names.
   4. Removed intermediate frequency change patch and merged
      in the main patch itself.
   5. Added the APSS CPU frequency change notifier patch
   6. Removed i2c node frequency table which is already reviewed.

[V3]

   1. Addressed the review comments given in v2 patches.
   2. Replaced the do_div with normal division.
   3. Marked the PCNOC node as critical.
   4. Modified the frequency values for the recent change done
      in IPQ4019 bootloader.
   5. Changed the i2c node frequency table for 19.05 MHz clock.

[V2]

   1. Removed the fixed clock references and add the same as clock nodes
   with recalc_rate operation.

Abhishek Sahu (1):
  clk: qcom: ipq4019: Add the cpu clock frequency change notifier

 drivers/clk/qcom/gcc-ipq4019.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
