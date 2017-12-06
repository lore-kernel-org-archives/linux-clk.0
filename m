Return-Path: <linux-kernel-owner@vger.kernel.org>
From: srinivas.kandagatla@linaro.org
To: sboyd@codeaurora.org, linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] clk: qcom: msm8916: fix mnd_width for codec_digcodec
Date: Wed,  6 Dec 2017 12:11:38 +0000
Message-Id: <20171206121139.18936-2-srinivas.kandagatla@linaro.org>
In-Reply-To: <20171206121139.18936-1-srinivas.kandagatla@linaro.org>
References: <20171206121139.18936-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patch fixes missing mnd_width for codec_digital clk, this is now set to
8 inline with datasheet.

Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 506e0736bf92..d973aeaab943 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1443,6 +1443,7 @@ static const struct freq_tbl ftbl_codec_clk[] = {
 
 static struct clk_rcg2 codec_digcodec_clk_src = {
 	.cmd_rcgr = 0x1c09c,
+	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll1_emclk_sleep_map,
 	.freq_tbl = ftbl_codec_clk,
-- 
2.15.0
