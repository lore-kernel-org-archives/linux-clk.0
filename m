Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH -next] clk: mvebu: Remove redundant dev_err call in armada_3700_periph_clock_probe()
Date: Sat, 20 Aug 2016 15:31:05 +0000
Message-Id: <1471707065-29575-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 5bb13c9..45905fc 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -383,10 +383,8 @@ static int armada_3700_periph_clock_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	reg = devm_ioremap_resource(dev, res);
-	if (IS_ERR(reg)) {
-		dev_err(dev, "Could not map the periph clock registers\n");
+	if (IS_ERR(reg))
 		return PTR_ERR(reg);
-	}
 
 	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
 	if (!driver_data)
