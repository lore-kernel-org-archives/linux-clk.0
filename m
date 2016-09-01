Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:34174 "EHLO
        mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752127AbcIAKwU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2016 06:52:20 -0400
Received: by mail-pf0-f172.google.com with SMTP id p64so30292710pfb.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2016 03:52:20 -0700 (PDT)
From: Baoyou Xie <baoyou.xie@linaro.org>
To: mturquette@baylibre.com, sboyd@codeaurora.org,
        maxime.ripard@free-electrons.com, wens@csie.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org,
        xie.baoyou@zte.com.cn
Subject: [PATCH] clk: sunxi-ng: mark ccu_nk_find_best() static
Date: Thu,  1 Sep 2016 18:51:48 +0800
Message-Id: <1472727108-18388-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We get 1 warning when building kernel with W=1:
drivers/clk/sunxi-ng/ccu_nk.c:17:6: warning: no previous prototype for 'ccu_nk_find_best' [-Wmissing-prototypes]

In fact, this function is only used in the file in which it is
declared and don't need a declaration, but can be made static.
So this patch marks it 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/clk/sunxi-ng/ccu_nk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nk.c b/drivers/clk/sunxi-ng/ccu_nk.c
index 4470ffc..2adb62e 100644
--- a/drivers/clk/sunxi-ng/ccu_nk.c
+++ b/drivers/clk/sunxi-ng/ccu_nk.c
@@ -14,7 +14,7 @@
 #include "ccu_gate.h"
 #include "ccu_nk.h"
 
-void ccu_nk_find_best(unsigned long parent, unsigned long rate,
+static void ccu_nk_find_best(unsigned long parent, unsigned long rate,
 		      unsigned int max_n, unsigned int max_k,
 		      unsigned int *n, unsigned int *k)
 {
-- 
2.7.4

