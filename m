Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E61C43334
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 13:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343757AbiFIN1j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343710AbiFIN1h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 09:27:37 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84F19D4CD
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 06:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvETb1WWxKoFh/Qd5BLk8+ZBkDQ9IikRE0Eut31BXtv6DFbuF7nmP64pSJO9z0uzFWPdI1NdkXZLWfslIQGO+AHrKgZS8fnYZBO0rZSWa+ZUj1nkX2KS0GQZfsYQcEsRIloQ0N2mweAb2w6Ef9MLicaaOLQ4kewWmP0MmbxoAAjPvl4Izjm4oMKgLTyvp4Ru7qKj04/qoFA79BO5vSgW35gT+bpYJA5CtJ9hQSuPQAFOw5hNJefRFFKl/Um1yX7zoM7Krn20XiFzCRfJRHoCKtqgOKv35UJXGRRP5G6kv4zv5FrKbHp4EqbLjRSIlxU/cW/A9ywhLHySgFlcvTCgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ml+VqZzPJwMkjSfH7ns7b0bNS8VA2xIT6WUopGxOmOw=;
 b=iTNqDk3szdLyIcZtxowxFpQoCsBDfaEmdfldSE8eVLYdc59MnMAfxftYjHKuyCSQ+nShF2UoddRJYQZJY5vK+NJKPwu0Nqkkn/pHU50lIzrSAiNFmYAnbbDEayAJghot8SWq5GYMvF5aJF97DbIDAzSs0ZySIYZZq0D/mUVjQzRS95qv4I2xLXE3QbYzO5buxIFpOYCswQacpK73iyLYdlexRZ/cdIaHSBE67cB/XcHSIqdYxuKmSVnDZTamCTaDUc6C8Zix0NOpOugLKy38KrUBKkB/LfktwrubTyxcoZbNWD1Fbz5Dm4122JS3eErpdQ0x0r//CRK66h/KInDoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml+VqZzPJwMkjSfH7ns7b0bNS8VA2xIT6WUopGxOmOw=;
 b=PeJt8nCQr0g4gQPnbjg9EFg+rqSIKOSj3dh1TEOPeQ0wTfTnEspUpBS1RYkZVRHd+AjzP0Tjl0FOy9zF/UGA3u+/1c6zUlFSeENQqSaH3oPCbqQVAILE4ukcA+yEFqbCOopjLXsmxa5tzY9yio4mYn68zPK8DAATo6nzpJ0YYZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB6220.eurprd04.prod.outlook.com (2603:10a6:10:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 13:27:34 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%8]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 13:27:34 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Liu Ying <victor.liu@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 5/7] clk: imx: clk-fracn-gppll: Return rate in rate table properly in ->recalc_rate()
Date:   Thu,  9 Jun 2022 21:29:00 +0800
Message-Id: <20220609132902.3504651-6-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
References: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0209.apcprd04.prod.outlook.com
 (2603:1096:4:187::12) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96678b86-2ebb-44bf-6bed-08da4a1bcfed
