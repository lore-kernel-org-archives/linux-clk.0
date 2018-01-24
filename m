Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
From: Shawn Guo <shawn.guo@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jianguo Sun <sunjianguo1@huawei.com>,
	linux-clk@vger.kernel.org,
	project-aspen-dev@linaro.org,
	Younian Wang <wangyounian@hisilicon.com>,
	Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/5] clk: hi3798cv200: correct IR clock parent
Date: Wed, 24 Jan 2018 19:48:24 +0800
Message-Id: <1516794507-5607-3-git-send-email-shawn.guo@linaro.org>
In-Reply-To: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
References: <1516794507-5607-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

From: Younian Wang <wangyounian@hisilicon.com>

The IR clock is sourced from '24m' rather than '100m'.  Correct it.

Signed-off-by: Younian Wang <wangyounian@hisilicon.com>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/hisilicon/crg-hi3798cv200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
index c586c79f4623..d7d1ba0153ec 100644
--- a/drivers/clk/hisilicon/crg-hi3798cv200.c
+++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
@@ -244,7 +244,7 @@ static void hi3798cv200_clk_unregister(struct platform_device *pdev)
 #define HI3798CV200_SYSCTRL_NR_CLKS 16
 
 static const struct hisi_gate_clock hi3798cv200_sysctrl_gate_clks[] = {
-	{ HISTB_IR_CLK, "clk_ir", "100m",
+	{ HISTB_IR_CLK, "clk_ir", "24m",
 		CLK_SET_RATE_PARENT, 0x48, 4, 0, },
 	{ HISTB_TIMER01_CLK, "clk_timer01", "24m",
 		CLK_SET_RATE_PARENT, 0x48, 6, 0, },
-- 
1.9.1
