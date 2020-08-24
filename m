Return-Path: <SRS0=ipkz=CC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F80C433DF
	for <linux-clk@archiver.kernel.org>; Mon, 24 Aug 2020 07:43:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FEDA2074D
	for <linux-clk@archiver.kernel.org>; Mon, 24 Aug 2020 07:43:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="e5bwoJFg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgHXHnN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Aug 2020 03:43:13 -0400
Received: from mail-eopbgr70047.outbound.protection.outlook.com ([40.107.7.47]:38305
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725730AbgHXHnL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Aug 2020 03:43:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZvggyk/MHwoeAx4OyuzoQWtYSjtDkgL2phLMSmirQugxA46O4d+Mobik1D0KUoCnFkst1vo0jw+pAdBJbBZZD9dp66E0aoSCFOf7mgvZ7b+fFqlan9KdSXgPRkKBrdgXSzXazvqDG764OI/XstZRdbEOJY2+C/GhUurummy5DcPo+c1eQ7QtkUuYzlE8yR5a9JbotXdVV7vPussGTCQLDsl4go66bwcEIR3fKJEuIEAzIxJXIjb7cWzWBtyG81KZmg9NNyiZARIriMghLPgkXlSBfpApLIkACZ3ZhU2rPfsdld0vS6XVTa4vKzAG41I4kAtVIvcB2QHsZswUQHXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EYzV9g2hbRwX/sZdtqmho3/dPg5TwT/e9yfiz6Pnw8=;
 b=YDEob7fLlfx4EbUC1Yn1pQ/MtJGSP2KC/769sM+o4o8tYuukt93QIe1p0DpCAa4g39vhWrbb+SpQoQPV/bf3koMPD0qkwCH0uq7yPY8wflCjXdHNyxoPKESwgcsmtp09PipzB5BMnyqiZz7AJ41sUJ8qjy4uvKnUsW2+LnBVpY7GwOiidGogNhLBtTbzwnu1bZ1s7yoG+Y0VySjXi8aJcV1j2HqflvX9/B06edmx36tQkLXeW/NVMXdRiYRIB7xVrHwYiFEDEYf7H9k3+9pI2pAW9ryLEF0WuzdEM1QtDNItzTQwKBzVMcnov1+4cDjwz8LYAM6C0MhDkwf67HyH0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EYzV9g2hbRwX/sZdtqmho3/dPg5TwT/e9yfiz6Pnw8=;
 b=e5bwoJFgsLGcajVAj9rpNexVEoIRkGg8lK1QtGpSfGolWSu8VT8xRl/wquDP+0nVJZwZu2Y1cDYt/phcmjces2HUM5crtgXMGHRXK0FPZsA/Ottk73UDQhxyHOXLMnqeYrHs7LsNjATb6y3WoUfRdOCEjVPWVrUHPaCYWELjMR8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com (2603:10a6:208:c5::20)
 by AM0PR0402MB3618.eurprd04.prod.outlook.com (2603:10a6:208:16::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 07:43:08 +0000
Received: from AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::8de5:80f:f11a:5fa3]) by AM0PR04MB4915.eurprd04.prod.outlook.com
 ([fe80::8de5:80f:f11a:5fa3%7]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 07:43:08 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, robh+dt@kernel.org,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: imx: Correct the memrepair clock on imx8mp
Date:   Mon, 24 Aug 2020 15:37:02 +0800
Message-Id: <1598254622-29340-2-git-send-email-ping.bai@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598254622-29340-1-git-send-email-ping.bai@nxp.com>
References: <1598254622-29340-1-git-send-email-ping.bai@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0083.apcprd02.prod.outlook.com
 (2603:1096:4:90::23) To AM0PR04MB4915.eurprd04.prod.outlook.com
 (2603:10a6:208:c5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 10.192.242.69 (119.31.174.67) by SG2PR02CA0083.apcprd02.prod.outlook.com (2603:1096:4:90::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 07:43:05 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1af9683-d434-4bce-7b68-08d8480157da
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3618:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3618EBFBA4B9C64ED0D6E38987560@AM0PR0402MB3618.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G89ndWnFte4zvoUgH2qqoW6fhoT4tHeP+NPSce+cUqkelLL5HS1mM+j3QHj3KahxyMb31zdAgES58g0D5pXIUw6pFuPpyp93v0BEWzXpo3kstZnDZIAHZmrfr/7Lm1wdjF1Gord7+DDNi+d0l4QabwOHhQv8YBeNSyfdDP11lWn7cU4PWRlWjZdXIPHk7Qo1ptpe0oAgscq33GYW3ElylNTaQ8h/QdE+wAhz68Z9QSzWtd8x76njBZzGT62QG1hNT3AJ66er1fdfdYk/ne0vnA6Mt60A6dYYLnTkmiKBTomMXu0wjIArmzrnvMuhYzvS6R45VxxzAJkwmQVAnsHGlP3eTa6I2jtHqX5ct4qrcqk0MPnDczPw+KSUF/pHzjan
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4915.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(186003)(16526019)(6666004)(66476007)(66556008)(26005)(8676002)(86362001)(8936002)(5660300002)(4326008)(478600001)(2906002)(66946007)(16576012)(956004)(6486002)(52116002)(2616005)(316002)(83380400001)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: NQGuSI9P2ACamu1Px8+bhr4bSjBkWtLuN+G2idyl/MggX8A7+Bn7g6mnAaaUeM6ejke0hlQ5enP+nWKoib27++D7W/KfNTUhkYRJNAEEV6iP7dKBU0fEOZVJiisnepA6x/ufrJS6OY5VNdRODmvAhAFCSsUjpNjojWV8jB3vAZUMlciOY93GZ6SZXeSOvQxUkKJY2AmDkrdzC6aYT/5srAMgWEYJnuj//KoIMuttPr0mczOLYSnxJ7X8oI0MlTYkoGm4P94Ku8CdmRamao1q3DJx/WB32SUE5xpjszpvsk+2UyJY3vOThFVt6XJ0psKsJCrR+DOe+vnwJznj8nNyikpMkR7i1W68EscKzY62pCGNhaAQSmJwaUBse6m0sRUEYKGIGD05hmfvhSHrc9uZGT856jJj/n8GUSgBtlDiFf15DYWEmaSk/SyszBTBfBwCgcU779ntC3t9B3rV8TspjhCcn++QjvJ6LQOL3jY+8L0++JD0rLLoU3w8NPSPVUSO/D0eI1Fosf/INg0Q9QxQAqkP0Hw3F1zT+fGMc+oYnhfJX56yfkkTW9IxmT1EIdtHBQe7RuRKN89F9KVucB5kF9GmeGKOrFwz+EbG5kO/sJ8wQICQB7l9FgYieZ7dm7G27CLubqYrpQhLtki6yws/QQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1af9683-d434-4bce-7b68-08d8480157da
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4915.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 07:43:08.0797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyphHs9zhmFXX0NKiBb1FPpy5Yiia4nYXdfUjK4RS6KyLWVDaspCtV71wxKwCqUgmnkUGXmWWvNaD8Cze1gcHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3618
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The root clock slice at offset 0xbf80 should be memrepair
clock, so correct it. And this clock should be always on
to make sure the memory repair function can works well.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-imx8mp.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 9574ab1aff45..d03811e9cf42 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -152,10 +152,6 @@ static const char * const imx8mp_can2_sels[] = {"osc_24m", "sys_pll2_200m", "sys
 						"sys_pll1_160m", "sys_pll1_800m", "sys_pll3_out",
 						"sys_pll2_250m", "audio_pll2_out", };
 
-static const char * const imx8mp_memrepair_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						     "sys_pll3_out", "audio_pll1_out", "video_pll1_out",
-						     "audio_pll2_out", "sys_pll1_133m", };
-
 static const char * const imx8mp_pcie_phy_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll2_500m",
 						    "clk_ext1", "clk_ext2", "clk_ext3",
 						    "clk_ext4", "sys_pll1_400m", };
@@ -380,10 +376,9 @@ static const char * const imx8mp_media_ldb_sels[] = {"osc_24m", "sys_pll2_333m",
 						     "clk_ext2", "audio_pll2_out",
 						     "video_pll1_out", };
 
-static const char * const imx8mp_media_mipi_csi2_esc_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m",
-							       "sys_pll1_800m", "sys_pll2_1000m",
-							       "sys_pll3_out", "clk_ext3",
-							       "audio_pll2_out", };
+static const char * const imx8mp_memrepair_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m",
+							"sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out",
+							"clk_ext3", "audio_pll2_out", };
 
 static const char * const imx8mp_pcie2_ctrl_sels[] = {"osc_24m", "sys_pll2_250m", "sys_pll2_200m",
 						      "sys_pll1_266m", "sys_pll1_800m", "sys_pll2_500m",
@@ -590,7 +585,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_VPU_G2] = imx8m_clk_hw_composite("vpu_g2", imx8mp_vpu_g2_sels, ccm_base + 0xa180);
 	hws[IMX8MP_CLK_CAN1] = imx8m_clk_hw_composite("can1", imx8mp_can1_sels, ccm_base + 0xa200);
 	hws[IMX8MP_CLK_CAN2] = imx8m_clk_hw_composite("can2", imx8mp_can2_sels, ccm_base + 0xa280);
