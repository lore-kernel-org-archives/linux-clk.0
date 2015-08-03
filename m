Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] clk: pxa: pxa3xx: fix CKEN register access
Date: Mon,  3 Aug 2015 21:58:27 +0200
Message-Id: <1438631907-27993-1-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

Clocks 0 to 31 are on CKENA, and not CKENB. The clock register names
were inadequately inverted. As a consequence, all clock operations were
happening on CKENB, because almost all but 2 clocks are on CKENA.

As the clocks were activated by the bootloader in the former tests, it
escaped the testing that the wrong clock gate was manipulated. The error
was revealed by changing the pxa3xx-and driver to a module, where tupon
unloading the wrong clock was disabled in CKENB.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/clk/pxa/clk-pxa3xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/pxa/clk-pxa3xx.c b/drivers/clk/pxa/clk-pxa3xx.c
index c677b9ab5367..4af4eed5f89f 100644
--- a/drivers/clk/pxa/clk-pxa3xx.c
+++ b/drivers/clk/pxa/clk-pxa3xx.c
@@ -126,7 +126,7 @@ PARENTS(pxa3xx_ac97_bus) = { "ring_osc_60mhz", "ac97" };
 PARENTS(pxa3xx_sbus) = { "ring_osc_60mhz", "system_bus" };
 PARENTS(pxa3xx_smemcbus) = { "ring_osc_60mhz", "smemc" };
 
-#define CKEN_AB(bit) ((CKEN_ ## bit > 31) ? &CKENA : &CKENB)
+#define CKEN_AB(bit) ((CKEN_ ## bit > 31) ? &CKENB : &CKENA)
 #define PXA3XX_CKEN(dev_id, con_id, parents, mult_lp, div_lp, mult_hp,	\
 		    div_hp, bit, is_lp, flags)				\
 	PXA_CKEN(dev_id, con_id, bit, parents, mult_lp, div_lp,		\
-- 
2.1.4
