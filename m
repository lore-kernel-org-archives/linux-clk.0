Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] clk: gcc-msm8916: add support to 9.6MHz codec clk
Date: Mon, 12 Jun 2017 10:41:22 +0100
Message-Id: <20170612094122.6770-1-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

MCLK for internal audio codec is expected to be at 9.6MHz by default.
This patch adds support to 9.6MHz to make the default case possible.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 628e6ca276ec..2cfe7000fc60 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1430,6 +1430,7 @@ static struct clk_branch gcc_ultaudio_stc_xo_clk = {
 };
 
 static const struct freq_tbl ftbl_codec_clk[] = {
+	F(9600000, P_XO, 2, 0, 0),
 	F(19200000, P_XO, 1, 0, 0),
 	F(11289600, P_EXT_MCLK, 1, 0, 0),
 	{ }
-- 
2.11.0
