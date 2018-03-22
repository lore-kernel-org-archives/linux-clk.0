Return-Path: <boris.brezillon@bootlin.com>
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	linux-rpi-kernel@lists.infradead.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: bcm2835: De-assert/assert PLL reset signal when appropriate
Date: Thu, 22 Mar 2018 10:11:30 +0100
Message-Id: <20180322091130.5997-1-boris.brezillon@bootlin.com>
List-ID: <linux-clk.vger.kernel.org>

In order to enable a PLL, not only the PLL has to be powered up and
locked, but you also have to de-assert the reset signal. The last part
was missing. Add it so PLLs that were not enabled by the FW/bootloader
can be enabled from Linux.

Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio domain clocks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- simplify bcm2835_pll_off()
---
 drivers/clk/bcm/clk-bcm2835.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index a07f6451694a..fa0d5c8611a0 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -602,9 +602,7 @@ static void bcm2835_pll_off(struct clk_hw *hw)
 	const struct bcm2835_pll_data *data = pll->data;
 
 	spin_lock(&cprman->regs_lock);
-	cprman_write(cprman, data->cm_ctrl_reg,
-		     cprman_read(cprman, data->cm_ctrl_reg) |
-		     CM_PLL_ANARST);
+	cprman_write(cprman, data->cm_ctrl_reg, CM_PLL_ANARST);
 	cprman_write(cprman, data->a2w_ctrl_reg,
 		     cprman_read(cprman, data->a2w_ctrl_reg) |
 		     A2W_PLL_CTRL_PWRDN);
@@ -640,6 +638,10 @@ static int bcm2835_pll_on(struct clk_hw *hw)
 		cpu_relax();
 	}
 
+	cprman_write(cprman, data->a2w_ctrl_reg,
+		     cprman_read(cprman, data->a2w_ctrl_reg) |
+		     A2W_PLL_CTRL_PRST_DISABLE);
+
 	return 0;
 }
 
-- 
2.14.1
