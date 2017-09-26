Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] clk-mux: Improve a size determination in
 clk_hw_register_mux_table()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <0d223969-36c3-6f78-97cb-46c074207d2f@users.sourceforge.net>
Message-ID: <7d70d3de-ba3b-3619-05a8-9a4abe0dacfe@users.sourceforge.net>
Date: Tue, 26 Sep 2017 18:22:44 +0200
MIME-Version: 1.0
In-Reply-To: <0d223969-36c3-6f78-97cb-46c074207d2f@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 17:30:06 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 1746dbf2f7ea..39cabe157163 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -134,7 +134,7 @@ struct clk_hw *clk_hw_register_mux_table(struct device *dev, const char *name,
 	}
 
 	/* allocate the mux */
-	mux = kzalloc(sizeof(struct clk_mux), GFP_KERNEL);
+	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
 	if (!mux)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.14.1
