Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3931DC19F2D
	for <linux-clk@archiver.kernel.org>; Wed,  3 Aug 2022 08:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235039AbiHCIQL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Aug 2022 04:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235533AbiHCIQE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 04:16:04 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC35A60E5;
        Wed,  3 Aug 2022 01:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfdxoiCBH1Dsl9rO7mM6FZxRkt8Neu9KMOuThQW6YCCVR7suf7PM40JaoQJQZFHOQLkhKeCsY2L+UG3dSdyO/mWNBmuAt8d2nRcwSGgk7wWKb1I6N2IUQmBwEiiIBYxnOJCETt1Ccjd9ypCOFCABlPxnKf7C9iFZv+X1XXG9ZURDTFaXkaiDwdtzAcoNLG8UZrV47HsSdyfdLMzkvf4f20SSweArDlYgpdXnfLfzVYsQd2TQLPPsYyh0+hXQIJJvBhlJr8/wV3mKl1sHMY0bnP37DtBQWQLbr+LwrioRvW65R+5GX+sM4d5GXb2AAtGD7vB6eZVELolTRQigdIDRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcjgV67dZf50cMFZ3tZHxVpbssck2FNfd0GqtMhg22E=;
 b=Lo2gzwK934LFERrlDTzXRwE1SpwkQOXh1EzgWGtkBEO4pDgQXv3fFiulP2mJKmNU/FV/dzt2d3E/+i7RlBY7iMM81Plh46qo+myxcYeyS6nQwWUoYD7hjYiirWKPvInpDhccVVZaqbuEZMBgTjyznatErpzZd5j4OWnDD6Ay8uR63Ymvk4IvZlnW+Qko/lVC2Wb74emoNq0OUmFdkrQSuSG18xB7Ja4VLm9/rb+lLa6PU/zRZ0xRqdiK5UA+FzFF48FhpzVglKLZaw19bX+CtqFbYZCpOOA5RX2qiF46i6LgoOJq9AWQXrg02Xoj3vNUtwIaruLBr7jnn0rOqJUPbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcjgV67dZf50cMFZ3tZHxVpbssck2FNfd0GqtMhg22E=;
 b=eiF+B0zSm4dk0/JW40sapNwEwtcmHRbJJkN1Y8Ry5x2/QijscoQC8y8f7Ymqsm8bIXMfargSJyW6dPUbtl2ht0gOwYMqhx0sFlDfw0lCSHnpnRwYwzvU8Y6ziInqJFfqjOeyz2551r0rFK6z3pT33S6uEYruAp90zfK45xgbvLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB6PR04MB3127.eurprd04.prod.outlook.com (2603:10a6:6:c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.25; Wed, 3 Aug 2022 08:16:00 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 08:16:00 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 5/7] clk: imx93: switch to use new clk gate API
