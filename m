Return-Path: <Jiada_Wang@mentor.com>
From: Jiada Wang <jiada_wang@mentor.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <joshua_frkuska@mentor.com>,
	<vladimir_zapolskiy@mentor.com>, <jiada_wang@mentor.com>
Subject: [PATCH] clk: move check of CLK_SET_RATE_GATE flag to clk_propagate_rate_change()
Date: Tue, 23 Aug 2016 17:10:58 +0900
Message-ID: <1471939858-20925-2-git-send-email-jiada_wang@mentor.com>
In-Reply-To: <1471939858-20925-1-git-send-email-jiada_wang@mentor.com>
References: <1471939858-20925-1-git-send-email-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Previously CLK_SET_RATE_GATE flag is only checked in clk_set_rate()
which only ensures the clock being called by clk_set_rate() won't
change rate when it has been prepared if CLK_SET_RATE_GATE flag is set.
But a clk_set_rate() request may propagate rate change to these clocks
from the requested clock's topmost parent clock to all its children,
when any one of these clocks has CLK_SET_RATE_GATE flag set
and it has been prepared, the clk_set_rate() request should fail.

This patch moves check of CLK_SET_RATE_GATE flag to
clk_propagate_rate_change() to ensure all affected clocks will
be checked if their rate will be changed after clk_set_rate().

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/clk/clk.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 820a939..021c740 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1437,6 +1437,13 @@ static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
 	if (core->rate == core->new_rate)
 		return NULL;
 
+	if ((event == PRE_RATE_CHANGE) &&
+	    (core->flags & CLK_SET_RATE_GATE) && core->prepare_count) {
+		pr_err("%s: %s not gated but wants to change rate\n",
+			__func__, core->name);
+		fail_clk = core;
+	}
+
 	if (core->notifier_count) {
 		ret = __clk_notify(core, event, core->rate, core->new_rate);
 		if (ret & NOTIFY_STOP_MASK)
@@ -1571,9 +1578,6 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (rate == clk_core_get_rate_nolock(core))
 		return 0;
 
-	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
-		return -EBUSY;
-
 	/* calculate new rates and get the topmost changed clock */
 	top = clk_calc_new_rates(core, rate);
 	if (!top)
-- 
2.4.5
