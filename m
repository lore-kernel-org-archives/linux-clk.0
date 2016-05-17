Return-Path: <Purna.Mandal@microchip.com>
From: Purna Chandra Mandal <purna.mandal@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, Purna
 Chandra Mandal <purna.mandal@microchip.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH 02/11] clk: microchip: Initialize SOSC clock rate for PIC32MZDA.
Date: Tue, 17 May 2016 10:35:51 +0530
Message-ID: <1463461560-9629-2-git-send-email-purna.mandal@microchip.com>
In-Reply-To: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: purna.mandal@microchip.com
List-ID: <linux-clk.vger.kernel.org>

Optional SOSC is an external fixed clock running at 32768HZ.
So Initialize SOSC rate as per PIC32MZDA datasheet.

Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>

---
Note: Please pull this complete series through the MIPS tree.

---

 drivers/clk/microchip/clk-pic32mzda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/microchip/clk-pic32mzda.c b/drivers/clk/microchip/clk-pic32mzda.c
index 020a29a..210694b 100644
--- a/drivers/clk/microchip/clk-pic32mzda.c
+++ b/drivers/clk/microchip/clk-pic32mzda.c
@@ -118,6 +118,7 @@ static const struct pic32_sec_osc_data sosc_clk = {
 	.status_reg = 0x1d0,
 	.enable_mask = BIT(1),
 	.status_mask = BIT(4),
+	.fixed_rate = 32768,
 	.init_data = {
 		.name = "sosc_clk",
 		.parent_names = NULL,
-- 
1.8.3.1