X-MS-TrafficTypeDiagnostic: DBBPR04MB6220:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB6220654E70E02F1D54E8FFE7C9A79@DBBPR04MB6220.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RsrUsPJegforydkDLJ1fFtZFexHLDsMYr7U5WrQ9hFWonixrZelLMBNICKF5mbTSlCXixNJHcD03txtVuJVbfd1FE/hjgM/dcs4BGuMNkjl3YfAnc1D7rVp3t8srWujFDzlzY+yodtp6SrxyYY4n31bCDt4mCNQ/XHZ/XjcjA9XIBES58srUT7d3WtNpw9Zy/nq2jCHp85cYVv8oW0NXID10nF1TjFbGdQ64eF5h+KZr0yBINVz6ZWSgb/EvOVcitn5njGuo7Sd4ln8jG0fUsUyYEMkR5yWnlRNJwnGkiRoCEDJPr2yIa7ht6M2HbO++fFsf/rzRC/9nRvSCLlnN1OV0+fhITihIMIFgyaSsjlaC86e0hQkQrMDGQ+J/FdC7mAE4E6Z8u4PglptZwYobfSNOwcwEO+OtiGOfUefi6PuB8yTC3naLFyAjo+aRBcjz2Elybsicyf6o35eLCctUoHABaGU+nmfujE/3sodef7+NSmgKUgyvGZMkJmHbTzjwB/ny1FH93i3irGEyy8WEeYDLcMW6O5E3HNHEteTtxWrlsiRhz29m9crVp1evEkiPg7BIeQUDw9cEpqTrDllsmogEkv0vHDSr1o3KXsqy+1gUBD7H4jJq3s8bdR1HroEm7C67y4vJxAlQ89k0fewuFDUZbk9q8k3ppMuvkNPzHWmrp9bMPA/7Il3xal+pxMp0tsUOhaDNNVWOwxLAC5as9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6666004)(26005)(6512007)(6506007)(52116002)(2906002)(508600001)(54906003)(38350700002)(86362001)(66946007)(5660300002)(316002)(6486002)(38100700002)(186003)(66476007)(66556008)(4326008)(8676002)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6RJNSQOCbkPFJCoK9okF7JWfgUyXB31+46/sZIBtQin408lJHcxhoI12RJTC?=
 =?us-ascii?Q?xDmEiyCRcFd8vNhhRIEwMW2pD8TiivKApfiZ8mMQ4CYQopVaZ8XUb/5yvgXn?=
 =?us-ascii?Q?+z/QVkI2B/iTnkML5E8N6iPZt23uhMXMy8o5DTOWq1bKce5Z2BsL0L48m6qc?=
 =?us-ascii?Q?+NJYnHkgq+nJPFhNHKQOCqqBF9G6Xxnw0iL2Bg1TRZSwKe/3j7InpelHXtAX?=
 =?us-ascii?Q?2dbYWdgZNXRCzp+LUAb2bZWIF6MY9fnv2XSsfGNKUYW+/wJarCc148CfD2jE?=
 =?us-ascii?Q?ktqkjBFivcpa2ee8MUGs0Vn7BEtuAA1X55BlrwMXtD5fbDMbPXe0ugzZuwHZ?=
 =?us-ascii?Q?vFoLSVfa45sT1tYMFJm7QrU/ukI7Oeem5c6GPLxhd00IafHwHIsqa4jbf5LA?=
 =?us-ascii?Q?nV3zfiAfQuq71RHcGGCp5MYUmQtMKKKe7KfyRsUq/VR7VMUaBFfSx6fKbtOq?=
 =?us-ascii?Q?XnTva91BfWBwvR4W1gs5lrPZ0L7NunHeA5TZsDiobPr1pgqkEg/JMYE6dm4j?=
 =?us-ascii?Q?Pgd5+CHgO1Ffivt8k94AQAHG1K5E235ixh0jQxSH6fF8WjuaRwkc38J0I7OG?=
 =?us-ascii?Q?A3u7hyJ6jLqH0MqZTJ2Et5Z8Wj+nL3fCUUJsKdDwF6a+FYICAxPvGl1+hwfP?=
 =?us-ascii?Q?ezRjVYj6oN3Hjngqv8KMp1dRAveb23BiWcjogyOu7IZfxNWyJVhVoo/2M/93?=
 =?us-ascii?Q?834SlLle1A6WZDV8wiTxUu5po6lgWczErVqghWiJrWJsICzyeNSGNnfyN1Lx?=
 =?us-ascii?Q?YFHeC2qsNk8A/5HYB9O5hX23TRyyT9eiQQdsub/WSlvA9VeZS4Wp5QazUine?=
 =?us-ascii?Q?E67ZS9LuuCdd/7H1W8eASdIm4kECUlY/eGeLaAfqRRh0rzsDfWokvRnqexAk?=
 =?us-ascii?Q?JVGAuK40AuAiE14OPb4zsmz3OH2vNi5MID1pIE1p4NmbbSsPPQzgkFQQx2+/?=
 =?us-ascii?Q?lDTKgaYscPasojpcyb1BYzecQJwsfhOVLiu/6moOQgCvwa7JM9dRtOy6C3/H?=
 =?us-ascii?Q?xJ6MEecf8MCdgMyGwBjwuSyqLzwmAvLo8BPdiJIICX7sQ2fDyq92Sa673FnN?=
 =?us-ascii?Q?d6u4oM+vxm6dEpV+QFoaPFFZLQNBkG5SoBHw3DNp422vbWvsFyiWa4pI+yy2?=
 =?us-ascii?Q?OMgXiZEOY3qo3gJ2zfRCcvVcM9Ll1JsJUFHUtFPUR5wwc7vbxuLznmQWQDHK?=
 =?us-ascii?Q?pL5/1uj1MqHp6dwLq8C8s/Rv/Tcp82q64n9z8hpRvZWfNQrZpfT00PI/8AEp?=
 =?us-ascii?Q?q2rgSWIg4FAJ/gf/zAog/J9STbmn8sdQuqXQ3RHVFvzoWtvjSafhTpYUaxDx?=
 =?us-ascii?Q?+5mYb3iQVM87Z2CXtQ3+SBgYHG6UsVrAVXccXMiHzcU66tfQWPxJln4OjAaR?=
 =?us-ascii?Q?rsVsZO6OXTazBm5t0hVSBXcsKO62YKKfbEytkR+yiuxgOV+wE5v8HYlQ3Yo/?=
 =?us-ascii?Q?Rr8zGppZ76TQtl7jc8VNhN72/82M4JOiHunzLZ7gg4jgunTv4C6b2AcHnN8z?=
 =?us-ascii?Q?HmBKThqE/O58uVp8U5kbftwHNx4l6R0TOl0sm9DOoxyg1Dg87e1osGfpQxdq?=
 =?us-ascii?Q?UIZ3+5ni6M4GfdFqdpj53ymuv4wWbkFUVfYQE4KxlI3eSspaEPwpI5Mx6n06?=
 =?us-ascii?Q?XnezV97lK+A1fti9n4djO9flchild2eJgJloH4wOzZrDYVTZB1Bm3s/7EvOz?=
 =?us-ascii?Q?81XSH28rohIdJsnXcH0dGSgqmZBlDr1eRuRF0dwgtt78hy4VsgakAqCG0/uf?=
 =?us-ascii?Q?qRE3PrppkA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96678b86-2ebb-44bf-6bed-08da4a1bcfed
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:27:34.1705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCtdSXAiHS9NVCakIEELNbQIt5LFfQ3b6pggLOd3256iAXo2NAsd6/uQZgUEZWHdqDvAZ4zVssAFES+ZJB51dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6220
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Liu Ying <victor.liu@nxp.com>

