Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56538 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751123AbdCWHox (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Mar 2017 03:44:53 -0400
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] clk: qcom: gdsc: Fix the vfe1 powerdomain name
Date: Thu, 23 Mar 2017 13:13:40 +0530
Message-Id: <1490255020-31616-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Fix a typo which caused both vfe0 and vfe1 powerdomains to be
named as vfe0

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 9b97246..20d8fea 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -2986,7 +2986,7 @@ enum {
 	.cxcs = (unsigned int []){ 0x36ac },
 	.cxc_count = 1,
 	.pd = {
-		.name = "vfe0",
+		.name = "vfe1",
 	},
 	.parent = &camss_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

