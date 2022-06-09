Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EA1C43334
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 13:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239408AbiFIN13 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236658AbiFIN11 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 09:27:27 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBC79D4CD
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 06:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcKAjxA+pNDpCCIgtxZq8/5RJaChHkv0V1Ij3QefVVcIZ6KCz8PtflJaIvb22ijLtwvG/VqRT8/RSqAxxKw8r7TzF4+mcFd5QScDcyOdlPwfOznMws0hF59bqQrLWHzcO5uEuEJKZUBd+RA11g6tR/cPBDahJB9xK44SXKb2DoglDNqILJ0yxY6FGLPIJptwM6yMVYAND33eNT4JvWnem+g9+ukvEPPf6ZwWJiGlRO+iS9aA8yyNoRljQssDaGzpgrj9ACWLuTpFvtiRXfnFUGn8zyf2hWt/aqVrJ7JQiPxIH7CSYmVV/VTOnlMWk6Hvauao+wjR+uGHEGIsLXRjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1bG1P7HGAiZl7/BHLG/aofJNFdgb29N+lDph0Wa34c=;
 b=UKCrqGG+w9nUIktwANOQzG6Lflp3HVAjXDkg1pNwcn8W9cPUuvjxLtI2+1MWV3JVlI7iidbLfxaeJGdeaFX2ruM808+g+oG26kviSMV2b+Tj9PTcK3goU2lmpG959DVM0pxG5kzSLH0WvEPN2GbESjjyFmM6rxvEbUFbunDal7dYieGK0ANnN6b+sBc2vgPWo4UNDBNehBjupWMYaL3SvCIouR1FzQ2mWYz/6Y9R9VpC1LQG3bbWyGyvs9ESIFpAvxTZTomnMvRlqWcsmmlF+Sikxg0b14IlGexLlR4rAdScOjgyAA1Fh/Lzda2W3Xbikjd0+p1cNBSHMVXVzHu1xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1bG1P7HGAiZl7/BHLG/aofJNFdgb29N+lDph0Wa34c=;
 b=bIPydMoQj06eVJrsI30iPT4D0v8pecGnN0eju0L8bRlZF6wa3YkkEMYrH5LtVm+ETxeujM8FjzfcoPByQZufu/0l7inCqDEDovXpHozAy5xJQXEb58EtBmZGGoaJIC2N2E+i8VGdB52yr6jB64BwPiL8Fu9pQe8Dx+3Qgc7PuYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB6220.eurprd04.prod.outlook.com (2603:10a6:10:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 13:27:23 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%8]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 13:27:23 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/7] clk: imx93: correct nic_media parent
