Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] clk-mux: Delete an error message for a failed memory
 allocation in clk_hw_register_mux_table()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <0d223969-36c3-6f78-97cb-46c074207d2f@users.sourceforge.net>
Message-ID: <31bc9968-20e9-1fd0-0f16-80cb0f2bffe0@users.sourceforge.net>
Date: Tue, 26 Sep 2017 18:21:42 +0200
MIME-Version: 1.0
In-Reply-To: <0d223969-36c3-6f78-97cb-46c074207d2f@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 17:23:04 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-mux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 16a3d5717f4e..1746dbf2f7ea 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -135,10 +135,8 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 
 	/* allocate the mux */
 	mux = kzalloc(sizeof(struct clk_mux), GFP_KERNEL);
-	if (!mux) {
-		pr_err("%s: could not allocate mux clk\n", __func__);
+	if (!mux)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	if (clk_mux_flags & CLK_MUX_READ_ONLY)
-- 
2.14.1
