Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07C6C32793
	for <linux-clk@archiver.kernel.org>; Wed, 24 Aug 2022 08:22:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbiHXIWt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Aug 2022 04:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236030AbiHXIW1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Aug 2022 04:22:27 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50061.outbound.protection.outlook.com [40.107.5.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC174901AD;
        Wed, 24 Aug 2022 01:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrCyf0FsNzrMZU0/xV58EXe5lD86FkWbGS7n/eQdEwk0VoTm1xhflwhgb5QlfA9xOZaXdO7W9PIldNeGIZj3y3UxCvTWl0pMVCP2X2c+wCDOQUQBH0nyA5/FvIAmGHHq50dbbbndbAqUgWtOTJ5Y9Bz1HrllP8rekPxH7ZZge40SlZuavmxKjuu9BbHHwE8jUvOily9uQuoVTaxgws77ryOPoXxgVk6PUHG9YIQ0VbDxnnkySjn8pYJUaTFp9AKIjlVdCVJgE6LQmII5g5DbyasPWvCG3D6DsaD4tfYyByEmBecC8xQVHebYN5bgd9lsUke0LgNq16ooTCuLzNyNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcNGz2aPIvWo6eBJutZvmFRgCKgsIvYhPrINqvIZGsI=;
 b=U4wEBEcik+eMbtO+vba4xGRAOVXSEUJo0YiG2N/xakI5SSHPS/UQ2cUICJOtwpsoLakQnTxUSyk2v1v2x7a6n0+JTFglS7sENztdWQ/UF81AJeDNZfJ7VYVlhMMQbjr+hSBDH0PS6p3OWlUIQXbFJWPnU++5IrNSY9YHS8bhCmfPX8h3M4z6BGdw5vesoVqoB+4OrIDhuDE1cS6bZ2+QbAa7+3QMd2yP6MOF3GHiNmCpvOANroPhae3EKsHoidYWYnLFTycyilbMs5gY08FZWCJZQzL6gK+ntEyq6E/nsjTz9eZj1d/21Nt6y3U7q/SXqDMZ1iiAveI0EyCR19h00w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcNGz2aPIvWo6eBJutZvmFRgCKgsIvYhPrINqvIZGsI=;
 b=HPCMraLrqynKgZKSpUscX4wbmT+El3M0iBvllFUfHf8MBi0gUFR4klxU34CtAbn02NAXHwgAZYWTaxmhGnT/T6hm2LL4MPBPk/ken0Bux3+pYSTDEeYZCkja2poaiNC4tu64O/MCoGFr8VDePQXaYhttURfdNq0So55leZYhGa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by HE1PR0402MB3514.eurprd04.prod.outlook.com (2603:10a6:7:83::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 08:21:58 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::1c65:f6a7:bc4:eb15]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::1c65:f6a7:bc4:eb15%6]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 08:21:58 +0000
