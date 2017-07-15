Return-Path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Michael Turquette <mturquette@baylibre.com>
Cc: keescook@chromium.org,
	kernel-janitors@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] clk: mmp: Drop unnecessary static
Date: Sat, 15 Jul 2017 22:07:36 +0200
Message-Id: <1500149266-32357-2-git-send-email-Julia.Lawall@lip6.fr>
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

 drivers/clk/mmp/clk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/clk/mmp/clk.c b/drivers/clk/mmp/clk.c
--- a/drivers/clk/mmp/clk.c
+++ b/drivers/clk/mmp/clk.c
@@ -9,7 +9,7 @@
 void mmp_clk_init(struct device_node *np, struct mmp_clk_unit *unit,
 		int nr_clks)
 {
-	static struct clk **clk_table;
+	struct clk **clk_table;
 
 	clk_table = kcalloc(nr_clks, sizeof(struct clk *), GFP_KERNEL);
 	if (!clk_table)
