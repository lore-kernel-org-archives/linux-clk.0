Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: Simplify __of_clk_get_hw_from_provider()
Date: Thu, 25 Aug 2016 13:35:36 -0700
Message-Id: <20160825203536.27235-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

__of_clk_get_hw_from_provider() is confusing because it will
return EPROBE_DEFER if there isn't a ->get() or ->get_hw()
function pointer in a provider. That's just a bug though, and we
used to NULL pointer exception when ->get() was missing anyway,
so let's make this more obvious that they're not optional. The
assumption is that most providers will implement ->get_hw() so we
only fallback to the ->get() function if necessary. This
clarifies the intent and removes any possibility of probe defer
happening if clk providers are buggy.

Reported-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 71cc56712666..d3d26148cdfb 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3174,19 +3174,14 @@ __of_clk_get_hw_from_provider(struct of_clk_provider *provider,
 			      struct of_phandle_args *clkspec)
 {
 	struct clk *clk;
-	struct clk_hw *hw = ERR_PTR(-EPROBE_DEFER);
 
-	if (provider->get_hw) {
-		hw = provider->get_hw(clkspec, provider->data);
-	} else if (provider->get) {
-		clk = provider->get(clkspec, provider->data);
-		if (!IS_ERR(clk))
-			hw = __clk_get_hw(clk);
-		else
-			hw = ERR_CAST(clk);
-	}
+	if (provider->get_hw)
+		return provider->get_hw(clkspec, provider->data);
 
-	return hw;
+	clk = provider->get(clkspec, provider->data);
+	if (IS_ERR(clk))
+		return ERR_CAST(clk);
+	return __clk_get_hw(clk);
 }
 
 struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
