Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 6/9] clk: sunxi: Use proper type for of_clk_get_parent_count() return value
Date: Mon, 22 Feb 2016 12:54:44 -0800
Message-Id: <1456174487-28397-7-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
References: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The return type of of_clk_get_parent_count() is an unsigned int
now, so let's update the code here to be more explicit about the
range of values we can test for.

Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org> 
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sunxi/clk-sun6i-ar100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-sun6i-ar100.c b/drivers/clk/sunxi/clk-sun6i-ar100.c
index 20887686bdbe..c90370572a16 100644
--- a/drivers/clk/sunxi/clk-sun6i-ar100.c
+++ b/drivers/clk/sunxi/clk-sun6i-ar100.c
@@ -181,7 +181,7 @@ static int sun6i_a31_ar100_clk_probe(struct platform_device *pdev)
 	struct ar100_clk *ar100;
 	struct resource *r;
 	struct clk *clk;
-	int nparents;
+	unsigned int nparents;
 
 	ar100 = devm_kzalloc(&pdev->dev, sizeof(*ar100), GFP_KERNEL);
 	if (!ar100)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
