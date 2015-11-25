Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:58594 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751985AbbKYWE0 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 25 Nov 2015 17:04:26 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Eric Miao <eric.y.miao@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Chao Xie <chao.xie@marvell.com>,
	Mike Turquette <mturquette@linaro.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mmp: add linux/clk.h includes
Date: Wed, 25 Nov 2015 23:03:49 +0100
Message-ID: <5338608.iS8N3pHg9B@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The common clk implementation for MMP broke without anyone noticing
when we stopped including linux/clk.h from the clk-provider header.

This did not show up in the defconfig builds because those use the
legacy MMP clk drivers, and it did not show up in my randconfig tests
either because I was testing with my mmp multiplatform series
applied, which at some point gained the fixup.

This fixes the three broken files.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 61ae76563ec3 ("clk: Remove clk.h from clk-provider.h")

diff --git a/drivers/clk/mmp/clk-mmp2.c b/drivers/clk/mmp/clk-mmp2.c
index 09d2832fbd78..71fd29348f28 100644
--- a/drivers/clk/mmp/clk-mmp2.c
+++ b/drivers/clk/mmp/clk-mmp2.c
@@ -9,6 +9,7 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
diff --git a/drivers/clk/mmp/clk-pxa168.c b/drivers/clk/mmp/clk-pxa168.c
index 93e967c0f972..75244915df05 100644
--- a/drivers/clk/mmp/clk-pxa168.c
+++ b/drivers/clk/mmp/clk-pxa168.c
@@ -9,6 +9,7 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
diff --git a/drivers/clk/mmp/clk-pxa910.c b/drivers/clk/mmp/clk-pxa910.c
index 993abcdb32cc..37ba04ba1368 100644
--- a/drivers/clk/mmp/clk-pxa910.c
+++ b/drivers/clk/mmp/clk-pxa910.c
@@ -9,6 +9,7 @@
  * warranty of any kind, whether express or implied.
  */
 
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/spinlock.h>

