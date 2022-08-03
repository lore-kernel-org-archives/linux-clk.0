Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F36BC3F6B0
	for <linux-clk@archiver.kernel.org>; Wed,  3 Aug 2022 08:16:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbiHCIQK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Aug 2022 04:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237440AbiHCIQA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 04:16:00 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2E260D0;
        Wed,  3 Aug 2022 01:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZDo/zeCdQTI/oG+2rQgrlyd05D1yy2+MNt/5UkvFOgc5uWIOb3CXf28/IEAi1vtk3tzhdCrwbqpP7jgbo7PCSHy9sJhE1k2O9aRRmrDa7VwRHZVRL62gYpHRV086rYlPkFz4lYeVXMh/5a1tc7oGTpacUKG09XGBE1rFZ/fZ/r9eHJxlR8tCkzKbsVauTiJtH0Zugey3INxuZc9RlW3CJhb/xe6r8AABQ/G7NyrO7rdKWbgRvhqluR80uelB8byFd3WR3x40voO+3W5MFBJ0bTpAaXvM6dN75QpMnQvIkz6SLJlzvgzvB+to+xOqAub5ZMM6pQZfu8/kqhz3csiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrjLU55qtoKtrmnPn0osRXp0fmXVJQh0fhbp9t1K+rU=;
 b=Ei2TIJIeuSnx887T/O1R9cK42LaiM3zmSYba2D6vIpWIJyMLLCXrggOz7x1DBq6D4Dq/c7Gafb2EnnlUPtc0QMdGV+4mfAPr3j8rTLiN/IcJ4cWBb3VCxwNc2+81O5ooJJeChDKZbyb1tuy4Ik4gh+tKPPJVhw20lnbsR4Jy8HiYWgQM+/w72iD81Rna5kZe7pF1YueArdB5IOl9wvXP1rpZhRn8Q/TNDd269tafN/6fVYpMiGOHkFTBwPTVg1N0AN4TPStKmQl2aJOB4xCly1v6WFPn9FnrnDPWtjFe7atMzLE19ZI89C4xnGfv/aYVI1MRUGgPPZ98N2LEJb6jvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrjLU55qtoKtrmnPn0osRXp0fmXVJQh0fhbp9t1K+rU=;
 b=gEmS+y5zD6nUhLC5oJQWPLr9QJigVs4AJ0Ew0nT2wJsMWuX2KOzAbr2ySdDfqnIK8alnV4tjsSl2x/FL0ytgsyONX+bL5hJVdEuP7u85JBJVAxdw6W/xl45qFZgq4u548tIBukaWEQfBV4I9SstjEnq693tTUz4i3xEHpM5Viy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM9PR04MB8130.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 08:15:55 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 08:15:55 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 4/7] clk: imx: add i.MX93 clk gate
