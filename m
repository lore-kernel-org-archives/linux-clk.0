Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, romain.perier@gmail.com, linux-clk@vger.kernel.org
Subject: [PATCH] clk: handle fixed-rate clocks correctly in clk_core_round_rate_nolock
Date: Sun, 26 Jul 2015 00:18:40 +0200
Message-ID: <110607065.NoWaKp3mDJ@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Commit 6edc753d8ecc ("clk: change clk_ops' ->determine_rate() prototype")
changed the behaviour of clk_core_round_rate_nolock as it forgot to also
include the else conditional simply returning the clock rate for clocks
that neither have a parent or can determine their rate - for example
said fixed clocks.

This resulted in failures to set pll rates on rockchip socs, as it
returned the target pll rate as suitable rate for the 24MHz xin24m clock,
thus making the ccf want to set this fixed clock to 1.6GHz or similar.

Fixes: 6edc753d8ecc ("clk: change clk_ops' ->determine_rate() prototype")
Reported-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 67f778b..819ffa6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -802,6 +802,8 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 		req->rate = rate;
 	} else if (core->flags & CLK_SET_RATE_PARENT) {
 		return clk_core_round_rate_nolock(parent, req);
+	} else {
+		req->rate = core->rate;
 	}
 
 	return 0;
-- 
2.1.4
