Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014E7C19F28
	for <linux-clk@archiver.kernel.org>; Wed,  3 Aug 2022 07:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236730AbiHCHsF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Aug 2022 03:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234466AbiHCHsB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 03:48:01 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00043.outbound.protection.outlook.com [40.107.0.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096AB27169
        for <linux-clk@vger.kernel.org>; Wed,  3 Aug 2022 00:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=de56KIAdYls/Mt4zpe94FAdQcy70rD/1Y8lHbF299b8rKPOliyHWRz9UgQmE+LymqsztYUvPdzuJwn105x3tlCId33rKxvUxAJAopd4qAhsXEXbO1KzKhI/ME9nov0SztQ6GdNRty1AMaHuPO0YsvaHoA1s8SBVIfcGmUiJhijXzeASdICsKZFv3FriOY2pCTjUVJVCG2TGaVy5Gri0CRCYFiXFM40LHb9NmMpZhg8YfDzHoCV1URUdIpD4thLtKk+/2tQMiwi0SHRzJv725LI61YcxnGxMIuyuNT7rDu7IH2QZiFWgkJiJd0BRsPs4riHBapmbwpDKAJnMBfteAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLDXv6ex/ybbVkZN/HY5bluSqQOwxJbaWsrV2Ca+v44=;
 b=U+bH7aPHq8KhfP9NQxqlpWgaLsaz5ENpR0B1tPhxFftrmDqbGbSjA7PTny1cKZTf7juXDOZ4gfZfSs7EHAE8Mii4OrbDIhlp6mzl93GL1MSFo3u1nw2JOAHxY/VqfEpAm17X+nJfrvxRs4/5e5XOJj9U1jXDEvg6zhV1gMLrddjpWM0FDnP9H/MSNj6EV95sH7gbP1L/4G+hggQLUd8iPBqSGU2MCr0a5QXHVZIV1a25nLbAF2xAqzlo5t+M6IDXMEx6dEy2kYUPB6emWNfFpfVeFKO8suJ3yzGQv371sOviIFkqper3b/guW8a0w22PUl5zpTQSVud/lop7Bgr/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLDXv6ex/ybbVkZN/HY5bluSqQOwxJbaWsrV2Ca+v44=;
 b=XAwKedgMfqdhrWB/YTiRcyxrcUKQdEZr+NKEmHe/yPt+aOPyd08MpKS7Zj6G2wrxpWkoU+/zdWGtBLK+9eeLr5wKTUHX5b8R4nt7V7DezsF3wmoBSTKJW9x8gnnyjh+EbFrv4f/yDnbOMlMQsJYR0YS04g9OWAgr+TsK92Nv8Ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM7PR04MB7093.eurprd04.prod.outlook.com (2603:10a6:20b:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Wed, 3 Aug
 2022 07:47:58 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 07:47:58 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Subject: [PATCH] clk: imx8mp: tune the order of enet_qos_root_clk
Date:   Wed,  3 Aug 2022 15:49:39 +0800
Message-Id: <20220803074939.3488418-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 552131a4-81f0-45fc-7e9c-08da75247b9a
X-MS-TrafficTypeDiagnostic: AM7PR04MB7093:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GI+bspAKBKBKIh7gRIvZFYYC1q9rLxpvstE7Q8upvQco6CbAPxkaPkkRUZPdh4lAol/JpZZOOL/WnUplSqdDPz3svIRTidqX2H6D9Utrx0FxAq6CIN63Y2NKP1X7Ls9z1fUzUVJa6qiErfftv7ARUM0uGmvk+FbnJ2My1rwNb9oE+7T7jR1fn8izf//OBryuh8JXhQd7WWmYueKRp7ZecW1eso8oR11v7kp5iha66nkVdLNzdqejtuMOvRtnC44oXGEQgrexpNJMkWkM6WMKKOfdXso++V0GTWYF8Sdg9/99Ij2zPrDmo+Oi1dNq6Sk4upR6eoDFDkBCYXNHofIxvUKWKrKalpikxLhsiefmlxPATO6TZCPTsb2vkV+Nd5qfuyAr0fS0wmV6s5B1BBNyriKRO95C1gcgOiv6QTPgJn2B1ZZ38yoYW/eL2c6rLxQoZGYmnwF7m5w6B5oWJpTD2RsGqCMoJG+Xi5hY/Q3KJDbmqoSNzpqRXSam7ncybCmWe/4a1tKO1CIkl8ErSGVvKHXDW7NZnoR4gPsK5u7CtxoCCuNDCjo7ev4kitDqdOyzhXThT/oGlMFUVhEyMBY8bXoT7xK30dshThBshU9Kage/80Lk1hB6N5KfUHWFfufhZk2oR3Q2NqJnx9LbpOOPKMjAc9nhIoSvwSSuzvntFnEnsPfzHLCuHzSGQzVlqGenrO0sGmxmdJvLhCLe1zw/6PMF+kp5bPnsmOR2PGmuuABTW776F7q1LOy8WNRkDYhj1o176fk7Z47gaLK1oexB+HhzGa14xY1eIq3EyRH5otewKVmSbSwMxC44MCflRGkS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(6666004)(6512007)(26005)(478600001)(5660300002)(41300700001)(86362001)(6486002)(2616005)(8936002)(8676002)(66946007)(66476007)(4326008)(66556008)(186003)(83380400001)(1076003)(54906003)(52116002)(38350700002)(2906002)(38100700002)(6506007)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jZzsdFkSx1RDrn1Q9foRKEZF/poi5LTGPYNmpAPA6yLTdX9JmYbqFi6fviCl?=
 =?us-ascii?Q?U66YshUqd5wDiG3IBAIm+qhVRpl7H6BiT5EJq+4x4dSUI9F5vTC7lG+sTIAA?=
 =?us-ascii?Q?7+SK+W8/qPU1f69JPma72bYvDgviAlq8RIWznGgYmvFXY7z6rKhkuCs1LZ9u?=
 =?us-ascii?Q?GxmBv8Tlit8vK1R1inU9z4yBcl6GHaUuKxgz6ickoFDL5hIT9H4Gtv/AHyMK?=
 =?us-ascii?Q?uXMQzIgYAK225XnPi9n74I28hsXa8EUbobFXdvRvJ8OHdUiET8a0xzfCCLwb?=
 =?us-ascii?Q?Yo/G2Vbazs7gvDYz1ipE+kTQvf4bQBRO4Uw0nGctjukPLXoO+n5HCPtROhdz?=
 =?us-ascii?Q?BSMacN9x5X1TtapzduyV+6FV8+L2vgyO/flJedad68N4srLf/W0CTxyAx15h?=
 =?us-ascii?Q?FzCk+hKGElN1VlcpNLsJXQXiVW5Y5WFjmPX2FqqbR5FLfPUs3Pg3wCLzw3Rj?=
 =?us-ascii?Q?yFyg/naakCCoQjOXh0zhzJ0/ztcwZbMbzrIqA8+ejkP/EhO3avesg7DBcfDt?=
 =?us-ascii?Q?aUWHD9fCCRGgz7dgThtRFfWlnSvRZKDveI42CGTmRqVReShJz/Jpox0+jBZx?=
 =?us-ascii?Q?6D4TROQztrT1pTi4rQZ4RbOidb5TsdlOFoFe6DIBa91bcOBSo4AKrJStotPX?=
 =?us-ascii?Q?wGwR0UruHMFPN/1S3FHqPlGJhbDGe8IAf8e+U5dKPAAGxR3HM8CTj6U+IdFo?=
 =?us-ascii?Q?CSHXh9atZmgwXE+lwNYDyUfcI+eyP+Z0soxDN0Y5M51hiHBpI6ksGn0HAlqJ?=
 =?us-ascii?Q?RgHeWOktgNfwx9WJUNhjpjeyL9aS3hDTOTe/S4tDikEMse0rtfalzzBTWpCK?=
 =?us-ascii?Q?Q6quSPtDkyFhgCAG0uHa/Jkqjm64gWbyduMM7woXKkL6mJIP9/rv7hG57MAq?=
 =?us-ascii?Q?s2XlyCaNMtFnaMEcUiz/6aIQHF36+p9MeEYJunEE0udcAndHP5koGGrOQa9a?=
 =?us-ascii?Q?bOeTWqQDHbGQoMOgKGic2+aKc2ODqNNcPt+X/8TYj6LQCaHL8m4EwNzKFXn8?=
 =?us-ascii?Q?wTvybJSVbCh5+7SuzS+Pw56O6dLyMcQueLahRU9ic8IqlFpc4OaqPNTpPgf3?=
 =?us-ascii?Q?ODfEqWG3stFX3yUlq/nAZMnmtQ3xJoi0TnSgELgnFD9oSY9LPJFTzs2uPCOp?=
 =?us-ascii?Q?eir8cAOY/bAUiIaAxTaLtJqIct9tIGHWVXzp6twUZ8mDL72WvcQifwk0eZqP?=
 =?us-ascii?Q?ilt+7MQRLe3SpQz22NKpGoKLK/QNln6eCAKP4MncoxrLcneqsXWv4N6HUg08?=
 =?us-ascii?Q?2cnvppf5TeL9tWpzAIyInp/MxCbl8/PJKNjy644rNNB/LDl4yMFdSm8q1TFr?=
 =?us-ascii?Q?xLl63XK8gfmNftBbU5o7mPBpspRJpLtZ7kIAWRRF1Qw0fz8qAOj3Dptk6o3e?=
 =?us-ascii?Q?SyzCkg19B+dmbCi+V05y8WqGnPjIhVCvmYtXauQuDW5ckLYNhlyxq4k9dP47?=
 =?us-ascii?Q?RsPAkAIJZCIa6B4RHdy2gNs3hR4t/bDUHiHHLIPITC5DUA9l9BJF/F4fEfS+?=
 =?us-ascii?Q?A70FRqVag3TRLKpTactZHmp8Ye0DIBSQ579EqgGDQLUQqbNcGNOeMytgPnjO?=
 =?us-ascii?Q?qvnyX+btyRnA9/q3RSduIpgNfTzqaK6i7zgUC/dr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552131a4-81f0-45fc-7e9c-08da75247b9a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 07:47:58.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmOvYlp5KIB+Hf//D7K7Q2XwYnk7c1OgtW9Y+blVYJ0PHWY2SCn+rc49CCou2VLYqZ3vkyCkvAgtF7zu2cA7qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7093
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The enet_qos_root_clk takes sim_enet_root_clk as parent. When
registering enet_qos_root_clk, it will be put into clk orphan list,
because sim_enet_root_clk is not ready.

When sim_enet_root_clk is ready, clk_core_reparent_orphans_nolock will
set enet_qos_root_clk parent to sim_enet_root_clk.

Because CLK_OPS_PARENT_ENABLE is set, sim_enet_root_clk will be
enabled and disabled during the enet_qos_root_clk reparent phase.

All the above are correct. But with M7 booted early and using
enet, M7 enet feature will be broken, because clk driver probe phase
disable the needed clks, in case M7 firmware not configure
sim_enet_root_clk.

And tune the order would also save cpu cycles.

Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V1:
 Patch got reviewed in NXP internal.

 drivers/clk/imx/clk-imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index e89db568f5a8..652ae58c2735 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -665,8 +665,8 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_CAN1_ROOT] = imx_clk_hw_gate2("can1_root_clk", "can1", ccm_base + 0x4350, 0);
 	hws[IMX8MP_CLK_CAN2_ROOT] = imx_clk_hw_gate2("can2_root_clk", "can2", ccm_base + 0x4360, 0);
 	hws[IMX8MP_CLK_SDMA1_ROOT] = imx_clk_hw_gate4("sdma1_root_clk", "ipg_root", ccm_base + 0x43a0, 0);
-	hws[IMX8MP_CLK_ENET_QOS_ROOT] = imx_clk_hw_gate4("enet_qos_root_clk", "sim_enet_root_clk", ccm_base + 0x43b0, 0);
 	hws[IMX8MP_CLK_SIM_ENET_ROOT] = imx_clk_hw_gate4("sim_enet_root_clk", "enet_axi", ccm_base + 0x4400, 0);
+	hws[IMX8MP_CLK_ENET_QOS_ROOT] = imx_clk_hw_gate4("enet_qos_root_clk", "sim_enet_root_clk", ccm_base + 0x43b0, 0);
 	hws[IMX8MP_CLK_GPU2D_ROOT] = imx_clk_hw_gate4("gpu2d_root_clk", "gpu2d_core", ccm_base + 0x4450, 0);
 	hws[IMX8MP_CLK_GPU3D_ROOT] = imx_clk_hw_gate4("gpu3d_root_clk", "gpu3d_core", ccm_base + 0x4460, 0);
 	hws[IMX8MP_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", ccm_base + 0x4490, 0);
-- 
2.25.1

