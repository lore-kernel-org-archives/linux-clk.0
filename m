Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH] clk: rockchip: initialize flags of clk_init_data in mmc-phase clock
Date: Tue, 17 May 2016 21:48:43 +0200
Message-ID: <5857488.K3ESyq6uAh@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

The flags element of clk_init_data was never initialized for mmc-
phase-clocks resulting in the element containing a random value
and thus possibly enabling unwanted clock flags.

Fixes: 89bf26cbc1a0 ("clk: rockchip: Add support for the mmc clock phases using the framework")
Cc: stable@vger.kernel.org
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
Found while investigating the critical clock locking in __clk_core_init
as it generated a bunch of warnings due to the (random) flags containing
the critical clock bit in most cases.

I've also already applied this to my fixes branch, so posted for
reference / shouting if it's terrible wrong :-)

 drivers/clk/rockchip/clk-mmc-phase.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
index bc856f2..4601130 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -154,6 +154,7 @@ struct clk *rockchip_clk_register_mmc(const char *name,
 		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
+	init.flags = 0;
 	init.num_parents = num_parents;
 	init.parent_names = parent_names;
 	init.ops = &rockchip_mmc_clk_ops;
-- 
2.6.4
