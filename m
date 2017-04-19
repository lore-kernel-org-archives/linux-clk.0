Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 2/5] clk: mvebu: Adjust two checks for null pointers in
 of_cpu_clk_setup()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Message-ID: <5b8ea228-917f-cfde-7000-5d8204b24bc1@users.sourceforge.net>
Date: Wed, 19 Apr 2017 21:54:12 +0200
MIME-Version: 1.0
In-Reply-To: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 20:25:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/mvebu/clk-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
index 072aa38374ce..8162833d2041 100644
--- a/drivers/clk/mvebu/clk-cpu.c
+++ b/drivers/clk/mvebu/clk-cpu.c
@@ -173,13 +173,13 @@ static void __init of_cpu_clk_setup(struct device_node *node)
 	int ncpus = 0;
 	struct device_node *dn;
 
-	if (clock_complex_base == NULL) {
+	if (!clock_complex_base) {
 		pr_err("%s: clock-complex base register not set\n",
 			__func__);
 		return;
 	}
 
-	if (pmu_dfs_base == NULL)
+	if (!pmu_dfs_base)
 		pr_warn("%s: pmu-dfs base register not set, dynamic frequency scaling not available\n",
 			__func__);
 
-- 
2.12.2
