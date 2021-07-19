Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAA9C636C9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31E2E61166
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhGSF1g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 01:27:36 -0400
Received: from mail-eopbgr60063.outbound.protection.outlook.com ([40.107.6.63]:9190
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229512AbhGSF1g (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 01:27:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp+tbcO5esdZnpzOL8v24BLOcLT4DiYWfythlmIvhZ2VPR0FPo5dwgG4DPvooY8sHFENwARfGlLfoHtjfpzqJoQYrE4fmnuSaZoScCQ4MRu2vGpjPDGAxBe0fbYLsMOS+QViKinPWrCnHzkt+PNbuL34bWGDN/PnugPXJI3xSTmpshkgGylTKH8dJHdzjKiaZH+0alAZWWvF7YRaGdnbi/cI0APvNJpSUB6PC89N0FJ9cLBjYNWWfS1Mv3VwTOfr1uz7JQPt3K0hkzjmPSFTETJ45z3O9s5ethOWNPm3sLYHZIcLNK8m7Ywb9VZhDEc/+RJk8gAz3xWjZb+O6IcVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm8hufol7F76roYEgcYStSqgO/EePck0VLdSIMJmlj4=;
 b=Z/AKJIuSAo+DkiktLHtjvBI8qltixuFHwlbRrYgDiu4NHUWDSJzmqiiwu04iBGpuET7OOZ0JdgryRg6+6z3E6eLBagsp9uadQQ4l5m1HRHciyhmvgl76796OActQy2IlX/t9/8WVFZM7f/JXU0hVyAd5Rlmk/epLe2ZwP6Vjtur2Od0J+0D53Dk5ITEDDOr9w4uhNeExXFRvyL4UvrkWEyjZLybBHXMRZrek3ZxHxIMS7khtOOq+4bEQSJSQsk1MUE+g3o4HMmT+SNkh4pH4MmSRdiH2dZjTR/8aXoVYnBccibxee4KxlaAD6sLMII6McD3uF78+2V/6lJLoXh+lUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mm8hufol7F76roYEgcYStSqgO/EePck0VLdSIMJmlj4=;
 b=GL8g7WC0DGfGmiKDMw4QjbDX/DmqsYL4/t+ExpdI8I2LzYnDY3NPUU+JaBORJF7vnv4IR/Ko77zSisj0/KFnhnknOiQmMylPjJO2BbfmRn3i+9bJbzIIANjfn8fqQnclGk2KMUxeXhXrztQG1Af65xyhVLUmvKq0ZV804uFIUf0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 05:24:34 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 19 Jul 2021
 05:24:34 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        abel.vesa@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/9] clk: imx: Update the pllv4 to support imx8ulp
Date:   Mon, 19 Jul 2021 13:34:23 +0800
Message-Id: <20210719053430.1442505-3-ping.bai@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 05:24:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78b534f6-053c-4f0a-6223-08d94a757e1d
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5244BF416BB39913EF763EE687E19@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bTFjJ0L8x1UjBELa67y2dc1k7v5w2lN+o5xkb6m5lc9HMjCSk56/RLv1NFlOMYzatcOr+XRNSOvzRcQuwhtF+AYBG0cefV54Vp4VNocKThOKGx1M/dvghVi0Puhq2n4Wwz3ZdsDoIH3vOasQOsxmzUPXXLDh+PCSR7GeL208J8/cEZ7Z+J3bYoh9c99Kx+ZcaRr0qOYhCPtq4LwVb9lEAm7dY7TVYi1ZdE6Sx4aDLK6edCrMRdCCXSG9Ykab7cv/fxy9SDAg+YjHxvFuW0eljIjWaSbNbmWoNGPb0rpcDznIKkK3FXcdLXwB6PjGfISfO5eLf7NXyBqkb/+HM4/4GEqeMIw39FEaNI3JQ+wNGWzej4vRuRvt2d7coN0C/KFzgX2s5jBFK7js8+9gS1tY86ETryfP+F4ZzKuAz3sWKRwcC1JOerS/9bnpW/e4QL7/717Gark86RWL1wAQ6/nLHQTheTrrSNV9ckI8p1WH4z4SnoutZrouP00sW+OB2S7fbGFIYwKRE7sA7Oz/Ple4BHRf+55wJK8NnBewk2X1/ERI+h3YYW3Z+YPFCj94kQ5ZmV/KFQr2PMmefMgINIOdiug/FeeRvd+NCdBcHRUBsiUzkho0uxxCMYEQ7R2J70+w13+wdH5pEJ2H9yjuvtGBWeejFXHkl1DJPRmaNzQcmVzLcjmxGSpyWFG3JHhgiRi0a/kLzzpPiJR5ZWDiNBpzXPNIZ/kyVDTreICFFb3wQds=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(478600001)(83380400001)(6512007)(38350700002)(38100700002)(6506007)(956004)(36756003)(2906002)(4326008)(1076003)(316002)(5660300002)(2616005)(6486002)(52116002)(86362001)(26005)(66476007)(186003)(66556008)(8676002)(66946007)(8936002)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V3KM318db17dNlZJHFyuNmdNlC9HuprFBjE3YtRqKw9nV3U+Zo/EX+NlJwTC?=
 =?us-ascii?Q?OZctUOl5oTno4gsWhkKHhwm8M9MOa1QH3s+I78dMcZOQfovY56W1n4WD2xZT?=
 =?us-ascii?Q?JPDkyHQTiElofm5KOIt+F17JKfFOkrGImakkZrzN0GBnF8kl0weY1iFnvtLh?=
 =?us-ascii?Q?/u9sfCZRFf0XnqWmm1vZwllOXgHfNR5NU4o2lzn7f2uMeD9+JnzQPv/OnjNp?=
 =?us-ascii?Q?sIoImhxxUPyMLYPZbYT7M98PJ9XHy/hEDUGYDga9Z5Yus4UHwzCJmrIxfDfs?=
 =?us-ascii?Q?mtd9lnj4dONqVvcKGMN2fG9ibibhTEpTge1Gsw83hRehpkS8P7meyRqTPP/u?=
 =?us-ascii?Q?6jLWdXVXiNPkn0wkFU/b+j7Tuh9QNLD9De3TWJkUBGMooExyT5e2bZgtvK5/?=
 =?us-ascii?Q?MbTQhO+LghVHYzN7KcWJL/SVMFAEnOHnZoVaajIC9JAOr1R/YYy09fJvZb5C?=
 =?us-ascii?Q?G49OQfl7RpJ0g3Lfek4vRFJWXUjiNYXRC7N0w9D4CgJuZSmxWUJUXup4Yo4A?=
 =?us-ascii?Q?X+WnhyvFjt7QQhQ2oTzUkXR7s/STIEsqA4fM5c4bHm3u0N4+Zl3VfxYiN+iY?=
 =?us-ascii?Q?f3HoTPMyuSmg1J/dnR432WmhtE0Zh/qiJbCmwK9/Zuc6YHPPw3fFnP6I/bC2?=
 =?us-ascii?Q?0VzFSvJ4cdfVl5iQV0OvHlWbsNM+Um27O+ZGGO/GeKFWC1KJed+LybjjGjpX?=
 =?us-ascii?Q?EavCNADyiNc85SM2py2OtBBoCvCWBREBWqbmxRpPilhcAk1T8LaTYLVLvV7V?=
 =?us-ascii?Q?2dUO/8nipFwgbDCmBkapy6hccagW4arf80rxpi/fB8xhsXaQAEYciGcJz60k?=
 =?us-ascii?Q?v7xQlY66WtdLb/RE29Rjy8eEuaGrmYdHOoza69j7gkrGCprbe010Ue34fvnO?=
 =?us-ascii?Q?+EHx2vq9Olwcf1SiofYbfMXaUUGejBWc95jpK/+pujMnXcllxxrQsY1YfTV8?=
 =?us-ascii?Q?Sz6WsHrBbNUq4Bf2Ty54aoN76jGbmPQ2lrXWQudO+cPAcfI/hY5naZY7nQ8l?=
 =?us-ascii?Q?yr6oZpAPJreUsr2S2dCxiDVRo8o5eA8U3cRl+sLSi6cuxcaKADtYlfVLaPsr?=
 =?us-ascii?Q?l70OyTfjGx92POhq7BcUWkFdCNH0MCkwd4PaK4Kow+ZOGYsKF3bvjI0Gs+DG?=
 =?us-ascii?Q?QF5KX1aVfdPg9DfGOOPKDlH6wdc8TJ7kblWaJhtwLlfr8Iq2bbcD+H4l+KMI?=
 =?us-ascii?Q?0a/BgbVZVKg7f0LaZ3YO8vNHqE0STMJGi8kVZ1OLEHuOGVBqda2Uwg2imvKm?=
 =?us-ascii?Q?6J3zqLnGAe5yv7zAB0IfoXtPRPmzUX0fNBXlWBndDUGKXbT8j/mZYIwyMBGV?=
 =?us-ascii?Q?mdBDFgaiqjLTzjpU5SYxwLQZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b534f6-053c-4f0a-6223-08d94a757e1d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 05:24:33.8971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiStxv16N77+ao3A7zDlhfnBe0XNpmN601rR7qqMYtBCSrpEGabUe1vZ1czxZBMdWDhaHG3DlY4zYiSd+cUs6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PLLs used on i.MX8ULP is mostly the same as on i.MX7ULP,
except the PLL register offset is changed. Change the PLLv4
driver for code reuse on i.MX7ULP and i.MX8ULP.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-imx7ulp.c |  4 ++--
 drivers/clk/imx/clk-pllv4.c   | 34 +++++++++++++++++++++++++---------
 drivers/clk/imx/clk.h         |  9 +++++++--
 3 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
index 779e09105da7..ba50d6db8097 100644
--- a/drivers/clk/imx/clk-imx7ulp.c
+++ b/drivers/clk/imx/clk-imx7ulp.c
@@ -78,8 +78,8 @@ static void __init imx7ulp_clk_scg1_init(struct device_node *np)
 	hws[IMX7ULP_CLK_SPLL_PRE_DIV]	= imx_clk_hw_divider_flags("spll_pre_div", "spll_pre_sel", base + 0x608,	8,	3,	CLK_SET_RATE_GATE);
 
 	/*						name	 parent_name	 base */
-	hws[IMX7ULP_CLK_APLL]		= imx_clk_hw_pllv4("apll",  "apll_pre_div", base + 0x500);
-	hws[IMX7ULP_CLK_SPLL]		= imx_clk_hw_pllv4("spll",  "spll_pre_div", base + 0x600);
+	hws[IMX7ULP_CLK_APLL]		= imx_clk_hw_pllv4(IMX_PLLV4_IMX7ULP, "apll",  "apll_pre_div", base + 0x500);
+	hws[IMX7ULP_CLK_SPLL]		= imx_clk_hw_pllv4(IMX_PLLV4_IMX7ULP, "spll",  "spll_pre_div", base + 0x600);
 
 	/* APLL PFDs */
 	hws[IMX7ULP_CLK_APLL_PFD0]	= imx_clk_hw_pfdv2("apll_pfd0", "apll", base + 0x50c, 0);
diff --git a/drivers/clk/imx/clk-pllv4.c b/drivers/clk/imx/clk-pllv4.c
index 8ec703f27417..3c750ccbee25 100644
--- a/drivers/clk/imx/clk-pllv4.c
+++ b/drivers/clk/imx/clk-pllv4.c
@@ -23,14 +23,17 @@
 
 /* PLL Configuration Register (xPLLCFG) */
 #define PLL_CFG_OFFSET		0x08
+#define IMX8ULP_PLL_CFG_OFFSET	0x10
 #define BP_PLL_MULT		16
 #define BM_PLL_MULT		(0x7f << 16)
 
 /* PLL Numerator Register (xPLLNUM) */
 #define PLL_NUM_OFFSET		0x10
+#define IMX8ULP_PLL_NUM_OFFSET	0x1c
 
 /* PLL Denominator Register (xPLLDENOM) */
 #define PLL_DENOM_OFFSET	0x14
+#define IMX8ULP_PLL_DENOM_OFFSET	0x18
 
 #define MAX_MFD			0x3fffffff
 #define DEFAULT_MFD		1000000
@@ -38,6 +41,9 @@
 struct clk_pllv4 {
 	struct clk_hw	hw;
 	void __iomem	*base;
+	u32		cfg_offset;
+	u32		num_offset;
+	u32		denom_offset;
 };
 
 /* Valid PLL MULT Table */
@@ -72,12 +78,12 @@ static unsigned long clk_pllv4_recalc_rate(struct clk_hw *hw,
 	u32 mult, mfn, mfd;
 	u64 temp64;
 
-	mult = readl_relaxed(pll->base + PLL_CFG_OFFSET);
+	mult = readl_relaxed(pll->base + pll->cfg_offset);
 	mult &= BM_PLL_MULT;
 	mult >>= BP_PLL_MULT;
 
-	mfn = readl_relaxed(pll->base + PLL_NUM_OFFSET);
-	mfd = readl_relaxed(pll->base + PLL_DENOM_OFFSET);
+	mfn = readl_relaxed(pll->base + pll->num_offset);
+	mfd = readl_relaxed(pll->base + pll->denom_offset);
 	temp64 = parent_rate;
 	temp64 *= mfn;
 	do_div(temp64, mfd);
@@ -165,13 +171,13 @@ static int clk_pllv4_set_rate(struct clk_hw *hw, unsigned long rate,
 	do_div(temp64, parent_rate);
 	mfn = temp64;
 
-	val = readl_relaxed(pll->base + PLL_CFG_OFFSET);
+	val = readl_relaxed(pll->base + pll->cfg_offset);
 	val &= ~BM_PLL_MULT;
 	val |= mult << BP_PLL_MULT;
-	writel_relaxed(val, pll->base + PLL_CFG_OFFSET);
+	writel_relaxed(val, pll->base + pll->cfg_offset);
 
-	writel_relaxed(mfn, pll->base + PLL_NUM_OFFSET);
-	writel_relaxed(mfd, pll->base + PLL_DENOM_OFFSET);
+	writel_relaxed(mfn, pll->base + pll->num_offset);
+	writel_relaxed(mfd, pll->base + pll->denom_offset);
 
 	return 0;
 }
@@ -207,8 +213,8 @@ static const struct clk_ops clk_pllv4_ops = {
 	.is_prepared	= clk_pllv4_is_prepared,
 };
 
-struct clk_hw *imx_clk_hw_pllv4(const char *name, const char *parent_name,
-			  void __iomem *base)
+struct clk_hw *imx_clk_hw_pllv4(enum imx_pllv4_type type, const char *name,
+		 const char *parent_name, void __iomem *base)
 {
 	struct clk_pllv4 *pll;
 	struct clk_hw *hw;
@@ -221,6 +227,16 @@ struct clk_hw *imx_clk_hw_pllv4(const char *name, const char *parent_name,
 
 	pll->base = base;
 
+	if (type == IMX_PLLV4_IMX8ULP) {
+		pll->cfg_offset = IMX8ULP_PLL_CFG_OFFSET;
+		pll->num_offset = IMX8ULP_PLL_NUM_OFFSET;
+		pll->denom_offset = IMX8ULP_PLL_DENOM_OFFSET;
+	} else {
+		pll->cfg_offset = PLL_CFG_OFFSET;
+		pll->num_offset = PLL_NUM_OFFSET;
+		pll->denom_offset = PLL_DENOM_OFFSET;
+	}
+
 	init.name = name;
 	init.ops = &clk_pllv4_ops;
 	init.parent_names = &parent_name;
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 7571603bee23..964f5cddc7aa 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -42,6 +42,11 @@ enum imx_pll14xx_type {
 	PLL_1443X,
 };
 
+enum imx_pllv4_type {
+	IMX_PLLV4_IMX7ULP,
+	IMX_PLLV4_IMX8ULP,
+};
+
 /* NOTE: Rate table should be kept sorted in descending order. */
 struct imx_pll14xx_rate_table {
 	unsigned int rate;
@@ -191,8 +196,8 @@ struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
 		.kdiv	=	(_k),			\
 	}
 
-struct clk_hw *imx_clk_hw_pllv4(const char *name, const char *parent_name,
-			     void __iomem *base);
+struct clk_hw *imx_clk_hw_pllv4(enum imx_pllv4_type type, const char *name,
+		const char *parent_name, void __iomem *base);
 
 struct clk_hw *clk_hw_register_gate2(struct device *dev, const char *name,
 		const char *parent_name, unsigned long flags,
-- 
2.26.2

