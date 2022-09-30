Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631A3C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 15:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbiI3PNy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbiI3PNw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 11:13:52 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB5412935F;
        Fri, 30 Sep 2022 08:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1vQyzHDcp4g5T8YirrmkLgyHQZ06olKzUBtC60FxDqXfu4sODzv/m8o1XRBwTaqYr7AjvsbuqbmKSbGmr0lf2P70C+NiC4IBX2ODBj1iG8yiDVB4m6r7jlJ9hCOUIkkBT0dA8oLjyU36TmHo1GdQ1NXxEYjTWDZyEMgu04JWNCGVVxmfkdk9HNtaGFGtPYWbmbwzAaOUI3AVHngGY4k3gpEemuocS8VHeTdOTfGoixUEuLtv69qvPA1Ii9s7ZtrrH+dL8oBxT2Nv++/GuYlglxLXw+7ve+VpkQGEK8mrJZTD1rr75xVCRCr/j+P7HRX00Rv1mOXK4mTHlIm7ktqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iqJ5QtAYf3fB8/CA29sbedHBiezVi0U64S2ETzVurA=;
 b=YoH3nOSDSgyCl6GGER8FtvGQ9oAjenid4Px8bEJCkmysQ0nsfTbs2+m2uwLnn0hAieF2iCbyM3gaLTtsq+p30N6J2dLvdr3k6RL/5BXzcRwhk95VVkERrIGUU8ekgcrqeB6xJJXGMw95su8majNWLA5I95lTaiJp1k7hCux9swwJuaXNBGWS8VZ4vcuOr2mVQKTzBK5j3UlA/q39WGacw5f5xVzdg3i7xna3MhNMEzZs6E/+aL8tQrF3j8KQYyhLqi7UEJBbYq3JSyZ0EElN4CR3vEEbBXfxGuIr3xEQ1cgC4RMR/wIZTjLAMjn4NF0uDDqZSPiJH1oQqQ5NerqcYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iqJ5QtAYf3fB8/CA29sbedHBiezVi0U64S2ETzVurA=;
 b=JOqadLr8DA+tEJgvAUwOhi+zX5oU2IDlysXd7aI1d0K94ukdqccRyRE3hkNGRZ1sOZxsryDlCTLBooTHfOnjiRKHYBgHNWRDQMr+QqUuvaORT5bbqC1m4GwI0ShDQc2wmUnYFnm07E24NNKD+S8h8o+lDQk2h4EWxTuGBxR1taA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AS8PR04MB8005.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 15:13:50 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::a81a:385:308a:b85a]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::a81a:385:308a:b85a%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 15:13:50 +0000
From:   Li Jun <jun.li@nxp.com>
To:     sboyd@kernel.org, abelvesa@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mturquette@baylibre.com,
        l.stach@pengutronix.de, peng.fan@nxp.com,
        alexander.stein@ew.tq-group.com, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 2/3] clk: imx: imx8mp: add shared clk gate for usb suspend clk
