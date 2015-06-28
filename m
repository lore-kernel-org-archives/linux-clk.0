Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:51519 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752215AbbF1OZo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Sun, 28 Jun 2015 10:25:44 -0400
From: Sergej Sawazki <ce3a@gmx.de>
To: sboyd@codeaurora.org, mturquette@baylibre.com, jsarha@ti.com
Cc: linux-clk@vger.kernel.org, Sergej Sawazki <ce3a@gmx.de>
Subject: [PATCH v4 1/4] clk: gpio-gate: Include export.h instead of module.h
Date: Sun, 28 Jun 2015 16:24:53 +0200
Message-Id: <1435501496-25761-2-git-send-email-ce3a@gmx.de>
In-Reply-To: <1435501496-25761-1-git-send-email-ce3a@gmx.de>
References: <1435501496-25761-1-git-send-email-ce3a@gmx.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Include export.h for EXPORT_SYMBOL_GPL, no need to include module.h.

Cc: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
---
 drivers/clk/clk-gpio-gate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-gpio-gate.c b/drivers/clk/clk-gpio-gate.c
index f564e62..a377f88 100644
--- a/drivers/clk/clk-gpio-gate.c
+++ b/drivers/clk/clk-gpio-gate.c
@@ -10,7 +10,7 @@
  */
 
 #include <linux/clk-provider.h>
-#include <linux/module.h>
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-- 
1.9.1

