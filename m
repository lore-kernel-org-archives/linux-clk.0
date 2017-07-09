Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexey Firago <alexey_firago@mentor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH V3 1/8] clk: vc5: Prevent division by zero on unconfigured outputs
Date: Sun,  9 Jul 2017 15:28:07 +0200
Message-Id: <20170709132814.2339-1-marek.vasut+renesas@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

In case the initial values of the FOD registers are not configured in
the OTP or by the bootloader, it is possible that the FOD registers
will contain zeroes. The code in vc5_fod_recalc_rate() immediately
feeds the FOD divider value obtained from the FOD registers into the
div64_u64() and if the FOD divider value is zero, triggers division
by zero exception.

Check if the FOD divider value is zero and return the frequency of
the FOD output as 0 Hz if it is so. This prevents the division by
zero exception.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexey Firago <alexey_firago@mentor.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
on Salvator-XS with the display LVDS output.
---
V2: None
V3: None
---
 drivers/clk/clk-versaclock5.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index ea7d552a2f2b..60bf4afb51bd 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -426,6 +426,10 @@ static unsigned long vc5_fod_recalc_rate(struct clk_hw *hw,
 	div_frc = (od_frc[0] << 22) | (od_frc[1] << 14) |
 		  (od_frc[2] << 6) | (od_frc[3] >> 2);
 
+	/* Avoid division by zero if the output is not configured. */
+	if ((div_int == 0) && (div_frc == 0))
+		return 0;
+
 	/* The PLL divider has 12 integer bits and 30 fractional bits */
 	return div64_u64((u64)f_in << 24ULL, ((u64)div_int << 24ULL) + div_frc);
 }
-- 
2.11.0
