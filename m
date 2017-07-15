Return-Path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Michael Turquette <mturquette@baylibre.com>
Cc: keescook@chromium.org,
	kernel-janitors@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] clk: moxart: Drop unnecessary static
Date: Sat, 15 Jul 2017 22:07:37 +0200
Message-Id: <1500149266-32357-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

Drop static on a local variable, when the variable is initialized before
any possible use.  Thus, the static has no benefit.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
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
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
These patches are all independent of each other.

 drivers/clk/clk-moxart.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
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
@@ -57,7 +57,7 @@ CLK_OF_DECLARE(moxart_pll_clock, "moxa,m
 
 static void __init moxart_of_apb_clk_init(struct device_node *node)
 {
-	static void __iomem *base;
+	void __iomem *base;
 	struct clk_hw *hw;
 	struct clk *pll_clk;
 	unsigned int div, val;
