Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] clk: cdce925: Fix limit check
Date: Fri, 11 Nov 2016 22:49:05 +0100
Message-Id: <20161111214905.29481-1-christophe.jaillet@wanadoo.fr>
List-ID: <linux-clk.vger.kernel.org>

It is likely that instead of '1>64', 'q>64' was expected.

Moreover, according to datasheet,
   http://www.ti.com/lit/ds/symlink/cdce925.pdf
   SCAS847I - JULY 2007 - REVISED OCTOBER 2016
PLL settings limits are: 16 <= q <= 63
So change the upper limit check from 64 to 63.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/clk-cdce925.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index b8459c14a1b7..f793b2d9238c 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -216,7 +216,7 @@ static int cdce925_pll_prepare(struct clk_hw *hw)
 		nn = n * BIT(p);
 		/* q = int(nn/m) */
 		q = nn / m;
-		if ((q < 16) || (1 > 64)) {
+		if ((q < 16) || (q > 63)) {
 			pr_debug("%s invalid q=%d\n", __func__, q);
 			return -EINVAL;
 		}
-- 
2.9.3
