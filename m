Return-Path: <gustavo@embeddedor.com>
Date: Wed, 25 Jul 2018 19:47:19 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH v2] reset: hisilicon: fix potential NULL pointer dereference
Message-ID: <20180726004719.GA9896@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

There is a potential execution path in which function
platform_get_resource() returns NULL. If this happens,
we will end up having a NULL pointer dereference.

Fix this by replacing devm_ioremap with devm_ioremap_resource,
which has the NULL check and the memory region request.

This code was detected with the help of Coccinelle.

Cc: stable@vger.kernel.org
Fixes: 97b7129cd2af ("reset: hisilicon: change the definition of hisi_reset_init")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
Changes in v2:
 - Use devm_ioremap_resource. Thanks to Stephen Boyd for
   pointing it out.

 drivers/clk/hisilicon/reset.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
index 2a5015c..43e82fa 100644
--- a/drivers/clk/hisilicon/reset.c
+++ b/drivers/clk/hisilicon/reset.c
@@ -109,9 +109,8 @@ struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev)
 		return NULL;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	rstc->membase = devm_ioremap(&pdev->dev,
-				res->start, resource_size(res));
-	if (!rstc->membase)
+	rstc->membase = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(rstc->membase))
 		return NULL;
 
 	spin_lock_init(&rstc->lock);
-- 
2.7.4
