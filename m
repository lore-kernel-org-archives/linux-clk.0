Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 1/5] clk: mvebu: Use kcalloc() in of_cpu_clk_setup()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Message-ID: <9377530b-9b07-bfc6-848c-b0c1994e33f7@users.sourceforge.net>
Date: Wed, 19 Apr 2017 21:52:55 +0200
MIME-Version: 1.0
In-Reply-To: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 20:15:21 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/mvebu/clk-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
index 044892b6534d..072aa38374ce 100644
--- a/drivers/clk/mvebu/clk-cpu.c
+++ b/drivers/clk/mvebu/clk-cpu.c
@@ -186,11 +186,11 @@ static void __init of_cpu_clk_setup(struct device_node *node)
 	for_each_node_by_type(dn, "cpu")
 		ncpus++;
 
-	cpuclk = kzalloc(ncpus * sizeof(*cpuclk), GFP_KERNEL);
+	cpuclk = kcalloc(ncpus, sizeof(*cpuclk), GFP_KERNEL);
 	if (WARN_ON(!cpuclk))
 		goto cpuclk_out;
 
-	clks = kzalloc(ncpus * sizeof(*clks), GFP_KERNEL);
+	clks = kcalloc(ncpus, sizeof(*clks), GFP_KERNEL);
 	if (WARN_ON(!clks))
 		goto clks_out;
 
-- 
2.12.2
