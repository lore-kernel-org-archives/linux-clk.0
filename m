Return-Path: <Govindraj.Raja@imgtec.com>
From: Govindraj Raja <govindraj.raja@imgtec.com>
To: <linux-mips@linux-mips.org>, <linux-clk@vger.kernel.org>, Mike Turquette
	<mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "Michael
 Turquette" <mturquette@baylibre.com>
CC: Zdenko Pulitika <zdenko.pulitika@imgtec.com>, Kevin Cernekee
	<cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, "Andrew
 Bresticker" <abrestic@chromium.org>, James Hartley
	<James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan
	<James.Hogan@imgtec.com>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
	Govindraj Raja <govindraj.raja@imgtec.com>
Subject: [PATCH 5/6] pistachio: pll: Fix vco calculation in .set_rate (fractional)
Date: Thu, 6 Aug 2015 14:46:51 +0100
Message-ID: <1438868811-7769-1-git-send-email-govindraj.raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>

Vco was calculated based on the current operating mode which
makes no sense because .set_rate is setting operating mode. Instead,
vco should be calculated using pll settings that are about to be set.

Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
---
 drivers/clk/pistachio/clk-pll.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/pistachio/clk-pll.c b/drivers/clk/pistachio/clk-pll.c
index eb91748..5554fa4 100644
--- a/drivers/clk/pistachio/clk-pll.c
+++ b/drivers/clk/pistachio/clk-pll.c
@@ -207,13 +207,9 @@ static int pll_gf40lp_frac_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (!params || !params->refdiv)
 		return -EINVAL;
 
-	/* get operating mode and calculate vco accordingly */
+	/* calculate vco */
 	vco = params->fref;
-	if (pll_frac_get_mode(hw) == PLL_MODE_INT)
-		vco *= params->fbdiv << 24;
-	else
-		vco *= (params->fbdiv << 24) + params->frac;
-
+	vco *= (params->fbdiv << 24) + params->frac;
 	vco = div64_u64(vco, params->refdiv << 24);
 
 	if (vco < MIN_VCO_FRAC_FRAC || vco > MAX_VCO_FRAC_FRAC)
-- 
1.9.1
