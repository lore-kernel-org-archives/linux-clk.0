Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FC3C25B06
	for <linux-clk@archiver.kernel.org>; Wed,  3 Aug 2022 08:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235533AbiHCIQM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Aug 2022 04:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233600AbiHCIQI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 04:16:08 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A894B60E2;
        Wed,  3 Aug 2022 01:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byhP3xUVkJBGiInxdW6SdLfOqwzXBE5jQS3rnIViZTzH6PC6LXtmMBopxm/9ajLQYBDJ0H9owWvFgIEAdtEMSVadvVqr+1oF1TIlbxoqja0L1RT5ulCp0oC6IMpGN5gVdhJ8rrwYgQ6EYi67O1TbnA0MGYjbt3A4cphxKNgmqD/Xp42VbhOCEd9NkhJ3Cemf/WhHQjkYi7SXid//TP2+t/ladeCwM7iYxy/8UOL4w8pneZ7f38HGqPfNG5/8SO3//ZK5lAqPrYwrb7aGPHAF+gy9oi1bVF1mQ4iO7CnFGyK0gTKT5fksTGNK6/M55aHu2ozKeeRs5Rkwe6JVvh/uWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPJgIW5XJuo0dMLPDFxnjqk//Y1tzsk3x+vJ9RwdTqc=;
 b=YANPMft0fG/8YNnxxS2S/rxiVKvox+vXI8S3GwUBLbUgLHGKptCg3NYU3aEN8z6wOgEtUl14yWCDKaecpf6U/RzLRLgtZkXrIhIRDFXTOhtxphLDPCUiFI/fmmcJZIQm1iHerpLWOQmiuwSpPc0D3qMcxi3iZVdFZPHaidJlAVxSOLtkoeD6zZ6FYIeDZ5jCp0W3NYYUFf6QnWBHxXawYhwOuj5dz3GurD5DMiAvFhTDWOvol+6wQQVHyWk21JxObQeSJGA2MXqNre5xT9dOqRnRhb2TrzYVONR/zD9E3ZR9y7O5yNge+z4O0+fHcBrwTv1ybi6O4VxtkHE0rEZNhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPJgIW5XJuo0dMLPDFxnjqk//Y1tzsk3x+vJ9RwdTqc=;
 b=RAumiJ1QL3EPRXZVjGSuVVr6Qyn1+xfAWmX60U75flrnq5PjfNVAQhHwsA00CAbFux0O2XFIeV5txiSszoWU0WHk0tWcuOZiq5qBkFbjYNBAhQ4dQyzMUTQ2oDijMIMsN00SCHnV4Ab5gBAtKq0hI54eiwQACq6RhoO0CR2jOCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB6PR04MB3127.eurprd04.prod.outlook.com (2603:10a6:6:c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.25; Wed, 3 Aug 2022 08:16:05 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 08:16:05 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 6/7] clk: imx93: add MU1/2 clock
