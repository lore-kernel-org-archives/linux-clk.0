Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-he1eur01on0074.outbound.protection.outlook.com ([104.47.0.74]:1536
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751558AbeBGB6R (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 6 Feb 2018 20:58:17 -0500
From: Bai Ping <ping.bai@nxp.com>
To: sboyd@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        aisheng.dong@nxp.com, jacky.baip@gmail.com
Subject: [PATCH v3 2/4] driver: clk: imx: add new gate/gate2 wrapper funtion
Date: Wed,  7 Feb 2018 10:00:17 +0800
Message-Id: <1517968819-12869-2-git-send-email-ping.bai@nxp.com>
In-Reply-To: <1517968819-12869-1-git-send-email-ping.bai@nxp.com>
References: <1517968819-12869-1-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add new gate/gate2 wrapper function to register clocks with optional flags.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 drivers/clk/imx/clk.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index d69c4bb..8076ec0 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -123,6 +123,13 @@ static inline struct clk *imx_clk_gate(const char *name, const char *parent,
 			shift, 0, &imx_ccm_lock);
 }
 
+static inline struct clk *imx_clk_gate_flags(const char *name, const char *parent,
+		void __iomem *reg, u8 shift, unsigned long flags)
+{
+	return clk_register_gate(NULL, name, parent, flags | CLK_SET_RATE_PARENT, reg,
+			shift, 0, &imx_ccm_lock);
+}
+
 static inline struct clk *imx_clk_gate_dis(const char *name, const char *parent,
 		void __iomem *reg, u8 shift)
 {
@@ -137,6 +144,13 @@ static inline struct clk *imx_clk_gate2(const char *name, const char *parent,
 			shift, 0x3, 0, &imx_ccm_lock, NULL);
 }
 
+static inline struct clk *imx_clk_gate2_flags(const char *name, const char *parent,
+		void __iomem *reg, u8 shift, unsigned long flags)
+{
+	return clk_register_gate2(NULL, name, parent, flags | CLK_SET_RATE_PARENT, reg,
+			shift, 0x3, 0, &imx_ccm_lock, NULL);
+}
+
 static inline struct clk *imx_clk_gate2_shared(const char *name,
 		const char *parent, void __iomem *reg, u8 shift,
 		unsigned int *share_count)
-- 
1.9.1

