Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH v4 1/2] clk: at91: fix clk-generated parenting
Date: Fri, 12 May 2017 16:25:30 +0200
Message-Id: <20170512142531.11274-1-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

clk_generated_startup is called after clk_hw_register. So the first call to
get_parent will not have the correct value (i.e. 0) and because this is
cached, it may never be updated.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/clk/at91/clk-generated.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
index 4e1cd5aa69d8..70474bd97a10 100644
--- a/drivers/clk/at91/clk-generated.c
+++ b/drivers/clk/at91/clk-generated.c
@@ -260,13 +260,12 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
 	gck->lock = lock;
 	gck->range = *range;
 
+	clk_generated_startup(gck);
 	hw = &gck->hw;
 	ret = clk_hw_register(NULL, &gck->hw);
 	if (ret) {
 		kfree(gck);
 		hw = ERR_PTR(ret);
-	} else
-		clk_generated_startup(gck);
 
 	return hw;
 }
-- 
2.11.0
