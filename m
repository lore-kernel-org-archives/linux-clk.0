Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [RFC 7/7] clk: fix incorrect usage of ENOSYS
Date: Tue, 21 Mar 2017 19:33:30 +0100
Message-Id: <20170321183330.26722-8-jbrunet@baylibre.com>
In-Reply-To: <20170321183330.26722-1-jbrunet@baylibre.com>
References: <20170321183330.26722-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

ENOSYS is special and should only be used for incorrect syscall number.
It does not seem to be the case here.

Reported by checkpatch.pl while working on clock protection.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ec6d57e97bac..377d5301348b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1926,7 +1926,7 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 
 	/* verify ops for for multi-parent clks */
 	if ((core->num_parents > 1) && (!core->ops->set_parent))
-		return -ENOSYS;
+		return -EPERM;
 
 	/* check that we are allowed to re-parent if the clock is in use */
 	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
-- 
2.9.3
