Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B14C636C9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B4B96117A
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbhGSF1j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 01:27:39 -0400
Received: from mail-eopbgr60085.outbound.protection.outlook.com ([40.107.6.85]:64030
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229512AbhGSF1i (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 01:27:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2b+diNRnkKaHzvswR/q5Uc0/u+H97148jYLt5Wuqak9tN9JkCJacfLmJnhdBW8xn6rQ3ZR9navVz3gJ1YsnPFTs3/6RFUR6I5nJzg1QXwi0MFuV+rDQe6vctOk6YBgN5GLjWNyaMMBOzHGv4k4vaDt1AI15nrUJl4AUu9HljCtaXqGoeUPjIr0mwqrXUQ8LEqrcCAwAyf4oDqHeS5NcwzCNi8iJvzVptIhnTC7OErlypGfSFR8orJEU8gSuvrvlQMzt6AHKZcml3CDLXu/AImWiV2ej6DqCNXfS+fW2WFWwlSGo/8PyJ0jufIREOAWfOGm9PYhsBNv0MBYoI5uPIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUgRefICjI1faxgBxYbMmx21tXsivbgDMAj+iT4XdAA=;
 b=OPclIV5HYwt6d0kJZ2M/iclt1V+721VOYdX7bEPEGYscqL4gPO6dKhBdPDb/Tk4eGsihsg4RB7KMG8rf5g22lP/iBN0qeEsiXrso3S9StRZ/Ucv9p8vrLY4lnRGjxYnvtgUikL8mMZit3eVfP/aJHV/SmcSZwNngoZSMLUTSg79k/vk0PlWMq4QGs4cQi9DNMsuLYk14zxWj3anOqkog9hzBiK2TU6YPYeZUcQXaHqnh3I3b2b89fVYuTDExUNHKWAa094XVqGOZwaKJEy4iH9cKEn/eQevjnZ+Q2kcWshUmMWkXIr+0c4TDYUBxx7T0XwGlZV5NVwpgQmStgOSL0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUgRefICjI1faxgBxYbMmx21tXsivbgDMAj+iT4XdAA=;
 b=LaK8tmplI8GsSBW9KcZyPfC6cfetyhwSTGfGeii10BfKUWIKFgxkAvnG0YTijuEa2K089D0GmuMafQDxLG//5cIBY2rDYYssV4YXEzTqvloYkgFATjaYhJdVh+mnEERVongySU1GOgl/ebMkXX/WKMNPCvTc8qN4pJIDoB9OaqA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 05:24:38 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 19 Jul 2021
 05:24:38 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        abel.vesa@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/9] clk: imx: Update the compsite driver to support imx8ulp
Date:   Mon, 19 Jul 2021 13:34:24 +0800
Message-Id: <20210719053430.1442505-4-ping.bai@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 05:24:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 977a25d6-30fd-4ca8-4a95-08d94a75808f
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5244FABD26F0B0C74E41AE4787E19@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hbXohz08CrheUXycBocoP4QJlMurJiBWnAdHqOpdtqTRt8Zep23urGSbfuu31s45WRw/IG64DPM2UJDkvS/a4xIs/ndnlVNseuc5JDmnWI9/FYuAihxyZjmRuov/tvg2If2FF9qaTX7VCv0q2p/9PDCMCo8HCZMVIkwPxQ07RCVZ4imN2AO1fJRFogBXDVbvkp9Zp5p96jf/+1zG6dgFe198CCvzQOb7s+2d5lEBRlZ+VjioUaJM1PSPLI7KaZObQAt628xqOKaA9jwAL/6WgTiWyYleGuPmGF7TSDRanbYAisRvorm+2a2YzP2rZ5xEXdNn/jJx20s802biEn+io8EwWIGxNwrO8OYeOI707r/tgBiJbJFJcaoFCTIowc7rK75NmzJAE/JedLvS8S7PEyKOLxoZ7PgQKRRWjjhJLoYbIA4gYDUiH+J4gApQj+0A9PyfRD2eQcEqGUdhOGqqVYRNcpDlzdhdo/ouYSoH+AFlpbKV3FlF/nUp5FrjuCX5lgCZmetE+uyAIRDA37heX/eiBLRCORXatl/KRzz1IU92dWuFald0fOmrDcvXya6tnKCgv7eWcxqR3D6jImZMj2ddl3TLR/8RAp95o98lov1lTKOKzI+1+3DjSRU0x5EJu2t0LrFlLAo1ZUSIDnfh2EJ03W5FTEmwvA9ynuOYE5ht4x3umPmg1MOWyAvoDhJo+lK1s1lPk1RapgLJBXIYUolv/MMVliGIdATc4/bGKzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(478600001)(83380400001)(6512007)(38350700002)(38100700002)(15650500001)(6506007)(956004)(36756003)(2906002)(4326008)(1076003)(316002)(5660300002)(2616005)(6486002)(52116002)(86362001)(26005)(66476007)(186003)(66556008)(8676002)(66946007)(8936002)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wt5JAnFOnAR73Jl/aJD/I25v6Lyu/0ZHiy+3yaV0GJuezyOaAAEPEw9GJorT?=
 =?us-ascii?Q?WCkhRTyfhXedHrfhTS3/LgAIDu1LTnzGzBkGPFEHXcQtgMsH1JznzMH+EDzx?=
 =?us-ascii?Q?BOOIApcNcKxxtY2Uccui9LZe70tIyofT2mZq5iz7smEUtMuUJCuPRiC7ddoN?=
 =?us-ascii?Q?+WlJsoQU7wIH2v9WQ1AdSX/vk3m5ePX5xmqyCiGDaHiVAm4JR3/MRmKIuWdp?=
 =?us-ascii?Q?sUO1F3/tzspx/XjwXxgIh97mWghY3VWb1jXkneEnEoSq+nA7Dxt3zO63djBH?=
 =?us-ascii?Q?BhSuYMEkoAyv8dbGaLJGPLPdKgstbDLXRibnaotUs1+X1OsLgDoEeW2UWvmO?=
 =?us-ascii?Q?Oz2fjssKBS5OeL7gDZ4C8iBCEDksB9RbB5hrDA0uOnT0cxfYh7jWLxCRbyRL?=
 =?us-ascii?Q?ESiH50ah850TqiNdM4sCDkUmRJoz9IF5cE1mucpGPJLsr/hh/jTPWgu52ErK?=
 =?us-ascii?Q?xL+0PA62xP6ZDCXi6bZsHPF6u05jf2wCGqfe3FnPEYZYQTqqh1vtmf8jARmr?=
 =?us-ascii?Q?XuerariDblLWZGVm7XSBUfq+pj7axagyWUA0UM/W0iJz4/TSfp48Q3eq83jH?=
 =?us-ascii?Q?cjen7c06b/oiJAVr+cAtdMmmeQL8AO28nDvi9lHXQyVvyRlkXKzlumAENdmQ?=
 =?us-ascii?Q?aIXpiUJ2vcdyvcJ5qkAgJFEO2/UYKdeeZFCp0bMDUDl0Ps/T3BRCMZ5eFdy2?=
 =?us-ascii?Q?qo0PBtUSvDyIYaqoWiFvUQ/2eCBzqUsBorzaPXFLjoucZ6fVgSTu6FpFK51u?=
 =?us-ascii?Q?c7ay7Il6tcJwdmqkbPwqVevbIasBxuKErXm6HNvksDy/SWhv5GyPsgFXUWiF?=
 =?us-ascii?Q?wF/IalcjC6UMgr7nnXxaQGTmPqsM9fHcWaPY/kx9KS5UTOpFrRa+msvvQ5UZ?=
 =?us-ascii?Q?z0ODMKjO0dBi7Ki3B1LZVtRSFaBfVf8LaXabsMuw6mNbf+Jao9UeY2CIsa/e?=
 =?us-ascii?Q?yjaA6UNAaaPKDmn5svmxEArBehvo0YeoMq4jXDP3igbL68IJsNWbcdAg4ebV?=
 =?us-ascii?Q?KS/rtfDb+Nw6k3T8ARVNncYFSxCOoTuhkGNen2FDL1S5BTuYHLnVbLMUeAWJ?=
 =?us-ascii?Q?/3y+C3n+ViIUaLYXjDmKPLF+FNiivgweFFArP5pZgE7WUU9kzG3qY6XoIJ9I?=
 =?us-ascii?Q?XsuqlWcJTYA5nj+4luYhqzLRWN4Vs3KdmUpALaEE7D9oZMqJyBRccaKwh35z?=
 =?us-ascii?Q?LGBMklLooSn0jCZsIRi88+ZxZ66KNbyQG1nrxWAzSyUkkUn6KldWmcQOL2Hi?=
 =?us-ascii?Q?sWPfKrsNaz5Yz0xnvREJFCdOfy7B661MaN4M+EBnUiQP7EVZP0Btk3grcWg6?=
 =?us-ascii?Q?OXBQPAE3MmwauCKzVsWyJ0S9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977a25d6-30fd-4ca8-4a95-08d94a75808f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 05:24:38.0060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Kc7tUpGTGkb3waHEs1JZogJsFn8nfRlf+NYbeBQWtfBW2OduDoAtVXJqSUh5WTd5LnV3T2d/ziNQ2VbYIPTLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On i.MX8ULP, some peripherals have a sw_rst control resides
in the per device PCC clock control register, all others are
same as i.MX7ULP, so update the 7ulp clock composite driver to
support i.MX8ULP to maxmimize the code reuse.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-composite-7ulp.c | 61 ++++++++++++++++++++++++++--
 drivers/clk/imx/clk.h                |  6 +++
 2 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
index 7c4f31b31eb0..9298bca7a62a 100644
--- a/drivers/clk/imx/clk-composite-7ulp.c
+++ b/drivers/clk/imx/clk-composite-7ulp.c
@@ -22,11 +22,50 @@
 #define PCG_PCD_WIDTH	3
 #define PCG_PCD_MASK	0x7
 
-struct clk_hw *imx7ulp_clk_hw_composite(const char *name,
+#define SW_RST		BIT(28)
+
+static int pcc_gate_enable(struct clk_hw *hw)
+{
+	struct clk_gate *gate = to_clk_gate(hw);
+	u32 val;
+	int ret;
+
+	ret = clk_gate_ops.enable(hw);
+	if (ret)
+		return ret;
+
+	/*
+	 * release the sw reset for peripherals associated with
+	 * with this pcc clock.
+	 */
+	val = readl(gate->reg);
+	val |= SW_RST;
+	writel(val, gate->reg);
+
+	return 0;
+}
+
+static void pcc_gate_disable(struct clk_hw *hw)
+{
+	clk_gate_ops.disable(hw);
+}
+
+static int pcc_gate_is_enabled(struct clk_hw *hw)
+{
+	return clk_gate_ops.is_enabled(hw);
+}
+
+static const struct clk_ops pcc_gate_ops = {
+	.enable = pcc_gate_enable,
+	.disable = pcc_gate_disable,
+	.is_enabled = pcc_gate_is_enabled,
+};
+
+static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
 				     const char * const *parent_names,
 				     int num_parents, bool mux_present,
 				     bool rate_present, bool gate_present,
-				     void __iomem *reg)
+				     void __iomem *reg, bool has_swrst)
 {
 	struct clk_hw *mux_hw = NULL, *fd_hw = NULL, *gate_hw = NULL;
 	struct clk_fractional_divider *fd = NULL;
@@ -76,7 +115,7 @@ struct clk_hw *imx7ulp_clk_hw_composite(const char *name,
 	hw = clk_hw_register_composite(NULL, name, parent_names, num_parents,
 				       mux_hw, &clk_mux_ops, fd_hw,
 				       &clk_fractional_divider_ops, gate_hw,
-				       &clk_gate_ops, CLK_SET_RATE_GATE |
+				       has_swrst ? &pcc_gate_ops : &clk_gate_ops, CLK_SET_RATE_GATE |
 				       CLK_SET_PARENT_GATE);
 	if (IS_ERR(hw)) {
 		kfree(mux);
@@ -86,3 +125,19 @@ struct clk_hw *imx7ulp_clk_hw_composite(const char *name,
 
 	return hw;
 }
+
+struct clk_hw *imx7ulp_clk_hw_composite(const char *name, const char * const *parent_names,
+				int num_parents, bool mux_present, bool rate_present,
+				bool gate_present, void __iomem *reg)
+{
+	return imx_ulp_clk_hw_composite(name, parent_names, num_parents, mux_present, rate_present,
+					gate_present, reg, false);
+}
+
+struct clk_hw *imx8ulp_clk_hw_composite(const char *name, const char * const *parent_names,
+				int num_parents, bool mux_present, bool rate_present,
+				bool gate_present, void __iomem *reg, bool has_swrst)
+{
+	return imx_ulp_clk_hw_composite(name, parent_names, num_parents, mux_present, rate_present,
+					gate_present, reg, has_swrst);
+}
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 964f5cddc7aa..2acac152c4aa 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -237,6 +237,12 @@ struct clk_hw *imx7ulp_clk_hw_composite(const char *name,
 				     bool rate_present, bool gate_present,
 				     void __iomem *reg);
 
+struct clk_hw *imx8ulp_clk_hw_composite(const char *name,
+				     const char * const *parent_names,
+				     int num_parents, bool mux_present,
+				     bool rate_present, bool gate_present,
+				     void __iomem *reg, bool has_swrst);
+
 struct clk_hw *imx_clk_hw_fixup_divider(const char *name, const char *parent,
 				  void __iomem *reg, u8 shift, u8 width,
 				  void (*fixup)(u32 *val));
-- 
2.26.2

