Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 4/6] clk: hi3620: Use kcalloc() in hi3620_mmc_clk_init()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Jiancheng Xue <xuejiancheng@hisilicon.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Message-ID: <9c35e91c-36c6-f33e-a283-4304ad118a22@users.sourceforge.net>
Date: Tue, 18 Apr 2017 11:41:48 +0200
MIME-Version: 1.0
In-Reply-To: <7a649967-8ff1-8682-2f87-43871172fc28@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 10:30:04 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/hisilicon/clk-hi3620.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/clk-hi3620.c b/drivers/clk/hisilicon/clk-hi3620.c
index d04a104ce1b4..f6dd971c9d3c 100644
--- a/drivers/clk/hisilicon/clk-hi3620.c
+++ b/drivers/clk/hisilicon/clk-hi3620.c
@@ -482,7 +482,7 @@ static void __init hi3620_mmc_clk_init(struct device_node *node)
 	if (WARN_ON(!clk_data))
 		return;
 
-	clk_data->clks = kzalloc(sizeof(struct clk *) * num, GFP_KERNEL);
+	clk_data->clks = kcalloc(num, sizeof(*clk_data->clks), GFP_KERNEL);
 	if (!clk_data->clks) {
 		pr_err("%s: fail to allocate mmc clk\n", __func__);
 		return;
-- 
2.12.2
