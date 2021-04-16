Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51726C433ED
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 07:28:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E50F6117A
	for <linux-clk@archiver.kernel.org>; Fri, 16 Apr 2021 07:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239513AbhDPH2r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Apr 2021 03:28:47 -0400
Received: from mail-db8eur05on2077.outbound.protection.outlook.com ([40.107.20.77]:51808
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235012AbhDPH2q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Apr 2021 03:28:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJJhnjLGe5u+ptV+I3Cm2NZHyGWFZeZad9A56HwZ3+GpL4g29OkIbAPdeDFBBPc+sSVDHpuEushq/TOKx9KjJNnRn7iVL9py61egHfgPBqaKTRDEHn/9YPGiCqtLONAplGSIld1VDcX9ITTb1vM49Ac++jqWlKlVOWd1/g8zZ1yTEzLIfHZu6ZIReC4RUDyp5GQ4CTU4H2xAO8xa0dOboOM4tDE0zEfzOfEksEtpIHeacQYiO/lMazGe4wkhgVEPV6/hgZ0rXA+7g2k0+sw5Jk/V3wiKfXB20kEzN8aUWBo+wAQCtdhUkjBsVA+O4aCZdCy8yJx1DlzayYCmSbVOow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32Uba/Be5p938DF9skUUWKDuXeixpBUKOnowg8GBKEE=;
 b=ID65P4rWGDNPixX/GBmzywrltVBKF4wTSdddfJoinOkGHvCjFuHUfug6hS/NcgJ9mMcMT8pXC1gVagxVrEP+GNNDbN6iJfMy/iXHL52SCSwrM0iFiufBvM435hhl9loWY5mkBcBXAhUZ9x1kNP+gxNnnWGCz/Lbr/ecujRKYXJc3Amf9KFWXKr9sbdMCfrlLbMu1BTffTfcSBfy3w/+R1U33PJAQTGkyodzs+u7dYoX54Mi16JFjFKw/cRggfdKmPnD6hh3ofrphGLdFEq4vE/YEO17QwbM/pnZwrrX3p3DotkTtrlzefTe0T/2P240EoBcnz7jGE5JoguAsc3TecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32Uba/Be5p938DF9skUUWKDuXeixpBUKOnowg8GBKEE=;
 b=YrJRL/6t9oj9DjWWkCB/0CbeAGf+2MgKDvIo8XHwokKVEKph8hoDuih6O1vkyXfT9cm0C6I7pIcaVNjn0dZLbBs8f6LiFusaaRka1eLE2fFipIcUrGjb02d0KqgyY4ZrggJmkMvoCr2+5RTsZ6fABiA5m7LmY++eoCebwILSrPU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB6PR0401MB2374.eurprd04.prod.outlook.com (2603:10a6:4:4c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 07:28:20 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274%5]) with mapi id 15.20.4020.022; Fri, 16 Apr 2021
 07:28:20 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com,
        s.hauer@pengutronix.de
