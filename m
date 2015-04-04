Return-Path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Mike Turquette <mturquette@linaro.org>
Cc: kernel-janitors@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: versatile: test returned value
Date: Sat,  4 Apr 2015 16:59:29 +0200
Message-Id: <1428159570-19467-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428159570-19467-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1428159570-19467-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

Put NULL test on the result of the previous call instead on one of its
arguments.  A simplified version of the semantic match that finds this
problem is as follows (http://coccinelle.lip6.fr/):

// <smpl>
r@
expression *e1;
expression *e2;
identifier f;
statement S1,S2;
@@

e1 = f(...,e2,...);
(
if (e1 == NULL || ...) S1 else S2
|
*if (e2 == NULL || ...) S1 else S2
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/versatile/clk-versatile.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-versatile.c b/drivers/clk/versatile/clk-versatile.c
index a76981e..7a4f863 100644
--- a/drivers/clk/versatile/clk-versatile.c
+++ b/drivers/clk/versatile/clk-versatile.c
@@ -69,7 +69,7 @@ static void __init cm_osc_setup(struct device_node *np,
 		struct device_node *parent;
 
 		parent = of_get_parent(np);
-		if (!np) {
+		if (!parent) {
 			pr_err("no parent on core module clock\n");
 			return;
 		}
