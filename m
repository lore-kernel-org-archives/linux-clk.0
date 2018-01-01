Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Marek Vasut <marek.vasut@gmail.com>,
	Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>,
	Alexey Firago <alexey_firago@mentor.com>
Subject: [PATCH v3 14/34] clk: vc5: change vc5_pfd_round_rate() return logic
Date: Mon,  1 Jan 2018 19:42:53 +0000
Message-Id: <1514835793-1104-15-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514835793-1104-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

This patch updates the round_rate() logic here to return zero instead of a
negative number on error.

In conjunction with higher-level changes associated with acting on the
return value of clk_ops->round_rate() it is then possible to have
clk_ops->round_rate() return values from 1 Hz to ULONG_MAX Hz instead of
the current limitation of 1 Hz to LONG_MAX Hz.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
Cc: Alexey Firago <alexey_firago@mentor.com>
---
 drivers/clk/clk-versaclock5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 7c7b369..9432122 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -351,7 +351,7 @@ static unsigned long vc5_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	/* PLL cannot operate with input clock above 50 MHz. */
 	if (rate > 50000000)
-		return -EINVAL;
+		return 0;
 
 	/* CLKIN within range of PLL input, feed directly to PLL. */
 	if (*parent_rate <= 50000000)
@@ -359,7 +359,7 @@ static unsigned long vc5_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	idiv = DIV_ROUND_UP(*parent_rate, rate);
 	if (idiv > 127)
-		return -EINVAL;
+		return 0;
 
 	return *parent_rate / idiv;
 }
-- 
2.7.4