From:   Li Jun <jun.li@nxp.com>
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] clk: imx: imx8mp: add shared clk gate for usb suspend clk
Date:   Wed, 24 Aug 2022 16:04:22 +0800
Message-Id: <1661328262-3867-2-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1661328262-3867-1-git-send-email-jun.li@nxp.com>
References: <1661328262-3867-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::34) To PA4PR04MB9640.eurprd04.prod.outlook.com
 (2603:10a6:102:261::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3ebe3ad-5209-4ed0-2329-08da85a9b661
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3514:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/usgiVXKs8XDiH0KZB3rpgdksb9e+8B466dS7/Rj/sBILBMAdyPkH4Qvoojbal14lL7jXVl99X+81CXSOTntqpPWIfTR28S3GunK1odM6cnA6WCeKgb89RZDKTjkScWmQjzYSEwBl/XubstTiau6N6LgIM3gxKt27ArkCWBhGybI0U0kmy0Uxx2V2+Igf1AsmaC7WwikphvN7ZRP2pbgRPC4bX2apGKJIE3cdnzKBFviurUSuwwOx6L+q8iiX3TfjrrjD8ORfLRHvFfPok8LTYA/dP9SLQARAMt6FiaeTg0eI8y306t78PtQHSxHxUeogXgTUFuC8iV4C7+9GKM0VGuc4GC2nBtzcwAnLRXPUdh4my27WJuYKzrncas9qV7pGDbzl4pg5kcOdeSGAdTpHMM3XGYMSGPlADcbS4unm4mOoasDvqQOa+Mji8UkhqA95YQIlqdUUqcVBJR8yJKrA3x1tCRHPsaGc0OUa+HJWK58Q19/+XA2C+CaUV4/HRV3TIbEuZfu3OX8LGg2Q51o04Iq6VT/sHkGbY7RQ3QSwW4PBQlsPWL/q6Hge9msQ0ds/IFXWpNQKsvSrsCTMgOlbUHrEXz2ACpFkcWrsJfv+lMFODksn3Ryx1/fZ4vwJLBPrMW9WUP+6dq1xEma9zjGZ0//pfkkD1Zf1T5vSjicSxSlgQxQGreVsK6gHkbNskQGAm1uTYvs8otkVgt4aR8ZYADRBg9od6JnphS3/VFvYMzL24tBS/jRXfxVnIiqKIa3s/Laer55dtnOlABBW0PlAhl42fD5LCMRgYWxmDkCGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(2616005)(186003)(41300700001)(36756003)(38100700002)(86362001)(38350700002)(52116002)(66476007)(66556008)(66946007)(8676002)(6486002)(6666004)(6512007)(6506007)(4326008)(26005)(2906002)(83380400001)(316002)(8936002)(7416002)(5660300002)(15650500001)(478600001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WyZjt4+6j7GRun0pMnVsQTpoo3Bu5alwx+SaQpAp38Shx61zKh6UuV7UkY6n?=
 =?us-ascii?Q?3pWwpxIHTkG4nx9xy+xXhmklLKJ8mLYpL+pM6oXWPEFLKJn/Aq2slNw7n3V6?=
 =?us-ascii?Q?4a1Y7DsSS38HRTcEU5izjNrBXnxOQ+wbEwV+TP5YDPGcuYo+d8IsQdzEbBBM?=
 =?us-ascii?Q?dVoQw41hp40DRuDF6UeDEF1uUOwNsopHcki6u8XqPQvXHGKGgj+NF1awylki?=
 =?us-ascii?Q?gp2rXWdTZ7DvrC3pEHWNzxEjY11tvhR3lZdmbO28lyXL5ZdKgOC8vR5ucrvc?=
 =?us-ascii?Q?ASbLC5cdF5AUy6c+bfnVdqXpG29Pd/xnZo3WNf55GXimGblvM0XDpUas57mJ?=
 =?us-ascii?Q?fnuOkvaLOj9yyyD+NCNDhZ5ugKg/mjxcfhQqtpjST9IJy5WL/ch9DzWdJMeS?=
 =?us-ascii?Q?USDneiKsHHt1+8Q8itf3vflJp/dhmnpqqS29s7UW85a4LNJ23f3TP7XxJA4o?=
 =?us-ascii?Q?ynQKJaGVoqV3yPqvgcCDz7n+HwxgnDTahIe7kWXo7VTOaBsA6P8g+eOWMYbk?=
 =?us-ascii?Q?vDJruE9/ahCMSA8yRCo42ipfZTi44XcA8odmO/23FQW0RKN+3QappG50psWq?=
 =?us-ascii?Q?DIVvwXLiwWHPe3EEfGFzfkPbVUKkMs8NG4jSfF8jIG1qNyT3LnWWKiy9fbGu?=
 =?us-ascii?Q?VdUss+IMg8lZ7uzl1nOdGP9sGJayXPkjauEvTo//QxZh2RvRdawOkqWNmw/y?=
 =?us-ascii?Q?tTs077f9qPlGKPvm1Oe9IQ2ekhZP7t++SklKHI1ViM4r8Ns5WAGbsiKaaHie?=
 =?us-ascii?Q?IFwVbNaldb6MgT7mYjvXZwyrysf91r7KgiMpIn7DAN8c5KWxRjkComyz2K1l?=
 =?us-ascii?Q?ucOkhmu/HQn9HWGd6/51BxEwPfZbjziJ2bPbj+d/nxJs/rljr71eJZEox5xb?=
 =?us-ascii?Q?JUGx3Wm458TzlzcITVKA/B6W7ZC5juwaDz6dJlMaOXxSNVNGyZljbnA0/N5v?=
 =?us-ascii?Q?hyKmT/gwy5hUO9EOx22NbzIuznL3xHfrdi9nkAQ5mqkrLZQCnkHcCRrMRq8y?=
 =?us-ascii?Q?E66LvTGlB3OaHwAU7cfHb55lYS92QGL0Y9GIZsgQ9+Uqvo5yBD6u3+e0Esn5?=
 =?us-ascii?Q?znAqmhT77Z6YrF47vmwC0zuvAtE9Zg5KqGk9clS2y3hwmpPKdwrFNm9J6lVm?=
 =?us-ascii?Q?B8VuZkKcX01RfO80l6f/+ajOWYHF9picV/pdQ93tUg7ldjaPLETxLGZFxBYj?=
 =?us-ascii?Q?CiUupvOpYC2ueY2bviVL/rDIf3T+0tCcvB/+EWBBgOWvlp6goyabkwUIO6DG?=
 =?us-ascii?Q?kf9WLY+eBU+8yhSKzdjyuyqDNZ32Y91G8tE4jDWJTfrDJIRq7F8ywuYnF8DT?=
 =?us-ascii?Q?7b2gFVeCR3P/sFe1pdXXBKAFfjxx8ZmEox1cvMQjS/698vKg50+/uG6B58F4?=
 =?us-ascii?Q?0pzE8uyx6s0vN72uNNwnVWdTXSZY+50ig80QUkLD7aJDScDsPKTIRl4ciL8D?=
 =?us-ascii?Q?uatlZvGjDDmH9oSvmHk3XiefU4yHgvGbEpaXQHhwCljTHJd0yaBGy9Y67MPI?=
 =?us-ascii?Q?KvYPzZL3kMopXcfqxeLPZnlc/9OvQshiEC8OtBu59NJke/G1RY53wn0wsUKX?=
 =?us-ascii?Q?mRVgUEMtJS9iBZvfzmE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ebe3ad-5209-4ed0-2329-08da85a9b661
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 08:21:58.3851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yd5LYlBrBdMdHgq6H9iAv5tIJwBrtE1fkChcNv53Ads40ohJof2ya2nUUTt43vWf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3514
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

32K usb suspend clock gate is shared with usb_root_clk.

Signed-off-by: Li Jun <jun.li@nxp.com>

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

