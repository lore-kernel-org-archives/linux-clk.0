Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: uniphier: add system clock support for sLD3 SoC
Date: Mon, 17 Oct 2016 00:11:14 +0900
Message-Id: <1476630674-29402-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

I do not know why, but I missed to add this compatible string in
the initial commit of this driver.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/uniphier/clk-uniphier-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/uniphier/clk-uniphier-core.c b/drivers/clk/uniphier/clk-uniphier-core.c
index 5ffb898..f4e0f6b 100644
--- a/drivers/clk/uniphier/clk-uniphier-core.c
+++ b/drivers/clk/uniphier/clk-uniphier-core.c
@@ -111,6 +111,10 @@ static int uniphier_clk_remove(struct platform_device *pdev)
 static const struct of_device_id uniphier_clk_match[] = {
 	/* System clock */
 	{
+		.compatible = "socionext,uniphier-sld3-clock",
+		.data = uniphier_sld3_sys_clk_data,
+	},
+	{
 		.compatible = "socionext,uniphier-ld4-clock",
 		.data = uniphier_ld4_sys_clk_data,
 	},
-- 
1.9.1
