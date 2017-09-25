Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH] clk/Renesas: Delete an error message for a failed memory
 allocation in three functions
To: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Simon Horman <horms+renesas@verge.net.au>,
 Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Wolfram Sang <wsa@the-dreams.de>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2927869.3rNkSDiBcX@avalon>
 <bd139d45-f7c1-ac79-6b38-93b1eb1f3e9a@users.sourceforge.net>
 <64106728.50RHrbMaf7@avalon>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <7fa950f5-01b5-fa9b-e4e9-4ed944f46e32@users.sourceforge.net>
Date: Mon, 25 Sep 2017 10:34:24 +0200
MIME-Version: 1.0
In-Reply-To: <64106728.50RHrbMaf7@avalon>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Sep 2017 10:10:51 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/renesas/clk-mstp.c      | 5 +----
 drivers/clk/renesas/clk-rcar-gen2.c | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 500a9e4e03c4..c944cc421e30 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -156,10 +156,8 @@ static struct clk * __init cpg_mstp_clock_register(const char *name,
 	struct clk *clk;
 
 	clock = kzalloc(sizeof(*clock), GFP_KERNEL);
-	if (!clock) {
-		pr_err("%s: failed to allocate MSTP clock.\n", __func__);
+	if (!clock)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.ops = &cpg_mstp_clock_ops;
@@ -196,7 +194,6 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	if (group == NULL || clks == NULL) {
 		kfree(group);
 		kfree(clks);
-		pr_err("%s: failed to allocate group\n", __func__);
 		return;
 	}
 
diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 0b2e56d0d94b..d14cbe1ca29a 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -423,7 +423,6 @@ static void __init rcar_gen2_cpg_clocks_init(struct device_node *np)
 		/* We're leaking memory on purpose, there's no point in cleaning
 		 * up as the system won't boot anyway.
 		 */
-		pr_err("%s: failed to allocate cpg\n", __func__);
 		return;
 	}
 
-- 
2.14.1
