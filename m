Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761C5C19F2A
	for <linux-clk@archiver.kernel.org>; Wed,  3 Aug 2022 08:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbiHCIQI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Aug 2022 04:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237124AbiHCIPv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 04:15:51 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FE1639D;
        Wed,  3 Aug 2022 01:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSzhA2oPSzV4G6K93+2zfKOuI2DmVQXHQFzkNjxDK4+Ke/IwfrI9k2Rw6D7qOKpDlX0qhfvGG62/Ku4FGmIsjk7wAPyNcEAjLHVgxN/5uZ8Jhx93x5Qpd1s9IGvR+3sKFuXeSa6egKiLK6vih7UMoiIy8rcU7JdazYRNdK2xNcuqM6uWuXrvCHnRd/oj8N96uAq+kOiFVTn4N03TKc3m/SoQmTAFCeXvBfDsRtoWBUNFVEESc10aXLu6qSdmZt6xVZ1K5Oy2eM5v4idFU6SE6ksN8T38AltmAf4PaAFB30SS8feXI+x743suF8WL5MHZ5WZchNgiDq6I4ATfspemsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25IZcEJKhgE8rBlEiW27t052g3zcNWbMjjdFhGC2q/0=;
 b=PcGdGdfhBCyx7zOV4r5lPlMrXvhbrklgWOrVAK+sZ37iit2JLQcuAh721I68VmhlXNrjeDG38wFu6ybXAW/CFXZyaLEOVE8G7mfbBg5ORK5ZSGjagyv9pA9Z0MK2VKXJQGDTqOAPI2CRWnn5JHl0xKVXLyfNtE5i8iWEZqJcxWKRb5yuabK4jl3gE1xSfHLIsa3fSHz35KBBBctwgakDN67XLTeHjLtHW8zvgjYoWEity+FBDD3asi/BdkZphYkFux9BIWKoL9/7hqA8NjsuCF0/3YnvbSs+c2/BYXiCUgE/zqFuJDE2l1Jqa2YEfNx5trHbiktjgbZdfBWyHn+Kmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25IZcEJKhgE8rBlEiW27t052g3zcNWbMjjdFhGC2q/0=;
 b=O7s+rXknNzYNl/a460KVHJDbXyP1tXC5dR0+Shr6Op6+oSxYmrMkI+ArXGU8RRRSByhZDtTAtFDr2F8I7AKSc1f3Ccu1QbFwqJE26dTxt3l4+z9q/CA+JC5TeFh2SnBjKqn98tWAdS/FOHCzYRDWl70oR8uV9i8cSRRJgMyEajo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB8233.eurprd04.prod.outlook.com (2603:10a6:10:24b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 08:15:45 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 08:15:45 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 2/7] clk: imx: clk-composite-93: check slice busy
