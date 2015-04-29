Return-Path: <festevam@gmail.com>
Return-Path: <festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
To: shawn.guo@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	mturquette@linaro.org,
	Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH v2] clk: imx: clk-cpu: Include "clk.h" header file
Date: Wed, 29 Apr 2015 18:34:42 -0300
Message-Id: <1430343282-13739-1-git-send-email-festevam@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Fabio Estevam <fabio.estevam@freescale.com>

Include the "clk.h" header file to fix the following sparse warning:

drivers/clk/imx/clk-cpu.c:77:12: warning: symbol 'imx_clk_cpu' was not declared. Should it be static?

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
Changes since v1:
- Rebased since the clk-cpu moved to drivers/clk/imx 

 drivers/clk/imx/clk-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-cpu.c b/drivers/clk/imx/clk-cpu.c
index aa1c345..9d46eac 100644
--- a/drivers/clk/imx/clk-cpu.c
+++ b/drivers/clk/imx/clk-cpu.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
+#include "clk.h"
 
 struct clk_cpu {
 	struct clk_hw	hw;
-- 
1.9.1
