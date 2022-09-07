Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3C0C38145
	for <linux-clk@archiver.kernel.org>; Wed,  7 Sep 2022 10:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiIGKz2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Sep 2022 06:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiIGKz1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Sep 2022 06:55:27 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60082.outbound.protection.outlook.com [40.107.6.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70060474C2;
        Wed,  7 Sep 2022 03:55:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILN/lx229bXw1XlKSLpico1+/MlQWuoiwHXx47v2wIAtjcdyygonRyfFbRnaEcDQ6yVqxn1yTZW4N2a9VNiB2e8fIn3mSUC0Bk60A8rVpwg513QDIzEebMFhgFaFucdygip8GmIJrIHaSi6SAuJVWB+NSMEvM6h9ijhKqlG+73L73xBN5ye1rM+GFhl5axtUytSrqdXkFDeiYcUFgwkAPhruGxVi4YABQ4JdlYYnhT0cE9u05K1aFD2JslS+hNE1AzxJqivQMnlyc4cAI8turzgO3H+jrFX3fX+zJYtPvWRuw4ux5wQSIVZl4p2tb7aqsBvPOPxEA6ZL5cYu/HwtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aul11TeaUBackpG1HfxFbtsSgUHl/00U+qWw5OrXgVI=;
 b=UptxdziukgFMzkfj6x4q6Q3WA+nkzonG1E9xfCNXIuE7/2f0/O+6S0XSPHqAawyYFR7NsGMszTMLceGNEyYiES756GJSJX7Xjr64Dk/j984mmo9txQGA7TZVXA8RZJoWI7FtU5vysncosqNeU0LRFJAQuaE6gk753+bxnbO7dHn+pqQ3m0/7kN/ptvKI0rPXcNlkpqEpWoSI6C4yvPiTMEV3r369yDZ8TmjLc0dgHOBnmEVyzsfCTVl12Ob1p8M6Z0Y4TtaYeyrSvooQAF3L+aJ30wfndStMVGeKf5yn9r4pRAV3nExiZkUsit+lqNzz2NnSOEWgNI5r60aiuL1OPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aul11TeaUBackpG1HfxFbtsSgUHl/00U+qWw5OrXgVI=;
 b=Zp7bgZnn4gjlnzdoe2ZqUNJKUfzn7bQtnnFefqMyJ6Vt4GIq0QfPe20kNGP9rmC3mzS3rpDERWG3gedxel3TveEtrzNsX6nHPW8POnhRbJNU2ruSUlv2cNccqboHcIj7XxpyN6oVtTPpFEzKnEaOWQMt7y6lk6J4f/EQ8TC/eCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DB8PR04MB5628.eurprd04.prod.outlook.com (2603:10a6:10:a7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 10:55:24 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2%9]) with mapi id 15.20.5588.012; Wed, 7 Sep 2022
 10:55:24 +0000
From:   Li Jun <jun.li@nxp.com>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] clk: imx: imx8mp: add shared clk gate for usb suspend clk
Date:   Wed,  7 Sep 2022 18:37:08 +0800
Message-Id: <1662547028-22279-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1662547028-22279-1-git-send-email-jun.li@nxp.com>
References: <1662547028-22279-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::20)
 To PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5066c80-12d2-47de-e7ed-08da90bf7739
