Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24C7C433B4
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 07:28:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C14F66117A
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 07:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239509AbhDPH2o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Apr 2021 03:28:44 -0400
Received: from mail-eopbgr130078.outbound.protection.outlook.com ([40.107.13.78]:11744
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235012AbhDPH2n (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Apr 2021 03:28:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbD1yX/X4NXQVYBlQwzdgL6jzJDtS0R6dSgg8VRL2GePQ3KyhM2GWT6wME5PevLghv2O6bAr46c5LxKuyNkCihtn9h2LmpevaIo/nKUVyGzxo1Txv32DFvaC8WBompoKsEmcckKtfKCvM8Ur7IgQEg2SYfHYz1+OFAvDOnwME6eraxkLjYQyALayvl3GosANOSL4HlnuGRL9Njs1iuObp4TTUif+OF4cbHlFemwttM9Otu1jafqEfhJDjLp74ruCJUduUWAgpStX+qVdEcSUG7scE6Ykr9ttN6qCB8xZiUyOP4YV8uBkDdBH269uQ1qKj8Ai1EaZ0OJPDFQxMdFv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRZjbO6P3eUof7Tm6OZVZS8+NSKgFcSxauwvrsy84q8=;
 b=GcaBolOjRw5iOYVlXrEqG/IClaGtJkk9aM/s0/eFS/eiJV4dAKPA+iNNp5mNg4e3aKiOyl8X5uS44ri6F7Ob4xE07J2dUE8uL7uv+Qhfq5m8cdmfnah5kfNwMRJNrUYXns03c8M4+GbYvk9DTNhBhHkAWIh/xVKhkdg6tYJ4W8Uj9n6NzcGqiXKqj+6SpjcaIzXBixBnKSpRDru1A24iLC+zC/Lnj8qlmm/q11e3iF3XfphGAiCEA1bE7KDf7fISXjRMwzW/T01sF6j7rKcNzHfDXWCYOHQHK/1gMZG3AufylCVNH397A5MKPazIRGi/E9PqF2RxAbpVhPjpkiV+ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRZjbO6P3eUof7Tm6OZVZS8+NSKgFcSxauwvrsy84q8=;
 b=Iw0LwbYIdAeb0pNMG3MSHAdeTvmY5+D4fZ9r1zEOPfiw2zFNnlT9McL3hgnt7PFpqZBaJQH8AyPTV+otZ9gDzHkfHOu5Zshs3z0DLPPBCCjRaIv8OA+c+aOdVekhvmF/zebz1mQ65qAnqbZQqu4xBTZyz8YlOYm+mzaDftNooU0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB6PR0401MB2536.eurprd04.prod.outlook.com (2603:10a6:4:36::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 07:28:16 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274%5]) with mapi id 15.20.4020.022; Fri, 16 Apr 2021
 07:28:16 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com,
        s.hauer@pengutronix.de
Cc:     festevam@gmail.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH 1/2] arm64: dts: imx8mp: Remove the reference to audio ipg clock on imx8mp
Date:   Fri, 16 Apr 2021 15:37:02 +0800
Message-Id: <20210416073703.1037718-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HKAPR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:203:d0::27) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HKAPR04CA0017.apcprd04.prod.outlook.com (2603:1096:203:d0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 07:28:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ba6c0eb-9976-4ada-e404-08d900a9335a
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB25369363A34572BFCE8E5BCD874C9@DB6PR0401MB2536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: howfis0/UzAKUWAO/CNq6HFLrKO19zODIFYuZWV/wa6g4+9HTEvvM5ItcWIY4B80N9pd6aPVqyyHY78e2HuRayTzimrkm435sSYaQDq68jsKvnbiQt5wRENydyQxBlNW/IBscdy4kTycTexzfFIBeyi6uockT6qWwOEv+ZcERFBpZYDemvegW2KAR736wNOQFNdxLki7Nmw9bvHTCjHspY4THVVhmO5fOm4GpGduWejH4rYKWWqzRamYxxj7Za0FjUs/cznLutdbG31p6vrZmqOvxVDK87VSKHJAQq/0w8R04PZ3Ws2x1OkW5kX2qhwasBiVf7JP4AtdIs+0aUxrg/JTsR4ZnJEY09hWeBOdNF4gsC9cVcA/SEI2ZIKZX4+tFcGY/Y8n/o2xOQVMo8MadKmrw4eix2qZfreZZVuPdgrBbXVK9cWtx73Kl5fOEuljd/RHF2mUruQyjsILeqyrUpDSHexZ4+4WfDuXXTTJzfa7kua6UMLxROTsYTH5Gt+h+U7p8IB+Zgdfp0/lncP4A1f7cEx9Fe0P/prHlT7hT1rDqL644ugn79Fqul07rvSa7rfJsHPE/pNLvmIoSOH0cjkUnwq8Lji4CSr3dQirZh53soeZHV45P3iunGniZvv4zkb9+flyLEFLIcfy9ZyHJuieO0M+8OWxf+y98SHgbi258Fm4KdLgNxvEqvgA9icjhfn1IxRIIDDVw838EKBAjRWPICMJc4N6KRJLsshZW4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(376002)(396003)(346002)(38350700002)(6666004)(478600001)(38100700002)(83380400001)(6512007)(186003)(86362001)(66476007)(52116002)(16526019)(4326008)(1076003)(2906002)(956004)(8936002)(69590400012)(6506007)(5660300002)(66556008)(26005)(36756003)(8676002)(6486002)(66946007)(2616005)(4744005)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5+vNkEMFBwII3kt0fGTbBV9Bb81gVSNDPgR0LUoujEUkq72iF/+74YDb57lU?=
 =?us-ascii?Q?u2cbJOhEgzuvAdQnLJcNK+CpcL8kzN0kZHSLyMBbUUoKUga0H3qS6lrkOWcH?=
 =?us-ascii?Q?xjntfJBll+pe6XVLg2+uvi84lU7lu8QzkOoKdqsFvVgqHVHs+u+pZm0Bu4e3?=
 =?us-ascii?Q?JYxRuhLj/219lvPJqXwFajFrlLCLiU10+4CaAUJ4p7ALhtUeH25FbsHPtxCi?=
 =?us-ascii?Q?IGVgaKgPnb6yE727Th5t8imaBrkG5yfx87CVm4+XEidh1GCUEdLZpxiYo3/l?=
 =?us-ascii?Q?UpWQyxl5U5CBimR/1RqyGJ0haMzpJUv9R1acZFSBuU51zPseKhirWSL3JpLJ?=
 =?us-ascii?Q?QAdxzB39c/4leXKx9ENIY2DtkSfy0mN8aSb+YxyUZ7AvrlB9ev9x1jKFEDr8?=
 =?us-ascii?Q?2TZU6rCa2xpY0dswTmdHKdYOXW9ZsHcdlpvK4+/hDWStKcEtMRuAsWaVJ0bF?=
 =?us-ascii?Q?w2dP1msA+2H+Aj+VDNCXPdI2mDO+FIxrnYD1MRcry9ViIoBYtZ0PjEN+mLIG?=
 =?us-ascii?Q?LSzRTRx5I4wjm4vhcTlMDA7Of7aWxPJIGi4gN4cpriBawVjPzD+UDq2MgA1Z?=
 =?us-ascii?Q?zVFu9liQ+Sl93vsyVBdyZf/12T1nLEagRMR0Aoo7X3TYx08Yz306/Nxir1Ib?=
 =?us-ascii?Q?FiqMT80xp4fx8muWFFIYDKeg3mqCcZje3U7fcCv4PqDWmyNYINtB285DHxI9?=
 =?us-ascii?Q?plj7IA8wtJqqgufds96K8WBMgeYOmZOtDdUFyhoMHzLc+5P4DokJgxKHNBT8?=
 =?us-ascii?Q?Cu9IAnLiXew5mleqqWiQhrjx+7sU04aIw3++k8MgM4rLKn2qhttDwwrljhub?=
 =?us-ascii?Q?uoEN8XGwC2IVWTf/V8lJd8Er6A00wwrsMqDT3aPWmyfAragFs/3JR88dfoWV?=
 =?us-ascii?Q?V9QWDrAnPNPJvHTOYwFOuWP3AFltW4/RLvOftEhHWf5iHD3F+qAz0honRPw+?=
 =?us-ascii?Q?nhLpPSWa3anCbAkykHpSMxxRG7NmOuRRXWOMG5jbG1CN5GNT3fZkyt8RW6ny?=
 =?us-ascii?Q?fBZXy8HM+kVFF+VRb43fOmeUaEz3ZoueAL69cO+a6V4qUwc4HmA7uRiu8z24?=
 =?us-ascii?Q?jcpDNB5sED4HbrUQCH8+6+l5DlxTTMr6tgwvsoo6oPF0/e29W/6HcYY4ru55?=
 =?us-ascii?Q?HcAYgDfn33+VNoP9Hc3clQLnv2h1/zzgpu/SkJoOTfImOZ/hRsmd7OdgaIRT?=
 =?us-ascii?Q?eMKhorqUwEn86QO+I/1OCwBZu0MtxVLq82iBzd+vXMvzVlyWQ8eocQtdFHku?=
 =?us-ascii?Q?pmrbmdGv09Imh7ZNW/AetNlnRko/yLQCZF1EsH9n1f7u4n+/NkrUB8bblY+M?=
 =?us-ascii?Q?wgw8tRVt/ijaRUzxtXhIAw8k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba6c0eb-9976-4ada-e404-08d900a9335a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 07:28:16.4466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEUmQNIt1K4rkn6hb2xaIX2qcAOZCePuIfz26Sc/U6Ck3bs1Xqs8/Wc66pDl3rM/Nd5kUbw+354WcoitdYWmvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2536
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On i.MX8MP, there is no audio ipg clock, so remove the wrong reference
to this clock in dts file.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index c2d51a46cb3c..0283c22c2bd3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -407,7 +407,6 @@ clk: clock-controller@30380000 {
 						  <&clk IMX8MP_CLK_GIC>,
 						  <&clk IMX8MP_CLK_AUDIO_AHB>,
 						  <&clk IMX8MP_CLK_AUDIO_AXI_SRC>,
-						  <&clk IMX8MP_CLK_IPG_AUDIO_ROOT>,
 						  <&clk IMX8MP_AUDIO_PLL1>,
 						  <&clk IMX8MP_AUDIO_PLL2>;
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
@@ -423,7 +422,6 @@ clk: clock-controller@30380000 {
 						       <500000000>,
 						       <400000000>,
 						       <800000000>,
-						       <400000000>,
 						       <393216000>,
 						       <361267200>;
 			};
-- 
2.26.2

