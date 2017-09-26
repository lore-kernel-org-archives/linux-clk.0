Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 1/4] clk-u300: Delete an error message for a failed memory
 allocation in two functions
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
Message-ID: <786e8b0c-a208-8ced-a566-905bae6ca394@users.sourceforge.net>
Date: Tue, 26 Sep 2017 20:21:24 +0200
MIME-Version: 1.0
In-Reply-To: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 19:30:46 +0200

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-u300.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-u300.c b/drivers/clk/clk-u300.c
index ec8aafda6e24..e524c3775264 100644
--- a/drivers/clk/clk-u300.c
+++ b/drivers/clk/clk-u300.c
@@ -703,11 +703,9 @@ syscon_clk_register(struct device *dev, const char *name,
 	int ret;
 
 	sclk = kzalloc(sizeof(struct clk_syscon), GFP_KERNEL);
-	if (!sclk) {
-		pr_err("could not allocate syscon clock %s\n",
-			name);
+	if (!sclk)
 		return ERR_PTR(-ENOMEM);
-	}
+
 	init.name = name;
 	init.ops = &syscon_clk_ops;
 	init.flags = flags;
@@ -1124,11 +1122,9 @@ mclk_clk_register(struct device *dev, const char *name,
 	int ret;
 
 	mclk = kzalloc(sizeof(struct clk_mclk), GFP_KERNEL);
-	if (!mclk) {
-		pr_err("could not allocate MMC/SD clock %s\n",
-		       name);
+	if (!mclk)
 		return ERR_PTR(-ENOMEM);
-	}
+
 	init.name = "mclk";
 	init.ops = &mclk_ops;
 	init.flags = 0;
-- 
2.14.1