Date:   Wed,  3 Aug 2022 16:17:12 +0800
Message-Id: <20220803081713.3504699-7-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b213b317-2275-4f74-f6ae-08da752868fe
X-MS-TrafficTypeDiagnostic: DB6PR04MB3127:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5gNKoVKd9MeWkaWFZUzLVU1QT6hq8WlrGyCzidPYrFCiVmTerW+1AR/kOQ6lMoLQc12rP0dQZ9O7LlqVZXDSwSrGTbXSP5EHuKiv9YTFupX9MPErsHGbPpluxrB/h+0txJ27t1z2i669PQ8ZaI1SOzhuLVJdsWnvK+Ckkr2axdKJdoWDqnuae2Nxt6xxgoZ+bzD8CElBiLCdrUX+gcr2bgylJsbuKtae03yu7MnR/mLJyhkcBxntj9QCFa2wfbZs1mOirmihL+fowbKP8Q1xmRLywAhhybLptGLnJHEHiwBcQTqvlJKrN6AEUwUIAAZRH+aC6GfVyjL6oU7RtaZEDuoAmBK58fECoi95HdWVxgb1op38pupQOmOk8zYjle8KX9/ljoS6iZVcYtWt8IKR5j/xF51PVocLYjJRCa2DTL2aCS9Rz7/GDwIWkpuSPwtMFvv46ubV5JTv2ej2ED3nRY61ixOX6P0rTHO8JJv7V+8ZbHpYtUQSVTR0fga8w8cP6KdG16Gruus+bN3PD0gcbbWJgtcFzUKmWbknHLd5FHt8szjPd9tDcxh3Fm1Vikki5ZeMNWQXvbe2F/uMPWpdxVMXnLSEyo9I7ZqSjqEfBbizYRgyzNtY0+W+Om4ezI99WaYcXaHEb+s0QKxNc7yxvGFEQFr8sW6Y65aW99ik9lf6+/fcCki6XPr5DGvIUX/SMl9jgVOqTE/OYslNQg5gt57xgqFRMmAT2DK+a0AoEMs6h6kpH9xvCIyl+2+ZWDwJ4KvtSRHls2+LOJusfftvYqMtFjNQ3YjAOBncKSq1zbkwRWQNm0CLJHttRhck2PfT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(1076003)(54906003)(186003)(83380400001)(316002)(38100700002)(6506007)(38350700002)(52116002)(2906002)(5660300002)(6666004)(26005)(478600001)(6512007)(66946007)(66556008)(6486002)(66476007)(4326008)(8676002)(8936002)(86362001)(2616005)(7416002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1kXNHCjra2pAe5qAVWxAy/rQ4X1OmKrKnexWHWHh0HNlisNQ16meqrTUMN4d?=
 =?us-ascii?Q?iYC8gUazTt07B4ryhkbswY8it7DYOHQaaTlVdzgEqGDsQOSWrYFyFz+kl6gC?=
 =?us-ascii?Q?J39wR8NahwU4LI82HLafXaVDclxBhVQI29RNEfdmVYcJFtte62DlbDkMYIjg?=
 =?us-ascii?Q?gPcuWxKsFiMxypT3VvogPXxUst4f2Y8Xk8W7MWzc+Y/f/lwn/LwQbpU7EGCr?=
 =?us-ascii?Q?gFn7aqiNoLrqTUrTyThI6wbDT9Tq8cCvMWzuJ6zdOU6f1uRAcCENld89YhkM?=
 =?us-ascii?Q?IBMJNqRNfaAduDPAyD9CTwMz8BVtc71BT3coU+IzxuDwj6dpcZ4HueAsuWLp?=
 =?us-ascii?Q?ZsgzLFp/PbYDpmLmM4bxSqCcLs1p4u4HoHpqNtve95cADxQhs7HqmHzV/hiT?=
 =?us-ascii?Q?2dpWzfaOxf/xGC9WEo3JWGCtxe/g5qxpfsnENPo2kU6FEJXsvFEXdn6Y8GrP?=
 =?us-ascii?Q?7UygH4SbzXydwpyLiu8q9DBd7Nt6PI/AnwnqP0IV/y+P8GQniHQm+L4qz//6?=
 =?us-ascii?Q?uKESc4y0yDJM7vt5I3F8t/k+gSa30Wgieux90+AJATuO0WW5GGqwzwg/vyJ5?=
 =?us-ascii?Q?J0UqNzD5Bxa+sgQ8GpMod91jTNEsjcJHkjqokPfIBXV/R8BxA9ldgLcfeIC/?=
 =?us-ascii?Q?YbmGf7YyvijokIzp9RwcPtBXVvjR8RMmxmL1aB/k8Y/USwhIk0DNjCTm/hB5?=
 =?us-ascii?Q?AmCkF7DgbYxH2uttciOucmsEv8Z21yLsNc28MHcNhMi7ZrrO0LXxnNnAEt6L?=
 =?us-ascii?Q?2h0Ye+9SkhTjkvdLjPiYzfQCXGw8BkOOBoQD3XUPFVGonuCCA15aZ3KvSXSZ?=
 =?us-ascii?Q?gfpxwrp65efWSZIRPNshmR/ZjuNPU/S4O4ldFtWJZFsUxpUtKKERM6Qa3Ooq?=
 =?us-ascii?Q?JUAgbQ7kG5+lnf0aNrulNNcS6oaI9HIy4dj0qbnPrnNl2fGsjq9LfqleLb1T?=
 =?us-ascii?Q?tUgDRHfgfVGo0AvHnDGHEbdy5nBwYUaVWsDKZ3aGI/zKp977mGjZ4PceKxnQ?=
 =?us-ascii?Q?A0/8H+u1GZQ1LcGfFxUa2DsYR+PVEeVpvnoaNBYevVEdhntZIXPcxr0fx8A5?=
 =?us-ascii?Q?GetJAhzCPkWmfdZnukII+znC/uS8XRofsUtg38og0BAME69QLp04e2rHfcFd?=
 =?us-ascii?Q?lwirE443pDdMT8WF3QuRgoj0Cp0GU6sXU921DaIMdo30b8vCjG7cMyn2MA7P?=
 =?us-ascii?Q?gYS7FtPWz0VqeuX4wlspBVcP/kUlFJbo6IN0XLi0JUeVfXjE18Hd2cFKQGaE?=
 =?us-ascii?Q?6PwHnoJou6vsoVTwZn9hhwTzmwxlG8vo1z1+TH8TJ4SFpyq8ASK0CYUuJw/z?=
 =?us-ascii?Q?A3jQTKVyhlFx/7uxCVU9v3L490Xo/7ujBWBVZ9pgHyexAulionZxsovmgZbT?=
 =?us-ascii?Q?pWtPELS8+17ipCEDcXRwGYkE0UT5e66nzedy1FRh5TM2d4n+Igh9AVcUmVKh?=
 =?us-ascii?Q?xgwbGvxcCRxvj/PQcmv9v3f+8b9pjYKxHhkCJWEBOF+hSGMzbHNOeEhd22DG?=
 =?us-ascii?Q?LXp/LXY4OAe4Zc3/xyDVZ2JJxiCoonRVgJIIdfEdDPf8RtFC5noSh2NGE9gm?=
 =?us-ascii?Q?/qTwpl6Fp1ThhmSKpon/D+lKQFcxcQ7uUOG7+90r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b213b317-2275-4f74-f6ae-08da752868fe
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:16:04.9673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sZF5rFtVFgIisJFtnhPic4VgYZl0RK82hUkGw17pcuKSLCEz34zlE6DRt03v7D4jJu+70x5wMLXe9r7YD4+AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3127
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The clk tree should be as:
bus_aon_root------>\               /--->MU1_B IP
                    -->MU_B gate-->
bus_wakeup_root--->/               \--->MU2_B IP

bus_aon_root------>\               /--->MU1_A IP
                    -->MU_A gate-->
bus_wakeup_root--->/               \--->MU2_A IP

So need use shared count gate. And linux use MU_B,
so set MU_A clk as CLK_IGNORE_UNUSED.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Reviewed-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-imx93.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index ebe553c6ca95..79ec46a91ed8 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -28,6 +28,8 @@ enum clk_sel {
 	MAX_SEL
 };
 
+static u32 share_count_mub;
+
 static const char *parent_names[MAX_SEL][4] = {
 	{"osc_24m", "sys_pll_pfd0_div2", "sys_pll_pfd1_div2", "video_pll"},
 	{"osc_24m", "sys_pll_pfd0_div2", "sys_pll_pfd1_div2", "sys_pll_pfd2_div2"},
@@ -159,8 +161,10 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_WDOG5_GATE,		"wdog5",	"osc_24m",		0x8400, },
 	{ IMX93_CLK_SEMA1_GATE,		"sema1",	"bus_aon_root",		0x8440, },
 	{ IMX93_CLK_SEMA2_GATE,		"sema2",	"bus_wakeup_root",	0x8480, },
-	{ IMX93_CLK_MU_A_GATE,		"mu_a",		"bus_aon_root",		0x84c0, },
-	{ IMX93_CLK_MU_B_GATE,		"mu_b",		"bus_aon_root",		0x8500, },
+	{ IMX93_CLK_MU1_A_GATE,		"mu1_a",	"bus_aon_root",		0x84c0, CLK_IGNORE_UNUSED },
+	{ IMX93_CLK_MU2_A_GATE,		"mu2_a",	"bus_wakeup_root",	0x84c0, CLK_IGNORE_UNUSED },
+	{ IMX93_CLK_MU1_B_GATE,		"mu1_b",	"bus_aon_root",		0x8500, 0, &share_count_mub },
+	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub },
 	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",		0x8540, },
 	{ IMX93_CLK_EDMA2_GATE,		"edma2",	"wakeup_axi_root",	0x8580, },
 	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi",	"flexspi_root",		0x8640, },
-- 
2.25.1