-	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite("memrepair", imx8mp_memrepair_sels, ccm_base + 0xa300);
 	hws[IMX8MP_CLK_PCIE_PHY] = imx8m_clk_hw_composite("pcie_phy", imx8mp_pcie_phy_sels, ccm_base + 0xa380);
 	hws[IMX8MP_CLK_PCIE_AUX] = imx8m_clk_hw_composite("pcie_aux", imx8mp_pcie_aux_sels, ccm_base + 0xa400);
 	hws[IMX8MP_CLK_I2C5] = imx8m_clk_hw_composite("i2c5", imx8mp_i2c5_sels, ccm_base + 0xa480);
@@ -648,7 +642,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite("media_disp1_pix", imx8mp_media_disp1_pix_sels, ccm_base + 0xbe00);
 	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
 	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
-	hws[IMX8MP_CLK_MEDIA_MIPI_CSI2_ESC] = imx8m_clk_hw_composite("media_mipi_csi2_esc", imx8mp_media_mipi_csi2_esc_sels, ccm_base + 0xbf80);
+	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
 	hws[IMX8MP_CLK_PCIE2_CTRL] = imx8m_clk_hw_composite("pcie2_ctrl", imx8mp_pcie2_ctrl_sels, ccm_base + 0xc000);
 	hws[IMX8MP_CLK_PCIE2_PHY] = imx8m_clk_hw_composite("pcie2_phy", imx8mp_pcie2_phy_sels, ccm_base + 0xc080);
 	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
-- 
2.26.2

