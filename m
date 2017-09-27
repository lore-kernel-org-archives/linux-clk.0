Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 3/3] clk/mmp: Adjust 12 checks for null pointers
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Chao Xie <chao.xie@marvell.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <051d7ba6-e3cc-8354-8315-93fe039dd2ce@users.sourceforge.net>
Message-ID: <e07c8432-3698-8db6-8ce2-7b30efc61fb9@users.sourceforge.net>
Date: Wed, 27 Sep 2017 09:27:40 +0200
MIME-Version: 1.0
In-Reply-To: <051d7ba6-e3cc-8354-8315-93fe039dd2ce@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 09:00:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/mmp/clk-mix.c    | 4 ++--
 drivers/clk/mmp/clk-mmp2.c   | 6 +++---
 drivers/clk/mmp/clk-pxa168.c | 6 +++---
 drivers/clk/mmp/clk-pxa910.c | 8 ++++----
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
index b2471fb369f1..90814b2613c0 100644
--- a/drivers/clk/mmp/clk-mix.c
+++ b/drivers/clk/mmp/clk-mix.c
@@ -229,7 +229,7 @@ static int mmp_clk_mix_determine_rate(struct clk_hw *hw,
 			parent_rate = clk_hw_get_rate(parent);
 			mix_rate = parent_rate / item->divisor;
 			gap = abs(mix_rate - req->rate);
-			if (parent_best == NULL || gap < gap_best) {
+			if (!parent_best || gap < gap_best) {
 				parent_best = parent;
 				parent_rate_best = parent_rate;
 				mix_rate_best = mix_rate;
@@ -247,7 +247,7 @@ static int mmp_clk_mix_determine_rate(struct clk_hw *hw,
 				div = _get_div(mix, j);
 				mix_rate = parent_rate / div;
 				gap = abs(mix_rate - req->rate);
-				if (parent_best == NULL || gap < gap_best) {
+				if (!parent_best || gap < gap_best) {
 					parent_best = parent;
 					parent_rate_best = parent_rate;
 					mix_rate_best = mix_rate;
diff --git a/drivers/clk/mmp/clk-mmp2.c b/drivers/clk/mmp/clk-mmp2.c
index 038023483b98..7460031714da 100644
--- a/drivers/clk/mmp/clk-mmp2.c
+++ b/drivers/clk/mmp/clk-mmp2.c
@@ -83,19 +83,19 @@ void __init mmp2_clk_init(phys_addr_t mpmu_phys, phys_addr_t apmu_phys,
 	void __iomem *apbc_base;
 
 	mpmu_base = ioremap(mpmu_phys, SZ_4K);
-	if (mpmu_base == NULL) {
+	if (!mpmu_base) {
 		pr_err("error to ioremap MPMU base\n");
 		return;
 	}
 
 	apmu_base = ioremap(apmu_phys, SZ_4K);
-	if (apmu_base == NULL) {
+	if (!apmu_base) {
 		pr_err("error to ioremap APMU base\n");
 		return;
 	}
 
 	apbc_base = ioremap(apbc_phys, SZ_4K);
-	if (apbc_base == NULL) {
+	if (!apbc_base) {
 		pr_err("error to ioremap APBC base\n");
 		return;
 	}
diff --git a/drivers/clk/mmp/clk-pxa168.c b/drivers/clk/mmp/clk-pxa168.c
index a9ef9209532a..8e2551ab8462 100644
--- a/drivers/clk/mmp/clk-pxa168.c
+++ b/drivers/clk/mmp/clk-pxa168.c
@@ -75,19 +75,19 @@ void __init pxa168_clk_init(phys_addr_t mpmu_phys, phys_addr_t apmu_phys,
 	void __iomem *apbc_base;
 
 	mpmu_base = ioremap(mpmu_phys, SZ_4K);
-	if (mpmu_base == NULL) {
+	if (!mpmu_base) {
 		pr_err("error to ioremap MPMU base\n");
 		return;
 	}
 
 	apmu_base = ioremap(apmu_phys, SZ_4K);
-	if (apmu_base == NULL) {
+	if (!apmu_base) {
 		pr_err("error to ioremap APMU base\n");
 		return;
 	}
 
 	apbc_base = ioremap(apbc_phys, SZ_4K);
-	if (apbc_base == NULL) {
+	if (!apbc_base) {
 		pr_err("error to ioremap APBC base\n");
 		return;
 	}
diff --git a/drivers/clk/mmp/clk-pxa910.c b/drivers/clk/mmp/clk-pxa910.c
index a520cf7702a1..7a7965141918 100644
--- a/drivers/clk/mmp/clk-pxa910.c
+++ b/drivers/clk/mmp/clk-pxa910.c
@@ -74,25 +74,25 @@ void __init pxa910_clk_init(phys_addr_t mpmu_phys, phys_addr_t apmu_phys,
 	void __iomem *apbc_base;
 
 	mpmu_base = ioremap(mpmu_phys, SZ_4K);
-	if (mpmu_base == NULL) {
+	if (!mpmu_base) {
 		pr_err("error to ioremap MPMU base\n");
 		return;
 	}
 
 	apmu_base = ioremap(apmu_phys, SZ_4K);
-	if (apmu_base == NULL) {
+	if (!apmu_base) {
 		pr_err("error to ioremap APMU base\n");
 		return;
 	}
 
 	apbcp_base = ioremap(apbcp_phys, SZ_4K);
-	if (apbcp_base == NULL) {
+	if (!apbcp_base) {
 		pr_err("error to ioremap APBC extension base\n");
 		return;
 	}
 
 	apbc_base = ioremap(apbc_phys, SZ_4K);
-	if (apbc_base == NULL) {
+	if (!apbc_base) {
 		pr_err("error to ioremap APBC base\n");
 		return;
 	}
-- 
2.14.1