Date:   Fri, 30 Sep 2022 22:54:22 +0800
Message-Id: <1664549663-20364-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9640:EE_|AS8PR04MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4e6300-812f-435e-1580-08daa2f6612a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v94Tb08Tsu5ilzbqaIYBEXmMsViiNsoSWg5yfuhFxHFx08GmalD/CjydcvrUZILwTGJhnngWA2EsDfcmy8FIXIzAp0JPwNrTwGwv691eJ4GSpk71uWy3EOHkZrtIeclXe/MWx2oDagYN+onIEnNeYZB4SgTEjQEpeqLixZtKuQ+4K5PEm0gIDg2S95N3Ryd9TrQ2mW8fvReIQCnwqfhntrZazkCWiVFfaH6Zz/s0xHjcJojuGfDLq1iDl8ix3w4wd/bP8dzZgfcGI8j3q4gjQSE2sl/6Uy29iXTFuyl+/qzaFSkd/iNgHhrmMnzVBAOQ5gxFzevWJa+lS9N2EvkCd0jh7v80l6M/e0S+AmFh02ruEPBR876//xiZQWCO+ej+UqLP5jy6b7oBQ4lh8ey2FHOoBZ/5yJbB3ZBAzSqdnWQh35bvlTevVb/KG0yS9V/IJsNayMZDZrxmS+QDbc5J6aih64xtoDB9Lp20UYEaO77zaXwVMEK1bPL4JcTXZYUNfWw1e1jTfk/eCF7lcXQ0hUFvs8dS2aJs/VJB8JeiKf5yCzi9OevTibItMSl+17Ie7egoiCPR/kiZdpfI3LoXza86s1RcLAa+S1vYHvDm56g7UNqIyG8SmOhjPdMuFg7tLZ1K1i2J1SOLN1aqYXYx8e0Jsm/2wSGp5OS46gCPbPQrvYcmKsfj2IaK/i4N0BnStYxkgxacFySojXafISqfJDD+6smY0GFTl+uxUAyOVsDsGMngQGA7Zl8JKWaM3RM2MxX8cC3m1VHn8kLKg8p5mjlQaV6Yhx3VK826ZiCdrXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199015)(6512007)(26005)(186003)(5660300002)(7416002)(2616005)(83380400001)(66946007)(66476007)(66556008)(2906002)(6486002)(316002)(6506007)(8676002)(4326008)(478600001)(86362001)(6666004)(38100700002)(36756003)(38350700002)(52116002)(8936002)(15650500001)(41300700001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P+AI62FcjsXgDny1BLO9SBtwX4azKqCzjckjK/rGnTrhSE9f1vSnTA5clzrF?=
 =?us-ascii?Q?/w5YqYZu4OFEH2dE9y58Q5Kvc0cdOYTTEc5hPG9HZa54n2iwUHIYC8JV8+Wu?=
 =?us-ascii?Q?s03HZmUUMOpdmssu8bI38WB/KFWHfl0UP0jEWpEuYQ0xgeUzVGWjS4fiKQwj?=
 =?us-ascii?Q?SPJiKUIaizixKrO3T1Y7K1F3mJB9OTPO1myjen/6K4W8IxQrbZbZomrVr7hY?=
 =?us-ascii?Q?UX7jCZepIB9MMVvmlW5GND7DYAwwMX0TaBxxl5ZtxttBoyDzodg6KnxlYaE1?=
 =?us-ascii?Q?QsdxgNlApzbhori8fDLIj7OQi6t2xSdD6Yb7mylo/Dk6VbqX2ZunVWLd9Ojv?=
 =?us-ascii?Q?jJCLa+OtbOo4uaYsZlY5XxxcYEpynbYJfMtybiGMqguvi4/y8jOHqalzQelu?=
 =?us-ascii?Q?vNzg2xKru3+/jocHRC/0kiv0ZQEth6m7sVKovZfipNijSotch3VMtvfju3pA?=
 =?us-ascii?Q?GMO3wufrC3MXl6jUOuF/xuFey2NK/9RJpVDLSnYyUDGGNQmboiEUI5myiKEq?=
 =?us-ascii?Q?ndtqWL63JHT0AI8saj+xh7tfJTRJetz2485XdtA/o/nb4sKtYH64Mx8pViqq?=
 =?us-ascii?Q?f9DaFm44VS4EUBKezj3x2W6XBHhIQVCcQzoyoxqgRVEfJVJ2v29zCizFdL6K?=
 =?us-ascii?Q?ILeAr/pIc0Cqr+2j5KASDr7Qmk8FHlwVw49Qs3NHLHTMcOE04n7gOm1F/aU8?=
 =?us-ascii?Q?RvzoMtT32VGnxq7/LorwAK5bwlURX7XesdLgXrnBVPa1yhsntckSIm79JkBJ?=
 =?us-ascii?Q?PeJmOceLUu8GvznLmoxHsXx7lnpJG7f9+wxiSzE0NMslaEShT8+z4f1FqnHp?=
 =?us-ascii?Q?XQRh3ziIcx/qYbfbGKQIeLTi9GjECOAkR8vssoc8TamPCq/KU3G4V+bZkc4s?=
 =?us-ascii?Q?SLebHBCxmpMTW/La1w+o1VxoCPdbkg6Va9V/hVeFZTdkJOsm426lf5OftOe/?=
 =?us-ascii?Q?JFkHazSINFMLgI6PV/ffIiwLLxZqxeha7on7KLYyEvDpik7wWXsQPJ0/X7GI?=
 =?us-ascii?Q?9TQrJJJOzDe8J87ILvealVKkMydALo75fxlfMqx8Tbd7CffFkah8Db95n9o9?=
 =?us-ascii?Q?rtM9VOoPcHj8Qmq5FdnVg++B97oa0/FUbtvO1RQ+DCrXtH74lH+ef11q/w0c?=
 =?us-ascii?Q?25e3a03bXra6D8ahthJfssu1mThcCZhhg4uJ6+lxq/YUyH9kN7JcZl9EywF9?=
 =?us-ascii?Q?hu7Hj0pWCwiqxCvvwJ1C72UJ4wD6yCr2s4hDn3Dg3W2cWvNZ0ppL5wwGZ4/u?=
 =?us-ascii?Q?ahGDtlgp3SwW64obciCTKRA70owOvUXm9g1vtiZ3JLvuhSrlpGDJ+hT3If5r?=
 =?us-ascii?Q?s5SnzQ6FPAsyfQS7aW90LfJGaiiIvqo9+sFVngmAK/y+rkycONtcxuq13x4F?=
 =?us-ascii?Q?wCZ3mospW2RFllwaLi/qgNbCUwWJJanvANPtTArnAfbMLYEbrPYxLsSIIPgk?=
 =?us-ascii?Q?b7TewLF7/aWDWUIZbw9PtWpc8LNLPETMhrNSLqVMYAl3ymx2/eNCALSzQTDQ?=
 =?us-ascii?Q?ubByZta0tbN5UW3PDlBN7dFqOZMRRd8oXC4y4lKDqyYIz/ZQkD2BQYmOEjHO?=
 =?us-ascii?Q?9lcCiDuIYW+4BtB+FMDzafbDP5zmZFnRwCfxu1WC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4e6300-812f-435e-1580-08daa2f6612a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 15:13:50.3880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3e0KW/oCm+8B8BMNp7xx6lnZy1juEDI8cgFSEP5qUIhws+cR3Zes6h4dwVChiP3E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8005
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

32K usb suspend clock gate is shared with usb_root_clk, this
shared clock gate was initially defined only for usb suspend
clock, usb suspend clk is kept on while system is active or
system sleep with usb wakeup enabled, so usb root clock is
fine with this situation; with the commit cf7f3f4fa9e5
("clk: imx8mp: fix usb_root_clk parent"), this clock gate is
changed to be for usb root clock, but usb root clock will
be off while usb is suspended, so usb suspend clock will be
gated too, this cause some usb functionalities will not work,
so define this clock to be a shared clock gate to conform with
the real HW status.

Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
Cc: stable@vger.kernel.org # v5.19+
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
change for v4:
- improve the commit log to explain why this is stable stuff.
 
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