Cc:     festevam@gmail.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH 2/2] clk: imx: Remove the audio ipg clock from imx8mp
Date:   Fri, 16 Apr 2021 15:37:03 +0800
Message-Id: <20210416073703.1037718-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210416073703.1037718-1-ping.bai@nxp.com>
References: <20210416073703.1037718-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HKAPR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:203:d0::27) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HKAPR04CA0017.apcprd04.prod.outlook.com (2603:1096:203:d0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 07:28:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02270ad2-7f7f-49db-5d58-08d900a9360d
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0401MB237415275E9557E1041C4542874C9@DB6PR0401MB2374.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IqEjiFkW/+N2yo1kcBIQb/TagrR+X9RYIlRTPFPrjb9OekwIS7byUkx0d67ykwY11XMk+/u8LcIhDyfwq0r6bI+J/iYkOLwbxi2VIv7NN8a7i5f4PEldCW12Acfj8H/RUZRg+oODW1DdI4ooORAHDb0RnfsXz7jfsA8LbeJCpDBNL/AFtDkzqqfz/1dAIiCrcR7n5rhrDPrI3q+SWBulD/Z/J18+iU/BJISzkPPTzKklXRoVTvBGcDyPC6RUOMzLSPNMzE/1ipTHeu2P1xIHB8D14Sitebcuv8ws8ETrbAMQVw+2l71LNiBN6o2CBixStcgkoNrLT8ROKiD8+rdYPW7Q9mHARuZ37lSyklNTxt48eWJI3M5v8opbSysbovuSmW88TKFiLTqM2FhStVCG0fWSOgte3NZ+vYUBCaubMcKvjBlbhlZ+O92FKu4k5m/+WS9DaCn6rqTndUQW1tN6Mn44LQ83kGstSB+/YyGp0wvwxFwKJlpCOBcY30Op5IKv2hVZxCwQmbE2Ck2oUrR7ukC87DHC2Nv2Xf/v7NxM2mFGQDSbQJ40r8q2nM2QaFxvM4OJSO8bWwIkLKeVhViu6vI6ItPkohJnQRrMUcie72vynqcx65/lUPliA17x46E6D1vDnA38ocvdiUYWEb0i/lfEjq9npFjxk2e+4q0o7lpp0lrDjlU0WBHXxXul47ORAKnY345WfNeZx1FsDw3tNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(396003)(376002)(366004)(83380400001)(1076003)(52116002)(6506007)(956004)(66946007)(86362001)(316002)(6666004)(66476007)(5660300002)(2616005)(186003)(16526019)(2906002)(26005)(6512007)(69590400012)(478600001)(38350700002)(38100700002)(36756003)(8676002)(8936002)(4326008)(66556008)(6486002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1+pPSMs71OEOV17idxQwGmnV8ozk+mahDumy1d+7+YH12vX9uwUwvhFMLvvJ?=
 =?us-ascii?Q?RvTQNzZpxaUPBgHo95n6D9prmD3PzzjRCd00lKkhqfltAa4j/K19ij87bBaJ?=
 =?us-ascii?Q?EB2XbFyhYE5sVS0MM+yn0v1c/DKaXwW2K8P9wPE6ZHdfdCegCAHrR+7MGYPF?=
 =?us-ascii?Q?m1Ad5ZpF/bXdi41UIXIqI9baVqp7EUz2o8nZyjfoYP5Ew9enXygYlEMYY2qZ?=
 =?us-ascii?Q?bW5+NW4QECdDIEKD4/rth639VAf4fJev/zhnRy9xnpxAzBPs5VlX6zSVU4vd?=
 =?us-ascii?Q?8pKVEORGfR+75eU/K2POF0OBBNQnV5ujQ1G8tRdekoi7g7oH8g83DMxU9FDP?=
 =?us-ascii?Q?qFCHVwjoWRz19HIs8tP3JrlSl8yXRE9IEHWqZRjbtWtdmoOWHhqa/kVhSgG3?=
 =?us-ascii?Q?AyQNhCpKAG8Cfp34eEaSutnKULoXaVk/zl2/jouLChOsZnP01VdEK0Q3aNrF?=
 =?us-ascii?Q?2tEkdfPFOsQF3HrV0J7mFdzFr4BsW2TEN1HA7y2b5QN1/lB8/zYf4L1DANQ3?=
 =?us-ascii?Q?NPvfF6qLW8ELENunqplcqCbiLjG6ehkU/zAJ5oLO9t8iJW8UiJV37OsbVjPf?=
 =?us-ascii?Q?DQI90Rl9eeyYXDgYSvmPP/29kAnmdKFHr5l+TJlQjPNAUvUh/xYVYmpJLC/Z?=
 =?us-ascii?Q?jOz9EfK7TOwytbL1efQUK1T/iWIH0xfjm5ITAZp+gSdr0tjNFtFn8I27TaPQ?=
 =?us-ascii?Q?mBej1xuFUgqWiNpFzMNb4fwDnE64BY88r4Bu6wGPH0bG3Q2rTDTCPrwAA4Iq?=
 =?us-ascii?Q?jCcSqkd+UWGWlmoUZd6nuXqweq6kzJ4vB9s0d2WN/dtXQZEpb1oww++rc73i?=
 =?us-ascii?Q?LgpCTEj/8Tr7c1bMpDuM/xBbcNDpJx78lHRmpwhmEVakFcNYBq/o6qaZXQKJ?=
 =?us-ascii?Q?vChYTC9xE59WIu+J8MVqa5ROT+mNdAIQL3zSmWjVe5pf71D0GIVhdBa2GyQj?=
 =?us-ascii?Q?qS67OGrTEsaU9UEHhoMorcKvUsFbwB3/C7uSuJALbpZQWk40aHYPk/kg/n79?=
 =?us-ascii?Q?1E9u9FMFbyUNw2UzrdZqv3xUT3VzfMUnQQUoBZffDxQevNI7A4AtU+Air0kr?=
 =?us-ascii?Q?j3Q1AKBiUNES2LhZeHzQIdVv0Wda5jU5xbmeY7APltkAnlWQ/VCl9yntMsN+?=
 =?us-ascii?Q?Y/ORCIGD6O1DaXprhw0hDPG5UALWfKkuavEoLyJr9r5ynfXLj7RqwwTidAmG?=
 =?us-ascii?Q?sB6GmeGGjIfeaBHBmpso5pCTFNC3AjmXhnTlFC/3cJtGgLYYiLm6LdWPTjeA?=
 =?us-ascii?Q?6bmnOAOIFf0/D67DoTDnr+dK04KpkiSHuQSfVQXikZurarcP8NfDyjdEGJao?=
 =?us-ascii?Q?3cjcKRy/bveYDsGewJ9JVIg5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02270ad2-7f7f-49db-5d58-08d900a9360d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 07:28:20.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+JN1+6vF9GNbUr5epHqo6yWmE3CW6zJNKZVocVCPARevSFLGlzrPpvw49QBJ6K8+Rjx/te1io7768Uo8WLwTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2374
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is no audio ipg clock on i.MX8MP, so remove this from
the clock driver.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-imx8mp.c             | 1 -
 include/dt-bindings/clock/imx8mp-clock.h | 1 -
 2 files changed, 2 deletions(-)

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
diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 43927a1b9e94..235c7a00d379 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -117,7 +117,6 @@
 #define IMX8MP_CLK_AUDIO_AHB			108
 #define IMX8MP_CLK_MIPI_DSI_ESC_RX		109
 #define IMX8MP_CLK_IPG_ROOT			110
-#define IMX8MP_CLK_IPG_AUDIO_ROOT		111
 #define IMX8MP_CLK_DRAM_ALT			112
 #define IMX8MP_CLK_DRAM_APB			113
 #define IMX8MP_CLK_VPU_G1			114
-- 
2.26.2

