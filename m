Return-Path: <>
Return-Path: <>
From: Arvind yadav <arvind.yadav.cs@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: a.hajda@samsung.com,
	lee.jones@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [v2] clk: st: clk-flexgen: Unmap region obtained by of_iomap
Date: Mon, 19 Sep 2016 13:51:24 +0530
Message-Id: <1474273285-9053-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Arvind Yadav <arvind.yadav.cs@gmail.com>

Free memory mapping, if probe is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/st/clk-flexgen.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 546bd79..ba69098 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -278,8 +278,10 @@ static void __init st_of_flexgen_setup(struct device_node *np)
 		return;
 
 	parents = flexgen_get_parents(np, &num_parents);
-	if (!parents)
+	if (!parents) {
+		iounmap(reg);
 		return;
+	}
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
@@ -337,6 +339,7 @@ static void __init st_of_flexgen_setup(struct device_node *np)
 	return;
 
 err:
+	iounmap(reg);
 	if (clk_data)
 		kfree(clk_data->clks);
 	kfree(clk_data);
-- 
1.7.9.5
