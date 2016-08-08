Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Carlo Caione <carlo@caione.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH -next] clk: gxbb: use builtin_platform_driver to simplify the code
Date: Mon,  8 Aug 2016 13:55:20 +0000
Message-Id: <1470664520-9604-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

Use the builtin_platform_driver() macro to make the code simpler.

Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
---
 drivers/clk/meson/gxbb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 8e36d22..b736277 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -946,8 +946,4 @@ static struct platform_driver gxbb_driver = {
 	},
 };
 
-static int __init gxbb_clkc_init(void)
-{
-	return platform_driver_register(&gxbb_driver);
-}
-device_initcall(gxbb_clkc_init);
+builtin_platform_driver(gxbb_driver);
