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
Subject: [PATCH v2] clk: qcom: clk-smd-rpm: Fix the reported rate of branches
Date: Thu, 13 Jul 2017 16:32:24 +0300
Message-Id: <20170713133224.753-1-georgi.djakov@linaro.org>
In-Reply-To: <20170712231413.GP22780@codeaurora.org>
References: <20170712231413.GP22780@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

As there is no way to actually query the hardware for the current clock
rate, now racalc_rate() just returns the last rate that was previously
set. But if the rate was not set yet, we return the bogus rate of 1000Hz.

The branch clocks actually have the same rate as their parent (xo_board),
so just return this rate.

Reported-by: Archit Taneja <architt@codeaurora.org>
Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index d990fe44aef3..b45782657ca9 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -364,6 +364,10 @@ static unsigned long clk_smd_rpm_recalc_rate(struct clk_hw *hw,
 {
 	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
 
+	/* Return the parent rate for branches */
+	if (r->branch)
+		return parent_rate;
+
 	/*
 	 * RPM handles rate rounding and we don't have a way to
 	 * know what the rate will be, so just return whatever
