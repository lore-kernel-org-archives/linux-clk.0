Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v2 4/5] clk: pxa: export core clocks
Date: Sun, 23 Oct 2016 14:19:29 +0200
Message-Id: <1477225170-19019-5-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
References: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

pxaxxx_get_clk_frequency_khz() needs several clocks to be available
through clk_get(), ie. the cpu clocks, system bus clock and memory
clocks.

Add the missing clkdev so that their rate can be acquired.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/clk/pxa/clk-pxa25x.c |  9 ++++++---
 drivers/clk/pxa/clk-pxa27x.c | 13 ++++++++-----
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/pxa/clk-pxa25x.c b/drivers/clk/pxa/clk-pxa25x.c
index 3bb603a27f2b..6a3009eec830 100644
--- a/drivers/clk/pxa/clk-pxa25x.c
+++ b/drivers/clk/pxa/clk-pxa25x.c
@@ -189,8 +189,10 @@ RATE_RO_OPS(clk_pxa25x_cpll, "cpll");
 
 static void __init pxa25x_register_core(void)
 {
-	clk_register_clk_pxa25x_cpll();
-	clk_register_clk_pxa25x_run();
+	clkdev_pxa_register(CLK_NONE, "cpll", NULL,
+			    clk_register_clk_pxa25x_cpll());
+	clkdev_pxa_register(CLK_NONE, "run", NULL,
+			    clk_register_clk_pxa25x_run());
 	clkdev_pxa_register(CLK_CORE, "core", NULL,
 			    clk_register_clk_pxa25x_core());
 }
@@ -212,7 +214,8 @@ static void __init pxa25x_base_clocks_init(void)
 {
 	pxa25x_register_plls();
 	pxa25x_register_core();
-	clk_register_clk_pxa25x_memory();
+	clkdev_pxa_register(CLK_NONE, "system_bus", NULL,
+			    clk_register_clk_pxa25x_memory());
 }
 
 #define DUMMY_CLK(_con_id, _dev_id, _parent) \
diff --git a/drivers/clk/pxa/clk-pxa27x.c b/drivers/clk/pxa/clk-pxa27x.c
index 3b36e8d0f81e..9fb40e884999 100644
--- a/drivers/clk/pxa/clk-pxa27x.c
+++ b/drivers/clk/pxa/clk-pxa27x.c
@@ -270,9 +270,10 @@ RATE_RO_OPS(clk_pxa27x_run, "run");
 
 static void __init pxa27x_register_core(void)
 {
-	clk_register_clk_pxa27x_cpll();
-	clk_register_clk_pxa27x_run();
-
+	clkdev_pxa_register(CLK_NONE, "cpll", NULL,
+			    clk_register_clk_pxa27x_cpll());
+	clkdev_pxa_register(CLK_NONE, "run", NULL,
+			    clk_register_clk_pxa27x_run());
 	clkdev_pxa_register(CLK_CORE, "core", NULL,
 			    clk_register_clk_pxa27x_core());
 }
@@ -382,8 +383,10 @@ static void __init pxa27x_base_clocks_init(void)
 {
 	pxa27x_register_plls();
 	pxa27x_register_core();
-	clk_register_clk_pxa27x_system_bus();
-	clk_register_clk_pxa27x_memory();
+	clkdev_pxa_register(CLK_NONE, "system_bus", NULL,
+			    clk_register_clk_pxa27x_system_bus());
+	clkdev_pxa_register(CLK_NONE, "memory", NULL,
+			    clk_register_clk_pxa27x_memory());
 	clk_register_clk_pxa27x_lcd_base();
 }
 
-- 
2.1.4
