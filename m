Return-Path: <phil.edworthy@renesas.com>
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] clk: renesas: r9a06g032: Fix UART34567 clock rate
Date: Fri, 31 Aug 2018 12:26:36 +0100
Message-Id: <1535714796-2211-1-git-send-email-phil.edworthy@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

The clock for UARTs 0 through 2 is UART012, the clock for UARTs 3 through
7 is UART34567.
For UART012, we stop the clock driver from changing the clock rate. This
is because the Synopsys UART driver simply sets the reference clock to 16x
the baud rate, but doesn't check if the actual rate is within the required
tolerance. The RZ/N1 clock divider can't provide this (we have to rely on
the UART's internal divider to set the correct clock rate), so you end up
with a clock rate that is way off what you wanted.

In addition, since the clock is shared between multiple UARTs, you don't
want the driver trying to change the clock rate as it may affect the other
UARTs (which may not have been configured yet, so you don't know what baud
rate they will use). Normally, the clock rate is set early on before Linux
to some very high rate that supports all of the clock rates you want.

This change stops the UART34567 clock rate from changing for the same
reasons.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index a0b6ecd..6d2b568 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -539,7 +539,8 @@ r9a06g032_div_round_rate(struct clk_hw *hw,
 	 * several uarts attached to this divider, and changing this impacts
 	 * everyone.
 	 */
-	if (clk->index == R9A06G032_DIV_UART) {
+	if (clk->index == R9A06G032_DIV_UART ||
+	    clk->index == R9A06G032_DIV_P2_PG) {
 		pr_devel("%s div uart hack!\n", __func__);
 		return clk_get_rate(hw->clk);
 	}
-- 
2.7.4
