Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58B5C6FA82
	for <linux-clk@archiver.kernel.org>; Fri, 23 Sep 2022 11:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbiIWLEa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Sep 2022 07:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbiIWLER (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Sep 2022 07:04:17 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CA1118DFA;
        Fri, 23 Sep 2022 04:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yc0gJtqPjYOnHhLiRZucTgcqRDuusOhnjKE8PHc4CSo9PXx39wWckv5my0aYxs6HwVAaZfyyArU7vCZrUFOJOx2DT5Wpy6KTHLVGffRJk6PmFl7pLntXKVXXdPmSAbafJOBQJg7VFkdVWgrR/5FF9QxKAU4I4xvGU5sq0ivFXzD04+uoJ7hg5CRPDSt1JiBIHUYZE9/QXaICnvb/ERN6rzSxzb9W0kX21o8uN9jr+TMvTXcynn/lOKkOe/4sUZBegUNWuNP2bCSOArqhxDedgHvBAbLg20Oi6TfE6oA1MrRdEe6K2ZXu5ynAVO6IOBMDfEHClb6k8EWxgFovukEdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9gMpyDAJvoSagc2E04kLmh1VWx3v+QqxiX7QZiT5LU=;
 b=TZrdVBdyXHBU7Zt+okIMDAwMzJmVUo3yd2PSfDNXhYFzdCgXLKT6T0dmhibBXBO6d7R1/Pn3tvMDhron0R1+fsZqvp46PCK1+BPvAYFP+Ea2onSGtGScl4OXJF5CuISUyOx/mt7/Aa6csxnqGy6n+eu9m6UvUMXJmQiTVDy8jfHcBUXd3xF0as4E9FXi6HGgV3/LV+qBfHvIWUxhqWb8Ighf7Qv6VNUf7KpBTSfjhnbMGR+zFY2OqJfPQ59V/ijK7ycGruIcXksKLU8rcamzRpnbhbzuOKiJMC1u5R14hPcxm1NXnZ+ZFlFMtBXj+M643yLuY3t4aNdy5gU4W5+niA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9gMpyDAJvoSagc2E04kLmh1VWx3v+QqxiX7QZiT5LU=;
 b=IKsnXz0ansznJFY8RXCGgM5Vsh6cr3mYGBOvgWx+2dSnrpLb36ALJ6W9xFXV/5M6lUtwp6Zf/pfAsaggZ7b2YbGn/gtd400W++eqZOiFsat5y88g5Ce6cuJneApZTFkJtENP2/Za6lacyDtu2yDmJ9PXl6oCu/PtvkyRsd4rY6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 11:04:09 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::4ceb:3c8:9764:6dea]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::4ceb:3c8:9764:6dea%6]) with mapi id 15.20.5654.016; Fri, 23 Sep 2022
 11:04:09 +0000
From:   Li Jun <jun.li@nxp.com>
To:     sboyd@kernel.org, abelvesa@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mturquette@baylibre.com,
        l.stach@pengutronix.de, peng.fan@nxp.com,
        alexander.stein@ew.tq-group.com, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH RESEND v3 2/3] clk: imx: imx8mp: add shared clk gate for usb suspend clk
