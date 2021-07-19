Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C61C12002
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B1AE6117A
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 05:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbhGSF1z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 01:27:55 -0400
Received: from mail-am6eur05on2062.outbound.protection.outlook.com ([40.107.22.62]:46049
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229906AbhGSF1z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 01:27:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP9PyUxhgjHuA8H+xbx4Q9s6PhDVOmvYDYwEaVCdR6XqS/UjdvNo2P4hPDbccZ3HF0FydzRxDWj6wQehepoNMCkWhFzqY7rWa9Mp1gmEPdSUeMsUJoxqhVY0c/D3SGay6w12LRtMTVR+FMzioxheknPJquWXNIs9Yu5UYgYnqXb0UgHJfx3CvS94cJD3rmVkVkuL+T9Os5x8htxsQVe21wYxyAdlHtJIBE+bFJL95MYM7WytF6YDoAmupkSvOMxHAHOUS73aCZYuvKxzq7WHgAyRt7d+PUh/TfJ2AqWySF1gbLn7P/eeTtNzMIH5pZ+cIy11mvRgttMACx87mBE6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2eDneCKknwYklHa/Dw/8a2/nssGUX258MoQJ8nLSmc=;
 b=FNKmIqehDyzu0QAotOfTzbhtKID1kRukwzBbXvPzJSnrGGhisjPzW+6+qlVoztdr/56IJayh4oy1UZ3Jt+kXnN16SY08DScJfpfxaMuIa4Tnv1KEnT09guulO9QVCeqhvlwE8JoatK6ln7A4l1/rlNNqOR5ZOkJyJAr5xQGUvYd6YW1cPHgQjUqzsSdryK5MRTq114hdPrBYobywCK4ii1/e6f7g6QIHr0KvXETwmb6s/0RFl2weeSQOPWkQJeAq1GSGXSyjBKej8t+iriBw4aRltUt0fAM06vWq15WZLjeC2ZxwPb7qYYGjROQsKct6DIRkTAwvtD9MWKrbOYDxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2eDneCKknwYklHa/Dw/8a2/nssGUX258MoQJ8nLSmc=;
 b=KTzQpzmzNqHthB231RfSvCRA3Z67437lBtwgQfR4TgaCBQdT5FNQtjY50YogCU91QJrAngrR2M40c9bXdQ3273jg9s4GB2IzlcU9h+EXjkK6Ji7VrL2dirjpJsakWou5XzNriYZV3KWldMXqeM8HsKDpqvW7m347vrtfsZIC16g=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5244.eurprd04.prod.outlook.com (2603:10a6:10:21::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Mon, 19 Jul
 2021 05:24:54 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 19 Jul 2021
 05:24:54 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        abel.vesa@nxp.com, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 7/9] clk: imx: Update the pfdv2 for 8ulp specific support
Date:   Mon, 19 Jul 2021 13:34:28 +0800
Message-Id: <20210719053430.1442505-8-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210719053430.1442505-1-ping.bai@nxp.com>
References: <20210719053430.1442505-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0126.apcprd06.prod.outlook.com
 (2603:1096:1:1d::28) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 05:24:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f325522d-d441-4eff-6177-08d94a758a63
X-MS-TrafficTypeDiagnostic: DB7PR04MB5244:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5244942C37D74EF93789BE5787E19@DB7PR04MB5244.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8oq/+WQisx+vhNueai72FH4JwrlL7l9FJHEEixDaXJfB05o0ocuu2LRjUb/jBYYUBVCGGOaMRfLV36z92Akk/rAZp8Y37O467NwT9TEI3tsUn8e9rZOKl/wbWWmPPgIu33xkgEFbxPXW3nO5v7eX1v7lhxASErYiseafd1k4v+HjhMMvY4eIPWvU4owfp69XoCWRYDEle7Plf9z2ANxg5nPBnjcW/UvXdAEV0R1A4tIIOXKE695QAhXMKx7ITLIbxpX0gyyBMHnX30D9ZIaczMvSPN+vvrqPothglKQav27P/VeoPtDyG0YxVROZxb3dqrYUWtCiHc8Mc1u8/jIfKyu8jCcz020CyJV59z4YZps2dUzOO4Gtobf/puXkCI6rBjp2Pp4/0rttyIr5FLNF9sHMPYOh9JOarHqbjHPCKWJwrgOBbnAu2e+h3XOwLqdM6BDV9k2owCx3cpf1jwVCck+3l8TX3TOR/Nh8qfX6wvut53zLVbZ07avpsKDfZO2cyM5a4icj1BF1ffAmEsgHjgvlHWG+s6up40L5GUqDfTGVjmaw+vUdmyRb55r/PCT1CyfdM8b9wc3iKlozyrKQy1tSP3ncbeZ+LSgEqZxxVQ+FXkTMXBI8etYkhhvORDXZf3Xj1K6u2e25rpEMw8SNN4iqDlTVrRTq+mcjZF6ZbZBnrgYwELVc4l925RooZ1bLcSoiQ/Io0aQIedOJpc96QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(478600001)(83380400001)(6512007)(38350700002)(38100700002)(15650500001)(6506007)(956004)(36756003)(2906002)(4326008)(1076003)(316002)(5660300002)(2616005)(6486002)(52116002)(86362001)(26005)(66476007)(186003)(66556008)(8676002)(66946007)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q8g04j8D6hTg9vbe8Hh9dEHaFMOUH4vGFVBiOs/1RbwpEbPBBdrRBykMTr+d?=
 =?us-ascii?Q?FQW9JNAIwXyArzuxAkmg5wnRPU9JipzKdoa7JeC3K7PTCHZNgIx08PUZxB8s?=
 =?us-ascii?Q?EaVUmG7SUG9AQnK5VroR6jedJQWZUQw3r6VjYLW9JCBXdj8qxU+qnTpoFmEG?=
 =?us-ascii?Q?bqdybog8hYpdkagvoYbEQpQQ0T7f3dNcBTV87ueCdpB1gcJO7Mntw/qhhT0O?=
 =?us-ascii?Q?CmXuRdbxGSb5b/AfbW8PTX6TjmtIXXDaoguiP7kwAKX8o11aGgzlQkxxYwXz?=
 =?us-ascii?Q?NEjLC93dteW0k2ruuUgBhNpiJzrHQGGlvKOg+CPgBSLGM+r8QVGGdH9SuPhR?=
 =?us-ascii?Q?0OlAGM+Bu7nja3Thsz9I8BdRq7uKyGXKVvt/ML7+asTZVaGVQNKFwUnK5i8L?=
 =?us-ascii?Q?1HKJJvSU2buOE90uzdTglE99IXVF+AuNL8H1BtXf+PLAgPuiyo77czRlSSzR?=
 =?us-ascii?Q?vB5fZ+ofHFcWEfcgFzuGjCOnddXtpqKjEfveEYyXuAvjN+HZwBbNosHjy7hP?=
 =?us-ascii?Q?6JZSnjyk9bDcmmf8Y1cLRThxuVhATdEJBhNy+JvIwT5BQVUbB/KF6DSZ7wj9?=
 =?us-ascii?Q?W9gixWj8L7Nz2LERgO/tlvOIV4A42YuJcCyEhozOjbKEppXyZlHyI/BJZGAs?=
 =?us-ascii?Q?lNE4aChAtxD5D0goRHR9kIaJNVppYRBiU/URpBFrCkGRwGBZBOBYobE5yKfO?=
 =?us-ascii?Q?wzhHuAwZCrOFKgLYY4bZhfWf1O1A7CImuZc5a2OgIb9sd9L4PTBvif/yunVk?=
 =?us-ascii?Q?DD4R7cPLz+ghyDXb2TgWiXSJC1Ru1AMcrfiI5sBY7bMWWpFNT8FxNA2pM6Qf?=
 =?us-ascii?Q?z/CTteHoNup6wJuJqBnI7sSghyc2V6O8+K4q7eWT0vKsumYJj9wPSJSEJncF?=
 =?us-ascii?Q?SkoeFXbMoCwdh3izHTXmnQKKczGAmipfm8NkNGZuqchgxRRPJsJYK5sdl9Uz?=
 =?us-ascii?Q?ptYo8DHGqK7CtZpxCc9AhPzf+p4KDl/rOglmMEzlXmGdAAb+odCLVnukOFMP?=
 =?us-ascii?Q?uCx1Qr6uxl1PbaXjB7LKKbLLDOrxvWmnLZds6krqtWQ7Jdmh4iY0ggLrTWeA?=
 =?us-ascii?Q?ElAtozg55+bKGBYJZtKO+L8DTwiEC1RrhVkiNppMFfCu9U9XtTsVwJXTcT0S?=
 =?us-ascii?Q?bsjqg1UaaLRB7JJQZvaDfyF5So2dlsQaWp779YFayTyRx1Fm7SCvTO8eB8D6?=
 =?us-ascii?Q?zfnXh3/m3XGxD7n/77poJIhDbnaZtmVfLPeUlTc0b+2KL81DiAX5QGLo4eD+?=
 =?us-ascii?Q?arbMFHNhu+E2xYGT99Rsl1ykWda5T13kPNhSaRcBkuFIZsVi8bi7BvT6smVb?=
 =?us-ascii?Q?MJzF1osRD0vY38f+6sm9dHfl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f325522d-d441-4eff-6177-08d94a758a63
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 05:24:54.4805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9Jab+HutumJBL5A4RxJ1gXjJptpSnJKAe0jGB6wdIHEFa66r/inbx1vTgtQIHgfIHFF6xK3nm0lhK028hOn0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5244
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On i.MX8ULP, the 'CLK_SET_RATE_PARENT' flag should NOT be
set and according to the laest RM, the PFD divider value range
seems will be changed in the future, so update the pfdv2 to
include the specific support for i.MX8ULP.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-imx7ulp.c | 16 ++++++++--------
 drivers/clk/imx/clk-pfdv2.c   |  9 ++++++---
 drivers/clk/imx/clk.h         |  9 +++++++--
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
index ba50d6db8097..b6e45e77ee39 100644
--- a/drivers/clk/imx/clk-imx7ulp.c
+++ b/drivers/clk/imx/clk-imx7ulp.c
@@ -82,16 +82,16 @@ static void __init imx7ulp_clk_scg1_init(struct device_node *np)
 	hws[IMX7ULP_CLK_SPLL]		= imx_clk_hw_pllv4(IMX_PLLV4_IMX7ULP, "spll",  "spll_pre_div", base + 0x600);
 
 	/* APLL PFDs */
-	hws[IMX7ULP_CLK_APLL_PFD0]	= imx_clk_hw_pfdv2("apll_pfd0", "apll", base + 0x50c, 0);
-	hws[IMX7ULP_CLK_APLL_PFD1]	= imx_clk_hw_pfdv2("apll_pfd1", "apll", base + 0x50c, 1);
-	hws[IMX7ULP_CLK_APLL_PFD2]	= imx_clk_hw_pfdv2("apll_pfd2", "apll", base + 0x50c, 2);
-	hws[IMX7ULP_CLK_APLL_PFD3]	= imx_clk_hw_pfdv2("apll_pfd3", "apll", base + 0x50c, 3);
+	hws[IMX7ULP_CLK_APLL_PFD0]	= imx_clk_hw_pfdv2(IMX_PFDV2_IMX7ULP, "apll_pfd0", "apll", base + 0x50c, 0);
+	hws[IMX7ULP_CLK_APLL_PFD1]	= imx_clk_hw_pfdv2(IMX_PFDV2_IMX7ULP, "apll_pfd1", "apll", base + 0x50c, 1);
+	hws[IMX7ULP_CLK_APLL_PFD2]	= imx_clk_hw_pfdv2(IMX_PFDV2_IMX7ULP, "apll_pfd2", "apll", base + 0x50c, 2);
+	hws[IMX7ULP_CLK_APLL_PFD3]	= imx_clk_hw_pfdv2(IMX_PFDV2_IMX7ULP, "apll_pfd3", "apll", base + 0x50c, 3);
 
 	/* SPLL PFDs */
-	hws[IMX7ULP_CLK_SPLL_PFD0]	= imx_clk_hw_pfdv2("spll_pfd0", "spll", base + 0x60C, 0);
-	hws[IMX7ULP_CLK_SPLL_PFD1]	= imx_clk_hw_pfdv2("spll_pfd1", "spll", base + 0x60C, 1);
-	hws[IMX7ULP_CLK_SPLL_PFD2]	= imx_clk_hw_pfdv2("spll_pfd2", "spll", base + 0x60C, 2);
-	hws[IMX7ULP_CLK_SPLL_PFD3]	= imx_clk_hw_pfdv2("spll_pfd3", "spll", base + 0x60C, 3);
+	hws[IMX7ULP_CLK_SPLL_PFD0]	= imx_clk_hw_pfdv2(IMX_PFDV2_IMX7ULP, "spll_pfd0", "spll", base + 0x60C, 0);
+	hws[IMX7ULP_CLK_SPLL_PFD1]	= imx_clk_hw_pfdv2(IMX_PFDV2_IMX7ULP, "spll_pfd1", "spll", base + 0x60C, 1);
+	hws[IMX7ULP_CLK_SPLL_PFD2]	= imx_clk_hw_pfdv2(IMX_PFDV2_IMX7ULP, "spll_pfd2", "spll", base + 0x60C, 2);
+	hws[IMX7ULP_CLK_SPLL_PFD3]	= imx_clk_hw_pfdv2(IMX_PFDV2_IMX7ULP, "spll_pfd3", "spll", base + 0x60C, 3);
 
 	/* PLL Mux */
 	hws[IMX7ULP_CLK_APLL_PFD_SEL]	= imx_clk_hw_mux_flags("apll_pfd_sel", base + 0x508, 14, 2, apll_pfd_sels, ARRAY_SIZE(apll_pfd_sels), CLK_SET_RATE_PARENT | CLK_SET_PARENT_GATE);
diff --git a/drivers/clk/imx/clk-pfdv2.c b/drivers/clk/imx/clk-pfdv2.c
index 9cba83521988..42505669cdfb 100644
--- a/drivers/clk/imx/clk-pfdv2.c
+++ b/drivers/clk/imx/clk-pfdv2.c
@@ -200,8 +200,8 @@ static const struct clk_ops clk_pfdv2_ops = {
 	.is_enabled     = clk_pfdv2_is_enabled,
 };
 
-struct clk_hw *imx_clk_hw_pfdv2(const char *name, const char *parent_name,
-			     void __iomem *reg, u8 idx)
+struct clk_hw *imx_clk_hw_pfdv2(enum imx_pfdv2_type type, const char *name,
+			     const char *parent_name, void __iomem *reg, u8 idx)
 {
 	struct clk_init_data init;
 	struct clk_pfdv2 *pfd;
@@ -223,7 +223,10 @@ struct clk_hw *imx_clk_hw_pfdv2(const char *name, const char *parent_name,
 	init.ops = &clk_pfdv2_ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
-	init.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT;
+	if (type == IMX_PFDV2_IMX7ULP)
+		init.flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT;
+	else
+		init.flags = CLK_SET_RATE_GATE;
 
 	pfd->hw.init = &init;
 
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 2acac152c4aa..76de2972d021 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -47,6 +47,11 @@ enum imx_pllv4_type {
 	IMX_PLLV4_IMX8ULP,
 };
 
+enum imx_pfdv2_type {
+	IMX_PFDV2_IMX7ULP,
+	IMX_PFDV2_IMX8ULP,
+};
+
 /* NOTE: Rate table should be kept sorted in descending order. */
 struct imx_pll14xx_rate_table {
 	unsigned int rate;
@@ -220,8 +225,8 @@ struct clk_hw *imx_clk_hw_gate_exclusive(const char *name, const char *parent,
 struct clk_hw *imx_clk_hw_pfd(const char *name, const char *parent_name,
 		void __iomem *reg, u8 idx);
 
-struct clk_hw *imx_clk_hw_pfdv2(const char *name, const char *parent_name,
-			     void __iomem *reg, u8 idx);
+struct clk_hw *imx_clk_hw_pfdv2(enum imx_pfdv2_type type, const char *name,
+	 const char *parent_name, void __iomem *reg, u8 idx);
 
 struct clk_hw *imx_clk_hw_busy_divider(const char *name, const char *parent_name,
 				 void __iomem *reg, u8 shift, u8 width,
-- 
2.26.2