Date:   Wed,  3 Aug 2022 16:17:10 +0800
Message-Id: <20220803081713.3504699-5-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220803081713.3504699-1-peng.fan@oss.nxp.com>
References: <20220803081713.3504699-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64ca8aea-3167-429a-7b15-08da75286324
X-MS-TrafficTypeDiagnostic: AM9PR04MB8130:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71R1k0jH9/7JCwJaB3xhKA6YqATWyLzhJ+N/lQL7qUmPHoW+5EdYUwPEWvA42Fq0XOljjY+4hJprLzXCE85cisl6XWQEzVNhrpgsp4OP4UnL5xStlkBZYTf9bD0b0O6yik3+dZfkW9B6lxhC6z2T/xEKF6XzTEq8JnGQbDN5RLb0jU9br/YoE3urmmO+B50Bl882H1p6RQz7e6RJ4EnKuOKHXMNsCDmw9CmE3FM/A5jV2Es6dReMVS4sBe9VE1EZFzZi5LPakLLhv8dJPwUbSKKCZ1njcDXgofiUilVPhX0Q1sAqkATXA717uHd8IFM0HEyc+ua37a1gsFGOzquiY88Aev/z8vAO02++mCIMsi+Nno6FuD8KEMlwaKKzD2brFZ0gRoCvKm5ovdGvPvlQg0x9qyIYB+54XcarnF3wJLSNH9IivL0TA53tB1TEoG8BdcS9Vv9yGXJVbzVUBmcIWSsJbevGpt8XJix0GVkqQe8/gADSo9JterjNz6otUi7rTcSVqtGfhz/54kMno81QIASIJGbdRgPYBeqycJGsvTkbczhtEPMu/N7iepP4Jw96hOEGLpCvIX1HAAelWgV3xgAK0EvwyuyMvR2ElsyLNuDtKkIIQtTvda11rTNbZ7n7av4IPnPEkImqG2j/KujsxYQzq2vGwKyo2kXUN6/Wd4MQKZaeywP6of2wqWBhXPifkxXcsYhnCr0rZ7Y5ClzLEULbGQoMuff7KcdQUQf/PPiha0RH352ySNOToIPG+nI4qD8NEJApRJWr1+639BF4NQRBWfD5A4L4a4XvjcWoldoGcbRRfKbPskUKuSDeqpiE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(316002)(54906003)(7416002)(86362001)(8936002)(8676002)(66556008)(66476007)(4326008)(6512007)(26005)(66946007)(5660300002)(1076003)(83380400001)(186003)(2616005)(52116002)(478600001)(6486002)(38100700002)(6666004)(38350700002)(6506007)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xYCyDP/6dG2KHbtLZQmXVZL4jy0ybybflmwJ4TErU2M2Rq4EmM24Mmle06hh?=
 =?us-ascii?Q?JHSZd1aynraE/sOetz0TvcvzQxG/VQ9bw5jSYWiUWTw3YKmME5GItNyIFrsT?=
 =?us-ascii?Q?0nhG/rXfHMOPfF1gACjkfW2U8GpauMTnYafZ4QJ9NAcrVWX/pSrVgMqYUNrB?=
 =?us-ascii?Q?NqQw4OF+CWf3VfDfaXQF7EZ1A2a8nWsBf+/vuFOG/HJHHURHf/v55+/CweEr?=
 =?us-ascii?Q?8HNevEleLxCxJTwPHLe6/Rx9Z1d5zqtCFK7g2otJ05F6YDGFtThxhZetEuTu?=
 =?us-ascii?Q?PPBIaOt9w4fkeRorCQ8MLOututqEl9UuxCtMPjGeRMUjTdz6CUhHGRp/dXJG?=
 =?us-ascii?Q?jN6di2JgAej/TlNLPJ33HwYf1PnQ8YDk9NunCnyCSc9m2zhOuDeWijjT6iHS?=
 =?us-ascii?Q?8Am5Xi2/FlNVzRkBVzRjg/y2S4JkHyIivyJ+z26x5KlAdzphni8g1Umj7mlV?=
 =?us-ascii?Q?DaI2v25bJgKDJ28mM0N8rQAzFvPSErzLEEiSkOrOtN7JxYVPbd+5T4DZsE10?=
 =?us-ascii?Q?J0gL6yrUbGNJwJiNPuQwTbMhmHN9SBaqTuyEV1q7ZNLuoL5Wto/qG8wXLTie?=
 =?us-ascii?Q?rCYK7XyGoy+vBvEBXzZWXzzJxpg7PpkYGR8dd45GoTKqOcufe5EJf2XGqquj?=
 =?us-ascii?Q?xH1CeZb/feaCQ9F9Bw1gUl8oFvQ2tmKu+lNbIYozcyYNQtHEoQrGxCxKR4VG?=
 =?us-ascii?Q?txDwMSVmN6dUMz6EsEar1ykjh0tmLp7mK6DNreSbxi1KQC9JdFEBNJJVarM+?=
 =?us-ascii?Q?07n06C/oOsW6xQR6aeVvVjtM6eLuIx16KR6A129CTx90mxXF7mYagQgXukuk?=
 =?us-ascii?Q?1y5qk2Um0AjTFS2KGp7z3ehxjlrpHCSZz8P/GP0Y3R3c+aNYijPDrsWp5TSU?=
 =?us-ascii?Q?Sa3p8+tKaL8/PyxwHVvhUCyR33AQPnT2D6hTTItmqkQtDPSDA5OYIKbKbLx8?=
 =?us-ascii?Q?8aLe0wcNNCs0ptGRSY/UU/sHSjVAOsutvZdFilY87O/nKIPX7+BgTSaIAOvS?=
 =?us-ascii?Q?X2hK8lPkqC3VMhjGG5xdYEuo180lZrZmpGk+gXDtvN4RAVes2epGuYYjJ8SF?=
 =?us-ascii?Q?27HS3AEPmnMy2StnM0Q84zTXImbCNoQs57QuJ0RqJXQJIM4Lnpkxq7RW1xHl?=
 =?us-ascii?Q?i+Twv1CL2/1mt33pZZFRslg8n9/3qgY7KauDsMockY6mmPnEpEWEBJtmUgkq?=
 =?us-ascii?Q?rI3BhIXsarJ0DahZ2AUwuWNV91VuoFJaLacI2UC85BAnyydh5r7IrHG3ZDwy?=
 =?us-ascii?Q?aOUgaakrJZ+v11TbhwD0A9Uv2VjhzQOQeP1E0hd5kUTtxo7+hVnCxEWdnl9F?=
 =?us-ascii?Q?ydBKfdTprUaS18Xop+iHvoxxHq2aTBOT2rVjPnVcZbvwuymnlHW34gi266X+?=
 =?us-ascii?Q?CyUsUrlVCHHvnVdOXMCJhHYtpy28bLh61/Z2xH8wonuEF+3e9YfyT/gH9ZsT?=
 =?us-ascii?Q?ZTdQkmlIH7Pda+aGv3zFri12EplrhoRZiy6VyDGB8vu7pBVjZoOKjBtVd0JC?=
 =?us-ascii?Q?w1IdQtPCG/O9rQ+A189G+MD0LUnjAiy9rk2BPn/KwiVQ6TvzvXSmguxY6wub?=
 =?us-ascii?Q?h5C8P4obR6osA2I4wZ/mmD2v8TjssGqcPURk+ylN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ca8aea-3167-429a-7b15-08da75286324
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:15:55.3463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIIUPZiaCYu3ovM+QRZA2nFr4aTOfSvorr7bpRCctuHXPKaUokliDp4sfqCaZtEaetcr++JqUuSXKux7jDkiMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8130
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX93 LPCG is different from i.MX8M CCGR. Although imx_clk_hw_gate4_flags
is used here, it not strictly match i.MX93. i.MX93 has such design:
 - LPCG_DIRECT use BIT0 as on/off gate when LPCG_AUTHEN CPU_LPM is 0
 - LPCG_LPM_CUR use BIT[2:0] as on/off gate when LPCG_AUTHEN CPU_LPM is 1

