Return-Path: <gustavo@embeddedor.com>
Date: Sat, 4 Aug 2018 19:22:22 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] clk: qcom: clk-branch: Use true and false for boolean values
Message-ID: <20180805002222.GA24789@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Return statements in functions returning bool should use true or false
instead of an integer value.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/clk/qcom/clk-branch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index bc2205c..99446bf 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -18,7 +18,7 @@ static bool clk_branch_in_hwcg_mode(const struct clk_branch *br)
 	u32 val;
 
 	if (!br->hwcg_reg)
-		return 0;
+		return false;
 
 	regmap_read(br->clkr.regmap, br->hwcg_reg, &val);
 
-- 
2.7.4
