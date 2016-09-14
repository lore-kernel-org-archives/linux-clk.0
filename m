Return-Path: <arvind.yadav.cs@gmail.com>
Return-Path: <arvind.yadav.cs@gmail.com>
Message-ID: <57d92940.6329c80a.3d959.9d78@mx.google.com>
From: arvind.yadav.cs@gmail.com
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: a.hajda@samsung.com,
	lee.jones@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] clk: st: clk-flexgen: Unmap region obtained by of_iomap
Date: Wed, 14 Sep 2016 16:08:31 +0530
In-Reply-To: <y>
References: <y>
List-ID: <linux-clk.vger.kernel.org>

From: Arvind Yadav <arvind.yadav.cs@gmail.com>

Free memory mapping, if probe is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/st/clk-flexgen.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 546bd79..af8df7b 100644
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
@@ -337,6 +339,8 @@ static void __init st_of_flexgen_setup(struct device_node *np)
 	return;
 
 err:
+	if (reg)
+		iounmap(reg);
 	if (clk_data)
 		kfree(clk_data->clks);
 	kfree(clk_data);
-- 
1.7.9.5
