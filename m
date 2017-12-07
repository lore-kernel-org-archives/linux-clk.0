Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:40018 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753371AbdLGOSY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Dec 2017 09:18:24 -0500
Received: by mail-wm0-f65.google.com with SMTP id f206so13102713wmf.5
        for <linux-clk@vger.kernel.org>; Thu, 07 Dec 2017 06:18:23 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: sboyd@codeaurora.org, linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] clk: qcom: gcc-msm8996: always enable aggre0_noc gdsc
Date: Thu,  7 Dec 2017 14:16:18 +0000
Message-Id: <20171207141618.4694-1-srinivas.kandagatla@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

bus clks which depend on this gdsc are marked as critical,
so this patch flags this gdsc ALWAYS_ON so that bus clks status
does not get stuck at on or off.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 0146d8853488..b2be77469693 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -3101,7 +3101,7 @@ static struct gdsc aggre0_noc_gdsc = {
 		.name = "aggre0_noc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | ALWAYS_ON,
 };
 
 static struct gdsc hlos1_vote_aggre0_noc_gdsc = {
-- 
2.15.0

