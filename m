Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 2/2] clk: at91: system: don't try to free_irq when there is no IRQ
Date: Fri, 11 Sep 2015 16:34:07 +0200
Message-Id: <1441982047-11303-2-git-send-email-alexandre.belloni@free-electrons.com>
In-Reply-To: <1441982047-11303-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1441982047-11303-1-git-send-email-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

In the error path of at91_clk_register_system(), sys->irq is freed
unconditionally but it may not exist or be request at all.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 drivers/clk/at91/clk-system.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-system.c b/drivers/clk/at91/clk-system.c
index 58008b3e8bc1..3f5314344286 100644
--- a/drivers/clk/at91/clk-system.c
+++ b/drivers/clk/at91/clk-system.c
@@ -138,7 +138,8 @@ at91_clk_register_system(struct at91_pmc *pmc, const char *name,
 
 	clk = clk_register(NULL, &sys->hw);
 	if (IS_ERR(clk)) {
-		free_irq(sys->irq, sys);
+		if (irq)
+			free_irq(sys->irq, sys);
 		kfree(sys);
 	}
 
-- 
2.1.4

