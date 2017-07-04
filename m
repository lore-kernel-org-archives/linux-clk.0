Return-Path: <garsilva@embeddedor.com>
Date: Tue, 4 Jul 2017 17:17:07 -0500
From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] clk: moxart: remove unnecessary static in
 moxart_of_pll_clk_init()
Message-ID: <20170704221707.GA20243@embeddedgus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Remove unnecessary static on local variable _base_.
Such variable is initialized before being used,
on every execution path throughout the function.
The static has no benefit and, removing it reduces
the code size.

This issue was detected using Coccinelle and the following semantic patch:

@bad exists@
position p;
identifier x;
type T;
@@

static T x@p;
...
x = <+...x...+>

@@
identifier x;
expression e;
type T;
position p != bad.p;
@@

-static
 T x@p;
 ... when != x
     when strict
?x = e;

In the following log you can see the difference in the code size and,
a significant difference in bss segment. This log is the output
of the size command, before and after the code change:

before:
   text    data     bss     dec     hex filename
   1724     384     128    2236     8bc drivers/clk/clk-moxart.o

after:
   text    data     bss     dec     hex filename
   1713     328      64    2105     839 drivers/clk/clk-moxart.o

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/clk/clk-moxart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
index b86dac8..d687d6a 100644
--- a/drivers/clk/clk-moxart.c
+++ b/drivers/clk/clk-moxart.c
@@ -18,7 +18,7 @@
 
 static void __init moxart_of_pll_clk_init(struct device_node *node)
 {
-	static void __iomem *base;
+	void __iomem *base;
 	struct clk_hw *hw;
 	struct clk *ref_clk;
 	unsigned int mul;
-- 
2.5.0