Date:   Wed,  3 Aug 2022 16:17:08 +0800
Message-Id: <20220803081713.3504699-3-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 72ff2af4-3030-417a-6e2a-08da75285d85
X-MS-TrafficTypeDiagnostic: DB9PR04MB8233:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1POY1RduVv742lWH39g34PJZbJVfX5mj1VJI9oEkzj50iYZiewY/17p8l/pU7L1nnRlRORCuvGbW4a0iovpUJmsbME7x43E1jLKAL3gD+VP14jJupuriFqzD3Z97SfHw+lLP2TWhMIax36Sl/i9QqeAbi0RGGRQFM0hzzv6CE18OjvAWPUEgBspIKkuQFZs9k+1ISndbkCDhquZ9N/dZdxSpHs9UpV7IzU31LQr24vW0yqv7SIuvflTgLyMjh8Gwec46cxm07s/QmoQgOV8912/Y3UU6CkynllABUmcUirk+4sq5JguglrNOQB3CU5HFvo0ve3p6kuShFrvKEgZJ2W99zNQ5dEX+Lhi1NFvR4e+LmfxlbzzGcuD7aYMJ14zFX884NS0vOpWTfbYkTKTLpb+ZFr0mlkXCN6iyN37P1/pC7mSKb27RRpLfMDY8OuFGb2MhFMz1jVZs46aQcu5n6W5typPpj2RMrRETw4NCTU4s4/gL1pmIPoc77elqHfEe5vT1xVpm4AvVTmtrW73NuJXJ3HFld0CobZtIo2lmbFhwxifjffVEQWuF4RKb5CM2dCiV3Pyzoajr4qKy3/nGniHmwhNgJl5XqaNCFOujCqwZ5n+EtBD5BYVjdrPlhcBLFGMEV2WSZzHM0fN0kNFRFIsILgsWOK8PBtu5nxJcjVwrH8SKFwKdIMEnOtEyjlkYd6Jr4ENR1Xj9RHGfw6fwtO0AL6MJX0m7vO05b8Qt/tTM4aIFL2QvHKIp1QTdXm1wLd7DHJytWs4TEcCswtLFvEfZTQD4Ocl1kpaiMg0AATKoQAeAATsjIJ0UQdCf+Y0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(7416002)(2616005)(6512007)(5660300002)(26005)(186003)(1076003)(54906003)(66556008)(66476007)(8676002)(4326008)(66946007)(316002)(86362001)(6506007)(41300700001)(478600001)(8936002)(52116002)(6666004)(38100700002)(38350700002)(83380400001)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q2gnY1mSoJkHcLzXdaYZXd1nJu3d9dXqt+Or2s1NfT69PkmFLNKdKc0uZm2i?=
 =?us-ascii?Q?AWtr3Hbojcn+nUMJw/raE90RMfTdiPxPwo9tcUbfDzTjlkr1rpXQjAJVLpya?=
 =?us-ascii?Q?a/hb9QT8VXyMmYcuuqECRpsI7B/G2oRSeUH++EN6KKvCmOqhcvA1sibzAmAL?=
 =?us-ascii?Q?OBLTuCrkmrW//33+N94ltniltebluZWSHJJDBW1Gtwv6Bfx7zetCZk61Gemv?=
 =?us-ascii?Q?HPec6HFQwCIIjI0KdYdlVaTTLqNGQY7OffYqRhtXc2u8FFDIEON6kGIxeshe?=
 =?us-ascii?Q?JWcJGTa3pwUvXdc1NLGTwiLS7k3IsSQOpsKdsW1oQfqNpuwp9Emy2Koausoc?=
 =?us-ascii?Q?afqS9VhPjegpCLwmeJ5HGq+ZmJzorGGXI9CQioFrFr28MokTm0PwYBu6bijY?=
 =?us-ascii?Q?1H5ge5A2CVCm5JuLeampcE14kdjMNZYXyEM0wotkkir5nHL2IYu07PgzgaFT?=
 =?us-ascii?Q?RXle7CZjAx0xIFdo2jRXD78rRAUJvk9XnLjpSmWU4Os84vcET4dhEx4zjblH?=
 =?us-ascii?Q?JwZ+bWkD+g2eb9UJyuhdhpIuM/ZC3XQEnM9KpT9YLoTxppTmLI3wo/1yUn37?=
 =?us-ascii?Q?fL9I0+A/GK1GWFBybj5u+E4+xujyz+AfuQ2xCUjFNv2tF0orhvCTDNrfGzfv?=
 =?us-ascii?Q?LPe6EyYWFhsDuWLRMsbtZC+pMvVj9F9YLPnzXVCMxmwnugvD0E6XGOSFcmXb?=
 =?us-ascii?Q?XmvwRAb+zgsiWgL4hL8dQbDXOxJTQlATdHJyWpKGUW8l3VtK/PVgzYiaeJlF?=
 =?us-ascii?Q?Mj/4Amt/3BYtwvbezB7jkGlMHoLH5hd9L6a5sat0tL/D8bVCXj+vqyLDo296?=
 =?us-ascii?Q?iQ6kitp149dvW8W0NlPdYa4omexLCn31onN4nt56t1b2a2LlVFkxit0UA8mu?=
 =?us-ascii?Q?URl0VP2zQJ7Ho4Oyz1Rn46tu/AAylRh+wCFmHMh7f1rMguzSAPKqX0cA887K?=
 =?us-ascii?Q?woRaN32HgnbHdW1eS+3i+AibBsp134YWkrcK+77IA2qYONG8LdOomMx7Spom?=
 =?us-ascii?Q?SQp93+bkbrXqqja5zKLvlZf2vFl0KLZc/nImu3ihFveraeTj/AYLvJAvqhUa?=
 =?us-ascii?Q?12I15/5ne5kdhRa+3uY42yzuM8tMf6rx+LJNJ1FoDk7UqijtCPmWEigj9N6m?=
 =?us-ascii?Q?7mr8jqj0ZHMfX5bd2qg6eVO2kJq+un6Iov8y3WGpKfwLgDaXSin3V78fcNAB?=
 =?us-ascii?Q?xX7BWQR968VEgpDmaRh0sPTG1aS2Ko9uf3HsdNKbeb4KKb1iVDfDGC2yLj7Y?=
 =?us-ascii?Q?4J1DohGFc5E3SK9HPIJXmcSp+kYne5FycyfU2MmSp5SDWOlURx4g6Dhs4GdB?=
 =?us-ascii?Q?QEdbQF2BL4cZpx0fVkYGTxLsl2resV50cFQU3tySyH89m0Kohn8IX0RZ3m9K?=
 =?us-ascii?Q?bN1NV+0/LQo8sEM9pDcQB4O3p4kdmUF29QFg4dyO/LA6kooKkQR9Bi+uPElf?=
 =?us-ascii?Q?OoDahbwNr1nE2GgZ1g4frZ8FchyV8cx3rQ1g+QGZT0BTuQk3AFFhpf/lBHr6?=
 =?us-ascii?Q?ROj5fdiDtEv72fAEgFMowuMm/gNEk6vO+qNV9snhwbKd0qk9H4P/9O3dpwsD?=
 =?us-ascii?Q?dGDGhxcsEFpFNgQTf2kPNpVBT7EBvDzLmAtFImDz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ff2af4-3030-417a-6e2a-08da75285d85
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:15:45.6544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +j1y+fUUeFmkO00KZTNRMqQVS/SkBo3ysgVIxYtKUzFJ6hdT6mcxP2Qoj3JSphYk3BOo5axX56Gq3H3pYd++sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8233
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