Date:   Thu,  9 Jun 2022 21:28:57 +0800
Message-Id: <20220609132902.3504651-3-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3fae712a-4881-42ee-921a-08da4a1bc986
X-MS-TrafficTypeDiagnostic: DBBPR04MB6220:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB62208C1578E1FC5EBFD6DD66C9A79@DBBPR04MB6220.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OQVTMK/Iq2AjRu8mtAuFB4nSDSpD0yW1dy0TQf79Ly8IuMPpXcH1E5XNVsNU7t2q8UFep7FnwQEHYUsdd/N+312HIPsLNMgzRdAxC49mx4X9v0w0tjAEOKHpBtVW7u4OSw66LVp+7puj0H9kF1G7nfvPxhXMtdGsRb2HTMvU4799ZoORMhqpupTq9ozRZYuK1z7sIEqaNFvc5Tb1Z74z6kDcGnzczbdR8+R5zR5fQHAHRr4ud14UhzGiLuBkSGU2j7W2VAgKv6sqsFPOoyP1/+fMnIVEoWVLOm2uFQzW26CQFnv90t8ixYvzAjz7mTgaPlqHUDcxvKoRBzrtIWH5psH+b3AY8OliXurotKZL+aIrGMSCUhNRN7YAhEOlNDkJUZYpNBOmyjhyNFcs+1w3tMzOIfBb753kg3gLli0axYeb3PqoG/bJoXvrkvBU17qQbklpiJbz/q6kLfB49mL+ETFt8Efn5cB60m/OpX/R724bYu3e7gqlHODX0aMcCgRpd4LBQUYPl1y34WImqEznDkfX19DhmNK7Whfm2uBY5nqvarTmSn5sbaFAXLpjZGf6jWsUd7fIHs3fWQbF4q48JK3i2fo5DdB3p34bDyeB+z0kvLovq4Bs35xc1RUsz+wpzw8QuNAlWYU2Ih/wrFNg5wH3jReGYyMOhksAgZFeCZlRQdxWnAqhwX6rbRld9/CRu3E0oq3ExglIihLXV4zPnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6666004)(26005)(6512007)(6506007)(52116002)(2906002)(508600001)(38350700002)(86362001)(66946007)(5660300002)(316002)(6486002)(38100700002)(186003)(66476007)(66556008)(4326008)(8676002)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tw9J7PfNTYCCj1Yg+dlRKYi6VoI0PW/elRIO66Bluw5a2iaANR8n3GEqGPqY?=
 =?us-ascii?Q?L3CVitkAoj68m9HOD+SVxTn9bDyDDXqcUoiDh35EJFdLx4h3g3AMFn2pR+/v?=
 =?us-ascii?Q?q+wWAhV/uze056Z9C54wmpySQxNkkLCN9Z3PsGMn3eLwB63ia4jmIUM2AKsT?=
 =?us-ascii?Q?E5BWLrS4mK9L90aMwjQGs7cqr3PbJd8AtYHeg6xK3xZ6TdgLt0xNSEO14ca4?=
 =?us-ascii?Q?d+P4lEdntMIAZuqtewdpmz/4vBR82SumDYV+TaX1LmSoFraLYXtFmCEavbnV?=
 =?us-ascii?Q?MEL2M39Tzl/twu4Oks2jCLQ10ruDBFX71+LrczcqxZ+fq38QBGVTZU/kyvBY?=
 =?us-ascii?Q?TSVB9GFQIxHyhh8oajBBxdE+dafVvoR81tS3aNwOpzK1BUoY0byuTgav0QYb?=
 =?us-ascii?Q?ghvF0GR9P/sR+W2crmg4RxtQiySU7ljXMtyftt01KJ4NjsumpTDVDtYKl1H1?=
 =?us-ascii?Q?9qyHVvz5j7pcRDJBm3HW+SBBGD+zFt1wi3ID7fimxjrO9AEGzrIEJHw0L5zp?=
 =?us-ascii?Q?LY/uv3uFas3FdUy9s6ELj7+JHhT4JoZFmRXapwGh+qlwSei9M4UFcQjbFqo3?=
 =?us-ascii?Q?yuuwAdDsCVLh0JM07xx2NNuK36bzoodHZPraNWltZYhHBsd2+Zbcd+u8mkOz?=
 =?us-ascii?Q?2zB7pTraWiI4HPxMY+Bvj3N7RdnlEIu5l329FC8Fnw91bjJGWUP+fMlfwBfC?=
 =?us-ascii?Q?3Ckl0kNbhmvg5WvbJaoqlEo/2/63/ZjNuo2K0veJqKJ0Y4L2NGz/lChfhgmH?=
 =?us-ascii?Q?lemwmjt5NtYzbgvtkZPHIG/PKZSLxeF/I+Vy+trLCDec24WY/FJGdNRG22BK?=
 =?us-ascii?Q?S0ZNal1AD4RPva5/zapYg25gCAxuCR0LaN7F6GT1CP9Z96JDM/0qWuBEMioI?=
 =?us-ascii?Q?J+wZ+mfSV84G69SK2CPdqBUQglz5/gS40eYeEmtDCY2/rFXbWb/vdsXFXrhN?=
 =?us-ascii?Q?ot6JqxgjjWgIDmhdQ4V3gJ1r34ir2l2iup5Q0+te6cqiOxXMjic8ItnMEhvo?=
 =?us-ascii?Q?tFxUxgYaf4iO8dQQggy7IzXUmxepAWaBYxzMGg/jk2aqTykIsq7W30zf2pBV?=
 =?us-ascii?Q?nru6q5P90xrT+s+mbpGEq/YlaF/tHWwBBuzyJSZ458xVi7NbyfYPmP+aFzWV?=
 =?us-ascii?Q?pWcCLBujh2wKFtchAq6CeB77j6ast3eE7yy3PEHqWEl62oUw40lfjhQYlYmT?=
 =?us-ascii?Q?iCjXHpKaQsiXptHCwmXgxwwUeX1KdUBqXW9NXcGcmb+vvhdcV+udaClXUA1A?=
 =?us-ascii?Q?VPK1HpNyJLhBvSPT3Y8D2oYR5jK9Ciu/qFp7gqmkZI7vVCylBo8SzZZydKBR?=
 =?us-ascii?Q?8v6GG4rQV/gwsffITrM9ueuGqlldh2uhQWEB1ZS0UHjmdCkcFOjOATCaqfoC?=
 =?us-ascii?Q?tWeJlwFbHXPMM2WrIVvhQlKYw0jKXaBRqMKj7z3zRtUYPmhVIH3BTU7JuYgs?=
 =?us-ascii?Q?cKd1Dwxhm58IKh7DEJb2q+sk80zVsh1s0kyty02fysuljfN64/H87x/9rsEj?=
 =?us-ascii?Q?OiW5auZQzOBkHVEWFE3F71tR1TsNORepbunPsvxpmDiaQxBoAZFY5LiaAM/R?=
 =?us-ascii?Q?AxzTED72RahLhakxxEHRsi5L0hDsJ2wLB5Vaaw/+cEU34QiMcY2QBcbHdF7f?=
 =?us-ascii?Q?570vXSIdOxpBb/JTX8NLt288zuLoVKyXE4rz3Hf/qTnF0XxepBxjKVaWopYW?=
 =?us-ascii?Q?9KMJZM/fjPaDTQ4Xl2XNU3Ye2OfPWELQptCN5/gL4S0RbbMGhR0bMfzcx3we?=
 =?us-ascii?Q?m8RNgqNX6A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fae712a-4881-42ee-921a-08da4a1bc986
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:27:23.5239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoFSHmSWoOTxDW+NSB9NH5iLEFl6KZD4DX2th8AdmmTj0DkwFVUOS0F4iaO8xhR5FuaB3lhqGdGgxHJb2CsNYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6220
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

NIC_MEDIA sources from media_axi_root, not media_apb_root.

Fixes: 24defbe194b6 ("clk: imx: add i.MX93 clk")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx93.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index 172cd56c9610..26885bd3971c 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -219,7 +219,7 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_LCDIF_GATE,		"lcdif",	"media_apb_root",	0x9640, },
 	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, },
 	{ IMX93_CLK_ISI_GATE,		"isi",		"media_apb_root",	0x96c0, },
-	{ IMX93_CLK_NIC_MEDIA_GATE,	"nic_media",	"media_apb_root",	0x9700, },
+	{ IMX93_CLK_NIC_MEDIA_GATE,	"nic_media",	"media_axi_root",	0x9700, },
 	{ IMX93_CLK_USB_CONTROLLER_GATE, "usb_controller", "hsio_root",		0x9a00, },
 	{ IMX93_CLK_USB_TEST_60M_GATE,	"usb_test_60m",	"hsio_usb_test_60m_root", 0x9a40, },
 	{ IMX93_CLK_HSIO_TROUT_24M_GATE, "hsio_trout_24m", "osc_24m",		0x9a80, },
-- 
2.25.1