Date:   Fri, 23 Sep 2022 18:45:04 +0800
Message-Id: <1663929905-10492-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1663929905-10492-1-git-send-email-jun.li@nxp.com>
References: <1663929905-10492-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: ce002dd9-f3c3-4789-309b-08da9d5356d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /q7bwgiDACmznlgCYsqe9blGgjCdn10CcUTDxO95QsJRpS3+PMmtc2+1/7NC++UFuSw+dRiZLm5tacAFjNXLXgMWarllDORDhi5lbUKjLY2vYfKMcStPkSz94IrZSiUZUyNEayjIGwmtuBC2NK4AVfXIOgSD2XjGFqQnN+QXFTmJ2XrPjUWBqh40VMWiWhwSPTDi2t3hA20NlFAL/jk8IKWhkydXU9zKIFrcVvdoyDSotDgZvCacfUA7x1CcdokjKdbZV38aqqcRVlaJduRNqsZCVHBKiAFxBspLA8IhC/Qd8ufzCigj1ylG+ycQyOGHJvUok76Iu2sHMCoKS7SKi/q6OHW+zYxWrFESan2Wp1nIo25LS1scVY5wSWqPa8zzK4mELF2wixZgMZrGcFQGQNjZ5hnDsQZKf8lWLIEBrQ4YlRkEZv6dFeC1vceTKgeW4pxr6IuhTa5YHuJZwOKm5AGAZ+zcs623BE+BRFb5YbP/UWHEQfuWdNMHCPPgnCC+DdxyIGPGYLiJhWRHNhlAtGWPRrczxn9vHJIHT3Acx8eGKJFmypm29lr9kBoA9Xz9OzjMYhe8EL/gt800Ej0kjiYZARDT8qG69LgLR38dijCjpvQGGqvjJAgd83uGcKrkdoqxzClPMrw3AFyPbY2QGlNq1Piek5HA8FksunJuL/lsxlo0X2BrLdeQFQuL3b4UPhPTC4igI2WmFxCLijYV3+6nrx+AgDtsycwuiRdET0Z2gLVx/yukzrZ9UuLFzwQrUc8ROUvzPK9aPJRg8tesX1P+CUxtRfwpFb/mq+JFC1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(66476007)(6506007)(52116002)(5660300002)(38350700002)(38100700002)(7416002)(41300700001)(66946007)(66556008)(6666004)(186003)(8936002)(86362001)(2616005)(8676002)(6486002)(6512007)(316002)(26005)(2906002)(478600001)(36756003)(15650500001)(4326008)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3CpEdMyujNcI5vlypu0Rtw20X3Tt1CqMMOnzgYhv92nuIaBLeu1/unOlrSiG?=
 =?us-ascii?Q?cPM7WZBxz8mR8tHdmY5gIx9tYAagtrgnCoBMIp25h1tESy0J15AmWfSCJ+gF?=
 =?us-ascii?Q?5/GzAibsPQjKPcQCBHev5nk+sjuW4V4dTGSH1JWyWZP5sI0vTgqZ1Ga3tUiz?=
 =?us-ascii?Q?8Ecz+z2jQaANWNMoL2hIEreSbg9rFUjpaRv0WC8bBK22JH5/6vKEd5mW7ZMI?=
 =?us-ascii?Q?YZrW0Oxb6cOY3D+1b8pmVm6f1e05g+uz95AjrUg0/2BwGKv200V7IDBycaTS?=
 =?us-ascii?Q?uw2heMKSActfjhph/qdbQhgSFB/LTCtLJ6LbblsVGEUv0g91iDmahm36N9CB?=
 =?us-ascii?Q?ZkqvayjLlp2QbCFo5rsXcQPzr4movw5POevz7mHLBxlZL0511JniyNFRNfFQ?=
 =?us-ascii?Q?m1SA7iSA6pK5iYGcMuWJtdkpVrI/Hr2DsCEmi0Q0WCE9TSGn1DJnybnoqptF?=
 =?us-ascii?Q?EqQX1wWIWXpGjNpZKOrP5Ak5zgY48lFaWGVFFniBKKe7Y/7nFMYrKOParPZW?=
 =?us-ascii?Q?tzvPMVra+dwi1ESbrErMl69JU+H+NWyF44bjT5O17SnmZ0gNnBcp3N0bZhGs?=
 =?us-ascii?Q?CDsMV0mcRHbGDUfJPkZYWKmPRx15XH6B/tM0HUtZLN9UOFwpyi/1He9IWOPK?=
 =?us-ascii?Q?qU/Te5Hr+2jJnZ+nmnxmoGlJGjMF3WVEjdFCmXRILnLZorArzXk3/NdHbl3S?=
 =?us-ascii?Q?Lo8SRg3yxQPpoEuZfd6p0Js9h6QVzSzhoxy/+eG49ihNZx1LfiL1C1ruC9xQ?=
 =?us-ascii?Q?jgaxSL5nkBnMF4zifUrHVrTiX/oS6tO4RsVQ6T2WVgJmnoiUC1ofhy1IklFl?=
 =?us-ascii?Q?yr/cuVQchknBZWdBlDeMmZSd///fct/wKcD+qknb8RNM9bF8WfbJz0yWghNb?=
 =?us-ascii?Q?hSLny3UqLJKzBJj3SBic2cxhhY+6SVkLDTrCUCfRSccI0TXVzImAx7NTWeIs?=
 =?us-ascii?Q?s8bwis6oeviXlWGtbRF+vdEjavXnVdDKrPaZRPXeWPIhtzh6Zp3Fetht0KtF?=
 =?us-ascii?Q?03RazPG7HpY6jlPDk1i/mZ8w8sy5b+MrVf/goX7/0Jvgq30SOHI9b3xAfxkd?=
 =?us-ascii?Q?5xXOMA++N60z9lK/UxMgiep/QIe063lLagOALgOC+WG7n2omN+FrevLavwMj?=
 =?us-ascii?Q?6RdMywFe1Gv44NZldSXcXn7t0bCb+qvqSj5PV0HkxBtvLk5zHc1oqkOuidpo?=
 =?us-ascii?Q?9h2q7VLE2cPz0t3/m67BUmeQYv/VzGjC5hIgLg+F+AHu/RsOebo7QXEV8nKo?=
 =?us-ascii?Q?91VHkLFGBRMZQlhEj+gMNFvujCV7xMJ/dVIOAwaPfotvvMbpKIw3OKChGtox?=
 =?us-ascii?Q?S3dXAM8zUqYJEsNxg1p2nIoaNGiiB0B0E4D06xkGzz+3P79Lj26jDYtz+iE/?=
 =?us-ascii?Q?PDtNRpv8Lb12s3L03nSbDA4BNm/OOtVREJmYje5V/XWsgLRZQtp64ZCt96IH?=
 =?us-ascii?Q?4nxPBfyRmp3XixNzXdY2wGlH0wPP0zJdHHuB2QXRdzKpdTyNnS1PoJmg3CxA?=
 =?us-ascii?Q?QzqwXqBDUqmJtqORNP9lZ9S0p4YQ+gBJrSq/Haysxf8tSQhX3qZsBQOdPODi?=
 =?us-ascii?Q?bNqI5wnuEggPFc2bD6k=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce002dd9-f3c3-4789-309b-08da9d5356d2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 11:04:09.2370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyI71PohOjfXWO08vPNIHULgLKmDDv9r9DG62eystFjY5/NaxBb76OE1HmTPcB52
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

