Return-Path: <javier@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: max77802: Update MODULE_AUTHOR() email address
Date: Wed, 14 Oct 2015 13:18:55 +0200
Message-Id: <1444821535-12953-1-git-send-email-javier@osg.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

The email address listed in MODULE_AUTHOR() no longer exist so to prevent
people to send emails to the old address, replace it with my current one.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/clk/clk-max77802.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-max77802.c b/drivers/clk/clk-max77802.c
index 74c49b93a6eb..4a89f7979ba0 100644
--- a/drivers/clk/clk-max77802.c
+++ b/drivers/clk/clk-max77802.c
@@ -94,5 +94,5 @@ static struct platform_driver max77802_clk_driver = {
 module_platform_driver(max77802_clk_driver);
 
 MODULE_DESCRIPTION("MAXIM 77802 Clock Driver");
-MODULE_AUTHOR("Javier Martinez Canillas <javier.martinez@collabora.co.uk>");
+MODULE_AUTHOR("Javier Martinez Canillas <javier@osg.samsung.com");
 MODULE_LICENSE("GPL");
-- 
2.4.3
