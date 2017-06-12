Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 09/10] clk: fix incorrect usage of ENOSYS
Date: Mon, 12 Jun 2017 21:44:37 +0200
Message-Id: <20170612194438.12298-10-jbrunet@baylibre.com>
In-Reply-To: <20170612194438.12298-1-jbrunet@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

ENOSYS is special and should only be used for incorrect syscall number.
It does not seem to be the case here.

Reported by checkpatch.pl while working on clock protection.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8d57e130c4e0..5d545954c48f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2032,7 +2032,7 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 
 	/* verify ops for for multi-parent clks */
 	if ((core->num_parents > 1) && (!core->ops->set_parent))
-		return -ENOSYS;
+		return -EPERM;
 
 	/* check that we are allowed to re-parent if the clock is in use */
 	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
-- 
2.9.4
