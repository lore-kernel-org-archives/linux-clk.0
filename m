Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-dm3nam03on0085.outbound.protection.outlook.com ([104.47.41.85]:48694
	"EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750989AbcHLS1P (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 12 Aug 2016 14:27:15 -0400
From: Fabio Estevam <fabio.estevam@nxp.com>
To: <sboyd@codeaurora.org>
CC: <shawnguo@kernel.org>, <stefan@agner.ch>, <festevam@gmail.com>,
	<linux-clk@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH 2/3] clk: imx: Introduce clk_register_gate2()
Date: Fri, 12 Aug 2016 15:26:55 -0300
Message-ID: <1471026416-11769-2-git-send-email-fabio.estevam@nxp.com>
In-Reply-To: <1471026416-11769-1-git-send-email-fabio.estevam@nxp.com>
References: <1471026416-11769-1-git-send-email-fabio.estevam@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Introduce imx_clk_gate2_shared2() which is similar to the existing
imx_clk_gate2_shared() and passes CLK_OPS_PARENT_ENABLE flag, which
is useful for i.MX7 shared clocks.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/clk/imx/clk.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index a81c038..3799ff8 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -134,6 +134,15 @@ static inline struct clk *imx_clk_gate2_shared(const char *name,
 			shift, 0x3, 0, &imx_ccm_lock, share_count);
 }
 
+static inline struct clk *imx_clk_gate2_shared2(const char *name,
+		const char *parent, void __iomem *reg, u8 shift,
+		unsigned int *share_count)
+{
+	return clk_register_gate2(NULL, name, parent, CLK_SET_RATE_PARENT |
+				  CLK_OPS_PARENT_ENABLE, reg, shift, 0x3, 0,
+				  &imx_ccm_lock, share_count);
+}
+
 static inline struct clk *imx_clk_gate2_cgr(const char *name,
 		const char *parent, void __iomem *reg, u8 shift, u8 cgr_val)
 {
-- 
1.9.1

