Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:45748 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933346AbeBVRRU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Feb 2018 12:17:20 -0500
Received: by mail-qk0-f194.google.com with SMTP id g2so7348749qkd.12
        for <linux-clk@vger.kernel.org>; Thu, 22 Feb 2018 09:17:19 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: sboyd@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] clk: imx6sl: Include "common.h" header file
Date: Thu, 22 Feb 2018 14:17:25 -0300
Message-Id: <1519319846-18246-1-git-send-email-festevam@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

The prototype for the imx6sl_set_wait_clk() function is provided
by the "common.h" header file, so include it to avoid the following
sparse warning:

drivers/clk/imx/clk-imx6sl.c:163:6: warning: symbol 'imx6sl_set_wait_clk' was not declared. Should it be static?

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/clk/imx/clk-imx6sl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx6sl.c b/drivers/clk/imx/clk-imx6sl.c
index 9642cdf..bdda77b 100644
--- a/drivers/clk/imx/clk-imx6sl.c
+++ b/drivers/clk/imx/clk-imx6sl.c
@@ -16,6 +16,7 @@
 #include <dt-bindings/clock/imx6sl-clock.h>
 
 #include "clk.h"
+#include "common.h"
 
 #define CCSR			0xc
 #define BM_CCSR_PLL1_SW_CLK_SEL	(1 << 2)
-- 
2.7.4

