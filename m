Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Quentin Schulz <quentin.schulz@free-electrons.com>
Subject: [PATCH] clk: sunxi-ng: fix recalc_rate formula of NKMP clocks
Date: Sat, 18 Mar 2017 04:19:43 +0800
Message-Id: <20170317201943.45190-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

In commit e66f81bbd746 ("clk: sunxi-ng: Implement factors offsets"), the
final formula of NKMP clocks' recalc_rate is refactored; however, the
refactored formula broke the calculation due to some C language operand
priority problem -- the priority of operand >> is lower than * and /,
makes the formula being parsed as "(parent_rate * n * k) >> (p / m)", but
it should be "(parent_rate * n * k >> p) / m".

Add the pair of parentheses to fix up this issue. This pair of
parentheses used to exist in the old formula.

Fixes: commit e66f81bbd746 ("clk: sunxi-ng: Implement factors offsets")
Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
Please patch the latest git tree master too, as this buggy commit is
introduced in 4.11-rc (for sun5i ccu support).

 drivers/clk/sunxi-ng/ccu_nkmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index a2b40a000157..488055ed944f 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -107,7 +107,7 @@ static unsigned long ccu_nkmp_recalc_rate(struct clk_hw *hw,
 	p = reg >> nkmp->p.shift;
 	p &= (1 << nkmp->p.width) - 1;
 
-	return parent_rate * n * k >> p / m;
+	return (parent_rate * n * k >> p) / m;
 }
 
 static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.12.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
