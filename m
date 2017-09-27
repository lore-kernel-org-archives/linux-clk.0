Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] clk/versatile: Improve a size determination in
 icst_clk_setup()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <66ff55fd-caae-9c98-197d-f6c3fe7a9c49@users.sourceforge.net>
Message-ID: <dfc5dcb1-2744-8fdb-b85d-8ff1bf06f56a@users.sourceforge.net>
Date: Wed, 27 Sep 2017 21:40:51 +0200
MIME-Version: 1.0
In-Reply-To: <66ff55fd-caae-9c98-197d-f6c3fe7a9c49@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 21:24:43 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/versatile/clk-icst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index 20ab4ceffb28..dafe7a45875d 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -359,7 +359,7 @@ static struct clk *icst_clk_setup(struct device *dev,
 	struct clk_init_data init;
 	struct icst_params *pclone;
 
-	icst = kzalloc(sizeof(struct clk_icst), GFP_KERNEL);
+	icst = kzalloc(sizeof(*icst), GFP_KERNEL);
 	if (!icst)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.14.2