The current implementation suppose CPU_LPM is 0, and use LPCG_DIRECT
BIT[1:0] as on/off gate. Although BIT1 is touched, actually BIT1 is
reserved.

And imx_clk_hw_gate4_flags use mask 0x3 to determine whether the clk
is enabled or not, but i.MX93 LPCG only use BIT0 to control when CPU_LPM
is 0. So clk disabled unused during kernel boot not able to gate off
the unused clocks.

To match i.MX93 LPCG, introduce imx93_clk_gate.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Reviewed-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/Makefile      |   2 +-
 drivers/clk/imx/clk-gate-93.c | 199 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk.h         |   4 +
 3 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-gate-93.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 88b9b9285d22..89fe72327788 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -28,7 +28,7 @@ obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn.o
 obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o
 obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
 
-obj-$(CONFIG_CLK_IMX93) += clk-imx93.o
+obj-$(CONFIG_CLK_IMX93) += clk-imx93.o clk-gate-93.o
 
 obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
 clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o \
diff --git a/drivers/clk/imx/clk-gate-93.c b/drivers/clk/imx/clk-gate-93.c
new file mode 100644
index 000000000000..ceb56b290394
--- /dev/null
+++ b/drivers/clk/imx/clk-gate-93.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2022 NXP
+ *
+ * Peng Fan <peng.fan@nxp.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/slab.h>
+
+#include "clk.h"
+
+#define DIRECT_OFFSET		0x0
+
+/*
+ * 0b000 - LPCG will be OFF in any CPU mode.
+ * 0b100 - LPCG will be ON in any CPU mode.
+ */
+#define LPM_SETTING_OFF		0x0
+#define LPM_SETTING_ON		0x4
+
+#define LPM_CUR_OFFSET		0x1c
+
+#define AUTHEN_OFFSET		0x30
+#define CPULPM_EN		BIT(2)
+#define TZ_NS_SHIFT		9
+#define TZ_NS_MASK		BIT(9)
+
+#define WHITE_LIST_SHIFT	16
+
+struct imx93_clk_gate {
+	struct clk_hw hw;
+	void __iomem	*reg;
+	u32		bit_idx;
+	u32		val;
+	u32		mask;
+	spinlock_t	*lock;
+	unsigned int	*share_count;
+};
+
+#define to_imx93_clk_gate(_hw) container_of(_hw, struct imx93_clk_gate, hw)
+
+static void imx93_clk_gate_do_hardware(struct clk_hw *hw, bool enable)
+{
+	struct imx93_clk_gate *gate = to_imx93_clk_gate(hw);
+	u32 val;
+
+	val = readl(gate->reg + AUTHEN_OFFSET);
+	if (val & CPULPM_EN) {
+		val = enable ? LPM_SETTING_ON : LPM_SETTING_OFF;
+		writel(val, gate->reg + LPM_CUR_OFFSET);
+	} else {
+		val = readl(gate->reg + DIRECT_OFFSET);
+		val &= ~(gate->mask << gate->bit_idx);
+		if (enable)
+			val |= (gate->val & gate->mask) << gate->bit_idx;
+		writel(val, gate->reg + DIRECT_OFFSET);
+	}
+}
+
+static int imx93_clk_gate_enable(struct clk_hw *hw)
+{
+	struct imx93_clk_gate *gate = to_imx93_clk_gate(hw);
+	unsigned long flags;
+
+	spin_lock_irqsave(gate->lock, flags);
+
+	if (gate->share_count && (*gate->share_count)++ > 0)
+		goto out;
+
+	imx93_clk_gate_do_hardware(hw, true);
+out:
+	spin_unlock_irqrestore(gate->lock, flags);
+
+	return 0;
+}
+
+static void imx93_clk_gate_disable(struct clk_hw *hw)
+{
+	struct imx93_clk_gate *gate = to_imx93_clk_gate(hw);
+	unsigned long flags;
+
+	spin_lock_irqsave(gate->lock, flags);
+
+	if (gate->share_count) {
+		if (WARN_ON(*gate->share_count == 0))
+			goto out;
+		else if (--(*gate->share_count) > 0)
+			goto out;
+	}
+
+	imx93_clk_gate_do_hardware(hw, false);
+out:
+	spin_unlock_irqrestore(gate->lock, flags);
+}
+
+static int imx93_clk_gate_reg_is_enabled(struct imx93_clk_gate *gate)
+{
+	u32 val = readl(gate->reg + AUTHEN_OFFSET);
+
+	if (val & CPULPM_EN) {
+		val = readl(gate->reg + LPM_CUR_OFFSET);
+		if (val == LPM_SETTING_ON)
+			return 1;
+	} else {
+		val = readl(gate->reg);
+		if (((val >> gate->bit_idx) & gate->mask) == gate->val)
+			return 1;
+	}
+
+	return 0;
+}
+
+static int imx93_clk_gate_is_enabled(struct clk_hw *hw)
+{
+	struct imx93_clk_gate *gate = to_imx93_clk_gate(hw);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(gate->lock, flags);
+
+	ret = imx93_clk_gate_reg_is_enabled(gate);
+
+	spin_unlock_irqrestore(gate->lock, flags);
+
+	return ret;
+}
+
+static void imx93_clk_gate_disable_unused(struct clk_hw *hw)
+{
+	struct imx93_clk_gate *gate = to_imx93_clk_gate(hw);
+	unsigned long flags;
+
+	spin_lock_irqsave(gate->lock, flags);
+
+	if (!gate->share_count || *gate->share_count == 0)
+		imx93_clk_gate_do_hardware(hw, false);
+
+	spin_unlock_irqrestore(gate->lock, flags);
+}
+
+static const struct clk_ops imx93_clk_gate_ops = {
+	.enable = imx93_clk_gate_enable,
+	.disable = imx93_clk_gate_disable,
+	.disable_unused = imx93_clk_gate_disable_unused,
+	.is_enabled = imx93_clk_gate_is_enabled,
+};
+
+static const struct clk_ops imx93_clk_gate_ro_ops = {
+	.is_enabled = imx93_clk_gate_is_enabled,
+};
+
+struct clk_hw *imx93_clk_gate(struct device *dev, const char *name, const char *parent_name,
+			      unsigned long flags, void __iomem *reg, u32 bit_idx, u32 val,
+			      u32 mask, u32 domain_id, unsigned int *share_count)
+{
+	struct imx93_clk_gate *gate;
+	struct clk_hw *hw;
+	struct clk_init_data init;
+	int ret;
+	u32 authen;
+
+	gate = kzalloc(sizeof(struct imx93_clk_gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->reg = reg;
+	gate->lock = &imx_ccm_lock;
+	gate->bit_idx = bit_idx;
+	gate->val = val;
+	gate->mask = mask;
+	gate->share_count = share_count;
+
+	init.name = name;
+	init.ops = &imx93_clk_gate_ops;
+	init.flags = flags | CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
+	gate->hw.init = &init;
+	hw = &gate->hw;
+
+	authen = readl(reg + AUTHEN_OFFSET);
+	if (!(authen & TZ_NS_MASK) || !(authen & BIT(WHITE_LIST_SHIFT + domain_id)))
+		init.ops = &imx93_clk_gate_ro_ops;
+
+	ret = clk_hw_register(dev, hw);
+	if (ret) {
+		kfree(gate);
+		return ERR_PTR(ret);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(imx93_clk_gate);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 396a5ea75083..dd49f90110e8 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -451,6 +451,10 @@ struct clk_hw *imx93_clk_composite_flags(const char *name,
 	imx93_clk_composite_flags(name, parent_names, num_parents, reg, domain_id \
 				  CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
 
+struct clk_hw *imx93_clk_gate(struct device *dev, const char *name, const char *parent_name,
+			      unsigned long flags, void __iomem *reg, u32 bit_idx, u32 val,
+			      u32 mask, u32 domain_id, unsigned int *share_count);
+
 struct clk_hw *imx_clk_hw_divider_gate(const char *name, const char *parent_name,
 		unsigned long flags, void __iomem *reg, u8 shift, u8 width,
 		u8 clk_divider_flags, const struct clk_div_table *table,
-- 
2.25.1

