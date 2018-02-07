Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-he1eur01on0053.outbound.protection.outlook.com ([104.47.0.53]:58257
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751558AbeBGB6K (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 6 Feb 2018 20:58:10 -0500
From: Bai Ping <ping.bai@nxp.com>
To: sboyd@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        aisheng.dong@nxp.com, jacky.baip@gmail.com
Subject: [PATCH v3 1/4] driver: clk: imx: Add CLK_IS_CRITICAL flag for busy diviver and busy mux
Date: Wed,  7 Feb 2018 10:00:16 +0800
Message-Id: <1517968819-12869-1-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The busy divider and busy mux is actually used by the system critical clocks,
so add 'CLK_IS_CRITICAL' to clocks registered with these two type.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-busy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c
index 6df3389..9903652 100644
--- a/drivers/clk/imx/clk-busy.c
+++ b/drivers/clk/imx/clk-busy.c
@@ -101,7 +101,7 @@ struct clk *imx_clk_busy_divider(const char *name, const char *parent_name,
 
 	init.name = name;
 	init.ops = &clk_busy_divider_ops;
-	init.flags = CLK_SET_RATE_PARENT;
+	init.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
@@ -175,7 +175,7 @@ struct clk *imx_clk_busy_mux(const char *name, void __iomem *reg, u8 shift,
 
 	init.name = name;
 	init.ops = &clk_busy_mux_ops;
-	init.flags = 0;
+	init.flags = CLK_IS_CRITICAL;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
 
-- 
1.9.1

