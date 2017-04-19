Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 4/5] clk: mvebu: Adjust two checks for null pointers in
 kirkwood_fix_sscg_deviation()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Message-ID: <8c5bdefb-896b-cd96-7e69-77ccb4a9286e@users.sourceforge.net>
Date: Wed, 19 Apr 2017 21:56:21 +0200
MIME-Version: 1.0
In-Reply-To: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 21:17:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/mvebu/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 472c88b90256..659d534a137b 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -51,13 +51,13 @@ u32 kirkwood_fix_sscg_deviation(u32 system_clk)
 	u64 freq_swing_half;
 
 	sscg_np = of_find_node_by_name(NULL, "sscg");
-	if (sscg_np == NULL) {
+	if (!sscg_np) {
 		pr_err("cannot get SSCG register node\n");
 		return system_clk;
 	}
 
 	sscg_map = of_iomap(sscg_np, 0);
-	if (sscg_map == NULL) {
+	if (!sscg_map) {
 		pr_err("cannot map SSCG register\n");
 		goto out;
 	}
-- 
2.12.2