Date:   Wed,  3 Aug 2022 16:17:11 +0800
Message-Id: <20220803081713.3504699-6-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 485e0357-1f60-4f02-6240-08da752865e3
X-MS-TrafficTypeDiagnostic: DB6PR04MB3127:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7StGQBOnGad4nYdvRrrhGGkOWMui4BlZ4J9phaXx6AX32yrfv8+PS6FbzcmSw46SR/Tb56gEH9XQ0/C/JLQqkexLGg7rsyNvyq8FyfiHXaiujZpK09aeLYQbNs/ZXU0vOP+ercpORzNvJi/Z684bkBScvlhp4l0uSOmFa6pT3HIO/BIr3lF5/MVLGgijsSG2H+kW4GmfE3IRBog+XBTdy9kkB4NvLAf/iXyLLdnX5hxWPVtZRyU26j54B8tlugyxdLjnhasPg9RxU3MdS2CNHVR4+SrFAPKuw8/FP8P2peNrx5rYjodlPJ6Ot/Gcdn6/hZlh1pgne7LzVXxA5HPQY+c/N75JOBPP5eZXObIzODuFwWS1TK1OprU0GSj8XLxDSUjRKoIjs6TO/eCJPMhEXDOexpHvEfSIi+V5RgQqaFn4H8Sw46mSVPeWarMGZvC5HBcWQ77SR7SI8Ekcl/yNpmnKaGAjQVxmk8AEQdpRVVF7/i/zrXo4MCMsm9wpRCnH0z8rYadzuNMiCTwr9nLsjilVgbjgTK7CqyKQYqhHIOVxTjZ406jWFg/M6VEAU4XxgV3D+O+r4ZDhgAU8kMSuLfst0rIoSXkqwA8Y98TQLsIxa5GSLKm1lpgf6gPuPKhwpA6rXLRpA7578wAoZFNHUfr2FMpd01yrz0W3XJ3kVAtLDwnVfurmJE7R/Nh1xg+0QBCbVQEjzUl3HCsajdZuxP+RKCWy1EOqFvaVbxWcgNNxQSd4EEithWCHk7IZ3vrElyuQYuDWA/WCgOU7Pmk7amyo03OVzX3qFB2rJCO+HwNn2feJu0JTXrIlKp0eQUK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(1076003)(54906003)(186003)(83380400001)(316002)(38100700002)(6506007)(38350700002)(52116002)(2906002)(5660300002)(6666004)(26005)(478600001)(6512007)(66946007)(66556008)(6486002)(66476007)(4326008)(8676002)(8936002)(86362001)(2616005)(7416002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KJuZiFh0z6x2hl6AeuRT+m808MCoR931mQeHTBBbS8cZDPF0m04qydnJZgXm?=
 =?us-ascii?Q?U6Kz405XkbwMIkG6mci5RPG0qr9Ryt6sz/JPaVGuNyOSbX69AdiKJq/vyWgO?=
 =?us-ascii?Q?DJFkLoziOOGIyWTxUT0tZt2NfADJitDX7iCwdm8Sr5+7gMEEy2a50uwpQGcx?=
 =?us-ascii?Q?2p+xl/jY/e+hnTYko4oXXYHWLezyNKUU1s95VKNXDIvFq0Vbf2Vb5EU+8saG?=
 =?us-ascii?Q?VfLwnph1WFLlJszX3q7vHmE2vngb177bEOxMwEjiUi+bR23mN6myhh2CzQl7?=
 =?us-ascii?Q?XKIC1IPocIxgbbQUBaCa88M5N/3gNgK4xOCCzSVWmV3MdY0GYk1lTQ2QmSFP?=
 =?us-ascii?Q?2xibeO+bcuvUtzbHoqqIGGS96VGRFg67ziqVV7KHujpDXnnd282WQuthGXBQ?=
 =?us-ascii?Q?rKeWYz4n1f3pGTAzeBlibm0BIuIOi16UgSI1CLOrKD9Ero5h7zjOSkSwsxVD?=
 =?us-ascii?Q?+2VU300rra7HVLp+fqrK5cWFDatrbn4P/ljLWKimVtJHJVTSXU/aKhY7MO12?=
 =?us-ascii?Q?+QgcBa3IZvWks9Y0uVsZUDMzod9sMi3ZID+nATKLM03Mij6JhGGxCRJ7vyKE?=
 =?us-ascii?Q?SLXqBq4huBUQhwCzdUh6ym/a12qmK1zethO5LvokayBPumgFXYlQCxyBb0l0?=
 =?us-ascii?Q?9QG2ZfkEdHjJ++P4k9tmkfPdkaBaXHEge6YqRNW3ueGodQsykwK4EgoxRwuE?=
 =?us-ascii?Q?dYNiEts8BnBDhObVxA+1ushrhsH1GNO6bIe0GbzwosaHHL8c4VCLLkAvtodx?=
 =?us-ascii?Q?1at0bdyu/3rYWCvzdmyUxCZeD8NT4SnW41fACGVDGBWEAS38DxmNCYNBtnJY?=
 =?us-ascii?Q?NHtyxLAU7SZgwEc0+7+ArjOevpOBzl+/L6eF+g08YqPcCNte/fugBANShOMP?=
 =?us-ascii?Q?SW10gxoGQrFUuD5gEG1tvN6eiUsD8oxKEnRCgcFOJ2PCQZbemEXxRvffL8JN?=
 =?us-ascii?Q?Me4RyI5OgGv4xxlRsIBhUJQQyzHZdAIio2gQEJprfN9yugbdmjkc4sV8J01i?=
 =?us-ascii?Q?yOUJw6s/PeaV8JYvGHYJynbI8yss3xGGshOUcam5hSCEwkrys0jVwq0VOMKT?=
 =?us-ascii?Q?aPuiazMmyLv4mnmcwApsC4PEC/AaFRf9WOb6Cmza+DD6Tn67mlbHCdNL7La5?=
 =?us-ascii?Q?8qmwB++DcU5Ob4OPoP7OoUgjPSNUVHfwrcxuGjyT/d6AjmsRsSVX/lk/NZaH?=
 =?us-ascii?Q?Y5uBXEASXvdYIfsh+jCxpf4v45RPbdgHhf9lbxQzjEXGkI7LgYgXkeYHEqbB?=
 =?us-ascii?Q?1puCvBE4PETUsdOM0NMMgYJ4zb9jyyVRry1jD/Rf835EyI2B8QdugIfXe1kq?=
 =?us-ascii?Q?zCKbjgx+QHH5CxWe5nV5xvA2gq3ZoguvYfpV2zv3usX9o9ZJrgoiYmQ9/6yL?=
 =?us-ascii?Q?stsdhIN7ENRVpzb1QGQgn7q29luccq48HJaLD20Omq4c4eIqVfwMa+M61det?=
 =?us-ascii?Q?okCEDKyTAmJoxOYIXspp89cDkFH7YO8t1M3ADLGRU6FTfQOIa0e2HuNLOulW?=
 =?us-ascii?Q?yM7svpGRrjuhRaDvAdp/dw0yzJjF93JeYKpjYAIYKxh+KDJcU0TM3VorzheK?=
 =?us-ascii?Q?uGNzDW7W6mG3sI4RpMYoyHsmicdo/kkcL7fFhLN9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485e0357-1f60-4f02-6240-08da752865e3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:16:00.4426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbI0Amfio8SpXr8GodKYmCyWTDdE2CDsHiG98fL0/pF9XyxV+YQE47CPBwpgAf/E2yhttxs7rFanbAqtjr5BMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3127
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use i.MX93 specific clk gate API

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Reviewed-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-imx93.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index 151b2051a5e6..ebe553c6ca95 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -146,6 +146,7 @@ static const struct imx93_clk_ccgr {
 	char *parent_name;
 	u32 off;
 	unsigned long flags;
+	u32 *shared_count;
 } ccgr_array[] = {
 	{ IMX93_CLK_A55_GATE,		"a55",		"a55_root",		0x8000, },
 	/* M33 critical clk for system run */
@@ -299,10 +300,9 @@ static int imx93_clocks_probe(struct platform_device *pdev)
 
 	for (i = 0; i < ARRAY_SIZE(ccgr_array); i++) {
 		ccgr = &ccgr_array[i];
-		clks[ccgr->clk] = imx_clk_hw_gate4_flags(ccgr->name,
-							 ccgr->parent_name,
-							 base + ccgr->off, 0,
-							 ccgr->flags);
+		clks[ccgr->clk] = imx93_clk_gate(NULL, ccgr->name, ccgr->parent_name,
+						 ccgr->flags, base + ccgr->off, 0, 1, 1, 3,
+						 ccgr->shared_count);
 	}
 
 	imx_check_clk_hws(clks, IMX93_CLK_END);
-- 
2.25.1

