Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Carlo Caione <carlo@caione.org>
Subject: [PATCH 06/41] clk: meson: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:51 -0800
Message-Id: <1456858826-28541-7-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Carlo Caione <carlo@caione.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/meson/meson8b-clkc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/meson8b-clkc.c b/drivers/clk/meson/meson8b-clkc.c
index 61f6d55c4ac7..4d057b3e21b2 100644
--- a/drivers/clk/meson/meson8b-clkc.c
+++ b/drivers/clk/meson/meson8b-clkc.c
@@ -141,11 +141,11 @@ static const struct composite_conf mali_conf __initconst = {
 };
 
 static const struct clk_conf meson8b_xtal_conf __initconst =
-	FIXED_RATE_P(MESON8B_REG_CTL0_ADDR, CLKID_XTAL, "xtal",
-		     CLK_IS_ROOT, PARM(0x00, 4, 7));
+	FIXED_RATE_P(MESON8B_REG_CTL0_ADDR, CLKID_XTAL, "xtal", 0,
+			PARM(0x00, 4, 7));
 
 static const struct clk_conf meson8b_clk_confs[] __initconst = {
-	FIXED_RATE(CLKID_ZERO, "zero", CLK_IS_ROOT, 0),
+	FIXED_RATE(CLKID_ZERO, "zero", 0, 0),
 	PLL(MESON8B_REG_PLL_FIXED, CLKID_PLL_FIXED, "fixed_pll",
 	    p_xtal, 0, &pll_confs),
 	PLL(MESON8B_REG_PLL_VID, CLKID_PLL_VID, "vid_pll",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
