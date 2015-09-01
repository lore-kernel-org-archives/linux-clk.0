Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Michael Turquette <mturquette@baylibre.com>,
	uclinux-h8-devel@lists.sourceforge.jp, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] clk: h8s2678: Fix compile error
Date: Mon, 31 Aug 2015 20:27:32 -0700
Message-Id: <1441078052-14790-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Recent cleanup removed some include files without checking if the cleaned
up code still compiles. This results in the following compile error.

drivers/clk/h8300/clk-h8s2678.c: In function ‘h8s2678_pll_clk_setup’:
drivers/clk/h8300/clk-h8s2678.c:99:14: error:
	implicit declaration of function ‘kzalloc’
drivers/clk/h8300/clk-h8s2678.c:138:2: error:
      implicit declaration of function ‘kfree’

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/clk/h8300/clk-h8s2678.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/h8300/clk-h8s2678.c b/drivers/clk/h8300/clk-h8s2678.c
index 2a38eb4a2552..6cf38dc1c929 100644
--- a/drivers/clk/h8300/clk-h8s2678.c
+++ b/drivers/clk/h8300/clk-h8s2678.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/of_address.h>
+#include <linux/slab.h>
 
 static DEFINE_SPINLOCK(clklock);
 
-- 
2.1.4

