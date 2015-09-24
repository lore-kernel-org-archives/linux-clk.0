Return-Path: <a.hajda@samsung.com>
From: Andrzej Hajda <a.hajda@samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: [PATCH 08/19] clk: st: fix handling result of of_property_count_strings
Date: Thu, 24 Sep 2015 16:00:16 +0200
Message-id: <1443103227-25612-9-git-send-email-a.hajda@samsung.com>
In-reply-to: <1443103227-25612-1-git-send-email-a.hajda@samsung.com>
References: <1443103227-25612-1-git-send-email-a.hajda@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

The function can return negative value.

The problem has been detected using proposed semantic patch
scripts/coccinelle/tests/assign_signed_to_unsigned.cocci [1].

[1]: http://permalink.gmane.org/gmane.linux.kernel/2046107

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi,

To avoid problems with too many mail recipients I have sent whole
patchset only to LKML. Anyway patches have no dependencies.

Regards
Andrzej
---
 drivers/clk/st/clk-flexgen.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index bd355ee..24d9959 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -268,6 +268,7 @@ static void __init st_of_flexgen_setup(struct device_node *np)
 	int num_parents, i;
 	spinlock_t *rlock = NULL;
 	unsigned long flex_flags = 0;
+	int ret;
 
 	pnode = of_get_parent(np);
 	if (!pnode)
@@ -285,13 +286,13 @@ static void __init st_of_flexgen_setup(struct device_node *np)
 	if (!clk_data)
 		goto err;
 
-	clk_data->clk_num = of_property_count_strings(np ,
-			"clock-output-names");
-	if (clk_data->clk_num <= 0) {
+	ret = of_property_count_strings(np, "clock-output-names");
+	if (ret <= 0) {
 		pr_err("%s: Failed to get number of output clocks (%d)",
 				__func__, clk_data->clk_num);
 		goto err;
 	}
+	clk_data->clk_num = ret;
 
 	clk_data->clks = kcalloc(clk_data->clk_num, sizeof(struct clk *),
 			GFP_KERNEL);
-- 
1.9.1
