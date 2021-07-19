Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5899C636C9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:25:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF61D61019
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbhGSF2F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 01:28:05 -0400
Received: from mail-db8eur05on2072.outbound.protection.outlook.com ([40.107.20.72]:3395
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229906AbhGSF2E (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 01:28:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuOijII86vfNmxBWhwcAts8OnXeu6jjZgFFf5qWvCNq5HgxBeDkE5p8//1d0og1i7a+XVsQZy37Bw9K7ugen3ylWuMNQcMseE7IXy1HIXqb0HTtbwv+CXO9SyIZ82WLr70CyvSPXOZJTvEkpsYAbDZvKgIe62MQEvYVO3qH0VNucaDGJeQlrSlfC5YpNvjMUbzvx40vjAISnms6BYX1fX+jtJBKVRWc7ceDUa9dSPYbUPts4GEZcLLn/XSHC8eE82ZNakjY5CCToJbVVIM90atyTTHjmk9V4y2+DnZqjtmgawDh2BIM1j4FGfIvGoDsfXqeRJJd2o7HQlIFW9WwbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITRCS30Z8OePAojopusLRoQJCw8NmkDVzX323DIoRz0=;
 b=oD6xmZ1hFq3r8E3evKdfqADvGMgqRBK9zm+f+WtnTVeec7/F3t4rm/bPZvuIHLqKQa6hXj3xuriBom2/ExP97dkhjRwlf7FPiZvRz+tIu2E+9a0UDCALTs2zrr+AHYAMI7U48jAAU/IADuNELqpmisf+DqbnVm/NY3cSj2tb5KG8F0tiNYPtW/x+ZrJG8yLLRw8h1sZgNuTuLXeu3O1YNjjkPI1bO/rJhWLHN5fzwbL9slCjCS4QWTmI39hlx50H1sZh7UUcdOvanUf2S3u3jLhPnCLDvMyQ+IVORgNhcbTTmIjoQIRBA6u3pPenWv8mLHXWZITxTudCeKnTRnUIMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITRCS30Z8OePAojopusLRoQJCw8NmkDVzX323DIoRz0=;
 b=lv+W+c9tJcOv8ZAnFUpedEyU8vA/a/XWDZcLbk/AvNuhZiiWoZc3n3SmX+8bkeB/BGZmzkaaIEdFXHUYV0HN2Xd78q11u5B5wsXQWmXiTq04TCIfTInSOjq6j9tAljbwIqEQMGVW4itMJRB44UMaYDrfVgNeLXstm6r0NF0Pde0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB6PR04MB3016.eurprd04.prod.outlook.com (2603:10a6:6:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Mon, 19 Jul 2021 05:25:03 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 19 Jul 2021
 05:25:03 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        abel.vesa@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 9/9] clk: imx: Add the pcc reset controller support on imx8ulp
Date:   Mon, 19 Jul 2021 13:34:30 +0800
Message-Id: <20210719053430.1442505-10-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210719053430.1442505-1-ping.bai@nxp.com>
References: <20210719053430.1442505-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0126.apcprd06.prod.outlook.com
 (2603:1096:1:1d::28) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 05:24:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8d645aa-6f0b-4c11-60f6-08d94a758f69
X-MS-TrafficTypeDiagnostic: DB6PR04MB3016:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3016D1A51969A93C36F9E1E187E19@DB6PR04MB3016.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bBfOabQto/bz2LiBEnAoaD/8JLWAvixpWkapY4o77kAmFdaP3RThy9g5jQoXBd3ICedMi/rnGGPzHyegHxG3OpeQknN+PT0BstPR2MwnRJnCxfVJ3fsZMao3+ayo9GrGGQebr2B+ppCCNiS+uZM0HDEnXyrQfkhH7YS11srcneJ57Qsn0J7dHSUC62Rx1kZAMUlj+YmBvZvbMFv/kZA2MsF4uMdqCkBAXAlFAjhWWf4rce9FIEAs1SNG6A3H+AEOlGAiywG10R/kSKgf80IkvMqdKpilCjCrZpvX/nPedmi4cljCQWQ3Nh1BA6FT2T0DmgTEKXdh/VNcKtc/73jvVoelEIcJXofYZV1N8SNkF/iN8sol1C3myRnS+tskLjpe2G/GfAXCsTQm9ybB9HIFLVjo3l0rHqjTRgHdO8By7GLv2G5sTfrN7Pp7gyNyFK3AhqymLW+iuYLWAxHx+MkN9RSvpVASWLydpOttBkcV7ri7+N7fwvY6E36N49fnMbHkous8FR8nw/T58tgpBfFokPRdxLIEUH0JcfroShFTfaEA7vDrLdOBarlzKbw711CT4J0CCfw8mAeaBEHH7pZOSdKWosL1vvCzE4SZN6vbtl1pkZTSW4wymDX6IwXQKAiR+JeMh6neS/+Er86vQBluqHkTkY2oYEEkFN43vWpNqp6ljhW4DqTwGkplf4VYIrihsM9UOJo8Ex0YjTcihznzxaugXqmHCU4v/C+MrKrVd2Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(36756003)(2616005)(5660300002)(66476007)(66556008)(66946007)(1076003)(38350700002)(478600001)(38100700002)(316002)(8676002)(956004)(8936002)(6486002)(6512007)(86362001)(186003)(52116002)(6506007)(26005)(2906002)(6666004)(83380400001)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k2uNxIT9MvupiyizUBODhHiuH8wphBZ6ow0E+NPBpr0YkyutzQYUwB08RUNl?=
 =?us-ascii?Q?oKZO/De1CV2T09E/sNtm1V6GDIfKqU7bm4AFcXgkrxFbYgwZgJM++YluEK2+?=
 =?us-ascii?Q?TX6bajCsJKML0Fs1AQ4riWqda4vwPjHmOH/tYjrbRHiJFW/UhqrZnvg1imd9?=
 =?us-ascii?Q?3ubOTIIaHgwQTfavR1nmtz9coYy8I03EA7sDh2IGukv+/JxcVmtRfDaH/r2+?=
 =?us-ascii?Q?j+Yq81YJgp0VV7UEd12HKFfCeWYxfTdEPCOq/5gOeYvU7GQq/b9DNawBOQYa?=
 =?us-ascii?Q?/5SxmOJNgzomTKw3IceLoVLh6vDv+y5Dy0iaSWizVcPOPb0WVJoj+vTNAqYA?=
 =?us-ascii?Q?fUhoVcXewKo3mdTJ1J3djd5UF+9Cik7Ppx7fW7nWlCroAVfv0YFjOkHpZkVJ?=
 =?us-ascii?Q?54DIF/J1TKeotygzI1WWgqgkEY+DD3vW1f3ZcoZV2DUML316WJuyTCMw13IV?=
 =?us-ascii?Q?YswhRs1pDNh3BVmsfKpAo1098xmM7KhpE3mGrL26ckq1c1pTNcmjvnt3AuE5?=
 =?us-ascii?Q?0FwZeBZLkVKxn1tgbrgzamdwfk7dA3dXVS2hq345JhcRxxnKIX7Sq7lwWgls?=
 =?us-ascii?Q?Q5VzyIaqLp//kSuorAai/SoMJh2lLP1Nhx5PZkoRCZYIhlTC0RB/3j9znnY1?=
 =?us-ascii?Q?RBM7De0+MsFcmQRiqydLjy2kEfXzsj3YAf+2+3QEGBw+hiz+ajYRrc5dJLAO?=
 =?us-ascii?Q?scVyf6uIEoEpOsF/sLA6hnKXsgYmTWTr7LD9ll8RfWtbYwMqQi7lEChzRLYS?=
 =?us-ascii?Q?RlvoSkn96Q5NKrGycbLaymnuD1X9d6C8YjsbOZA0Hlas+oVtcydmWGU+ev0b?=
 =?us-ascii?Q?/420AbvMWzhvse/fbYJgCsfUzfYvxo1XChydjBo7xeVYdywpnlUsrYtU5c1b?=
 =?us-ascii?Q?p8E0tagdnroFREj3CBOL2qcx3SJVIzVJqTD7Ggt17UrV52i5KqxqC1hkPvQJ?=
 =?us-ascii?Q?6difZ0MvVCtiGmqXO9Rcr3szSnU/4gHYPXUbvk1G5kZFiXMbNE+nJbAuMQsY?=
 =?us-ascii?Q?w3DiS1GZNki0f9y0lXZnmYKeUzUPr/iGz9+FnZCPG1hepyFWfWaX2arUqocn?=
 =?us-ascii?Q?JQ4aWGJAgWJj2ta0FvaJCdJ01Emjnz9bxhNIzlCImErpdM6BNFhzlH4dhfMN?=
 =?us-ascii?Q?wPyr/MZ6ZWE38G62i6lV896RTLc7ZHo3AvKbTow5tNmPpB49hSnEGRSaesl0?=
 =?us-ascii?Q?v4tPPkwCtLJ76ZjWa3a+JsWZTRaHVQ1rnfV9y2q+d7KCJHpqzk91IZ00klfM?=
 =?us-ascii?Q?htyKx68BG6jEaeDnpasZfWMMYU0mWy0poD4Y+v1FHuKhAmuc7dqZwaV1yOhh?=
 =?us-ascii?Q?4bZWOY3UbL7OR/rQ4xRRS9Du?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d645aa-6f0b-4c11-60f6-08d94a758f69
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 05:25:03.0269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETK5nCIVrueVRvRyMVxS9t7tTrUMvhCyIf9rIhSRqfZVlBaqQ8t3ler89H8ATI4TXHWeOyyCWpqFzqLDIJjV3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3016
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On i.MX8ULP, for some of the PCCs, it has a peripheral SW RST bit
resides in the same registers as the clock controller. So add this
SW RST controller support alongs with the pcc clock initialization.

the reset and clock shared the same register, to avoid  accessing
the same register by reset control and clock control concurrently,
locking is necessary, so reuse the imx_ccm_lock spinlock to simplify
the code.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/Kconfig              |   1 +
 drivers/clk/imx/clk-composite-7ulp.c |  10 +++
 drivers/clk/imx/clk-imx8ulp.c        | 115 ++++++++++++++++++++++++++-
 3 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index b81d6437ed95..0d1e3a6ac32a 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -102,5 +102,6 @@ config CLK_IMX8QXP
 config CLK_IMX8ULP
 	tristate "IMX8ULP CCM Clock Driver"
 	depends on ARCH_MXC || COMPILE_TEST
+	select RESET_CONTROLLER
 	help
 	    Build the driver for i.MX8ULP CCM Clock Driver
diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
index 99a36a73dcb5..6cc1b8bb8780 100644
--- a/drivers/clk/imx/clk-composite-7ulp.c
+++ b/drivers/clk/imx/clk-composite-7ulp.c
@@ -28,6 +28,7 @@
 static int pcc_gate_enable(struct clk_hw *hw)
 {
 	struct clk_gate *gate = to_clk_gate(hw);
+	unsigned long flags;
 	u32 val;
 	int ret;
 
@@ -35,6 +36,7 @@ static int pcc_gate_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
+	spin_lock_irqsave(gate->lock, flags);
 	/*
 	 * release the sw reset for peripherals associated with
 	 * with this pcc clock.
@@ -43,6 +45,8 @@ static int pcc_gate_enable(struct clk_hw *hw)
 	val |= SW_RST;
 	writel(val, gate->reg);
 
+	spin_unlock_irqrestore(gate->lock, flags);
+
 	return 0;
 }
 
@@ -83,6 +87,8 @@ static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
 		mux->reg = reg;
 		mux->shift = PCG_PCS_SHIFT;
 		mux->mask = PCG_PCS_MASK;
+		if (has_swrst)
+			mux->lock = &imx_ccm_lock;
 	}
 
 	if (rate_present) {
@@ -100,6 +106,8 @@ static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
 		fd->nwidth = PCG_PCD_WIDTH;
 		fd->nmask = PCG_PCD_MASK;
 		fd->flags = CLK_FRAC_DIVIDER_ZERO_BASED;
+		if (has_swrst)
+			fd->lock = &imx_ccm_lock;
 	}
 
 	if (gate_present) {
@@ -112,6 +120,8 @@ static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
 		gate_hw = &gate->hw;
 		gate->reg = reg;
 		gate->bit_idx = PCG_CGC_SHIFT;
+		if (has_swrst)
+			gate->lock = &imx_ccm_lock;
 		/*
 		 * make sure clock is gated during clock tree initialization,
 		 * the HW ONLY allow clock parent/rate changed with clock gated,
diff --git a/drivers/clk/imx/clk-imx8ulp.c b/drivers/clk/imx/clk-imx8ulp.c
index 44d7dc105848..909a74d74c6c 100644
--- a/drivers/clk/imx/clk-imx8ulp.c
+++ b/drivers/clk/imx/clk-imx8ulp.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 #include <linux/slab.h>
 
 #include "clk.h"
@@ -48,6 +49,98 @@ static const char * const nic_per_divplat[] = { "nic_per_divplat" };
 static const char * const lpav_axi_div[] = { "lpav_axi_div" };
 static const char * const lpav_bus_div[] = { "lpav_bus_div" };
 
+struct pcc_reset_dev {
+	void __iomem *base;
+	struct reset_controller_dev rcdev;
+	const u32 *resets;
+	spinlock_t *lock;
+};
+
+#define PCC_SW_RST	BIT(28)
+#define to_pcc_reset_dev(_rcdev)	container_of(_rcdev, struct pcc_reset_dev, rcdev)
+
+static const u32 pcc3_resets[] = {
+	0xa8, 0xac, 0xc8, 0xcc, 0xd0,
+	0xd4, 0xd8, 0xdc, 0xe0, 0xe4,
+	0xe8, 0xec, 0xf0
+};
+
+static const u32 pcc4_resets[] = {
+	0x4, 0x8, 0xc, 0x10, 0x14,
+	0x18, 0x1c, 0x20, 0x24, 0x34,
+	0x38, 0x3c, 0x40, 0x44, 0x48,
+	0x4c, 0x54
+};
+
+static const u32 pcc5_resets[] = {
+	0xa0, 0xa4, 0xa8, 0xac, 0xb0,
+	0xb4, 0xbc, 0xc0, 0xc8, 0xcc,
+	0xd0, 0xf0, 0xf4, 0xf8
+};
+
+static int imx8ulp_pcc_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct pcc_reset_dev *pcc_reset = to_pcc_reset_dev(rcdev);
+	u32 offset = pcc_reset->resets[id];
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(pcc_reset->lock, flags);
+
+	val = readl(pcc_reset->base + offset);
+	val &= ~PCC_SW_RST;
+	writel(val, pcc_reset->base + offset);
+
+	spin_unlock_irqrestore(pcc_reset->lock, flags);
+
+	return 0;
+}
+
+static int imx8ulp_pcc_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct pcc_reset_dev *pcc_reset = to_pcc_reset_dev(rcdev);
+	u32 offset = pcc_reset->resets[id];
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(pcc_reset->lock, flags);
+
+	val = readl(pcc_reset->base + offset);
+	val |= PCC_SW_RST;
+	writel(val, pcc_reset->base + offset);
+
+	spin_unlock_irqrestore(pcc_reset->lock, flags);
+
+	return 0;
+}
+
+static const struct reset_control_ops imx8ulp_pcc_reset_ops = {
+	.assert = imx8ulp_pcc_assert,
+	.deassert = imx8ulp_pcc_deassert,
+};
+
+static int imx8ulp_pcc_reset_init(struct platform_device *pdev, void __iomem *base,
+	 const u32 *resets, unsigned int nr_resets)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct pcc_reset_dev *pcc_reset;
+
+	pcc_reset = devm_kzalloc(dev, sizeof(*pcc_reset), GFP_KERNEL);
+	if (!pcc_reset)
+		return -ENOMEM;
+
+	pcc_reset->base = base;
+	pcc_reset->lock = &imx_ccm_lock;
+	pcc_reset->resets = resets;
+	pcc_reset->rcdev.owner = THIS_MODULE;
+	pcc_reset->rcdev.nr_resets = nr_resets;
+	pcc_reset->rcdev.ops = &imx8ulp_pcc_reset_ops;
+	pcc_reset->rcdev.of_node = np;
+
+	return devm_reset_controller_register(dev, &pcc_reset->rcdev);
+}
+
 static int imx8ulp_clk_cgc1_init(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -294,10 +387,13 @@ static int imx8ulp_clk_pcc3_init(struct platform_device *pdev)
 	imx_check_clk_hws(clks, clk_data->num);
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		return ret;
 
 	imx_register_uart_clocks(1);
 
-	return ret;
+	/* register the pcc3 reset controller */
+	return imx8ulp_pcc_reset_init(pdev, base, pcc3_resets, ARRAY_SIZE(pcc3_resets));
 }
 
 static int imx8ulp_clk_pcc4_init(struct platform_device *pdev)
@@ -306,6 +402,7 @@ static int imx8ulp_clk_pcc4_init(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	struct clk_hw **clks;
 	void __iomem *base;
+	int ret;
 
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, IMX8ULP_CLK_PCC4_END),
 			   GFP_KERNEL);
@@ -345,7 +442,13 @@ static int imx8ulp_clk_pcc4_init(struct platform_device *pdev)
 
 	imx_check_clk_hws(clks, clk_data->num);
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		return ret;
+
+	/* register the pcc4 reset controller */
+	return imx8ulp_pcc_reset_init(pdev, base, pcc4_resets, ARRAY_SIZE(pcc4_resets));
+
 }
 
 static int imx8ulp_clk_pcc5_init(struct platform_device *pdev)
@@ -354,6 +457,7 @@ static int imx8ulp_clk_pcc5_init(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	struct clk_hw **clks;
 	void __iomem *base;
+	int ret;
 
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, IMX8ULP_CLK_PCC5_END),
 			   GFP_KERNEL);
@@ -426,7 +530,12 @@ static int imx8ulp_clk_pcc5_init(struct platform_device *pdev)
 
 	imx_check_clk_hws(clks, clk_data->num);
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		return ret;
+
+	/* register the pcc5 reset controller */
+	return imx8ulp_pcc_reset_init(pdev, base, pcc5_resets, ARRAY_SIZE(pcc5_resets));
 }
 
 static int imx8ulp_clk_probe(struct platform_device *pdev)
-- 
2.26.2

