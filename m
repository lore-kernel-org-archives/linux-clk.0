Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 5/5] clk: mvebu: Delete an unnecessary variable initialisation
 in kirkwood_fix_sscg_deviation()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Message-ID: <adc65587-9ae6-96ad-51fc-ee8a2bedeef0@users.sourceforge.net>
Date: Wed, 19 Apr 2017 21:57:21 +0200
MIME-Version: 1.0
In-Reply-To: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 21:31:43 +0200

A pointer is immediately assigned to the local variable "sscg_np".
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/mvebu/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 659d534a137b..6cfa38566e19 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -44,7 +44,7 @@ static struct clk_onecell_data clk_data;
  */
 u32 kirkwood_fix_sscg_deviation(u32 system_clk)
 {
-	struct device_node *sscg_np = NULL;
+	struct device_node *sscg_np;
 	void __iomem *sscg_map;
 	u32 sscg_reg;
 	s32 low_bound, high_bound;
-- 
2.12.2
