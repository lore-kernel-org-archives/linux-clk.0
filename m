Return-Path: <p.zabel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH 009/102] clk: sunxi: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:25:13 +0200
Message-Id: <20170719152646.25903-10-p.zabel@pengutronix.de>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: "Emilio López" <emilio@elopez.com.ar>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/sunxi/clk-sun9i-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-sun9i-mmc.c b/drivers/clk/sunxi/clk-sun9i-mmc.c
index 6041bdba2e971..a1a634253d6f2 100644
--- a/drivers/clk/sunxi/clk-sun9i-mmc.c
+++ b/drivers/clk/sunxi/clk-sun9i-mmc.c
@@ -124,7 +124,7 @@ static int sun9i_a80_mmc_config_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(data->clk);
 	}
 
-	data->reset = devm_reset_control_get(&pdev->dev, NULL);
+	data->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(data->reset)) {
 		dev_err(&pdev->dev, "Could not get reset control\n");
 		return PTR_ERR(data->reset);
-- 
2.11.0
