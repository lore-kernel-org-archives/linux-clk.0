Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-he1eur01on0042.outbound.protection.outlook.com ([104.47.0.42]:37504
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751004AbeCTCVi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Mar 2018 22:21:38 -0400
From: Bai Ping <ping.bai@nxp.com>
To: sboyd@kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        aisheng.dong@nxp.com, jacky.baip@gmail.com
Subject: [PATCH v6 2/4] clk: imx: add new gate/gate2 wrapper funtion
Date: Tue, 20 Mar 2018 10:24:02 +0800
Message-Id: <1521512644-25265-2-git-send-email-ping.bai@nxp.com>
In-Reply-To: <1521512644-25265-1-git-send-email-ping.bai@nxp.com>
References: <1521512644-25265-1-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add new gate/gate2 wrapper function to register clocks with optional flags.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
Acked-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 change from v3->v4:
 - no
 change from v4->5:
 - optimize commit subject
 change from v5->v6:
 - no change
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

