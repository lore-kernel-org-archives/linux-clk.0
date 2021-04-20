Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FAAC433ED
	for <linux-clk@archiver.kernel.org>; Tue, 20 Apr 2021 05:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B27961007
	for <linux-clk@archiver.kernel.org>; Tue, 20 Apr 2021 05:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhDTFpv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Apr 2021 01:45:51 -0400
Received: from mail-eopbgr80049.outbound.protection.outlook.com ([40.107.8.49]:46110
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229843AbhDTFpu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Apr 2021 01:45:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieowY4y8s8amUb8BKrUj7DMCNuWa2TKfHCJ2HNf9x1nEhckJM19bBuOij5vvA+O5F0l2Utugo06JuhBfRX1REy7iDnRS8zt99AiwUfKWjGmmM1tWX55O8IUkwc7K0uhE/T8wkxI1ykDng1RTuHo8IyRs4uZedzc4cVI3YbVaZuSjmv0rGWoh9PCuL/cZQXRuOryIeVvHza7iG6PWo7uelEK85z52lzXodQk4tGguQiF7QEu/4IiiuEiq/DKWIaOKE1Z5TQBhLjOiVBy01T8zk1S56xubhG/5zqDq/eHwTiXDEBBgYd+J6Kl8YpiJET+WfEFQm0ZiR5lHoT0NcekMag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LhGjzwwDuD6hKf1llzoxPSu68LXYfgv/hMbYEZY4L4=;
 b=Nf8XglBisseIpYMfu+iA4DL7aXIL8Za2mPAQfUxrgRKz4idFHTUZyBELO5q99vCUE3KxpBw09LT/TALy7WPPnBJZzOyuHyKYmbhboLDgoyvaHlizctqQGcWMx57BnNeM8WdfDOviit0+7fVXC98xLfVBEaEWfgYP7SoYb90KFCMqKGYmktRUT03hh7rjslDyyWQL833HaWn0RbS5mPHn5DwswdZNyjbnN8jrbLJWa7av3hCOxjpeLbfRRyqnSv+l8HQ54dwfJNhrclnv6DNBN/dxyM8BqPe8EY5kWqSkxyRUYGm3Z3AhGjeehBumsIWgCcrHcRU6KnOomHeEPD/OUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LhGjzwwDuD6hKf1llzoxPSu68LXYfgv/hMbYEZY4L4=;
 b=dIIuG+25lFzFP+FWjpcgtw+T4UdSetqNiUdTGpG5SuGBf/qOK73DvbJvfMrwwM81gAq7fqZSKFBmwr6hPOz8gkoWouc6VK7Z3HUoRhJeXN0iFyi1jUSFHIkQ4WGr07MDrWa8QgAe0sdDvizH1lM+byRdje3B7hcktNslZ/lvH2I=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB6PR04MB3013.eurprd04.prod.outlook.com (2603:10a6:6:4::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Tue, 20 Apr 2021 05:45:17 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274%5]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 05:45:17 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com,
        s.hauer@pengutronix.de, sboyd@kernel.org
Cc:     festevam@gmail.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v2 2/2] clk: imx: Remove the audio ipg clock from imx8mp
Date:   Tue, 20 Apr 2021 13:54:53 +0800
Message-Id: <20210420055453.1235297-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210420055453.1235297-1-ping.bai@nxp.com>
References: <20210420055453.1235297-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR03CA0045.apcprd03.prod.outlook.com
 (2603:1096:202:17::15) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR03CA0045.apcprd03.prod.outlook.com (2603:1096:202:17::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.6 via Frontend Transport; Tue, 20 Apr 2021 05:45:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd72d71e-c914-4e82-0f6b-08d903bf7a35
X-MS-TrafficTypeDiagnostic: DB6PR04MB3013:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3013720D47B79CB32B0A4A3687489@DB6PR04MB3013.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HWi1ZgSePn2pIf5rxxIgBDwSPv0JIYGH8cm2ok3OUzcVCJxvqwLWVMDkINkgz5zNm2434NwwaetNtORy0dQ/qysaAFjxzRybWkYLCF+P6+ABY2s3OufDUKAhFaSKk7/bX5qwy2oqblqlBn1CX0zZAHv8RvzfHaSJmdb0aX0n6MMB7bJvR950uCRwyO3vROmU5rgJvOx1gtY2vBTkAt63cWZd5jguF/1PMO/UzBwlJzjw68lMxjy7+lIjJddOYHnwLhWclnBlR5TviVcQ6EyIJfoJ5RCKUDEiLbEvLSreBIY6fWcfFY5v/Odz7zRDpvqK49HFxJm5fLw2Nu1Fki3BywZlZzYgU4365/L3s4FxRIJDSuE0+vaEJcjdBTxJTcteMXMhN2Ub7V4bisTZXTlW96V9aNGXjaeKcS2Qff2eD7qVcU4OHk80b0DIxFUhn90quMUO3ly/4NP7E1jPY7yfn7/qJRWIoitDDp16+3fN/hfGdOvcReZUwiC2Yf+tcDsf1S0362TiMSq+k20EXwkztw5A1ZPcxJkWQTMPD3YPkfeIxaMlAImewugRF38xNax9trJM1U5gCRr6E0ny+7w8eW19zZULt5QlLgESu5At7RV2vC2uDr2b4QW+++Esgir6em3/Gqfq0W7jbjBJXLzh/eGeUkv2EqhKL7h0Z0cggvrzvvQAoP5cIabZ8WJxowjdyAn71wr2YAgu8a04hs9MoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(186003)(1076003)(16526019)(38100700002)(52116002)(26005)(316002)(38350700002)(86362001)(6506007)(83380400001)(956004)(6486002)(2616005)(6666004)(66556008)(66476007)(8676002)(36756003)(6512007)(4326008)(5660300002)(2906002)(8936002)(66946007)(478600001)(69590400013)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AX9XLwzLgqgcG1YNMUtyOwj20uKwReEuaW/KHrPYpBm4w8CxWKbxgZbhRgX5?=
 =?us-ascii?Q?69c2hDsuevqCVJ26YypOXW8bOY/TT2Z1aOmMD2lRsax3XGSwi9C98PFxCyJ8?=
 =?us-ascii?Q?6xPUUMQGZjXuCAfpLy/HaOTNFL1R5cLV4Uep5UFFMmiWyDl7uIe7Dhth8MnV?=
 =?us-ascii?Q?wzfISasFImrRB7fbk8ngfNCPldcW70NoBwU+1EtaKbrr7q1lF8+g/RZfD6El?=
 =?us-ascii?Q?vui0pIbfLR5fES1IQBZ6AxJl8UUZyQ580jCwKmMN7G3Zgsq+pQrE+6iqWYg3?=
 =?us-ascii?Q?QuxznioLyAdM3AcRY7bSZCHLni74+c5qDdSlhnB9OVQ1gOQegalgYMRioZFN?=
 =?us-ascii?Q?9dp5TOv2X0Rdi5SSrhOhLGpX64Z693gCGWUyox9w4hSzR0raY1pWriD0od+U?=
 =?us-ascii?Q?Kr2uEPK2d+mAJxfexl9sXew3GVDW3QQzGxcpWVUyORbSUkL/KV2gOKeih4L9?=
 =?us-ascii?Q?PNjj91Lir2wzaNNKSUdgozsT8ij7uY2vJFfh1ZVVCQWrwVcAo7gZKT/xTkRj?=
 =?us-ascii?Q?Ql/BLklSjty+8oq+Uc20dqeI52pdTtlt3SGuxpDkYJZrKJHShIvJuGoGHo4S?=
 =?us-ascii?Q?/hRKFt/Fmlh+HXmoQr7CyBWsO1M4xS9ypJ7OP2V0wedbcgZSrtoI110zNVNJ?=
 =?us-ascii?Q?c5CYlMoKiuaVVtJEwRN3pUXauYoP/9q5sR0Cs1Iqn0aUDxydSR6k2G1dsEMB?=
 =?us-ascii?Q?5E1VAddX2TP4kU2Uep47Vc1NYkFLGEuwr+Q5/krmZw9hFmzcqFVehtem23ER?=
 =?us-ascii?Q?B3cd93rfOOB1kOn88AEwsBbb0azzh5U/2CH5ahkxle1yxl2YjQs/SI8Xye6w?=
 =?us-ascii?Q?3ErJ+S93Yw5aTUFitLHr0SEo7WINBIbF1+vYm3BlNyElFOQxe9AFcRWrFdfg?=
 =?us-ascii?Q?RhdVLOgA1Qd8eKHgzj9P5gnVz6m3GpS7O59zt8Kk9yl7mhVAQQIyueQyeuvq?=
 =?us-ascii?Q?jtlmEQ3ES3keH4KYbi5d45X+iaRGI/InvxEGQ9m0O49CwGgDhPRChjSZVRKg?=
 =?us-ascii?Q?p/Um6gwdChxtSkl0D9/fZRBKA1ThEBsGIKweHy59GNf4b4rog+2+jz0DrJvp?=
 =?us-ascii?Q?7YFttChuxJE/6pWEZYuAjguUp7iEI+Y624J8t4lqegsqEl7On/TA6+Qo+egF?=
 =?us-ascii?Q?Xtg9aS8fnnK/CYTRS2XuFggN3DAH0EWJ6VMrSGdryo9s0GDAFEnCTv5QO/JO?=
 =?us-ascii?Q?lE0Q/MqG5Muy0soAJ7L+jh+nxYlMVEwZQnzNBwAFtG9S0vKeiu+flIqRxNTA?=
 =?us-ascii?Q?/druIjJI7eTKK3dhdIM3QjsSGq5NtVRokX0G9Ew5dEaAYSfs0k3m7Uv07rNq?=
 =?us-ascii?Q?fSZXListkoylzcYN286xS/4g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd72d71e-c914-4e82-0f6b-08d903bf7a35
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 05:45:17.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aV7dPhVtldnSxqdSRE7dTJ9mD5OgAdTAPfT2vw19sOb4vdoQ2mp2lKh7lCpTL6pMQyj7jX1DFgZc2EeJtk+3gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3013
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is no audio ipg clock on i.MX8MP, so remove this from
the clock driver.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
- changes v2:
  keep the clock binding define no changes to fix the cross tree
  dependency with dts.
---
 drivers/clk/imx/clk-imx8mp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index e39c9c907c38..12837304545d 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -556,7 +556,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_MIPI_DSI_ESC_RX] = imx8m_clk_hw_composite_bus("mipi_dsi_esc_rx", imx8mp_mipi_dsi_esc_rx_sels, ccm_base + 0x9200);
 
 	hws[IMX8MP_CLK_IPG_ROOT] = imx_clk_hw_divider2("ipg_root", "ahb_root", ccm_base + 0x9080, 0, 1);
-	hws[IMX8MP_CLK_IPG_AUDIO_ROOT] = imx_clk_hw_divider2("ipg_audio_root", "audio_ahb", ccm_base + 0x9180, 0, 1);
 
 	hws[IMX8MP_CLK_DRAM_ALT] = imx8m_clk_hw_composite("dram_alt", imx8mp_dram_alt_sels, ccm_base + 0xa000);
 	hws[IMX8MP_CLK_DRAM_APB] = imx8m_clk_hw_composite_critical("dram_apb", imx8mp_dram_apb_sels, ccm_base + 0xa080);
-- 
2.26.2

