Return-Path: <weiyj_lk@163.com>
From: weiyj_lk@163.com
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: Fix return value check in oxnas_stdclk_probe()
Date: Fri, 17 Jun 2016 17:24:23 +0000
Message-Id: <1466184263-17890-1-git-send-email-weiyj_lk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function syscon_node_to_regmap() returns
ERR_PTR() and never returns NULL. The NULL test in the return
value check should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/clk/clk-oxnas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-oxnas.c b/drivers/clk/clk-oxnas.c
index efba7d4..79bcb2e 100644
--- a/drivers/clk/clk-oxnas.c
+++ b/drivers/clk/clk-oxnas.c
@@ -144,9 +144,9 @@ static int oxnas_stdclk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	regmap = syscon_node_to_regmap(of_get_parent(np));
-	if (!regmap) {
+	if (IS_ERR(regmap)) {
 		dev_err(&pdev->dev, "failed to have parent regmap\n");
-		return -EINVAL;
+		return PTR_ERR(regmap);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(clk_oxnas_init); i++) {
