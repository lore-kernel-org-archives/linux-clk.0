Return-Path: <>
Return-Path: <>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	manabian@gmail.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] clk: nxp: clk-lpc18xx-ccu: Unmap region obtained by of_iomap
Date: Tue, 20 Sep 2016 16:09:47 +0530
Message-Id: <1474367987-15808-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Arvind Yadav <arvind.yadav.cs@gmail.com>

Free memory mapping, if lpc18xx_ccu_init is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/nxp/clk-lpc18xx-ccu.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/nxp/clk-lpc18xx-ccu.c b/drivers/clk/nxp/clk-lpc18xx-ccu.c
index f7136b9..27781b4 100644
--- a/drivers/clk/nxp/clk-lpc18xx-ccu.c
+++ b/drivers/clk/nxp/clk-lpc18xx-ccu.c
@@ -277,12 +277,15 @@ static void __init lpc18xx_ccu_init(struct device_node *np)
 	}
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
-	if (!clk_data)
+	if (!clk_data) {
+		iounmap(reg_base);
 		return;
+	}
 
 	clk_data->num = of_property_count_strings(np, "clock-names");
 	clk_data->name = kcalloc(clk_data->num, sizeof(char *), GFP_KERNEL);
 	if (!clk_data->name) {
+		iounmap(reg_base);
 		kfree(clk_data);
 		return;
 	}
-- 
1.7.9.5
