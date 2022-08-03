Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B39C19F28
	for <linux-clk@archiver.kernel.org>; Wed,  3 Aug 2022 08:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbiHCIQJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Aug 2022 04:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237387AbiHCIPz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 04:15:55 -0400
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30077.outbound.protection.outlook.com [40.107.3.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323DD60E2;
        Wed,  3 Aug 2022 01:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOeK5WzLRroSvJIiHmp8LGIY969fr/ELC5OzqfbIYaakJARYpJhlkCSpFpL0yvPYD/qZo6Xdg5HfD2RvosWEAOIvm1ms1tl7gHzJumNy/Ds706xYIQobLgpQx15B+OcHr+IrbaFnmE0MWtzm4Uc7U+Fh9c4SRW20qq7dJ/ILQ0jvN957ysJJ1OKnnyi20eELuVTAfyGQ6/duXS+ygTPraahwxaiMu0/mLLbz0nVe0jcChhri/q0zoifpM1BmotFEx/Vs+BhXIdEd55fHTOGdvJDHmfs4RIUJo2pidfSMgLRHQ5mcY/P+mqNVXEBMrgmGHg6pfK6Foh1WqGvi8o4Xww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upM2od+mQGjjSmS5JPbpNT0pfKtT2eOu+RlUCIGonr8=;
 b=WlbMBcdx6+mKZsI2RroaU8HdIDq4LkYgCKynhp2p4urYW84zGTddUYplvd9hucUrq3m4imyGZCp7FHoc7bxAqhfcW0DmJd2dBSRl6yen4UIy2rudRCWZm6YcV2VrtxvQDWc5TEPfAAw9J0RsDCn3E9LLxEu817as1dbtCmd1zHKIsqvDj+y5itkNxwrbrKZX15Ka3ab0JFnLRN34PYWWlyweMPkmvPzJ2RzpxuTrKPzpJsQ8YTav8dk6/sOUSiGexm9iblNkSB3c1LnqBdESKplQBRVg68vbfmMVD5iXUZ8MlT8dh/XQtXbkp4vbLmSSRFIlJIHKkO/YTRzmOF10Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upM2od+mQGjjSmS5JPbpNT0pfKtT2eOu+RlUCIGonr8=;
 b=Dqg4HBxkMr/xCIAHuevejS0GR4JOcqLnLBis0dgMJ3WghvbOGyoB8bDxZpNXmvotwL0GZlzUVGxKEoqfHMZ0fff6+CsDgNIbk/3TttB7rTfrBbtIhpjpbtyTUhrqcyK/uqbQUzU99XC4AidqgGtues8YCpEzWaAflBtyoNIQcN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM6PR04MB5560.eurprd04.prod.outlook.com (2603:10a6:20b:9f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Wed, 3 Aug
 2022 08:15:50 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 08:15:50 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH 3/7] clk: imx: clk-composite-93: check white_list
Date:   Wed,  3 Aug 2022 16:17:09 +0800
Message-Id: <20220803081713.3504699-4-peng.fan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ebdb9db0-5ae8-40b8-a67b-08da7528604e
X-MS-TrafficTypeDiagnostic: AM6PR04MB5560:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WOdpER6b3EbNCPOMlT0xwn++GXCLZFXkW2qeXhICMnSGdd7hmI3e4tPj2tjHOkykAjHWZYVNXvtr0MqNqj353vRd1ijLOlMqWZuDpNeh/GNEprBdmAQo33Iepz5cDypTw+9yVgQv1pFm8SpYx6OZISN+gwHWMu/mKFrlL4JCQ9XTZYwr0hRSHb5gS+bLoBYeafgWfPR1Kw7wXFA/KpxwB3I7lpD5SDGdNJ49bAcx4zcU9ROIsxTQjHsbJdMrkoDVqYE+6GcFD71bIzAccsmi7QWKHvB9BMpphHVqjvtNYCoyCFvg6HVHTnGz0xX+FpoeZQh5lexay2fxejjtnuYYle2MjZecTlMKcTGpYrEmVXm3csgeiahq3QTTDnShmwMx+pTe/yFwikAof71+YiYg5UAxOSfoK6fK0jb1Fl5E79XWX34QFs3SvNqdhz6AlDpEqgbgtNl1bj0X4UsQzm8qFGWt6aNthElYQACMkSFxRyDRRSEzpFsioyzLLwF4of5TnOVvDhjJgBv8/z4xYBYnsRilhvnNemybt+XWPvvylN5ZgGEBqzwRQv+IQqzD6V/2S2BB0IsZFeAyGP+VcDk7hLy4IIijs1rQys5QLmMO2cryWWFK/S+wSiTKlXgloejn/wyFvFVeD7o4rJvwl2F0JPepxBFW3F3xm8l8A3fPgAUyy+8OYY6EEPoPNz6Ge0a6Q2bAUnJHUI2J1T2qRH6MSkzXopBL6Tb+u7OtsMq8uwodZVJpqUe/qiGYpHX/CDDzD8rxAL3y/KUV9voUR7YW8S+USR/AyUqCUB4kPOzHoQT8ZL6HdJYPr3IHrUnuXpZp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(38100700002)(38350700002)(52116002)(6486002)(6506007)(6666004)(26005)(6512007)(66556008)(41300700001)(478600001)(66476007)(5660300002)(7416002)(2906002)(86362001)(83380400001)(8676002)(8936002)(4326008)(54906003)(316002)(1076003)(186003)(2616005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cjGKsn7EByyIjPSY5z4EScORl4yG7AZ/UINGkUHhiWlgxHNkUAK1MnIsEcc9?=
 =?us-ascii?Q?5vhhYgpdBCHOkRuZZl6bhgW+bb8yAu12xJS8JM6hRB551GvfSWN/FiZCA82i?=
 =?us-ascii?Q?23xaCiKMD2TZzvrn4Ybn9rjstyi8acL+SeNPUAzHxWQRdCs60C2OUjwecSoy?=
 =?us-ascii?Q?Gqq44m2nTIbN1IlSLcHRYIaex5jWsbHdpXoARuWI9EEPuFOFW0A23eZoZCo7?=
 =?us-ascii?Q?gli4L25Sg+2Ioimi/SEUfrHoAHzAhcMSYaKY/tXBhfW5eQ/DvO1V3l5mSNvR?=
 =?us-ascii?Q?eoMnigWy3v05btAN2ei+u5oV9ZYHk4DzHShlm7CM8Os7WtaWwxmAhwM5k+N+?=
 =?us-ascii?Q?SC9lOzxQ/R0WUtmOeXrR0Q/tR0Bh2e2S2lex2CJ3Z97VPeiZ2cmACl35m2DI?=
 =?us-ascii?Q?HrnyzeUH//Zm3Uzcvenz9TmF5qsnIiMF/hU66FJw6O9Q604NtYqW3DEyto4+?=
 =?us-ascii?Q?XMbiJMSTFu6PmPWMzcZtf29hdrO+xXYUdL12Ffl59KGKUr/YRH5eDErlOILz?=
 =?us-ascii?Q?wHriZPW4Vl8A08qJ3m5GU9ww6ktJOnNQrokOEdpHfhDGnZG4gcMVqa6Bp3kP?=
 =?us-ascii?Q?II9jkqg1su9KLW/duI/rolZp/FD9vgAE4TWoePnESFosuHZvguwQ7jgjKqJQ?=
 =?us-ascii?Q?fzN8k4Kr9SgpdKsKMbL23n4NBLLWWK+lel4Y9oxtVga3gN9uxAA28pxFYW2Y?=
 =?us-ascii?Q?JdbRxp9qHdcjqDbTxGx8WeAC9KZK95rlFLhwWc2yVpDTQpOKu+FpZMzEIZyg?=
 =?us-ascii?Q?3tTvVjJA939NUjU/sdxkvur2lZBh+haQhsK0EQUBX7CcQ8iGvwTTVRqxyziq?=
 =?us-ascii?Q?rYE70oRj0N5BK8j69f2/jc/nQJSCSYtZjrhXJNg8PQFTOP9qvADmIKP4pnSU?=
 =?us-ascii?Q?iqFvbA6oQBwKFjnjTI8jkyNChkCX5B/XfCAQCTLdoJtvG/O2QkdpYABG+f5V?=
 =?us-ascii?Q?GMeply5YhzIjp42x8X7Qno7Vx3IZEnbmNQr6s6uagnzk3NiMJB/TYSPRv8Ww?=
 =?us-ascii?Q?VVjOC6nnrWI5kL5iQZlUT/Hvb6rxQ7mxK6cGeEnYF5PFL4EYRAi4eo62iuz8?=
 =?us-ascii?Q?TdiTZypVewCEWEjbz+iQvNGOlNmXnIJdtyZpElKwIodDNI5fPIfq8CgUXn5b?=
 =?us-ascii?Q?iwKN4ezPm1yk92iLuNSg90OqcpEtWP/1jYZ16JdytkyxFfi6SHHHar0fs7AS?=
 =?us-ascii?Q?lPdqWK20l1rV2LmhHQDuqmB+5k0OHZvae46aZac60KrZWP6MZ1NARO1fiJ6S?=
 =?us-ascii?Q?4CEWX77FC1RFWsngMKJjzfvq32jHTJWcMm7fb1lmQJVHZF5pOl5QiLrQcMRP?=
 =?us-ascii?Q?CmR0v6hSSkG9cOz44MsvmosWklgLAPQN2P5XaoIfHF1Z5Fbo/g3h6Lovokgs?=
 =?us-ascii?Q?f1GLM2vfYPcmMpnGHBTcV+WJw/ZMjRfe+f6xnhFqJz5YnBlJ3V6h88dZbrY9?=
 =?us-ascii?Q?tBHuuWkJeqmx2VPWfqwTCF/BUYS6bZZK/NDClB+53rWTTEsWygrIvTYmUFkW?=
 =?us-ascii?Q?yuC2bclHFDW6LxPGB2dXC0GZBORMSCNW6VtgqU4qqKeEvZD4YyfV9M5pXymX?=
 =?us-ascii?Q?SE8jqcgs8pM03ujxO84TXvnswpjDHnSa1qoc1NAf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdb9db0-5ae8-40b8-a67b-08da7528604e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:15:50.5004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TasCtsvoV4fmqJj1eu1C9QcIZKP4/+SysknvIRXCcGba0iG0VNRcbdmSChzPmk8qq3S6X7AM8UkovKIKO1N4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5560
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

The CCM ROOT AUTHEN register WHITE_LIST indicate:
Each bit in this field represent for one domain. Bit16~Bit31 represent
for DOMAIN0~DOMAIN15 respectively. Only corresponding bit of the domains
is set to 1 can change the registers of this Clock Root.

i.MX93 DID is 3, so if BIT(3 + WHITE_LIST_SHIFT) is 0, the clk should be
set to read only. To make the imx93_clk_composite_flags be reusable,
add a new parameter named did(domain id);

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Reviewed-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-composite-93.c | 8 ++++++--
 drivers/clk/imx/clk-imx93.c        | 2 +-
 drivers/clk/imx/clk.h              | 5 +++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-93.c b/drivers/clk/imx/clk-composite-93.c
index 19f4037e6cca..74a66b0203e4 100644
--- a/drivers/clk/imx/clk-composite-93.c
+++ b/drivers/clk/imx/clk-composite-93.c
@@ -28,6 +28,8 @@
 #define TZ_NS_SHIFT	9
 #define TZ_NS_MASK	BIT(9)
 
+#define WHITE_LIST_SHIFT	16
+
 static int imx93_clk_composite_wait_ready(struct clk_hw *hw, void __iomem *reg)
 {
 	int ret;
@@ -180,7 +182,7 @@ static const struct clk_ops imx93_clk_composite_mux_ops = {
 };
 
 struct clk_hw *imx93_clk_composite_flags(const char *name, const char * const *parent_names,
-					 int num_parents, void __iomem *reg,
+					 int num_parents, void __iomem *reg, u32 domain_id,
 					 unsigned long flags)
 {
 	struct clk_hw *hw = ERR_PTR(-ENOMEM), *mux_hw;
@@ -189,6 +191,7 @@ struct clk_hw *imx93_clk_composite_flags(const char *name, const char * const *p
 	struct clk_gate *gate = NULL;
 	struct clk_mux *mux = NULL;
 	bool clk_ro = false;
+	u32 authen;
 
 	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
 	if (!mux)
@@ -211,7 +214,8 @@ struct clk_hw *imx93_clk_composite_flags(const char *name, const char * const *p
 	div->lock = &imx_ccm_lock;
 	div->flags = CLK_DIVIDER_ROUND_CLOSEST;
 
-	if (!(readl(reg + AUTHEN_OFFSET) & TZ_NS_MASK))
+	authen = readl(reg + AUTHEN_OFFSET);
+	if (!(authen & TZ_NS_MASK) || !(authen & BIT(WHITE_LIST_SHIFT + domain_id)))
 		clk_ro = true;
 
 	if (clk_ro) {
diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index f5c9fa40491c..151b2051a5e6 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -293,7 +293,7 @@ static int imx93_clocks_probe(struct platform_device *pdev)
 		root = &root_array[i];
 		clks[root->clk] = imx93_clk_composite_flags(root->name,
 							    parent_names[root->sel],
-							    4, base + root->off,
+							    4, base + root->off, 3,
 							    root->flags);
 	}
 
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 5061a06468df..396a5ea75083 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -445,9 +445,10 @@ struct clk_hw *imx93_clk_composite_flags(const char *name,
 					 const char * const *parent_names,
 					 int num_parents,
 					 void __iomem *reg,
+					 u32 domain_id,
 					 unsigned long flags);
-#define imx93_clk_composite(name, parent_names, num_parents, reg) \
-	imx93_clk_composite_flags(name, parent_names, num_parents, reg, \
+#define imx93_clk_composite(name, parent_names, num_parents, reg, domain_id) \
+	imx93_clk_composite_flags(name, parent_names, num_parents, reg, domain_id \
 				  CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
 
 struct clk_hw *imx_clk_hw_divider_gate(const char *name, const char *parent_name,
-- 
2.25.1

