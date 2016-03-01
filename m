Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 04/41] clk: imx: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 10:59:49 -0800
Message-Id: <1456858826-28541-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/imx/clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index c94ac5c26226..d942f5748d08 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -87,7 +87,7 @@ struct clk *imx_clk_fixup_mux(const char *name, void __iomem *reg,
 
 static inline struct clk *imx_clk_fixed(const char *name, int rate)
 {
-	return clk_register_fixed_rate(NULL, name, NULL, CLK_IS_ROOT, rate);
+	return clk_register_fixed_rate(NULL, name, NULL, 0, rate);
 }
 
 static inline struct clk *imx_clk_divider(const char *name, const char *parent,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
