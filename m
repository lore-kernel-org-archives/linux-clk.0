Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 2/4] clk-u300: Improve a size determination in two functions
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
Message-ID: <781271c5-482f-d4da-e91e-3b048bac69c2@users.sourceforge.net>
Date: Tue, 26 Sep 2017 20:22:25 +0200
MIME-Version: 1.0
In-Reply-To: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 19:33:02 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-u300.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-u300.c b/drivers/clk/clk-u300.c
index e524c3775264..ae78461c7836 100644
--- a/drivers/clk/clk-u300.c
+++ b/drivers/clk/clk-u300.c
@@ -702,7 +702,7 @@ syscon_clk_register(struct device *dev, const char *name,
 	struct clk_init_data init;
 	int ret;
 
-	sclk = kzalloc(sizeof(struct clk_syscon), GFP_KERNEL);
+	sclk = kzalloc(sizeof(*sclk), GFP_KERNEL);
 	if (!sclk)
 		return ERR_PTR(-ENOMEM);
 
@@ -1121,7 +1121,7 @@ mclk_clk_register(struct device *dev, const char *name,
 	struct clk_init_data init;
 	int ret;
 
-	mclk = kzalloc(sizeof(struct clk_mclk), GFP_KERNEL);
+	mclk = kzalloc(sizeof(*mclk), GFP_KERNEL);
 	if (!mclk)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.14.1