The PLL parameters in rate table should be directly compared with
those read from PLL registers instead of the cooked ones.

Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
Cc: Abel Vesa <abel.vesa@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 36a53c60e71f..cb06b0045e9e 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -131,18 +131,7 @@ static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned lon
 	mfi = FIELD_GET(PLL_MFI_MASK, pll_div);
 
 	rdiv = FIELD_GET(PLL_RDIV_MASK, pll_div);
-	rdiv = rdiv + 1;
 	odiv = FIELD_GET(PLL_ODIV_MASK, pll_div);
-	switch (odiv) {
-	case 0:
-		odiv = 2;
-		break;
-	case 1:
-		odiv = 3;
-		break;
-	default:
-		break;
-	}
 
 	/*
 	 * Sometimes, the recalculated rate has deviation due to
@@ -160,6 +149,19 @@ static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned lon
 	if (rate)
 		return (unsigned long)rate;
 
+	rdiv = rdiv + 1;
+
+	switch (odiv) {
+	case 0:
+		odiv = 2;
+		break;
+	case 1:
+		odiv = 3;
+		break;
+	default:
+		break;
+	}
+
 	/* Fvco = Fref * (MFI + MFN / MFD) */
 	fvco = fvco * mfi * mfd + fvco * mfn;
 	do_div(fvco, mfd * rdiv * odiv);
-- 
2.25.1