i.MX93 CCM ROOT STAT register has a SLICE_BUSY bit:
indication for clock generation logic is applying new setting.
0b - Clock generation logic is not busy.
1b - Clock generation logic is applying new setting.

So when set parent/rate/gate, need check this bit.

Introduce specific ops to do the work.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Reviewed-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-composite-93.c | 163 ++++++++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
index b44619aa5ca5..19f4037e6cca 100644
--- a/drivers/clk/imx/clk-composite-93.c
+++ b/drivers/clk/imx/clk-composite-93.c
@@ -9,20 +9,176 @@
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/slab.h>
 
 #include "clk.h"
 
+#define TIMEOUT_US	500U
+
 #define CCM_DIV_SHIFT	0
 #define CCM_DIV_WIDTH	8
 #define CCM_MUX_SHIFT	8
 #define CCM_MUX_MASK	3
 #define CCM_OFF_SHIFT	24
+#define CCM_BUSY_SHIFT	28
 
+#define STAT_OFFSET	0x4
 #define AUTHEN_OFFSET	0x30
 #define TZ_NS_SHIFT	9
 #define TZ_NS_MASK	BIT(9)
 
+static int imx93_clk_composite_wait_ready(struct clk_hw *hw, void __iomem *reg)
+{
+	int ret;
+	u32 val;
+
+	ret = readl_poll_timeout_atomic(reg + STAT_OFFSET, val, !(val & BIT(CCM_BUSY_SHIFT)),
+					0, TIMEOUT_US);
+	if (ret)
+		pr_err("Slice[%s] busy timeout\n", clk_hw_get_name(hw));
+
+	return ret;
+}
+
+static void imx93_clk_composite_gate_endisable(struct clk_hw *hw, int enable)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	unsigned long flags;
+	u32 reg;
+
+	if (gate->lock)
+		spin_lock_irqsave(gate->lock, flags);
+
+	reg = readl(gate->reg);
+
+	if (enable)
+		reg &= ~BIT(gate->bit_idx);
+	else
+		reg |= BIT(gate->bit_idx);
+
+	writel(reg, gate->reg);
+
+	imx93_clk_composite_wait_ready(hw, gate->reg);
+
+	if (gate->lock)
+		spin_unlock_irqrestore(gate->lock, flags);
+}
+
+static int imx93_clk_composite_gate_enable(struct clk_hw *hw)
+{
+	imx93_clk_composite_gate_endisable(hw, 1);
+
+	return 0;
+}
+
+static void imx93_clk_composite_gate_disable(struct clk_hw *hw)
+{
+	imx93_clk_composite_gate_endisable(hw, 0);
+}
+
+static const struct clk_ops imx93_clk_composite_gate_ops = {
+	.enable = imx93_clk_composite_gate_enable,
+	.disable = imx93_clk_composite_gate_disable,
+	.is_enabled = clk_gate_is_enabled,
+};
+
+static unsigned long
+imx93_clk_composite_divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	return clk_divider_ops.recalc_rate(hw, parent_rate);
+}
+
+static long
+imx93_clk_composite_divider_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
+{
+	return clk_divider_ops.round_rate(hw, rate, prate);
+}
+
+static int
+imx93_clk_composite_divider_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return clk_divider_ops.determine_rate(hw, req);
+}
+
+static int imx93_clk_composite_divider_set_rate(struct clk_hw *hw, unsigned long rate,
+						unsigned long parent_rate)
+{
+	struct clk_divider *divider = to_clk_divider(hw);
+	int value;
+	unsigned long flags = 0;
+	u32 val;
+	int ret;
+
+	value = divider_get_val(rate, parent_rate, divider->table, divider->width, divider->flags);
+	if (value < 0)
+		return value;
+
+	if (divider->lock)
+		spin_lock_irqsave(divider->lock, flags);
+
+	val = readl(divider->reg);
+	val &= ~(clk_div_mask(divider->width) << divider->shift);
+	val |= (u32)value << divider->shift;
+	writel(val, divider->reg);
+
+	ret = imx93_clk_composite_wait_ready(hw, divider->reg);
+
+	if (divider->lock)
+		spin_unlock_irqrestore(divider->lock, flags);
+
+	return ret;
+}
+
+static const struct clk_ops imx93_clk_composite_divider_ops = {
+	.recalc_rate = imx93_clk_composite_divider_recalc_rate,
+	.round_rate = imx93_clk_composite_divider_round_rate,
+	.determine_rate = imx93_clk_composite_divider_determine_rate,
+	.set_rate = imx93_clk_composite_divider_set_rate,
+};
+
+static u8 imx93_clk_composite_mux_get_parent(struct clk_hw *hw)
+{
+	return clk_mux_ops.get_parent(hw);
+}
+
+static int imx93_clk_composite_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	u32 val = clk_mux_index_to_val(mux->table, mux->flags, index);
+	unsigned long flags = 0;
+	u32 reg;
+	int ret;
+
+	if (mux->lock)
+		spin_lock_irqsave(mux->lock, flags);
+
+	reg = readl(mux->reg);
+	reg &= ~(mux->mask << mux->shift);
+	val = val << mux->shift;
+	reg |= val;
+	writel(reg, mux->reg);
+
+	ret = imx93_clk_composite_wait_ready(hw, mux->reg);
+
+	if (mux->lock)
+		spin_unlock_irqrestore(mux->lock, flags);
+
+	return ret;
+}
+
+static int
+imx93_clk_composite_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return clk_mux_ops.determine_rate(hw, req);
+}
+
+static const struct clk_ops imx93_clk_composite_mux_ops = {
+	.get_parent = imx93_clk_composite_mux_get_parent,
+	.set_parent = imx93_clk_composite_mux_set_parent,
+	.determine_rate = imx93_clk_composite_mux_determine_rate,
+};
+
 struct clk_hw *imx93_clk_composite_flags(const char *name, const char * const *parent_names,
 					 int num_parents, void __iomem *reg,
 					 unsigned long flags)
@@ -74,9 +230,10 @@ struct clk_hw *imx93_clk_composite_flags(const char *name, const char * const *p
 		gate->flags = CLK_GATE_SET_TO_DISABLE;
 
 		hw = clk_hw_register_composite(NULL, name, parent_names, num_parents,
-					       mux_hw, &clk_mux_ops, div_hw,
-					       &clk_divider_ops, gate_hw,
-					       &clk_gate_ops, flags | CLK_SET_RATE_NO_REPARENT);
+					       mux_hw, &imx93_clk_composite_mux_ops, div_hw,
+					       &imx93_clk_composite_divider_ops, gate_hw,
+					       &imx93_clk_composite_gate_ops,
+					       flags | CLK_SET_RATE_NO_REPARENT);
 	}
 
 	if (IS_ERR(hw))
-- 
2.25.1

