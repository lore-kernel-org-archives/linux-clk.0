Return-Path: <>
Return-Path: <>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: geert+renesas@glider.be,
	laurent.pinchart@ideasonboard.com,
	horms+renesas@verge.net.au,
	ulf.hansson@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] clk: renesas: clk-mstp: Free memory and Unmap region obtained by kzalloc and of_iomap
Date: Tue, 20 Sep 2016 18:09:19 +0530
Message-Id: <1474375159-16568-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Arvind Yadav <arvind.yadav.cs@gmail.com>

Free memory and memory mapping , if cpg_mstp_clocks_init is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/renesas/clk-mstp.c |   14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 5093a25..19e73c8 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -179,14 +179,20 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	group->data.clks = clks;
 
 	group->smstpcr = of_iomap(np, 0);
-	group->mstpsr = of_iomap(np, 1);
-
 	if (group->smstpcr == NULL) {
 		pr_err("%s: failed to remap SMSTPCR\n", __func__);
 		kfree(group);
 		kfree(clks);
 		return;
 	}
+	group->mstpsr = of_iomap(np, 1);
+	if (group->mstpsr == NULL) {
+		pr_err("%s: failed to remap MSTPCR\n", __func__);
+		iounmap(group->smstpcr);
+		kfree(group);
+		kfree(clks);
+		return;
+	}
 
 	for (i = 0; i < MSTP_MAX_CLOCKS; ++i)
 		clks[i] = ERR_PTR(-ENOENT);
@@ -236,6 +242,10 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 		} else {
 			pr_err("%s: failed to register %s %s clock (%ld)\n",
 			       __func__, np->name, name, PTR_ERR(clks[clkidx]));
+			iounmap(group->smstpcr);
+			iounmap(group->mstpsr);
+			kfree(group);
+			kfree(clks);
 		}
 	}
 
-- 
1.7.9.5