X-MS-TrafficTypeDiagnostic: DB8PR04MB5628:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: novBcre8xBFKt0RpH6hIVbdmMgGx7o856o33SBaDr+pvQxf4nrGAfBFJSsIffMQ0780USZS+SvsUzu5qUxbu64RcPprSFNra094rpf5igFv2Cge5BiAageRmVXa/0RiAxfHuCXErtduVZP5ouYMOFE1kHLoAwKvVGa8G+P9cqUXsPZVu40f8kaTGT+JjtZzgc1F6GLYEYb4jYCGsGmoKhLzAPfPJo8vONbnjzMTTJNF9UmfSEzcRATW1vjozuch0F3jaDhElH6WSCCNvZ9hRJCvpCT6rtTQ337UsvM55cJNVLB/tsj0K8jP5puX+8COCUExoFNyxlgjIv7ut6gYb+ymNkeDnwVFrmZMOeb4tsSQX7WKlVeYG2FD58ZOQr3zurFXSJhcCY8xfTp8GRu1AXcIJEXy9aDPrhFHOttHsvP/sDkK37AGMWvqsokS/ymiaCZ2ZTJAXZm7KpWGTuN1jxNevCRtMRFbhW/p61sh6RqQsC02jJKb78WB4J4kZaXi4U3j581Iaylg3S9zWj5SwGBEwLt2brODMxS8wrmi5+5iB1VKOMKx+LOE4kO2OzhXX+td8/QRDItBlKA5EEZQdouopUSLuBk0fh2Dpx6YPDLtwgUeddTHiaFH8n4upfCjucTdRVwvMdYEm27nH8SvyhTx2yMDkPsEU3nYH8mmuR2tM2+4E8g0+94oqsD7cO5KFul3LR44piwhXVxCtZh998r+Fro9idbWu9JrlM6L6rrPQ0kkFnBZAAa0wSfOdaJV1jnUhpurEocTwl+8feqv2CJmG/42E3w0mzLabd7cHLqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(366004)(396003)(376002)(5660300002)(8936002)(41300700001)(26005)(6512007)(15650500001)(52116002)(2906002)(6666004)(7416002)(86362001)(6506007)(2616005)(38350700002)(38100700002)(186003)(6486002)(66476007)(66556008)(4326008)(83380400001)(8676002)(66946007)(316002)(478600001)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0JCSthQoxgheVscJTAxzmXv2UM4zMxXKHn0pHm6ayXTrTkTN/OkBhb2rSDxO?=
 =?us-ascii?Q?uJauEx4bO6/sZTQP7WsxcAki5XVsIwfM5tEzih30i1IBsxWHtO+Qy9ijOinO?=
 =?us-ascii?Q?sBrp+joT+3uWksT0yOEx0gJemuoUNcN9MkTmJSjxcDIhelf6yBWI1c7MfTow?=
 =?us-ascii?Q?TlDId1l1I06dc7xLnVRkP5ZS3zUFpAR//m1BxtIBfHP56VEXsax2Lzm1w7OZ?=
 =?us-ascii?Q?kysDa9Nzj5d/edEmFzcRQKO/us3y7sjsbIBV9ctBtQOnWTHtEgIa0e4uWjVq?=
 =?us-ascii?Q?3HKoOU08ka+5HmgraMNTS/H8lOLUHFJgrPm7yhMtsvVA2DUN2HuhaMNYQ0Nc?=
 =?us-ascii?Q?dCcYmJbm/uyM7dhiuBQRcgt/NucMt+PlVzFesu6EEJK+VrFFBT2ovRLDCBZ+?=
 =?us-ascii?Q?N0JOTPxqMPetJ8khV5FSpWvtrzLxHVvMZN/Ry7RKpnTYJ7bvFLnqHASI9ieR?=
 =?us-ascii?Q?fuWvIaFryzbxn7afCgGQIULpCvqiLJm1PV0KiBDQOUYLEqih5WjmNFM4Jui0?=
 =?us-ascii?Q?YY9uy6Ab1G8081deFh25odneNJn0GRjqsiFPSoe5wDWN1/A2Mx0RHVzsOwSX?=
 =?us-ascii?Q?yYypoygVe/P1hPEXp340oNW6A/7EZE5Be84PoFcvLteKXlyf/U6FoEujf4h/?=
 =?us-ascii?Q?KPPlqhZ6FppVT3aEgK3OIct2tu+GW3BheDh/7eRGcLcPxcuNqQ7VzcgLazOu?=
 =?us-ascii?Q?ukNlErxd/0N110JhkMhGh4VqK9FWXR6iBKTO82UKVCKMYgi669IPUFdxZRxu?=
 =?us-ascii?Q?HKoVSo1NCrJopXB9Kaa4CgYhpQ6hzuqUiveOUcTgAo+Me30WOQ+AMOZXEafc?=
 =?us-ascii?Q?iGK2FYn+y6HZFfO3C3DiSM1enhuD0Xn/GufHvH13r1WAvG52nCJ+HbLap//j?=
 =?us-ascii?Q?ZSqQVWMZJcdXOmXtK69xGv6IdNIeBLhurbpJe8DCzkSkOF1IaNP0W9yM3InV?=
 =?us-ascii?Q?w7SsVH18wGnPc4r2l/yay2CXl7N6S1+ZqiCPDXz8hcDmKEvderQHptt/n0QH?=
 =?us-ascii?Q?Fve9AT8VKAR/c7U9h1brWb9Qx3/ZghYun68cSSynU3JFRtaIeBfhLO4pjTzR?=
 =?us-ascii?Q?7R6XUcglfCgw/6xoyTlPTGHH4NyR3srgs+pLatKokedr0h+5mLHxyKgTBUpo?=
 =?us-ascii?Q?+PHG6UYkMeN7P2SlJwWfOv9/TnfBvFNG0HbYg4Y+EPozPK2HPOE3bOS8rQpU?=
 =?us-ascii?Q?WmVjmGPIYNjlNSsHsXmMtyS78bTarozQk0nViK6QRUImSDEKPGDfYU16O43u?=
 =?us-ascii?Q?hxeM5CPdID+vTom8ODac+FO6fo0rB4ojCd5J2WoWjkdV2mm3QaAHgKkjeuRk?=
 =?us-ascii?Q?MWNe++U0TkgxHx0BLDFnIty+cZNCVrLDGU13f90TYLkgvowlb5JU9jLK5Tvh?=
 =?us-ascii?Q?sWDjaubBlDTtMC9S8id6eE3Gjs0lmSEmBLat9B5mhfYGrYP8vnW7zL4jb8jW?=
 =?us-ascii?Q?DpEOyXN/RHPahNqFZ0nT2URTbq8YI+Eupwlndt0uYc3WQmVaDOPIMWiRpldo?=
 =?us-ascii?Q?lUuIytXh7sjQc9CMGgOrpYG9ZuwjU3O5sjmmt4Wd7k81kl86WAiSfBlDvQ3u?=
 =?us-ascii?Q?Dg0ppWjXSuHRKvYA16I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5066c80-12d2-47de-e7ed-08da90bf7739
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 10:55:24.1658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJc7SJS0a/oa94pQEDgPDsVyS/Ff99ZcEfqiy4SUWEyC68m8UMPCMGVUfm+r1ppV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5628
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

32K usb suspend clock gate is shared with usb_root_clk.

Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
Cc: stable@vger.kernel.org # v5.19+
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

