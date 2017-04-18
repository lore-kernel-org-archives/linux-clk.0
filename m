Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 6/6] clk: hi3620: Fix a typo in one variable name
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Jiancheng Xue <xuejiancheng@hisilicon.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Message-ID: <6034a36d-a1a2-e942-0651-61f08475d8c8@users.sourceforge.net>
Date: Tue, 18 Apr 2017 11:44:32 +0200
MIME-Version: 1.0
In-Reply-To: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 11:15:56 +0200

The script "checkpatch.pl" pointed information out like the following.

CHECK: 'seperated' may be misspelled - perhaps 'separated'?

Thus rename the affected variable.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/hisilicon/clk-hi3620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon/clk-hi3620.c
index 33a713ac8fe6..fa0fba653898 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -144,7 +144,7 @@ static struct hisi_divider_clock hi3620_div_clks[] __initdata = {
 	{ HI3620_MMC3_DIV,     "mmc3_div",   "mmc3_mux",  0, 0x140, 5, 4, CLK_DIVIDER_HIWORD_MASK, NULL, },
 };
 
-static struct hisi_gate_clock hi3620_seperated_gate_clks[] __initdata = {
+static struct hisi_gate_clock hi3620_separated_gate_clks[] __initdata = {
 	{ HI3620_TIMERCLK01,   "timerclk01",   "timer_rclk01", CLK_SET_RATE_PARENT, 0x20, 0, 0, },
 	{ HI3620_TIMER_RCLK01, "timer_rclk01", "rclk_tcxo",    CLK_SET_RATE_PARENT, 0x20, 1, 0, },
 	{ HI3620_TIMERCLK23,   "timerclk23",   "timer_rclk23", CLK_SET_RATE_PARENT, 0x20, 2, 0, },
@@ -224,8 +224,8 @@ static void __init hi3620_clk_init(struct device_node *np)
 			      clk_data);
 	hisi_clk_register_divider(hi3620_div_clks, ARRAY_SIZE(hi3620_div_clks),
 				  clk_data);
-	hisi_clk_register_gate_sep(hi3620_seperated_gate_clks,
-				   ARRAY_SIZE(hi3620_seperated_gate_clks),
+	hisi_clk_register_gate_sep(hi3620_separated_gate_clks,
+				   ARRAY_SIZE(hi3620_separated_gate_clks),
 				   clk_data);
 }
 CLK_OF_DECLARE(hi3620_clk, "hisilicon,hi3620-clock", hi3620_clk_init);
-- 
2.12.2
