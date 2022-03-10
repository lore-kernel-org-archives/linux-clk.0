Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70F4C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 10 Mar 2022 09:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbiCJJVl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Mar 2022 04:21:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiCJJVl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Mar 2022 04:21:41 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B3C139815
        for <linux-clk@vger.kernel.org>; Thu, 10 Mar 2022 01:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG+IymXfncsd6xVFxHtwbfRo/PTLXPnDmisQl7Hz7CbPLTGNz75j7grJVOI8Cw9TfMq6HSQZno+CynEnrDs9SlAGnvc0DdSFY5kJM4seOLkU6sIAVL99S0NySTzaZPNTTG60okdDuXvKCV0Fn/AQH5IJLLSBm1qNYyqCqv5gTFJWh1wRuYeDePtvlqpIPidkfojens2ktFURL4muO9+wPWAUlp/1Cja8+tK+HpPQv2M4pzH2pPfCCw4lyhxfhN1Wgzan3sOgPoljv+Qeb6W2U3UZ8dJaE8nbNZJ1nJyzp7ORfo+pITbXCCC9T3F31um7fz0eA1W+ZEwzS7poXqcLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqQSfNyV6bVUBH759LAmSgPmwRVCfNqMZOgQC/WHvj8=;
 b=DqF0GIDO6T3iCprSL2P3b+5HAAqhKNV1+ZcxWlDakdrF9YARL1xuDILwPiVqFC05Y2iTcmzu3bdYIDq0G2NUX9jO0KpUmg5igDnOmN3Sndp1QXmaR9Il+Hb/SH5FLmtJ9CBdqbUaKI9XzVXiSW7oIZQUD/Rwl6UBbcFaH2YNpHMkJvVMmjdbYbCmLYTyiY0KFApLzDpCBsxwAd8rrAo11wqtDkJ5FeMhNI/AAKOdp6WYS0JtrL4l36fVXco1dthvnbQ7HWT8x/hChCUI32kPfJGf/cbRtiQ4JV1FQSsxgAcZb/HPCnZQzAjIIjx+pvjJtFTkJlRHlpLaQA4rcHOSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqQSfNyV6bVUBH759LAmSgPmwRVCfNqMZOgQC/WHvj8=;
 b=CmBTZ1Z51mvx5aVbOdr+Lxc/Tu0cdrh72Dr/2H2EE96jxdxd+Ma0lnGfrOE91zmX1P9rd3t6hQ4nC2ZoOO8jkLhryzVTqUUAVIfOpwGHJXRPYBQjpvwwkAVflq4w/dyyksHTYIl4VCPZUvwpDjK2NMdWZrNv/v9sqezWREQkH9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9)
 by PA4PR04MB7984.eurprd04.prod.outlook.com (2603:10a6:102:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 09:20:37 +0000
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::4da8:6419:c67:3ec7]) by DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::4da8:6419:c67:3ec7%2]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 09:20:37 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org
Cc:     festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: [PATCH v2] clk: imx: Remove the snvs clock
Date:   Thu, 10 Mar 2022 17:34:04 +0800
Message-Id: <20220310093404.236966-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To DB9PR04MB8412.eurprd04.prod.outlook.com
 (2603:10a6:10:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9000180-6f4c-4e39-0848-08da02773cfa
X-MS-TrafficTypeDiagnostic: PA4PR04MB7984:EE_
X-Microsoft-Antispam-PRVS: <PA4PR04MB79841C9C83C5EC498FA0D93A870B9@PA4PR04MB7984.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fyA1lDFYup1WqPEY9yNz61Khk3zfBE0m4ZwP/fZF/O0UX62LXg/Ct87Igv74ttOupmI8DthHlFIH+qv8QzBAo9F1EYQcKj5jfmNERn/dRTO9q4nJbDAsBoRcxkEZp5MKO5pilmx6WchZBfnT6oWWI2p8698qhYpEKWxwHSOvJ24eW3RJqTpHzn6x4SjlQNpNOQLH39P3RLHHb7jW1qRUhpVDfbYd99Oylwzm5SOyWOoc8JcANSpbuIi8wRzOKWD4XCM/W7g5c8pxcLkeVQux8GJx8CEhICL8yWu2UwTIJu5y5pT5nB8eNR3BZr4eNIavhiRPDXZT2BpKxy8XvkKAK6VNEXJCl2p6PZAG89Ft3Qd7P5c0V5CUK0LHCE+F+a3VNV/UUjxF0J+e0380GVP+SzmkLBoj7hpApPZB6UFPyWtw86J3yDaPCImY1R5Pk0mGEsHRmDNKDe96i2kKnEF6flZbS181nrGdh+tE426+x1Hn4qmWgx+O2AZGDp3qd1Qk+CbV5kgljJjGiK2vIa/pJeijp0PDpesgPTP8ZC0nwikkV5N1b42BTJdcHTb4UOwou1uNrCHP6NSll9fhatdZpGKNqGeamB2CNKJD4vmvOMRJyh4fMnvxFL+To01CGpy6AUGQx4Yi1/5t2ZdR7mff2RYEB6elrhO6k7+wwWB4nKp1+6pryLbtkpDxJ+NMXd/DzEDOlmemTEU6EzvJVpPhQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8412.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(6666004)(66476007)(66556008)(2906002)(38100700002)(8676002)(4326008)(6512007)(66946007)(8936002)(38350700002)(5660300002)(2616005)(1076003)(26005)(186003)(6486002)(86362001)(52116002)(316002)(6506007)(36756003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kcaiSgQJ+6Wafz7frkSh/V1woTRQWX+oIXEaEKTUPSx8nIqUeDhE6CGM0Kbr?=
 =?us-ascii?Q?VI/aLHqNfxZA/eTJ8XYlPov5Fcbgx5mCtMm3AMBZZtQTjI5ZDi9yYX6bmZg5?=
 =?us-ascii?Q?tZ3sawEVVwoyIbAv+cea4Q6YLzMSDfLkB2D+hsPfmDWcA19WrFukPzVy5wSU?=
 =?us-ascii?Q?UASNZzjK0FW2J553pNgRLS4Vp+dnXnX0R/TeXTSTqblYtustRyNII8Q14jyW?=
 =?us-ascii?Q?aQpjQoQWUsICSJEP3i3BIsawurWkzLnBgCve59aeW6frLWB6euhxF8rzqWI7?=
 =?us-ascii?Q?ItFA5/5/ufBP29VCPobvVCYuF2jzqJSjFslU2gAITqx++pGV8noK4t4uhThu?=
 =?us-ascii?Q?imlmMe2l+M5TV/80pEGX5bOBlhQerl9bgJ14FpJRl0bYaXOVMkaFo/ou8jOZ?=
 =?us-ascii?Q?xkRNhiJTtNmxQszBn1rF5kaAC2gUNNQG5Ztm6lHS8KaWTVGnvQsqhVDhbwkL?=
 =?us-ascii?Q?mAhUX/UPydhLJwHQ8ugVPcpoVxFI/kqV4od1tur6EDfoFfuV4GKugyZIWmMj?=
 =?us-ascii?Q?fxj07TDzH3W63dXUd3qzxMfGAxznsj2QZ1hYUT9h9R5VQgS7GvHIkZaDnDAr?=
 =?us-ascii?Q?0rpWSYneFpd7rsVI3/T6JvvxMk4kIQzaZm03ikdxwfwhfOfYMOMg08kVP7zL?=
 =?us-ascii?Q?535xls5eFRCZXa44wxXZ03Gp7qVdON3W84cdvD60CqEK7JP8t4191wTE0dDX?=
 =?us-ascii?Q?U8LihES8OOWqEiL6faqX4k3BtvQMvCDlMAl7qR38ekEMl9O75SHvtNpRbYBF?=
 =?us-ascii?Q?/N/ulI+8685HXWWxY1Od2D3zQbZjBHNpsHMfFvyXrJzxLCLD6Ml564PM7bFM?=
 =?us-ascii?Q?3zft4u2bXmkL67L6P5iuIzU3hmP+B7tlxbqijPJ7RABhPTqpqpYlCyUH9aXu?=
 =?us-ascii?Q?dcBEmbFzT1wiFvlI3FzMmXlFzOQAw51xYIeZ/cgPHveybB3nIJhlGvoFtqRV?=
 =?us-ascii?Q?iwrGqmIXeXXHyFcd/yzcO0CSyo0hT9HCqQIHou6siT9S6DqoQMnjVVNgfEAz?=
 =?us-ascii?Q?4IPSXssGbABvzrvuykf+00zTClJZS49s/70wCm/CjR5D26ABPh2TNFBC1eYT?=
 =?us-ascii?Q?M4OunICpgJHtTm/qxEXZhawN4XTGuoeSvY5iq6MsWMPp4DumYfF0p3kCYtjH?=
 =?us-ascii?Q?uzGOd7OB/3nT6mL8bFX/mn5R79DXY4eISY4yjHv0dT0qlKGfqM8lE2TCWSGc?=
 =?us-ascii?Q?y374+M5N7t3UVB8Po3Fl6r3yUy3Sl9vJy1Uf207AMkCuTD6H4q8btHmhBhQY?=
 =?us-ascii?Q?+deGdiUwHUjTXh0vzYB2r7fhqUnLxqQdv1yLowRWZD6sTrNvKFhdghgGGoeA?=
 =?us-ascii?Q?Gfc0YB721KNbtqmiVOq5bKjo5APZTsXqo299HdKeL9R/VEVU2HKC23dwyVgp?=
 =?us-ascii?Q?OWR6f7DakNFQp37mwtK15uKESRVw10aQPmGKck6W/DDM9nW0axdSOtJTY5tL?=
 =?us-ascii?Q?fAmTtKLsK6J+Y8TxijICCp/uBeP2qZ2X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9000180-6f4c-4e39-0848-08da02773cfa
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8412.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 09:20:37.6385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fW4a4alOjLaRCQSUh5B/JD18an4g2AkEdfPj8ZtO41qPNhbOiRw5oW24tn3A2cIDro9wl5AF7Ij457FvwtHZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7984
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SNVS moudule is not used only by the linux, it may also used
by other SW component is secure world. No sense to populate it
in linux, so remove it.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 v2 changes:
 - remove the SNVS clock rather than mark it CRITICAL as suggested by Stephen
---
 drivers/clk/imx/clk-imx7d.c  | 1 -
 drivers/clk/imx/clk-imx8mm.c | 1 -
 drivers/clk/imx/clk-imx8mn.c | 1 -
 drivers/clk/imx/clk-imx8mp.c | 1 -
 drivers/clk/imx/clk-imx8mq.c | 1 -
 5 files changed, 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 3f6fd7ef2a68..cbf8131c63f7 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -782,7 +782,6 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	hws[IMX7D_DRAM_PHYM_ALT_ROOT_CLK] = imx_clk_hw_gate2_flags("dram_phym_alt_root_clk", "dram_phym_alt_post_div", base + 0x4130, 0, CLK_IS_CRITICAL | CLK_OPS_PARENT_ENABLE);
 	hws[IMX7D_DRAM_ALT_ROOT_CLK] = imx_clk_hw_gate2_flags("dram_alt_root_clk", "dram_alt_post_div", base + 0x4130, 0, CLK_IS_CRITICAL | CLK_OPS_PARENT_ENABLE);
 	hws[IMX7D_OCOTP_CLK] = imx_clk_hw_gate4("ocotp_clk", "ipg_root_clk", base + 0x4230, 0);
-	hws[IMX7D_SNVS_CLK] = imx_clk_hw_gate4("snvs_clk", "ipg_root_clk", base + 0x4250, 0);
 	hws[IMX7D_MU_ROOT_CLK] = imx_clk_hw_gate4("mu_root_clk", "ipg_root_clk", base + 0x4270, 0);
 	hws[IMX7D_CAAM_CLK] = imx_clk_hw_gate4("caam_clk", "ipg_root_clk", base + 0x4240, 0);
 	hws[IMX7D_USB_HSIC_ROOT_CLK] = imx_clk_hw_gate4("usb_hsic_root_clk", "usb_hsic_post_div", base + 0x4690, 0);
diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index e8cbe181ec06..4f01be021503 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -560,7 +560,6 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MM_CLK_SAI5_IPG] = imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x4370, 0, &share_count_sai5);
 	hws[IMX8MM_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &share_count_sai6);
 	hws[IMX8MM_CLK_SAI6_IPG] = imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x4380, 0, &share_count_sai6);
