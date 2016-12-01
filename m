Return-Path: <bianpan2016@163.com>
From: Pan Bian <bianpan2016@163.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: patches@opensource.wolfsonmicro.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pan Bian <bianpan2016@163.com>
Subject: [PATCH 1/1] clk: clk-wm831x: fix a logic error
Date: Thu,  1 Dec 2016 14:25:44 +0800
Message-Id: <1480573545-18588-1-git-send-email-bianpan2016@163.com>
List-ID: <linux-clk.vger.kernel.org>

Fix bug https://bugzilla.kernel.org/show_bug.cgi?id=188561. Function
wm831x_clkout_is_prepared() returns "true" when it fails to read
CLOCK_CONTROL_1. "true" means the device is already prepared. So
return "true" on the read failure seems improper.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/clk/clk-wm831x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-wm831x.c b/drivers/clk/clk-wm831x.c
index f4fdac5..0621fbf 100644
--- a/drivers/clk/clk-wm831x.c
+++ b/drivers/clk/clk-wm831x.c
@@ -243,7 +243,7 @@ static int wm831x_clkout_is_prepared(struct clk_hw *hw)
 	if (ret < 0) {
 		dev_err(wm831x->dev, "Unable to read CLOCK_CONTROL_1: %d\n",
 			ret);
-		return true;
+		return false;
 	}
 
 	return (ret & WM831X_CLKOUT_ENA) != 0;
-- 
1.9.1
