Return-Path: <garsilva@embeddedor.com>
Date: Tue, 4 Jul 2017 17:36:50 -0500
From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH v2] clk: moxart: remove unnecessary statics
Message-ID: <20170704223650.GA22546@embeddedgus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Remove unnecessary static on local variable _base_ in both functions
moxart_of_pll_clk_init() and moxart_of_apb_clk_init(). Such variables
are initialized before being used, on every execution path throughout
the mentioned functions. The statics have no benefit and, removing
them reduce the code size.

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

In the following log you can see the difference in the code size. Also,
notice that the bss segment is reduced down to zero. This log is the
output of the size command, before and after the code change:

before:
   text    data     bss     dec     hex filename
   1724     384     128    2236     8bc drivers/clk/clk-moxart.o

after:
   text    data     bss     dec     hex filename
   1697     240       0    1937     791 drivers/clk/clk-moxart.o

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
Changes in v2:
 Remove static on local variable _base_
 in function moxart_of_apb_clk_init()

 drivers/clk/clk-moxart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
index b86dac8..1f66ccb 100644
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
@@ -57,7 +57,7 @@ CLK_OF_DECLARE(moxart_pll_clock, "moxa,moxart-pll-clock",
 
 static void __init moxart_of_apb_clk_init(struct device_node *node)
 {
-	static void __iomem *base;
+	void __iomem *base;
 	struct clk_hw *hw;
 	struct clk *pll_clk;
 	unsigned int div, val;
-- 
2.5.0
