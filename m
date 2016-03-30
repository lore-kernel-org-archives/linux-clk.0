Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jean-Francois Moine <moinejf@free.fr>
Date: Wed, 30 Mar 2016 19:47:40 +0200
Subject: [PATCH v2] clk: sunxi: Accept a greater rate when setting a parent
 clock
To: Emilio Lopez <emilio@elopez.com.ar>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Message-ID: <E1alKeT-0008DX-7V@bombadil.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

The best rate of a clock may be a bit greater than the requested one.
In such a case, the rate setting from a child clock was rejected.

This patch fixes the problem searching a 'best rate' instead of
a 'fastest rate <= rate'.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
 drivers/clk/sunxi/clk-factors.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
index ddefe96..c8e2f29 100644
--- a/drivers/clk/sunxi/clk-factors.c
+++ b/drivers/clk/sunxi/clk-factors.c
@@ -95,9 +95,10 @@ static int clk_factors_determine_rate(struct clk_hw *hw,
 	struct clk_factors *factors = to_clk_factors(hw);
 	struct clk_hw *parent, *best_parent = NULL;
 	int i, num_parents;
-	unsigned long parent_rate, best = 0, child_rate, best_child_rate = 0;
+	unsigned long parent_rate, best = 0, child_rate, best_child_rate;
+	unsigned long d_rate, best_d_rate = ~0ul;
 
-	/* find the parent that can help provide the fastest rate <= rate */
+	/* find the parent that can help provide the best rate */
 	num_parents = clk_hw_get_num_parents(hw);
 	for (i = 0; i < num_parents; i++) {
 		struct factors_request factors_req = {
@@ -116,10 +117,18 @@ static int clk_factors_determine_rate(struct clk_hw *hw,
 		factors->get_factors(&factors_req);
 		child_rate = factors_req.rate;
 
-		if (child_rate <= req->rate && child_rate > best_child_rate) {
+		if (child_rate >= req->rate)
+			d_rate = child_rate - req->rate;
+		else
+			d_rate = req->rate - child_rate;
+
+		if (d_rate < best_d_rate) {
 			best_parent = parent;
 			best = parent_rate;
 			best_child_rate = child_rate;
+			if (d_rate == 0)
+				break;
+			best_d_rate = d_rate;
 		}
 	}
 
-- 
2.8.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
