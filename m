Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7A0C12002
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:25:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E46B16117A
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhGSF2B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 01:28:01 -0400
Received: from mail-am6eur05on2067.outbound.protection.outlook.com ([40.107.22.67]:6752
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229906AbhGSF2A (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 01:28:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsahFuoMRhMp2sRgknClpLc/9kbo9y3jgoIT1g0pYdLSWjESsmDqJb43qkEjuCUfTWWLSmkfSQ1djA9D5RiCaO24SU43lNbTpnuyP6JkYaaElo99nvSM+GRV7Xn9iDTl6Lv+9+9q+9fOaxzDfRHPs6aWp+muQ+vh+qtw+oNZJpwFTBF6WGgFB5aFqwAcrWuqKMxQZ/cqqNByax9Eop0N5B/dgp6avdS1ftfGt63NBV5tsjg0AR826csnXruuV3tlZ3Jey2llGzS5UXhJfu7+By5OqIxIIii1bJ/fQomirLdmT70Mskj+ZBX6bfKUnpWd3OZsWZGFDt0Gs+Es6u+HEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvtKM+SiDMhj6IlSqZSaBXTCiKC/aJXzJ0N80baFPk8=;
 b=D1Z6gle0BTHm7zLU60ZOby7OQXYtU4laDL+kxss08EopmO441BiZk2XtSa+r0lvUqE0Q92Fo8H8QhQWLkKKGjOk4NTc7hXVk11zeRRTMrUhpF4P3kHNdgwRK2HUYc/mzqqpAwA+TLWqjU4G1s5p4XUOCXHfaF+59A5DTx0NuQCQHipQw2z0L+iOr/rhaknqAj1zmYYrOdOIbChZf9GAHi4vYJSx259IEGgFGmsH3NwJ1uXfpsUAx7kuJdIapQu5nitLrQcd0pWZWXnu8Q4Uyg/wd/ACQ40d3i6d8IriQOp7y6uk2ZRWq86vq3BQcqqSX6PaRnFORuSjPX5X62rkhRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvtKM+SiDMhj6IlSqZSaBXTCiKC/aJXzJ0N80baFPk8=;
 b=TDbRYNc0dNpAIH2x+GigDShw/hB7jhtdK4D4oFpfl8iFDmJSa1J7TeRVHq781eDQEbvpuB7edgNZ0XpbDPdRvbYyrLclIaOdItg5XVGJ65BMLP2EmM3aqQdutnaMCa0Ni7IVwoka+dfUg1V2UM4wfSBDuPctt1NGO6fe/ATxTzs=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 05:24:59 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 19 Jul 2021
 05:24:59 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        abel.vesa@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 8/9] clk: imx: Add clock driver for imx8ulp
Date:   Mon, 19 Jul 2021 13:34:29 +0800
Message-Id: <20210719053430.1442505-9-ping.bai@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 05:24:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55271d9e-4fe9-4484-ecbd-08d94a758ceb
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB52440172F88A7DE9FA044EAA87E19@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rcfODrW0WurPaUXN5/dyOk9g7R0Fz4RYdkyLVFDwDhlGUVyW6Jk55+QS/qOpUH8T40J0PhCXr6lSaKr5WtQY0sfe7XMeSWmxf1hN4XTghPA6gG2RrVVfwRC/6gDFMlxhPXZwwyEBqSH43TswjSWf4NjGy3C1/h5b8JDgWOYoQzKPO7uWtVewMP2Kkq5Z1YbWfPuzHO80MCbKrEBJAK8wktDru7/f5rJiT9Wmvzw80tq9RXGgpKGOrGroC7SRvXwYeXT+jhuMzmuIxgZf5zQvRB7qGfV2pY0iZSc+zNqPxK202Bgl6zRx5FF13O1t1q4ewqXzqgxzejHIGlWXcKJJ65p4CqaXjW/GhpdW4DISo3YiIyTJirOKCGphEG9VPajOMcbAwaJV6hqSu7CjnrVSV4n/VQ3lVgD+YN7dnWuwJgJnAChx4G2hz2kb9pbXys1T7hRdIE76srmNi1gu3kE8Hxsd6RjJkgg5EY/uuSz5MVGfKsnCCemwe+mNg9MKPWOeu3weiqmWSzkOTJAiuphr51z0Dn549fmXpmxNw7FrPdcyakDqNHAa6iBcqOkJ6iynBtL9jFkvo6coWF51d4dA8x2Px0NTuxtxcXwdzfhv9Vuk/Pr8oE0bs7ia3R68P069yNk0I1vLLRa9jAF3sJjSnMpoq6UPmPtlMxMAFYcpC8+m/Ogqc55gcar7nqFEKVkUn2DCB7c2m5EWu5cMO906RX7aExX0pfxoVeNltWNTedg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(478600001)(83380400001)(6512007)(38350700002)(38100700002)(6506007)(30864003)(956004)(36756003)(2906002)(4326008)(1076003)(316002)(5660300002)(2616005)(6486002)(52116002)(86362001)(26005)(66476007)(186003)(66556008)(8676002)(66946007)(8936002)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NdO0OZiF0+UADcHO2SamPLRoeef2r7vuP7aIc+LVq6gCpNea0bNdRCmehEKY?=
 =?us-ascii?Q?eK+xK5YNVbwtiq0mE7Ze1jhlFaRRHZ/voiXa6vql8n4mOqMm1/PQXiS70bV3?=
 =?us-ascii?Q?5ogkKMWki1oGXc4ZRKosPqhEM+zyvURoxX2GXEquBNAUY/DSCdD0sZUyHGsv?=
 =?us-ascii?Q?UbrJR1CxY3GU7yqK8OBNj/htwcYXdo5R3Xf/ETKvL33VoFlKywHO45+phTnv?=
 =?us-ascii?Q?FTFZQP+NSHqckszPXdWD4vJGv9Mvsj8o0HQDABfP1ZkWRuIFJiJ0FhrR3WwD?=
 =?us-ascii?Q?3BUZLMESRNWu64fm+fc3W4VKPVjnIfQXMMoxoqvk9NwBVM1Sv4PX+AlanJLx?=
 =?us-ascii?Q?cWpahP9F2D7b1qq+yHD3gDie33j396Nv8jRZZszpPPHgSQC21uX8yHfugGTR?=
 =?us-ascii?Q?LoTzI0QMXK2jLK8sRe2VF4erW6sQtb9sZQynHfwz/Thw3ZQRUYsDGQAuIzr1?=
 =?us-ascii?Q?lj4iC2RPqIx65iDPBoQpehIyHf2YJmIhrXO94IwTiQyv7LKznHRbLgOLlKjt?=
 =?us-ascii?Q?y+ntmm9L8d9bv+D2OHRP+AerHbTWPwOyt5a43wIYr3X04RG5pvwTeZfYrhPq?=
 =?us-ascii?Q?4K6oqjslv0Ng2BBomkIpviug8hMHkUnXN1s1S8vsusHda3htGO9fVCW6XHij?=
 =?us-ascii?Q?UM5i6dm0fslfaOJNVsXBS219YRWgufJUkg/xQey4H4Ox9CvgskxiKtSjkXHs?=
 =?us-ascii?Q?ZTMm+pi4xWh0vLZJG2z9RvsvGTkj9pbM1UsuBzw5O/3vMqFuPTtrUFjB3/rp?=
 =?us-ascii?Q?kdwLbsYt91d0XtNV1MGzQ79pTHx7hZWg4dhACJ2w71YgaJ6RNy+T3hha9X4b?=
 =?us-ascii?Q?zYcH669OfsrG9cKN+8MBFJ2w9u3YZya6QllzMkSWtG+Tx3VFwkF+hYnpdsNR?=
 =?us-ascii?Q?KLjHDztb15lD6xZhvAmxS1pxVZ5s8ffuySd78Xw+UB0ZMcsUpX5vi1IocieR?=
 =?us-ascii?Q?xzF7so8ABJFyaD+cutAonyLckQCgmJ17URv08FD7ksk/5X8s7CTK5pNNWYw/?=
 =?us-ascii?Q?ftREPVTqR9ofIGX3ln3jHjEOvLr5AZHwmMLINmfZCTral3pMht0ia49+aWoX?=
 =?us-ascii?Q?l34QGDJSB1mzwMsWIjYjXgQPvwvYj9pZse9WwY0194V+G/dmrx3fPytpKRHb?=
 =?us-ascii?Q?riJbMUa8LR3hJhwrFT4dhRu1tH+fs9Iczpf1WRjPALEq1BO5k0p1iTRxTxWS?=
 =?us-ascii?Q?uiz9kD8wDLHIZjY2A9saHJdumO++ZYn+gBx84O4M+EsS0ImicAdNwpapIDj6?=
 =?us-ascii?Q?RjOfseasWfVwcM6rELWJXq27BLGI78/vzf9GIp2SlFtVsM0NodqR4/qtWwC5?=
 =?us-ascii?Q?uu6hDhwoxsdkaOOzU+KpbwAY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55271d9e-4fe9-4484-ecbd-08d94a758ceb
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 05:24:58.8712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91EHsJw4AgRN3Fvu0tHNYKCjQVoxQvYozz3oy2qnwrgxqbDtHLzk5z5FRcJrMEcw0ZyUTHsNHFB1ucrl1htWMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock driver for i.MX8ULP.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/Kconfig       |   6 +
 drivers/clk/imx/Makefile      |   2 +
 drivers/clk/imx/clk-imx8ulp.c | 465 ++++++++++++++++++++++++++++++++++
 3 files changed, 473 insertions(+)
 create mode 100644 drivers/clk/imx/clk-imx8ulp.c

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 47d9ec3abd2f..b81d6437ed95 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -98,3 +98,9 @@ config CLK_IMX8QXP
 	select MXC_CLK_SCU
 	help
 	  Build the driver for IMX8QXP SCU based clocks.
+
+config CLK_IMX8ULP
+	tristate "IMX8ULP CCM Clock Driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	help
+	    Build the driver for i.MX8ULP CCM Clock Driver
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index c24a2acbfa56..b5e040026dfb 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -31,6 +31,8 @@ clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o \
 				     clk-imx8qxp-rsrc.o clk-imx8qm-rsrc.o
 clk-imx-lpcg-scu-$(CONFIG_CLK_IMX8QXP) += clk-lpcg-scu.o clk-imx8qxp-lpcg.o
 
+obj-$(CONFIG_CLK_IMX8ULP) += clk-imx8ulp.o
+
 obj-$(CONFIG_CLK_IMX1)   += clk-imx1.o
 obj-$(CONFIG_CLK_IMX25)  += clk-imx25.o
 obj-$(CONFIG_CLK_IMX27)  += clk-imx27.o
diff --git a/drivers/clk/imx/clk-imx8ulp.c b/drivers/clk/imx/clk-imx8ulp.c
new file mode 100644
index 000000000000..44d7dc105848
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8ulp.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 NXP
+ */
+
+#include <dt-bindings/clock/imx8ulp-clock.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include "clk.h"
+
+static const char * const pll_pre_sels[] = { "sosc", "frosc", };
+static const char * const a35_sels[] = { "frosc", "spll2", "sosc", "lvds", };
+static const char * const nic_sels[] = { "frosc", "spll3_pfd0", "sosc", "lvds", };
+static const char * const pcc3_periph_bus_sels[] = { "dummy", "lposc", "sosc_div2",
+						     "frosc_div2", "xbar_divbus", "spll3_pfd1_div1",
+						     "spll3_pfd0_div2", "spll3_pfd0_div1", };
+static const char * const pcc4_periph_bus_sels[] = { "dummy", "dummy", "lposc",
+						     "sosc_div2", "frosc_div2", "xbar_divbus",
+						     "spll3_vcodiv", "spll3_pfd0_div1", };
+static const char * const pcc4_periph_plat_sels[] = { "dummy", "sosc_div1", "frosc_div1",
+						      "spll3_pfd3_div2", "spll3_pfd3_div1",
+						      "spll3_pfd2_div2", "spll3_pfd2_div1",
+						      "spll3_pfd1_div2", };
+static const char * const pcc5_periph_bus_sels[] = { "dummy", "dummy", "lposc",
+						     "sosc_div2", "frosc_div2", "lpav_bus_clk",
+						     "pll4_vcodiv", "pll4_pfd3_div1", };
+static const char * const pcc5_periph_plat_sels[] = { "dummy", "pll4_pfd3_div2", "pll4_pfd2_div2",
+						      "pll4_pfd2_div1", "pll4_pfd1_div2",
+						      "pll4_pfd1_div1", "pll4_pfd0_div2",
+						      "pll4_pfd0_div1", };
+static const char * const hifi_sels[] = { "frosc", "pll4", "pll4_pfd0", "sosc",
+					 "lvds", "dummy", "dummy", "dummy", };
+static const char * const ddr_sels[] = { "frosc", "pll4_pfd1", "sosc", "lvds",
+					 "pll4", "pll4", "pll4", "pll4", };
+static const char * const lpav_sels[] = { "frosc", "pll4_pfd1", "sosc", "lvds", };
+static const char * const sai45_sels[] = { "spll3_pfd1_div1", "aud_clk1", "aud_clk2", "sosc", };
+static const char * const sai67_sels[] = { "spll1_pfd2_div", "spll3_pfd1_div1", "aud_clk0", "aud_clk1", "aud_clk2", "sosc", "dummy", "dummy", };
+static const char * const aud_clk1_sels[] = { "ext_aud_mclk2", "sai4_rx_bclk", "sai4_tx_bclk", "sai5_rx_bclk", "sai5_tx_bclk", "dummy", "dummy", "dummy", };
+static const char * const aud_clk2_sels[] = { "ext_aud_mclk3", "sai6_rx_bclk", "sai6_tx_bclk", "sai7_rx_bclk", "sai7_tx_bclk", "spdif_rx", "dummy", "dummy", };
+static const char * const enet_ts_sels[] = { "ext_rmii_clk", "ext_ts_clk", "rosc", "ext_aud_mclk", "sosc", "dummy", "dummy", "dummy"};
+static const char * const xbar_divbus[] = { "xbar_divbus" };
+static const char * const nic_per_divplat[] = { "nic_per_divplat" };
+static const char * const lpav_axi_div[] = { "lpav_axi_div" };
+static const char * const lpav_bus_div[] = { "lpav_bus_div" };
+
+static int imx8ulp_clk_cgc1_init(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **clks;
+	void __iomem *base;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, IMX8ULP_CLK_CGC1_END),
+			   GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = IMX8ULP_CLK_CGC1_END;
+	clks = clk_data->hws;
+
+	clks[IMX8ULP_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
+
+	clks[IMX8ULP_CLK_FROSC] = imx_obtain_fixed_clk_hw(np, "frosc");
+	clks[IMX8ULP_CLK_LPOSC] = imx_obtain_fixed_clk_hw(np, "lposc");
+	clks[IMX8ULP_CLK_ROSC] = imx_obtain_fixed_clk_hw(np, "rosc");
+	clks[IMX8ULP_CLK_SOSC] = imx_obtain_fixed_clk_hw(np, "sosc");
+
+	/* CGC1 */
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (WARN_ON(IS_ERR(base)))
+		return PTR_ERR(base);
+
+	clks[IMX8ULP_CLK_SPLL2_PRE_SEL]	= imx_clk_hw_mux_flags("spll2_pre_sel", base + 0x510, 0, 1, pll_pre_sels, ARRAY_SIZE(pll_pre_sels), CLK_SET_PARENT_GATE);
+	clks[IMX8ULP_CLK_SPLL3_PRE_SEL]	= imx_clk_hw_mux_flags("spll3_pre_sel", base + 0x610, 0, 1, pll_pre_sels, ARRAY_SIZE(pll_pre_sels), CLK_SET_PARENT_GATE);
+
+	clks[IMX8ULP_CLK_SPLL2] = imx_clk_hw_pllv4(IMX_PLLV4_IMX8ULP, "spll2", "spll2_pre_sel", base + 0x500);
+	clks[IMX8ULP_CLK_SPLL3] = imx_clk_hw_pllv4(IMX_PLLV4_IMX8ULP, "spll3", "spll3_pre_sel", base + 0x600);
+	clks[IMX8ULP_CLK_SPLL3_VCODIV] = imx_clk_hw_divider("spll3_vcodiv", "spll3", base + 0x604, 0, 6);
+
+	clks[IMX8ULP_CLK_SPLL3_PFD0] = imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "spll3_pfd0", "spll3_vcodiv", base + 0x614, 0);
+	clks[IMX8ULP_CLK_SPLL3_PFD1] = imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "spll3_pfd1", "spll3_vcodiv", base + 0x614, 1);
+	clks[IMX8ULP_CLK_SPLL3_PFD2] = imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "spll3_pfd2", "spll3_vcodiv", base + 0x614, 2);
+	clks[IMX8ULP_CLK_SPLL3_PFD3] = imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "spll3_pfd3", "spll3_vcodiv", base + 0x614, 3);
+
+	clks[IMX8ULP_CLK_SPLL3_PFD0_DIV1_GATE] = imx_clk_hw_gate_dis("spll3_pfd0_div1_gate", "spll3_pfd0", base + 0x608, 7);
+	clks[IMX8ULP_CLK_SPLL3_PFD0_DIV2_GATE] = imx_clk_hw_gate_dis("spll3_pfd0_div2_gate", "spll3_pfd0", base + 0x608, 15);
+	clks[IMX8ULP_CLK_SPLL3_PFD1_DIV1_GATE] = imx_clk_hw_gate_dis("spll3_pfd1_div1_gate", "spll3_pfd1", base + 0x608, 23);
+	clks[IMX8ULP_CLK_SPLL3_PFD1_DIV2_GATE] = imx_clk_hw_gate_dis("spll3_pfd1_div2_gate", "spll3_pfd1", base + 0x608, 31);
+	clks[IMX8ULP_CLK_SPLL3_PFD2_DIV1_GATE] = imx_clk_hw_gate_dis("spll3_pfd2_div1_gate", "spll3_pfd2", base + 0x60c, 7);
+	clks[IMX8ULP_CLK_SPLL3_PFD2_DIV2_GATE] = imx_clk_hw_gate_dis("spll3_pfd2_div2_gate", "spll3_pfd2", base + 0x60c, 15);
+	clks[IMX8ULP_CLK_SPLL3_PFD3_DIV1_GATE] = imx_clk_hw_gate_dis("spll3_pfd3_div1_gate", "spll3_pfd3", base + 0x60c, 23);
+	clks[IMX8ULP_CLK_SPLL3_PFD3_DIV2_GATE] = imx_clk_hw_gate_dis("spll3_pfd3_div2_gate", "spll3_pfd3", base + 0x60c, 31);
+	clks[IMX8ULP_CLK_SPLL3_PFD0_DIV1] = imx_clk_hw_divider("spll3_pfd0_div1", "spll3_pfd0_div1_gate", base + 0x608, 0, 6);
+	clks[IMX8ULP_CLK_SPLL3_PFD0_DIV2] = imx_clk_hw_divider("spll3_pfd0_div2", "spll3_pfd0_div2_gate", base + 0x608, 8, 6);
+	clks[IMX8ULP_CLK_SPLL3_PFD1_DIV1] = imx_clk_hw_divider("spll3_pfd1_div1", "spll3_pfd1_div1_gate", base + 0x608, 16, 6);
+	clks[IMX8ULP_CLK_SPLL3_PFD1_DIV2] = imx_clk_hw_divider("spll3_pfd1_div2", "spll3_pfd1_div2_gate", base + 0x608, 24, 6);
+	clks[IMX8ULP_CLK_SPLL3_PFD2_DIV1] = imx_clk_hw_divider("spll3_pfd2_div1", "spll3_pfd2_div1_gate", base + 0x60c, 0, 6);
+	clks[IMX8ULP_CLK_SPLL3_PFD2_DIV2] = imx_clk_hw_divider("spll3_pfd2_div2", "spll3_pfd2_div2_gate", base + 0x60c, 8, 6);
+	clks[IMX8ULP_CLK_SPLL3_PFD3_DIV1] = imx_clk_hw_divider("spll3_pfd3_div1", "spll3_pfd3_div1_gate", base + 0x60c, 16, 6);
+	clks[IMX8ULP_CLK_SPLL3_PFD3_DIV2] = imx_clk_hw_divider("spll3_pfd3_div2", "spll3_pfd3_div2_gate", base + 0x60c, 24, 6);
+
+	clks[IMX8ULP_CLK_A35_SEL] = imx_clk_hw_mux2("a35_sel", base + 0x14, 28, 2, a35_sels, ARRAY_SIZE(a35_sels));
+	clks[IMX8ULP_CLK_A35_DIV] = imx_clk_hw_divider_flags("a35_div", "a35_sel", base + 0x14, 21, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+
+	clks[IMX8ULP_CLK_NIC_SEL] = imx_clk_hw_mux2("nic_sel", base + 0x34, 28, 2, nic_sels, ARRAY_SIZE(nic_sels));
+	clks[IMX8ULP_CLK_NIC_AD_DIVPLAT] = imx_clk_hw_divider_flags("nic_ad_divplat", "nic_sel", base + 0x34, 21, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+	clks[IMX8ULP_CLK_NIC_PER_DIVPLAT] = imx_clk_hw_divider_flags("nic_per_divplat", "nic_ad_divplat", base + 0x34, 14, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+	clks[IMX8ULP_CLK_XBAR_AD_DIVPLAT] = imx_clk_hw_divider_flags("xbar_ad_divplat", "nic_ad_divplat", base + 0x38, 14, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+	clks[IMX8ULP_CLK_XBAR_DIVBUS] = imx_clk_hw_divider_flags("xbar_divbus", "nic_ad_divplat", base + 0x38, 7, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+	clks[IMX8ULP_CLK_XBAR_AD_SLOW] = imx_clk_hw_divider_flags("xbar_ad_slow", "nic_ad_divplat", base + 0x38, 0, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
+
+	clks[IMX8ULP_CLK_SOSC_DIV1_GATE] = imx_clk_hw_gate_dis("sosc_div1_gate", "sosc", base + 0x108, 7);
+	clks[IMX8ULP_CLK_SOSC_DIV2_GATE] = imx_clk_hw_gate_dis("sosc_div2_gate", "sosc", base + 0x108, 15);
+	clks[IMX8ULP_CLK_SOSC_DIV3_GATE] = imx_clk_hw_gate_dis("sosc_div3_gate", "sosc", base + 0x108, 23);
+	clks[IMX8ULP_CLK_SOSC_DIV1] = imx_clk_hw_divider("sosc_div1", "sosc_div1_gate", base + 0x108, 0, 6);
+	clks[IMX8ULP_CLK_SOSC_DIV2] = imx_clk_hw_divider("sosc_div2", "sosc_div2_gate", base + 0x108, 8, 6);
+	clks[IMX8ULP_CLK_SOSC_DIV3] = imx_clk_hw_divider("sosc_div3", "sosc_div3_gate", base + 0x108, 16, 6);
+
+	clks[IMX8ULP_CLK_FROSC_DIV1_GATE] = imx_clk_hw_gate_dis("frosc_div1_gate", "frosc", base + 0x208, 7);
+	clks[IMX8ULP_CLK_FROSC_DIV2_GATE] = imx_clk_hw_gate_dis("frosc_div2_gate", "frosc", base + 0x208, 15);
+	clks[IMX8ULP_CLK_FROSC_DIV3_GATE] = imx_clk_hw_gate_dis("frosc_div3_gate", "frosc", base + 0x208, 23);
+	clks[IMX8ULP_CLK_FROSC_DIV1] = imx_clk_hw_divider("frosc_div1", "frosc_div1_gate", base + 0x208, 0, 6);
+	clks[IMX8ULP_CLK_FROSC_DIV2] = imx_clk_hw_divider("frosc_div2", "frosc_div2_gate", base + 0x208, 8, 6);
+	clks[IMX8ULP_CLK_FROSC_DIV3] = imx_clk_hw_divider("frosc_div3", "frosc_div3_gate", base + 0x208, 16, 6);
+	clks[IMX8ULP_CLK_AUD_CLK1] = imx_clk_hw_mux2("aud_clk1", base + 0x900, 0, 3, aud_clk1_sels, ARRAY_SIZE(aud_clk1_sels));
+	clks[IMX8ULP_CLK_SAI4_SEL] = imx_clk_hw_mux2("sai4_sel", base + 0x904, 0, 2, sai45_sels, ARRAY_SIZE(sai45_sels));
+	clks[IMX8ULP_CLK_SAI5_SEL] = imx_clk_hw_mux2("sai5_sel", base + 0x904, 8, 2, sai45_sels, ARRAY_SIZE(sai45_sels));
+	clks[IMX8ULP_CLK_ENET_TS_SEL] = imx_clk_hw_mux2("enet_ts", base + 0x700, 24, 3, enet_ts_sels, ARRAY_SIZE(enet_ts_sels));
+
+	imx_check_clk_hws(clks, clk_data->num);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+}
+
+static int imx8ulp_clk_cgc2_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **clks;
+	void __iomem *base;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, IMX8ULP_CLK_CGC2_END),
+			   GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = IMX8ULP_CLK_CGC2_END;
+	clks = clk_data->hws;
+
+	/* CGC2 */
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (WARN_ON(IS_ERR(base)))
+		return PTR_ERR(base);
+
+	clks[IMX8ULP_CLK_PLL4_PRE_SEL] = imx_clk_hw_mux_flags("pll4_pre_sel", base + 0x610, 0, 1, pll_pre_sels, ARRAY_SIZE(pll_pre_sels), CLK_SET_PARENT_GATE);
+
+	clks[IMX8ULP_CLK_PLL4]	= imx_clk_hw_pllv4(IMX_PLLV4_IMX8ULP, "pll4", "pll4_pre_sel", base + 0x600);
+	clks[IMX8ULP_CLK_PLL4_VCODIV] = imx_clk_hw_divider("pll4_vcodiv", "pll4", base + 0x604, 0, 6);
+
+	clks[IMX8ULP_CLK_HIFI_SEL] = imx_clk_hw_mux_flags("hifi_sel", base + 0x14, 28, 3, hifi_sels, ARRAY_SIZE(hifi_sels), CLK_SET_PARENT_GATE);
+	clks[IMX8ULP_CLK_HIFI_DIVCORE] = imx_clk_hw_divider("hifi_core_div", "hifi_sel", base + 0x14, 21, 6);
+	clks[IMX8ULP_CLK_HIFI_DIVPLAT] = imx_clk_hw_divider("hifi_plat_div", "hifi_core_div", base + 0x14, 14, 6);
+
+	clks[IMX8ULP_CLK_DDR_SEL] = imx_clk_hw_mux_flags("ddr_sel", base + 0x40, 28, 3, ddr_sels, ARRAY_SIZE(ddr_sels), CLK_SET_PARENT_GATE);
+	clks[IMX8ULP_CLK_DDR_DIV] = imx_clk_hw_divider_flags("ddr_div", "ddr_sel", base + 0x40, 21, 6, CLK_IS_CRITICAL);
+	clks[IMX8ULP_CLK_LPAV_AXI_SEL] = imx_clk_hw_mux("lpav_sel", base + 0x3c, 28, 2, lpav_sels, ARRAY_SIZE(lpav_sels));
+	clks[IMX8ULP_CLK_LPAV_AXI_DIV] = imx_clk_hw_divider_flags("lpav_axi_div", "lpav_sel", base + 0x3c, 21, 6, CLK_IS_CRITICAL);
+	clks[IMX8ULP_CLK_LPAV_AHB_DIV] = imx_clk_hw_divider_flags("lpav_ahb_div", "lpav_axi_div", base + 0x3c, 14, 6, CLK_IS_CRITICAL);
+	clks[IMX8ULP_CLK_LPAV_BUS_DIV] = imx_clk_hw_divider_flags("lpav_bus_div", "lpav_axi_div", base + 0x3c, 7, 6, CLK_IS_CRITICAL);
+
+	clks[IMX8ULP_CLK_PLL4_PFD0] = imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "pll4_pfd0", "pll4_vcodiv", base + 0x614, 0);
+	clks[IMX8ULP_CLK_PLL4_PFD1] = imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "pll4_pfd1", "pll4_vcodiv", base + 0x614, 1);
+	clks[IMX8ULP_CLK_PLL4_PFD2] = imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "pll4_pfd2", "pll4_vcodiv", base + 0x614, 2);
+	clks[IMX8ULP_CLK_PLL4_PFD3] = imx_clk_hw_pfdv2(IMX_PFDV2_IMX8ULP, "pll4_pfd3", "pll4_vcodiv", base + 0x614, 3);
+
+	clks[IMX8ULP_CLK_PLL4_PFD0_DIV1_GATE] = imx_clk_hw_gate_dis("pll4_pfd0_div1_gate", "pll4_pfd0", base + 0x608, 7);
+	clks[IMX8ULP_CLK_PLL4_PFD0_DIV2_GATE] = imx_clk_hw_gate_dis("pll4_pfd0_div2_gate", "pll4_pfd0", base + 0x608, 15);
+	clks[IMX8ULP_CLK_PLL4_PFD1_DIV1_GATE] = imx_clk_hw_gate_dis("pll4_pfd1_div1_gate", "pll4_pfd1", base + 0x608, 23);
+	clks[IMX8ULP_CLK_PLL4_PFD1_DIV2_GATE] = imx_clk_hw_gate_dis("pll4_pfd1_div2_gate", "pll4_pfd1", base + 0x608, 31);
+	clks[IMX8ULP_CLK_PLL4_PFD2_DIV1_GATE] = imx_clk_hw_gate_dis("pll4_pfd2_div1_gate", "pll4_pfd2", base + 0x60c, 7);
+	clks[IMX8ULP_CLK_PLL4_PFD2_DIV2_GATE] = imx_clk_hw_gate_dis("pll4_pfd2_div2_gate", "pll4_pfd2", base + 0x60c, 15);
+	clks[IMX8ULP_CLK_PLL4_PFD3_DIV1_GATE] = imx_clk_hw_gate_dis("pll4_pfd3_div1_gate", "pll4_pfd3", base + 0x60c, 23);
+	clks[IMX8ULP_CLK_PLL4_PFD3_DIV2_GATE] = imx_clk_hw_gate_dis("pll4_pfd3_div2_gate", "pll4_pfd3", base + 0x60c, 31);
+	clks[IMX8ULP_CLK_PLL4_PFD0_DIV1] = imx_clk_hw_divider("pll4_pfd0_div1", "pll4_pfd0_div1_gate", base + 0x608, 0, 6);
+	clks[IMX8ULP_CLK_PLL4_PFD0_DIV2] = imx_clk_hw_divider("pll4_pfd0_div2", "pll4_pfd0_div2_gate", base + 0x608, 8, 6);
+	clks[IMX8ULP_CLK_PLL4_PFD1_DIV1] = imx_clk_hw_divider("pll4_pfd1_div1", "pll4_pfd1_div1_gate", base + 0x608, 16, 6);
+	clks[IMX8ULP_CLK_PLL4_PFD1_DIV2] = imx_clk_hw_divider("pll4_pfd1_div2", "pll4_pfd1_div2_gate", base + 0x608, 24, 6);
+	clks[IMX8ULP_CLK_PLL4_PFD2_DIV1] = imx_clk_hw_divider("pll4_pfd2_div1", "pll4_pfd2_div1_gate", base + 0x60c, 0, 6);
+	clks[IMX8ULP_CLK_PLL4_PFD2_DIV2] = imx_clk_hw_divider("pll4_pfd2_div2", "pll4_pfd2_div2_gate", base + 0x60c, 8, 6);
+	clks[IMX8ULP_CLK_PLL4_PFD3_DIV1] = imx_clk_hw_divider("pll4_pfd3_div1", "pll4_pfd3_div1_gate", base + 0x60c, 16, 6);
+	clks[IMX8ULP_CLK_PLL4_PFD3_DIV2] = imx_clk_hw_divider("pll4_pfd3_div2", "pll4_pfd3_div2_gate", base + 0x60c, 24, 6);
+
+	clks[IMX8ULP_CLK_CGC2_SOSC_DIV1_GATE] = imx_clk_hw_gate_dis("cgc2_sosc_div1_gate", "sosc", base + 0x108, 7);
+	clks[IMX8ULP_CLK_CGC2_SOSC_DIV2_GATE] = imx_clk_hw_gate_dis("cgc2_sosc_div2_gate", "sosc", base + 0x108, 15);
+	clks[IMX8ULP_CLK_CGC2_SOSC_DIV3_GATE] = imx_clk_hw_gate_dis("cgc2_sosc_div3_gate", "sosc", base + 0x108, 23);
+	clks[IMX8ULP_CLK_CGC2_SOSC_DIV1] = imx_clk_hw_divider("cgc2_sosc_div1", "cgc2_sosc_div1_gate", base + 0x108, 0, 6);
+	clks[IMX8ULP_CLK_CGC2_SOSC_DIV2] = imx_clk_hw_divider("cgc2_sosc_div2", "cgc2_sosc_div2_gate", base + 0x108, 8, 6);
+	clks[IMX8ULP_CLK_CGC2_SOSC_DIV3] = imx_clk_hw_divider("cgc2_sosc_div3", "cgc2_sosc_div3_gate", base + 0x108, 16, 6);
+
+	clks[IMX8ULP_CLK_CGC2_FROSC_DIV1_GATE] = imx_clk_hw_gate_dis("cgc2_frosc_div1_gate", "frosc", base + 0x208, 7);
+	clks[IMX8ULP_CLK_CGC2_FROSC_DIV2_GATE] = imx_clk_hw_gate_dis("cgc2_frosc_div2_gate", "frosc", base + 0x208, 15);
+	clks[IMX8ULP_CLK_CGC2_FROSC_DIV3_GATE] = imx_clk_hw_gate_dis("cgc2_frosc_div3_gate", "frosc", base + 0x208, 23);
+	clks[IMX8ULP_CLK_CGC2_FROSC_DIV1] = imx_clk_hw_divider("cgc2_frosc_div1", "cgc2_frosc_div1_gate", base + 0x208, 0, 6);
+	clks[IMX8ULP_CLK_CGC2_FROSC_DIV2] = imx_clk_hw_divider("cgc2_frosc_div2", "cgc2_frosc_div2_gate", base + 0x208, 8, 6);
+	clks[IMX8ULP_CLK_CGC2_FROSC_DIV3] = imx_clk_hw_divider("cgc2_frosc_div3", "cgc2_frosc_div3_gate", base + 0x208, 16, 6);
+	clks[IMX8ULP_CLK_AUD_CLK2]  = imx_clk_hw_mux2("aud_clk2", base + 0x900, 0, 3, aud_clk2_sels, ARRAY_SIZE(aud_clk2_sels));
+	clks[IMX8ULP_CLK_SAI6_SEL]  = imx_clk_hw_mux2("sai6_sel", base + 0x904, 0, 3, sai67_sels, ARRAY_SIZE(sai67_sels));
+	clks[IMX8ULP_CLK_SAI7_SEL]  = imx_clk_hw_mux2("sai7_sel", base + 0x904, 8, 3, sai67_sels, ARRAY_SIZE(sai67_sels));
+	clks[IMX8ULP_CLK_SPDIF_SEL] = imx_clk_hw_mux2("spdif_sel", base + 0x910, 0, 3, sai67_sels, ARRAY_SIZE(sai67_sels));
+	clks[IMX8ULP_CLK_DSI_PHY_REF] = imx_clk_hw_fixed("dsi_phy_ref", 24000000);
+
+	imx_check_clk_hws(clks, clk_data->num);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+}
+
+static int imx8ulp_clk_pcc3_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **clks;
+	void __iomem *base;
+	int ret;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, IMX8ULP_CLK_PCC3_END),
+			   GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = IMX8ULP_CLK_PCC3_END;
+	clks = clk_data->hws;
+
+	/* PCC3 */
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (WARN_ON(IS_ERR(base)))
+		return PTR_ERR(base);
+
+	clks[IMX8ULP_CLK_WDOG3] = imx8ulp_clk_hw_composite("wdog3", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xa8, 1);
+	clks[IMX8ULP_CLK_WDOG4] = imx8ulp_clk_hw_composite("wdog4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xac, 1);
+	clks[IMX8ULP_CLK_LPIT1] = imx8ulp_clk_hw_composite("lpit1", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xc8, 1);
+	clks[IMX8ULP_CLK_TPM4] = imx8ulp_clk_hw_composite("tpm4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xcc, 1);
+	clks[IMX8ULP_CLK_TPM5] = imx8ulp_clk_hw_composite("tpm5", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xd0, 1);
+	clks[IMX8ULP_CLK_FLEXIO1] = imx8ulp_clk_hw_composite("flexio1", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xd4, 1);
+	clks[IMX8ULP_CLK_I3C2] = imx8ulp_clk_hw_composite("i3c2", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xd8, 1);
+	clks[IMX8ULP_CLK_LPI2C4] = imx8ulp_clk_hw_composite("lpi2c4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xdc, 1);
+	clks[IMX8ULP_CLK_LPI2C5] = imx8ulp_clk_hw_composite("lpi2c5", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xe0, 1);
+	clks[IMX8ULP_CLK_LPUART4] = imx8ulp_clk_hw_composite("lpuart4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xe4, 1);
+	clks[IMX8ULP_CLK_LPUART5] = imx8ulp_clk_hw_composite("lpuart5", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xe8, 1);
+	clks[IMX8ULP_CLK_LPSPI4] = imx8ulp_clk_hw_composite("lpspi4", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xec, 1);
+	clks[IMX8ULP_CLK_LPSPI5] = imx8ulp_clk_hw_composite("lpspi5", pcc3_periph_bus_sels, ARRAY_SIZE(pcc3_periph_bus_sels), true, true, true, base + 0xf0, 1);
+
+	clks[IMX8ULP_CLK_DMA1_MP] = imx_clk_hw_gate("pcc_dma1_mp", "xbar_ad_divplat", base + 0x4, 30);
+	clks[IMX8ULP_CLK_DMA1_CH0] = imx_clk_hw_gate("pcc_dma1_ch0", "xbar_ad_divplat", base + 0x8, 30);
+	clks[IMX8ULP_CLK_DMA1_CH1] = imx_clk_hw_gate("pcc_dma1_ch1", "xbar_ad_divplat", base + 0xc, 30);
+	clks[IMX8ULP_CLK_DMA1_CH2] = imx_clk_hw_gate("pcc_dma1_ch2", "xbar_ad_divplat", base + 0x10, 30);
+	clks[IMX8ULP_CLK_DMA1_CH3] = imx_clk_hw_gate("pcc_dma1_ch3", "xbar_ad_divplat", base + 0x14, 30);
+	clks[IMX8ULP_CLK_DMA1_CH4] = imx_clk_hw_gate("pcc_dma1_ch4", "xbar_ad_divplat", base + 0x18, 30);
+	clks[IMX8ULP_CLK_DMA1_CH5] = imx_clk_hw_gate("pcc_dma1_ch5", "xbar_ad_divplat", base + 0x1c, 30);
+	clks[IMX8ULP_CLK_DMA1_CH6] = imx_clk_hw_gate("pcc_dma1_ch6", "xbar_ad_divplat", base + 0x20, 30);
+	clks[IMX8ULP_CLK_DMA1_CH7] = imx_clk_hw_gate("pcc_dma1_ch7", "xbar_ad_divplat", base + 0x24, 30);
+	clks[IMX8ULP_CLK_DMA1_CH8] = imx_clk_hw_gate("pcc_dma1_ch8", "xbar_ad_divplat", base + 0x28, 30);
+	clks[IMX8ULP_CLK_DMA1_CH9] = imx_clk_hw_gate("pcc_dma1_ch9", "xbar_ad_divplat", base + 0x2c, 30);
+	clks[IMX8ULP_CLK_DMA1_CH10] = imx_clk_hw_gate("pcc_dma1_ch10", "xbar_ad_divplat", base + 0x30, 30);
+	clks[IMX8ULP_CLK_DMA1_CH11] = imx_clk_hw_gate("pcc_dma1_ch11", "xbar_ad_divplat", base + 0x34, 30);
+	clks[IMX8ULP_CLK_DMA1_CH12] = imx_clk_hw_gate("pcc_dma1_ch12", "xbar_ad_divplat", base + 0x38, 30);
+	clks[IMX8ULP_CLK_DMA1_CH13] = imx_clk_hw_gate("pcc_dma1_ch13", "xbar_ad_divplat", base + 0x3c, 30);
+	clks[IMX8ULP_CLK_DMA1_CH14] = imx_clk_hw_gate("pcc_dma1_ch14", "xbar_ad_divplat", base + 0x40, 30);
+	clks[IMX8ULP_CLK_DMA1_CH15] = imx_clk_hw_gate("pcc_dma1_ch15", "xbar_ad_divplat", base + 0x44, 30);
+	clks[IMX8ULP_CLK_DMA1_CH16] = imx_clk_hw_gate("pcc_dma1_ch16", "xbar_ad_divplat", base + 0x48, 30);
+	clks[IMX8ULP_CLK_DMA1_CH17] = imx_clk_hw_gate("pcc_dma1_ch17", "xbar_ad_divplat", base + 0x4c, 30);
+	clks[IMX8ULP_CLK_DMA1_CH18] = imx_clk_hw_gate("pcc_dma1_ch18", "xbar_ad_divplat", base + 0x50, 30);
+	clks[IMX8ULP_CLK_DMA1_CH19] = imx_clk_hw_gate("pcc_dma1_ch19", "xbar_ad_divplat", base + 0x54, 30);
+	clks[IMX8ULP_CLK_DMA1_CH20] = imx_clk_hw_gate("pcc_dma1_ch20", "xbar_ad_divplat", base + 0x58, 30);
+	clks[IMX8ULP_CLK_DMA1_CH21] = imx_clk_hw_gate("pcc_dma1_ch21", "xbar_ad_divplat", base + 0x5c, 30);
+	clks[IMX8ULP_CLK_DMA1_CH22] = imx_clk_hw_gate("pcc_dma1_ch22", "xbar_ad_divplat", base + 0x60, 30);
+	clks[IMX8ULP_CLK_DMA1_CH23] = imx_clk_hw_gate("pcc_dma1_ch23", "xbar_ad_divplat", base + 0x64, 30);
+	clks[IMX8ULP_CLK_DMA1_CH24] = imx_clk_hw_gate("pcc_dma1_ch24", "xbar_ad_divplat", base + 0x68, 30);
+	clks[IMX8ULP_CLK_DMA1_CH25] = imx_clk_hw_gate("pcc_dma1_ch25", "xbar_ad_divplat", base + 0x6c, 30);
+	clks[IMX8ULP_CLK_DMA1_CH26] = imx_clk_hw_gate("pcc_dma1_ch26", "xbar_ad_divplat", base + 0x70, 30);
+	clks[IMX8ULP_CLK_DMA1_CH27] = imx_clk_hw_gate("pcc_dma1_ch27", "xbar_ad_divplat", base + 0x74, 30);
+	clks[IMX8ULP_CLK_DMA1_CH28] = imx_clk_hw_gate("pcc_dma1_ch28", "xbar_ad_divplat", base + 0x78, 30);
+	clks[IMX8ULP_CLK_DMA1_CH29] = imx_clk_hw_gate("pcc_dma1_ch29", "xbar_ad_divplat", base + 0x7c, 30);
+	clks[IMX8ULP_CLK_DMA1_CH30] = imx_clk_hw_gate("pcc_dma1_ch30", "xbar_ad_divplat", base + 0x80, 30);
+	clks[IMX8ULP_CLK_DMA1_CH31] = imx_clk_hw_gate("pcc_dma1_ch31", "xbar_ad_divplat", base + 0x84, 30);
+	clks[IMX8ULP_CLK_MU0_B] = imx_clk_hw_gate("mu0_b", "xbar_ad_divplat", base + 0x88, 30);
+	clks[IMX8ULP_CLK_MU3_A] = imx_clk_hw_gate("mu3_a", "xbar_ad_divplat", base + 0x8c, 30);
+
+	imx_check_clk_hws(clks, clk_data->num);
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+
+	imx_register_uart_clocks(1);
+
+	return ret;
+}
+
+static int imx8ulp_clk_pcc4_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **clks;
+	void __iomem *base;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, IMX8ULP_CLK_PCC4_END),
+			   GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = IMX8ULP_CLK_PCC4_END;
+	clks = clk_data->hws;
+
+	/* PCC4 */
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (WARN_ON(IS_ERR(base)))
+		return PTR_ERR(base);
+
+	clks[IMX8ULP_CLK_FLEXSPI2] = imx8ulp_clk_hw_composite("flexspi2", pcc4_periph_plat_sels, ARRAY_SIZE(pcc4_periph_plat_sels), true, true, true, base + 0x4, 1);
+	clks[IMX8ULP_CLK_TPM6] = imx8ulp_clk_hw_composite("tpm6", pcc4_periph_bus_sels, ARRAY_SIZE(pcc4_periph_bus_sels), true, true, true, base + 0x8, 1);
+	clks[IMX8ULP_CLK_TPM7] = imx8ulp_clk_hw_composite("tpm7", pcc4_periph_bus_sels, ARRAY_SIZE(pcc4_periph_bus_sels), true, true, true, base + 0xc, 1);
+	clks[IMX8ULP_CLK_LPI2C6] = imx8ulp_clk_hw_composite("lpi2c6", pcc4_periph_bus_sels, ARRAY_SIZE(pcc4_periph_bus_sels), true, true, true, base + 0x10, 1);
+	clks[IMX8ULP_CLK_LPI2C7] = imx8ulp_clk_hw_composite("lpi2c7", pcc4_periph_bus_sels, ARRAY_SIZE(pcc4_periph_bus_sels), true, true, true, base + 0x14, 1);
+	clks[IMX8ULP_CLK_LPUART6] = imx8ulp_clk_hw_composite("lpuart6", pcc4_periph_bus_sels, ARRAY_SIZE(pcc4_periph_bus_sels), true, true, true, base + 0x18, 1);
+	clks[IMX8ULP_CLK_LPUART7] = imx8ulp_clk_hw_composite("lpuart7", pcc4_periph_bus_sels, ARRAY_SIZE(pcc4_periph_bus_sels), true, true, true, base + 0x1c, 1);
+	clks[IMX8ULP_CLK_SAI4] = imx8ulp_clk_hw_composite("sai4", xbar_divbus, 1, false, false, true, base + 0x20, 1); /* sai ipg, NOT from sai sel */
+	clks[IMX8ULP_CLK_SAI5] = imx8ulp_clk_hw_composite("sai5", xbar_divbus, 1, false, false, true, base + 0x24, 1); /* sai ipg */
+	clks[IMX8ULP_CLK_PCTLE] = imx_clk_hw_gate("pctle", "xbar_divbus", base + 0x28, 30);
+	clks[IMX8ULP_CLK_PCTLF] = imx_clk_hw_gate("pctlf", "xbar_divbus", base + 0x2c, 30);
+	clks[IMX8ULP_CLK_USDHC0] = imx8ulp_clk_hw_composite("usdhc0", pcc4_periph_plat_sels, ARRAY_SIZE(pcc4_periph_plat_sels), true, false, true, base + 0x34, 1);
+	clks[IMX8ULP_CLK_USDHC1] = imx8ulp_clk_hw_composite("usdhc1", pcc4_periph_plat_sels, ARRAY_SIZE(pcc4_periph_plat_sels), true, false, true, base + 0x38, 1);
+	clks[IMX8ULP_CLK_USDHC2] = imx8ulp_clk_hw_composite("usdhc2", pcc4_periph_plat_sels, ARRAY_SIZE(pcc4_periph_plat_sels), true, false, true, base + 0x3c, 1);
+	clks[IMX8ULP_CLK_USB0] = imx8ulp_clk_hw_composite("usb0", nic_per_divplat, 1, false, false, true, base + 0x40, 1);
+	clks[IMX8ULP_CLK_USB0_PHY] = imx8ulp_clk_hw_composite("usb0_phy", xbar_divbus, 1, false, false, true, base + 0x44, 1);
+	clks[IMX8ULP_CLK_USB1] = imx8ulp_clk_hw_composite("usb1", nic_per_divplat, 1, false, false, true, base + 0x48, 1);
+	clks[IMX8ULP_CLK_USB1_PHY] = imx8ulp_clk_hw_composite("usb1_phy", xbar_divbus, 1, false, false, true, base + 0x4c, 1);
+	clks[IMX8ULP_CLK_USB_XBAR] = imx_clk_hw_gate("usb_xbar", "xbar_divbus", base + 0x50, 30);
+	clks[IMX8ULP_CLK_ENET] = imx8ulp_clk_hw_composite("enet", nic_per_divplat, 1, false, false, true, base + 0x54, 1);
+	clks[IMX8ULP_CLK_RGPIOE] = imx_clk_hw_gate("rgpioe", "nic_per_divplat", base + 0x78, 30);
+	clks[IMX8ULP_CLK_RGPIOF] = imx_clk_hw_gate("rgpiof", "nic_per_divplat", base + 0x7c, 30);
+
+	imx_check_clk_hws(clks, clk_data->num);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+}
+
+static int imx8ulp_clk_pcc5_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **clks;
+	void __iomem *base;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, IMX8ULP_CLK_PCC5_END),
+			   GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = IMX8ULP_CLK_PCC5_END;
+	clks = clk_data->hws;
+
+	/* PCC5 */
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (WARN_ON(IS_ERR(base)))
+		return PTR_ERR(base);
+
+	clks[IMX8ULP_CLK_DMA2_MP] = imx_clk_hw_gate("pcc_dma2_mp", "lpav_axi_div", base + 0x0, 30);
+	clks[IMX8ULP_CLK_DMA2_CH0] = imx_clk_hw_gate("pcc_dma2_ch0", "lpav_axi_div", base + 0x4, 30);
+	clks[IMX8ULP_CLK_DMA2_CH1] = imx_clk_hw_gate("pcc_dma2_ch1", "lpav_axi_div", base + 0x8, 30);
+	clks[IMX8ULP_CLK_DMA2_CH2] = imx_clk_hw_gate("pcc_dma2_ch2", "lpav_axi_div", base + 0xc, 30);
+	clks[IMX8ULP_CLK_DMA2_CH3] = imx_clk_hw_gate("pcc_dma2_ch3", "lpav_axi_div", base + 0x10, 30);
+	clks[IMX8ULP_CLK_DMA2_CH4] = imx_clk_hw_gate("pcc_dma2_ch4", "lpav_axi_div", base + 0x14, 30);
+	clks[IMX8ULP_CLK_DMA2_CH5] = imx_clk_hw_gate("pcc_dma2_ch5", "lpav_axi_div", base + 0x18, 30);
+	clks[IMX8ULP_CLK_DMA2_CH6] = imx_clk_hw_gate("pcc_dma2_ch6", "lpav_axi_div", base + 0x1c, 30);
+	clks[IMX8ULP_CLK_DMA2_CH7] = imx_clk_hw_gate("pcc_dma2_ch7", "lpav_axi_div", base + 0x20, 30);
+	clks[IMX8ULP_CLK_DMA2_CH8] = imx_clk_hw_gate("pcc_dma2_ch8", "lpav_axi_div", base + 0x24, 30);
+	clks[IMX8ULP_CLK_DMA2_CH9] = imx_clk_hw_gate("pcc_dma2_ch9", "lpav_axi_div", base + 0x28, 30);
+	clks[IMX8ULP_CLK_DMA2_CH10] = imx_clk_hw_gate("pcc_dma2_ch10", "lpav_axi_div", base + 0x2c, 30);
+	clks[IMX8ULP_CLK_DMA2_CH11] = imx_clk_hw_gate("pcc_dma2_ch11", "lpav_axi_div", base + 0x30, 30);
+	clks[IMX8ULP_CLK_DMA2_CH12] = imx_clk_hw_gate("pcc_dma2_ch12", "lpav_axi_div", base + 0x34, 30);
+	clks[IMX8ULP_CLK_DMA2_CH13] = imx_clk_hw_gate("pcc_dma2_ch13", "lpav_axi_div", base + 0x38, 30);
+	clks[IMX8ULP_CLK_DMA2_CH14] = imx_clk_hw_gate("pcc_dma2_ch14", "lpav_axi_div", base + 0x3c, 30);
+	clks[IMX8ULP_CLK_DMA2_CH15] = imx_clk_hw_gate("pcc_dma2_ch15", "lpav_axi_div", base + 0x40, 30);
+	clks[IMX8ULP_CLK_DMA2_CH16] = imx_clk_hw_gate("pcc_dma2_ch16", "lpav_axi_div", base + 0x44, 30);
+	clks[IMX8ULP_CLK_DMA2_CH17] = imx_clk_hw_gate("pcc_dma2_ch17", "lpav_axi_div", base + 0x48, 30);
+	clks[IMX8ULP_CLK_DMA2_CH18] = imx_clk_hw_gate("pcc_dma2_ch18", "lpav_axi_div", base + 0x4c, 30);
+	clks[IMX8ULP_CLK_DMA2_CH19] = imx_clk_hw_gate("pcc_dma2_ch19", "lpav_axi_div", base + 0x50, 30);
+	clks[IMX8ULP_CLK_DMA2_CH20] = imx_clk_hw_gate("pcc_dma2_ch20", "lpav_axi_div", base + 0x54, 30);
+	clks[IMX8ULP_CLK_DMA2_CH21] = imx_clk_hw_gate("pcc_dma2_ch21", "lpav_axi_div", base + 0x58, 30);
+	clks[IMX8ULP_CLK_DMA2_CH22] = imx_clk_hw_gate("pcc_dma2_ch22", "lpav_axi_div", base + 0x5c, 30);
+	clks[IMX8ULP_CLK_DMA2_CH23] = imx_clk_hw_gate("pcc_dma2_ch23", "lpav_axi_div", base + 0x60, 30);
+	clks[IMX8ULP_CLK_DMA2_CH24] = imx_clk_hw_gate("pcc_dma2_ch24", "lpav_axi_div", base + 0x64, 30);
+	clks[IMX8ULP_CLK_DMA2_CH25] = imx_clk_hw_gate("pcc_dma2_ch25", "lpav_axi_div", base + 0x68, 30);
+	clks[IMX8ULP_CLK_DMA2_CH26] = imx_clk_hw_gate("pcc_dma2_ch26", "lpav_axi_div", base + 0x6c, 30);
+	clks[IMX8ULP_CLK_DMA2_CH27] = imx_clk_hw_gate("pcc_dma2_ch27", "lpav_axi_div", base + 0x70, 30);
+	clks[IMX8ULP_CLK_DMA2_CH28] = imx_clk_hw_gate("pcc_dma2_ch28", "lpav_axi_div", base + 0x74, 30);
+	clks[IMX8ULP_CLK_DMA2_CH29] = imx_clk_hw_gate("pcc_dma2_ch29", "lpav_axi_div", base + 0x78, 30);
+	clks[IMX8ULP_CLK_DMA2_CH30] = imx_clk_hw_gate("pcc_dma2_ch30", "lpav_axi_div", base + 0x7c, 30);
+	clks[IMX8ULP_CLK_DMA2_CH31] = imx_clk_hw_gate("pcc_dma2_ch31", "lpav_axi_div", base + 0x80, 30);
+
+	clks[IMX8ULP_CLK_AVD_SIM] = imx_clk_hw_gate("avd_sim", "lpav_bus_div", base + 0x94, 30);
+	clks[IMX8ULP_CLK_TPM8] = imx8ulp_clk_hw_composite("tpm8", pcc5_periph_bus_sels, ARRAY_SIZE(pcc5_periph_bus_sels), true, true, true, base + 0xa0, 1);
+	clks[IMX8ULP_CLK_MU2_B] = imx_clk_hw_gate("mu2_b", "lpav_bus_div", base + 0x84, 30);
+	clks[IMX8ULP_CLK_MU3_B] = imx_clk_hw_gate("mu3_b", "lpav_bus_div", base + 0x88, 30);
+	clks[IMX8ULP_CLK_SAI6] = imx8ulp_clk_hw_composite("sai6", lpav_bus_div, 1, false, false, true, base + 0xa4, 1);
+	clks[IMX8ULP_CLK_SAI7] = imx8ulp_clk_hw_composite("sai7", lpav_bus_div, 1, false, false, true, base + 0xa8, 1);
+	clks[IMX8ULP_CLK_SPDIF] = imx8ulp_clk_hw_composite("spdif", lpav_bus_div, 1, false, false, true, base + 0xac, 1);
+	clks[IMX8ULP_CLK_ISI] = imx8ulp_clk_hw_composite("isi", lpav_axi_div, 1, false, false, true, base + 0xb0, 1);
+	clks[IMX8ULP_CLK_CSI_REGS] = imx8ulp_clk_hw_composite("csi_regs", lpav_bus_div, 1, false, false, true, base + 0xb4, 1);
+	clks[IMX8ULP_CLK_CSI] = imx8ulp_clk_hw_composite("csi", pcc5_periph_plat_sels, ARRAY_SIZE(pcc5_periph_plat_sels), true, true, true, base + 0xbc, 1);
+	clks[IMX8ULP_CLK_DSI] = imx8ulp_clk_hw_composite("dsi", pcc5_periph_plat_sels, ARRAY_SIZE(pcc5_periph_plat_sels), true, true, true, base + 0xc0, 1);
+	clks[IMX8ULP_CLK_WDOG5] = imx8ulp_clk_hw_composite("wdog5", pcc5_periph_bus_sels, ARRAY_SIZE(pcc5_periph_bus_sels), true, true, true, base + 0xc8, 1);
+	clks[IMX8ULP_CLK_EPDC] = imx8ulp_clk_hw_composite("epdc", pcc5_periph_plat_sels, ARRAY_SIZE(pcc5_periph_plat_sels), true, true, true, base + 0xcc, 1);
+	clks[IMX8ULP_CLK_PXP] = imx8ulp_clk_hw_composite("pxp", lpav_axi_div, 1, false, false, true, base + 0xd0, 1);
+	clks[IMX8ULP_CLK_GPU2D] = imx8ulp_clk_hw_composite("gpu2d", pcc5_periph_plat_sels, ARRAY_SIZE(pcc5_periph_plat_sels), true, true, true, base + 0xf0, 1);
+	clks[IMX8ULP_CLK_GPU3D] = imx8ulp_clk_hw_composite("gpu3d", pcc5_periph_plat_sels, ARRAY_SIZE(pcc5_periph_plat_sels), true, true, true, base + 0xf4, 1);
+	clks[IMX8ULP_CLK_DC_NANO] = imx8ulp_clk_hw_composite("dc_nano", pcc5_periph_plat_sels, ARRAY_SIZE(pcc5_periph_plat_sels), true, true, true, base + 0xf8, 1);
+	clks[IMX8ULP_CLK_CSI_CLK_UI] = imx8ulp_clk_hw_composite("csi_clk_ui", pcc5_periph_plat_sels, ARRAY_SIZE(pcc5_periph_plat_sels), true, true, true, base + 0x10c, 1);
+	clks[IMX8ULP_CLK_CSI_CLK_ESC] = imx8ulp_clk_hw_composite("csi_clk_esc", pcc5_periph_plat_sels, ARRAY_SIZE(pcc5_periph_plat_sels), true, true, true, base + 0x110, 1);
+	clks[IMX8ULP_CLK_RGPIOD] = imx_clk_hw_gate("rgpiod", "lpav_axi_div", base + 0x114, 30);
+	clks[IMX8ULP_CLK_DSI_TX_ESC] = imx_clk_hw_fixed_factor("mipi_dsi_tx_esc", "dsi", 1, 4);
+
+	imx_check_clk_hws(clks, clk_data->num);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+}
+
+static int imx8ulp_clk_probe(struct platform_device *pdev)
+{
+	int (*probe)(struct platform_device *pdev);
+
+	probe = of_device_get_match_data(&pdev->dev);
+
+	if (probe)
+		return probe(pdev);
+
+	return 0;
+}
+
+static const struct of_device_id imx8ulp_clk_dt_ids[] = {
+	{ .compatible = "fsl,imx8ulp-pcc3", .data = imx8ulp_clk_pcc3_init },
+	{ .compatible = "fsl,imx8ulp-pcc4", .data = imx8ulp_clk_pcc4_init },
+	{ .compatible = "fsl,imx8ulp-pcc5", .data = imx8ulp_clk_pcc5_init },
+	{ .compatible = "fsl,imx8ulp-cgc2", .data = imx8ulp_clk_cgc2_init },
+	{ .compatible = "fsl,imx8ulp-cgc1", .data = imx8ulp_clk_cgc1_init },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, imx8ulp_clk_dt_ids);
+
+static struct platform_driver imx8ulp_clk_driver = {
+	.probe	= imx8ulp_clk_probe,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= imx8ulp_clk_dt_ids,
+	},
+};
+module_platform_driver(imx8ulp_clk_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX8ULP clock driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