-	hws[IMX8MM_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", base + 0x4470, 0);
 	hws[IMX8MM_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
 	hws[IMX8MM_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
 	hws[IMX8MM_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 92fcbab4f5be..44b697c9b2ac 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -522,7 +522,6 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_CLK_SAI5_IPG] = imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x4370, 0, &share_count_sai5);
 	hws[IMX8MN_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &share_count_sai6);
 	hws[IMX8MN_CLK_SAI6_IPG] = imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x4380, 0, &share_count_sai6);
-	hws[IMX8MN_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", base + 0x4470, 0);
 	hws[IMX8MN_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
 	hws[IMX8MN_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
 	hws[IMX8MN_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 18f5b7c3ca9d..2cc69919b6fc 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -654,7 +654,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_SIM_ENET_ROOT] = imx_clk_hw_gate4("sim_enet_root_clk", "enet_axi", ccm_base + 0x4400, 0);
 	hws[IMX8MP_CLK_GPU2D_ROOT] = imx_clk_hw_gate4("gpu2d_root_clk", "gpu2d_core", ccm_base + 0x4450, 0);
 	hws[IMX8MP_CLK_GPU3D_ROOT] = imx_clk_hw_gate4("gpu3d_root_clk", "gpu3d_core", ccm_base + 0x4460, 0);
-	hws[IMX8MP_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", ccm_base + 0x4470, 0);
 	hws[IMX8MP_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", ccm_base + 0x4490, 0);
 	hws[IMX8MP_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", ccm_base + 0x44a0, 0);
 	hws[IMX8MP_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", ccm_base + 0x44b0, 0);
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 83cc2b1c3294..fb7a8aef6187 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -557,7 +557,6 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MQ_CLK_SAI5_IPG] = imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x4370, 0, &share_count_sai5);
 	hws[IMX8MQ_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &share_count_sai6);
 	hws[IMX8MQ_CLK_SAI6_IPG] = imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x4380, 0, &share_count_sai6);
-	hws[IMX8MQ_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", base + 0x4470, 0);
 	hws[IMX8MQ_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
 	hws[IMX8MQ_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
 	hws[IMX8MQ_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
-- 
2.26.2

