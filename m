Return-Path: <ben.dooks@codethink.co.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Cc: Ben Dooks <ben.dooks@codethink.co.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Ray Jui <rjui@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH] clk: iproc: fix missing include of clk-iproc.h
Date: Tue,  7 Jun 2016 17:32:30 +0100
Message-Id: <1465317150-12704-1-git-send-email-ben.dooks@codethink.co.uk>
List-ID: <linux-clk.vger.kernel.org>

Fix the implicit declaration of iproc_armpll_setup() by
including clk-iproc.h which defines it. Fixes the warning:

drivers/clk/bcm/clk-iproc-armpll.c:242:13: warning: symbol 'iproc_armpll_setup' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Jon Mason <jonmason@broadcom.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com
---
 drivers/clk/bcm/clk-iproc-armpll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/bcm/clk-iproc-armpll.c b/drivers/clk/bcm/clk-iproc-armpll.c
index a196ee2..698c507 100644
--- a/drivers/clk/bcm/clk-iproc-armpll.c
+++ b/drivers/clk/bcm/clk-iproc-armpll.c
@@ -20,6 +20,8 @@
 #include <linux/clkdev.h>
 #include <linux/of_address.h>
 
+#include "clk-iproc.h"
+
 #define IPROC_CLK_MAX_FREQ_POLICY                    0x3
 #define IPROC_CLK_POLICY_FREQ_OFFSET                 0x008
 #define IPROC_CLK_POLICY_FREQ_POLICY_FREQ_SHIFT      8
-- 
2.8.1
