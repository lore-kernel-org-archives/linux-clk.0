Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	andy.gross@linaro.org,
	architt@codeaurora.org,
	hverkuil@xs4all.nl,
	bjorn.andersson@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v3] clk: qcom: clk-smd-rpm: Fix the reported rate of branches
Date: Mon, 17 Jul 2017 18:35:42 +0300
Message-Id: <20170717153542.21676-1-georgi.djakov@linaro.org>
In-Reply-To: <20170713180332.GC22780@codeaurora.org>
References: <20170713180332.GC22780@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

As there is no way to actually query the hardware for the current clock
rate, now racalc_rate() just returns the last rate that was previously
set. But if the rate was not set yet, we return the bogus rate of 1000Hz.

The branch clocks have the same rate as their parent, so in this case we
just need to remove recalc_rate ops and then the core framework will handle
this automagically. The round_rate() is unused, so remove it as well.

Reported-by: Archit Taneja <architt@codeaurora.org>
Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index d990fe44aef3..cc03d5508627 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -412,8 +412,6 @@ static const struct clk_ops clk_smd_rpm_ops = {
 static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
-	.round_rate	= clk_smd_rpm_round_rate,
-	.recalc_rate	= clk_smd_rpm_recalc_rate,
 };
 
 /* msm8916 */
