Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 3/5] clk: mvebu: Use kcalloc() in two functions
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Message-ID: <6d6837ee-ea98-00cc-faea-cfa2a556109b@users.sourceforge.net>
Date: Wed, 19 Apr 2017 21:55:32 +0200
MIME-Version: 1.0
In-Reply-To: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 21:08:54 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data types by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/mvebu/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 66be2e0c82b4..472c88b90256 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -126,7 +126,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 	if (desc->get_refclk_freq)
 		clk_data.clk_num += 1;
 
-	clk_data.clks = kzalloc(clk_data.clk_num * sizeof(struct clk *),
+	clk_data.clks = kcalloc(clk_data.clk_num, sizeof(*clk_data.clks),
 				GFP_KERNEL);
 	if (WARN_ON(!clk_data.clks)) {
 		iounmap(base);
@@ -270,7 +270,7 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 		n++;
 
 	ctrl->num_gates = n;
-	ctrl->gates = kzalloc(ctrl->num_gates * sizeof(struct clk *),
+	ctrl->gates = kcalloc(ctrl->num_gates, sizeof(*ctrl->gates),
 			      GFP_KERNEL);
 	if (WARN_ON(!ctrl->gates))
 		goto gates_out;
-- 
2.12.2
