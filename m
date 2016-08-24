Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jean-Francois Moine <moinejf@free.fr>
Date: Wed, 24 Aug 2016 08:32:51 +0200
Subject: [PATCH RESEND] clk: core: Force setting the phase delay when no change
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Message-ID: <E1bcUOQ-0002Wn-1d@bombadil.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

This patch reverts the commit 023bd7166be0595d18220dfd5c9765b3970f6ef3
(clk: skip unnecessary set_phase if nothing to do), fixing two
problems:
- in some SoCs, the hardware phase delay depends on the rate ratio of
  the clock and its parent. So, changing this ratio may imply to set
  new hardware values, even if the logical delay is the same.
- when the delay was the same as previously, an error was returned.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
resend:
- send to the clock maintainers (asked by Maxime Ripard)
- change the comment adding the reference to the reverted commit
---
 drivers/clk/clk.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 71cc567..7e8576e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1908,10 +1908,6 @@ int clk_set_phase(struct clk *clk, int degrees)
 
 	clk_prepare_lock();
 
-	/* bail early if nothing to do */
-	if (degrees == clk->core->phase)
-		goto out;
-
 	trace_clk_set_phase(clk->core, degrees);
 
 	if (clk->core->ops->set_phase)
@@ -1922,7 +1918,6 @@ int clk_set_phase(struct clk *clk, int degrees)
 	if (!ret)
 		clk->core->phase = degrees;
 
-out:
 	clk_prepare_unlock();
 
 	return ret;
-- 
2.9.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
