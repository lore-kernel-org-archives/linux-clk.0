Return-Path: <gustavo@embeddedor.com>
Date: Wed, 18 Jul 2018 20:58:45 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] reset: hisilicon: fix potential NULL pointer dereference
Message-ID: <20180719015845.GA10768@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

There is a potential execution path in which function
platform_get_resource() returns NULL. If this happens,
we will end up having a NULL pointer dereference.

Fix this by adding asanity check in order to avoid a
NULL pointer dereference.

This code was detected with the help of Coccinelle.

Cc: stable@vger.kernel.org
Fixes: 97b7129cd2af ("reset: hisilicon: change the definition of hisi_reset_init")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/clk/hisilicon/reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
index 2a5015c..5dfb48b 100644
--- a/drivers/clk/hisilicon/reset.c
+++ b/drivers/clk/hisilicon/reset.c
@@ -109,6 +109,9 @@ struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev)
 		return NULL;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return NULL;
+
 	rstc->membase = devm_ioremap(&pdev->dev,
 				res->start, resource_size(res));
 	if (!rstc->membase)
-- 
2.7.4
