Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jianguo Sun <sunjianguo1@huawei.com>,
	linux-clk@vger.kernel.org,
	project-aspen-dev@linaro.org,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/5] clk: hi3798cv200: fix unregister call sequence in error path
Date: Wed, 24 Jan 2018 19:48:23 +0800
Message-Id: <1516794507-5607-2-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
References: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The unregister call sequence in error path of function
hi3798cv200_clk_register() should be opposite to the order of register
calls.  Let's reverse the call sequence to fix the problem.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/hisilicon/crg-hi3798cv200.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
index 8478948e858e..c586c79f4623 100644
--- a/drivers/clk/hisilicon/crg-hi3798cv200.c
+++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
@@ -202,18 +202,17 @@ static struct hisi_clock_data *hi3798cv200_clk_register(
 
 	return clk_data;
 
-unregister_fixed_rate:
-	hisi_clk_unregister_fixed_rate(hi3798cv200_fixed_rate_clks,
-				ARRAY_SIZE(hi3798cv200_fixed_rate_clks),
+unregister_gate:
+	hisi_clk_unregister_gate(hi3798cv200_gate_clks,
+				ARRAY_SIZE(hi3798cv200_gate_clks),
 				clk_data);
-
 unregister_mux:
 	hisi_clk_unregister_mux(hi3798cv200_mux_clks,
 				ARRAY_SIZE(hi3798cv200_mux_clks),
 				clk_data);
-unregister_gate:
-	hisi_clk_unregister_gate(hi3798cv200_gate_clks,
-				ARRAY_SIZE(hi3798cv200_gate_clks),
+unregister_fixed_rate:
+	hisi_clk_unregister_fixed_rate(hi3798cv200_fixed_rate_clks,
+				ARRAY_SIZE(hi3798cv200_fixed_rate_clks),
 				clk_data);
 	return ERR_PTR(ret);
 }
-- 
1.9.1
