Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: pxa: fix building on older compilers
Date: Fri, 15 Sep 2017 21:53:47 +0200
Message-Id: <20170915195402.1469159-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

gcc-4.4 got confused by the inline assembler statement:

drivers/clk/pxa/clk-pxa.c: In function 'pxa2xx_core_turbo_switch':
drivers/clk/pxa/clk-pxa.c:152: error: expected string literal before ')' token

This removes the extraneous ':' to let all compilers parse the
driver correctly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/pxa/clk-pxa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index 74f64c3c4290..b80dc9d5855c 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -147,9 +147,7 @@ void pxa2xx_core_turbo_switch(bool on)
 	"	b	3f\n"
 	"2:	b	1b\n"
 	"3:	nop\n"
-		: "=&r" (unused)
-		: "r" (clkcfg)
-		: );
+		: "=&r" (unused) : "r" (clkcfg));
 
 	local_irq_restore(flags);
 }
-- 
2.9.0