32K usb suspend clock gate is shared with usb_root_clk.

Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
Cc: stable@vger.kernel.org # v5.19+
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/clk/imx/clk-imx8mp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index e89db568f5a8..5b66514bdd0c 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -17,6 +17,7 @@
 
 static u32 share_count_nand;
 static u32 share_count_media;
+static u32 share_count_usb;
 
 static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
 static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
@@ -673,7 +674,8 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", ccm_base + 0x44a0, 0);
 	hws[IMX8MP_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", ccm_base + 0x44b0, 0);
 	hws[IMX8MP_CLK_UART4_ROOT] = imx_clk_hw_gate4("uart4_root_clk", "uart4", ccm_base + 0x44c0, 0);
-	hws[IMX8MP_CLK_USB_ROOT] = imx_clk_hw_gate4("usb_root_clk", "hsio_axi", ccm_base + 0x44d0, 0);
+	hws[IMX8MP_CLK_USB_ROOT] = imx_clk_hw_gate2_shared2("usb_root_clk", "hsio_axi", ccm_base + 0x44d0, 0, &share_count_usb);
+	hws[IMX8MP_CLK_USB_SUSP] = imx_clk_hw_gate2_shared2("usb_suspend_clk", "osc_32k", ccm_base + 0x44d0, 0, &share_count_usb);
 	hws[IMX8MP_CLK_USB_PHY_ROOT] = imx_clk_hw_gate4("usb_phy_root_clk", "usb_phy_ref", ccm_base + 0x44f0, 0);
 	hws[IMX8MP_CLK_USDHC1_ROOT] = imx_clk_hw_gate4("usdhc1_root_clk", "usdhc1", ccm_base + 0x4510, 0);
 	hws[IMX8MP_CLK_USDHC2_ROOT] = imx_clk_hw_gate4("usdhc2_root_clk", "usdhc2", ccm_base + 0x4520, 0);
-- 
2.34.1

