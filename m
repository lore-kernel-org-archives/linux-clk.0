Return-Path: <k.kozlowski@samsung.com>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
To: Tero Kristo <t-kristo@ti.com>, Mike Turquette <mturquette@linaro.org>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFT PATCH 5/8] clk: ti: clk-43xx: Prevent possible ERR_PTR dereference
Date: Wed, 13 May 2015 15:54:44 +0900
Message-id: <1431500087-2275-6-git-send-email-k.kozlowski@samsung.com>
In-reply-to: <1431500087-2275-1-git-send-email-k.kozlowski@samsung.com>
References: <1431500087-2275-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

The return value of clk_get_sys() was immediately used in
clk_set_parent(). The first one may return ERR_PTR and the latter only
checks if supplied argument is non-NULL.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/ti/clk-43xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clk-43xx.c b/drivers/clk/ti/clk-43xx.c
index 3795fce8a830..c6e1fc704052 100644
--- a/drivers/clk/ti/clk-43xx.c
+++ b/drivers/clk/ti/clk-43xx.c
@@ -134,7 +134,8 @@ int __init am43xx_dt_clk_init(void)
 	 */
 	clk1 = clk_get_sys(NULL, "cpsw_cpts_rft_clk");
 	clk2 = clk_get_sys(NULL, "dpll_core_m5_ck");
-	clk_set_parent(clk1, clk2);
+	if (!IS_ERR(clk1) && !IS_ERR(clk2))
+		clk_set_parent(clk1, clk2);
 
 	return 0;
 }
-- 
1.9.1
