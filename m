Return-Path: <ben.dooks@codethink.co.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Cc: Ben Dooks <ben.dooks@codethink.co.uk>,
	Bintian Wang <bintian.wang@huawei.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: hi6220: fix missing clk.h include
Date: Tue,  7 Jun 2016 14:54:08 +0100
Message-Id: <1465307648-15660-1-git-send-email-ben.dooks@codethink.co.uk>
List-ID: <linux-clk.vger.kernel.org>

Fix the warning from missing "clk.h" include which
defines hi6220_register_clkdiv() function.

drivers/clk/hisilicon/clkdivider-hi6220.c:102:12: warning: symbol 'hi6220_register_clkdiv' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Bintian Wang <bintian.wang@huawei.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/hisilicon/clkdivider-hi6220.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/hisilicon/clkdivider-hi6220.c b/drivers/clk/hisilicon/clkdivider-hi6220.c
index 113eee8..a1c1f68 100644
--- a/drivers/clk/hisilicon/clkdivider-hi6220.c
+++ b/drivers/clk/hisilicon/clkdivider-hi6220.c
@@ -18,6 +18,8 @@
 #include <linux/err.h>
 #include <linux/spinlock.h>
 
+#include "clk.h"
+
 #define div_mask(width)	((1 << (width)) - 1)
 
 /**
-- 
2.8.1
