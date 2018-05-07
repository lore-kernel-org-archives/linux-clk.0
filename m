Return-Path: <nsekhar@ti.com>
From: Sekhar Nori <nsekhar@ti.com>
To: David Lechner <david@lechnology.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC: Linux clk Mailing List <linux-clk@vger.kernel.org>,
        Linux ARM Mailing List
	<linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH] clk: davinci: psc-da830: fix USB0 48MHz PHY clock registration
Date: Mon, 7 May 2018 17:04:57 +0530
Message-ID: <20180507113457.4716-1-nsekhar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

USB0 48MHz PHY clock registration fails on DA830 because the
da8xx-cfgchip clock driver cannot get a reference to USB0
LPSC clock.

The USB0 LPSC needs to be enabled during PHY clock enable. Setup
the clock lookup correctly to fix this.

Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 drivers/clk/davinci/psc-da830.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/davinci/psc-da830.c b/drivers/clk/davinci/psc-da830.c
index f61abf5632ff..081b039fcb02 100644
--- a/drivers/clk/davinci/psc-da830.c
+++ b/drivers/clk/davinci/psc-da830.c
@@ -55,7 +55,8 @@ const struct davinci_psc_init_data da830_psc0_init_data = {
 	.psc_init		= &da830_psc0_init,
 };
 
-LPSC_CLKDEV2(usb0_clkdev,	NULL,	"musb-da8xx",
+LPSC_CLKDEV3(usb0_clkdev,	"fck",	"da830-usb-phy-clks",
+				NULL,	"musb-da8xx",
 				NULL,	"cppi41-dmaengine");
 LPSC_CLKDEV1(usb1_clkdev,	NULL,	"ohci-da8xx");
 /* REVISIT: gpio-davinci.c should be modified to drop con_id */
-- 
2.16.2
