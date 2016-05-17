Return-Path: <Purna.Mandal@microchip.com>
From: Purna Chandra Mandal <purna.mandal@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, Purna
 Chandra Mandal <purna.mandal@microchip.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH 01/11] clk: microchip: use readl_poll_timeout() in pbclk_set_rate().
Date: Tue, 17 May 2016 10:35:50 +0530
Message-ID: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: purna.mandal@microchip.com
List-ID: <linux-clk.vger.kernel.org>

pbclk_set_rate() is using readl_poll_timeout_atomic() even
though spinlock is released. Fix it by replacing with
readl_poll_timeout().

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
---
Note: Please pull this complete series through the MIPS tree.

---

 drivers/clk/microchip/clk-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index ca85cea..c3b3014 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -199,9 +199,9 @@ static int pbclk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	spin_unlock_irqrestore(&pb->core->reg_lock, flags);
 
-	/* wait again, for pbdivready */
-	err = readl_poll_timeout_atomic(pb->ctrl_reg, v, v & PB_DIV_READY,
-					1, LOCK_TIMEOUT_US);
+	/* wait again for DIV_READY */
+	err = readl_poll_timeout(pb->ctrl_reg, v, v & PB_DIV_READY,
+				 1, LOCK_TIMEOUT_US);
 	if (err)
 		return err;
 
-- 
1.8.3.1
