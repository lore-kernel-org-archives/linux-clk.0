Return-Path: <jernej.skrabec@siol.net>
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: robh+dt@kernel.org,
	maxime.ripard@bootlin.com,
	wens@csie.org
Cc: mark.rutland@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	airlied@linux.ie,
	architt@codeaurora.org,
	a.hajda@samsung.com,
	jernej.skrabec@siol.net,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 06/27] clk: sunxi-ng: h6: Set video PLLs limits
Date: Sun,  2 Sep 2018 09:26:22 +0200
Message-Id: <20180902072643.4917-7-jernej.skrabec@siol.net>
In-Reply-To: <20180902072643.4917-1-jernej.skrabec@siol.net>
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
List-ID: <linux-clk.vger.kernel.org>

Video PLL factors can be set in a way that final PLL rate is outside
stable range. H6 user manual specifically says that N factor should not
be below 12. While it doesn't says anything about maximum stable rate, it
is clear that PLL doesn't work at 6.096 GHz (254 * 24 MHz).

Set minimum allowed PLL video rate to 288 MHz (12 * 24 MHz) and maximum
to 2.4 GHz, which is maximum in BSP driver.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 2193e1495086..f44d314b2285 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -120,6 +120,8 @@ static struct ccu_nm pll_video0_clk = {
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
 	.fixed_post_div	= 4,
+	.min_rate	= 288000000,
+	.max_rate	= 2400000000,
 	.common		= {
 		.reg		= 0x040,
 		.features	= CCU_FEATURE_FIXED_POSTDIV,
@@ -136,6 +138,8 @@ static struct ccu_nm pll_video1_clk = {
 	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
 	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
 	.fixed_post_div	= 4,
+	.min_rate	= 288000000,
+	.max_rate	= 2400000000,
 	.common		= {
 		.reg		= 0x048,
 		.features	= CCU_FEATURE_FIXED_POSTDIV,
-- 
2.18.0
