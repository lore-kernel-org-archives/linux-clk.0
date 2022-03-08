Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A976C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  8 Mar 2022 10:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbiCHKEn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Mar 2022 05:04:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiCHKEl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Mar 2022 05:04:41 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22ADF3FBF8
        for <linux-clk@vger.kernel.org>; Tue,  8 Mar 2022 02:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djhTR3vlTQzCoobwdCqlp9Eg9gOVMXc6hTsLboxMn8VQ/VgVTqFWYHFqvPK9sVyrlKHhmlozamWUhho3nBDN7rBpfIM34onN3HHWjIZs9IW46kHmTZpN6cbGCdGB1hZFLhsA21PYKCFkVbk7fZ0gL5yl6DUlzlfC/DksEQnGPr7Wpt07njXHSBycDXhErAFkcC6jUmxKdZJTFOzS1eUpkLHgpcRujC3epp2bKhRaD0oN3EwUq28nHw2A6GCfmr62/y8L19eVXjuQzNDcqXZiVgiEb01ECjdk6JCjOywHOEDnpnXKWQXdBqwo+VwyBGTU3B7R5qz8g0JTZ4Hus0zB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV9xJnoQWG7olRRY2KT7DyBjR3V/79/ZjxDQRnoDQv0=;
 b=e5+0PC4Qus4kvDiuMZjzlpPaDjqJ17fqswlCtvyqXWDWsg4l3GGaVQ6W1ZHGcXzaAzxIFGhCiLdPd+xqN6rueQsMyDFp6tiYejyTktbD5+jDWiIVl98JvannUzwKuAwsL50toqKirynzTfZSGyr2LxJu/MBiGH/kQSwsk2Z37iAQp+d3IQIaneVWsDDZCK4a5kw/MUQ1K0VPlPtwpf0ILBHZvCHFGI+DglgaFF9fdf/CTbsjgSxbz0b73sWwlc9YiQHLQuOGgrTepwfQNsEPhvAdxqVerwzBn3butA9Pa03eghpx/kwTnJt1AeY4jNFMBAP0X7U29fw3/7NkYjdv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV9xJnoQWG7olRRY2KT7DyBjR3V/79/ZjxDQRnoDQv0=;
 b=f/VxWPhDTy7iPnHXYX7vkSB72Gs35zZYAlX47LIJuiLPsD73fTyP13gV5He0likVGFyk9ml/803mL/aevIVOWSLthR4ycOD58mq8cUF9R7y1LXeDwA7R7UP4vR4Y5HtC+frS+P4z8JNFYCf8eE6O6tZ6Hj6PXBWG+lVgiXgH4z4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9)
 by AM6PR0402MB3702.eurprd04.prod.outlook.com (2603:10a6:209:1c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 10:03:42 +0000
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::4da8:6419:c67:3ec7]) by DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::4da8:6419:c67:3ec7%2]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 10:03:42 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     abel.vesa@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org
Cc:     festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org
Subject: [PATCH] clk: imx: Mark the snvs clock as critical by default
Date:   Tue,  8 Mar 2022 18:17:14 +0800
Message-Id: <20220308101714.164163-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0198.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::7) To DB9PR04MB8412.eurprd04.prod.outlook.com
 (2603:10a6:10:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14ac132c-0f2c-4a3d-de33-08da00eaecaf
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3702:EE_
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3702A06B8556492C64DD236B87099@AM6PR0402MB3702.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aj6eqEm4MV19BkxoEHylol3YRs0MqMzYXXh0Ifz3de3hDnLLDmSFlNu16JYntE56LGM995sRnWchiq90Sh8pVmO7vzm6+3FVyzXFRFsriwrA+dmEYp8yO6zTKQE9tmoTI6fmswllnolgy2R2TA0yRGokId1mdYwfFglqD9kSTLIZHlm3zoewF5tbI7HcGRoOMXuLPAR2o3Yk/SdaXSuX6BEPZPAmEAmjRAbrl20ckRhZpa0ZQmgkgzT6/zFIb126Bay3/iK4LSvViv7YBPZeS8P7SzId48X8Zeb1rK8YHmBGgKzAYHdDZPLYaLpR2QzdrqFP2HpsLts8mt0lNnvDmaObnzjch0JjzuHgsoPc0+wRb4Ql6byOgoMyH6p8n2h0UHfnGCN9F6X/7wdHGBue4JwWCSvFP0g960Y9TdAveh+Sx3kRbAP9j/Kgd/jl8kZBGfUKeXsO8IaYOn+tT8oD1l0DwB7OYbV6AfFA4gsL+T9WdzGfsrSXM4EiWw25sXBnweds8U2djS7XumB8TWUW5QyWA0hUGTCDiT0NcTY9mo0xkSkPQmU8M2lA2kKMZrCbtQNYQ/vE5aufCpVMo7vad7hKSqJFztsFO9aSCg1kveZ+5QiGEGLlqvx2p9qnd8VdJa6MnDHtwEr87oKnNR3XVy7ENFuqs4nZJfkRQ4h5Qvwy37FalKBDBf8Ow5dNjwOmFYGba+b+Z8evJpez254XRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8412.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(52116002)(6506007)(6512007)(8936002)(38350700002)(2906002)(66476007)(66556008)(66946007)(6666004)(4326008)(86362001)(8676002)(186003)(2616005)(5660300002)(36756003)(26005)(1076003)(83380400001)(508600001)(316002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UdBMJFkLnMA4KxJLuRZLYeQ00aECGUvmeCV8VPmpKr9RvzrWzkL5cHPFSaJo?=
 =?us-ascii?Q?Uwfik6rTm+a5DdjPnM2UUnirKbElC1q9Jyiixjt0JWPw75pM6tmSIPlopJSi?=
 =?us-ascii?Q?7XtxOPpHUajT00RXdMoBCbdTtW1qhHFZReaf637b6WGU5PSFt/OWmUsE6b4W?=
 =?us-ascii?Q?qQKxMi8wQcR/82bvVEFcXrdNO9ec2jfCIv3xd1nCQ8PMuv851dP3tBhgB1Nx?=
 =?us-ascii?Q?mdWIlacZkqAzx/4mUqtfFNQW5+121XtvI/q3qRlODri6I67V00mG1pYqcJsp?=
 =?us-ascii?Q?PTvyXPIKwfBVeohwNSnZFTjnxyqfJucM+gJE7Jn3kz17czlBuREMt1yzk7By?=
 =?us-ascii?Q?U/ibEvmiRNkBEqLy6SDjGmw8FLfZGs/9YNkahJUuiahseLY8RPycqfU8eTFu?=
 =?us-ascii?Q?3sgssqeqm52793vyPFRHcWLcBrEgUqlGCP/8qDDGf++bHQ2g5TX1U3ucqFwi?=
 =?us-ascii?Q?Jxx87tmEdO1vD6f5jjk3cVCFXH3rMa+QZdZz61OasYbDBZfsNXAMnTqf/vVE?=
 =?us-ascii?Q?udHKjzlC4ZPQlnnbRTReR68257NcNgWG/16TOU4/NDJnUbvSsFcB53drJyk5?=
 =?us-ascii?Q?0AGCF7kLi8jwLSkOmqXGeY5l16XHGg1gdxpnDpEWRAIHVABzF+H2QQkjCAZx?=
 =?us-ascii?Q?qmCIUsoAtxFrr1ojo38z9d6SbeE7e3U01raLuh6cawr2iYD/5N+kmOsHdE4w?=
 =?us-ascii?Q?bjCTZZ1R3vkSr484RV7CAWgIko4MEewebLa+3YkwuU6QsQ21BIXIXozxHWQ3?=
 =?us-ascii?Q?pTbNkJ4eozGNthDltNXEB8NEiXuXHDJqg3vmnNLiLajgTjRIuIDZtuZjmytd?=
 =?us-ascii?Q?TGDZ6wOw80sj3BeGClVFbEks0wG8QkO0V3HbIdKnPFDooefrVyIrK0h2U9bq?=
 =?us-ascii?Q?iwmWUqVcl+QAIFwTnlx6EFXiCd3lCkDO604nSuTd7Q5vcc0xfLihJrB7+W32?=
 =?us-ascii?Q?vBF0EYF7IhPlsMjgMXHAaT2LaimmUWPmnsQGReprpxcblCMoX9kwdMiC2pfD?=
 =?us-ascii?Q?FE2240LpYetsRm5d9/YS5m7fwlCyACGFieTv7nmixJ80DiRmaDOfF14AOo26?=
 =?us-ascii?Q?4gVGL14GgJ367mf9BKZEuCpY7BVfmb/lI/JgEwjWHA2tCidw0Tg3AbVtPwJL?=
 =?us-ascii?Q?3KqlZGhvN3CfBO6R0UXbIqxjiayFty31ut0rvhGNmEBSH8X4/28inPF7FkY5?=
 =?us-ascii?Q?Pj0Ax6xTbkxTYIqdM+jrRwIOKELLtrehQWM4HlGasYDflVugShmirIP+JKtg?=
 =?us-ascii?Q?m13Cgdq1qfKHnnnZ6S+gRrSpt4tHu9+s2fqXhsbPev0f5T2Ej3b9Y3IHIwJU?=
 =?us-ascii?Q?Y0+D3vGAktvcOy49lLP2ciYZYMmZsb1e7gJrf2rwBUC1FC4YXJaGbS0W8yHH?=
 =?us-ascii?Q?rcm+XpQZExl5RSRh+jcfZbBB2aI4AEd+c2gGzC+DmNiYOycDQElB2NDgthVK?=
 =?us-ascii?Q?3yG0D36GnwlIPlrW9Stb7Lz1RfOEJ8NBtomWBhiMAvg/EOwPPn8WQQJyyxPw?=
 =?us-ascii?Q?RAp38Aim0tIqDRC6qoUgHE6EdSV1Ibp89dfFm3kpV/ByQHBc0P8NrIoa0xzJ?=
 =?us-ascii?Q?Fpv03rOPGTs9fMhTwYkFTcjOvDjp8TplikbnK7J75MNSIh7/0EoNi0oplmwY?=
 =?us-ascii?Q?n2DjQTdMW0zaYQZRKTh0EfY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ac132c-0f2c-4a3d-de33-08da00eaecaf
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8412.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 10:03:42.2298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9Bb/DXFaNek+ydXy3E2JVwjF3WQdxqQIuqcTk9GWql/QFWh1Q3Pzn/AjPCP1S+2ov8XfTek1y5arJbNC8lGFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3702
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SNVS moudule is not used only by the linux, it may also used
by other SW component is secure world. No sense to gate it
by linux, so mark it as critical clock.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-imx7d.c  | 2 +-
 drivers/clk/imx/clk-imx8mm.c | 2 +-
 drivers/clk/imx/clk-imx8mn.c | 2 +-
 drivers/clk/imx/clk-imx8mp.c | 2 +-
 drivers/clk/imx/clk-imx8mq.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 3f6fd7ef2a68..2da151d7e594 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -782,7 +782,7 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	hws[IMX7D_DRAM_PHYM_ALT_ROOT_CLK] = imx_clk_hw_gate2_flags("dram_phym_alt_root_clk", "dram_phym_alt_post_div", base + 0x4130, 0, CLK_IS_CRITICAL | CLK_OPS_PARENT_ENABLE);
 	hws[IMX7D_DRAM_ALT_ROOT_CLK] = imx_clk_hw_gate2_flags("dram_alt_root_clk", "dram_alt_post_div", base + 0x4130, 0, CLK_IS_CRITICAL | CLK_OPS_PARENT_ENABLE);
 	hws[IMX7D_OCOTP_CLK] = imx_clk_hw_gate4("ocotp_clk", "ipg_root_clk", base + 0x4230, 0);
-	hws[IMX7D_SNVS_CLK] = imx_clk_hw_gate4("snvs_clk", "ipg_root_clk", base + 0x4250, 0);
+	hws[IMX7D_SNVS_CLK] = imx_clk_hw_gate2_flags("snvs_clk", "ipg_root_clk", base + 0x4250, 0, CLK_IS_CRITICAL);
 	hws[IMX7D_MU_ROOT_CLK] = imx_clk_hw_gate4("mu_root_clk", "ipg_root_clk", base + 0x4270, 0);
 	hws[IMX7D_CAAM_CLK] = imx_clk_hw_gate4("caam_clk", "ipg_root_clk", base + 0x4240, 0);
 	hws[IMX7D_USB_HSIC_ROOT_CLK] = imx_clk_hw_gate4("usb_hsic_root_clk", "usb_hsic_post_div", base + 0x4690, 0);
diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index e8cbe181ec06..f85cf9ebde69 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -560,7 +560,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MM_CLK_SAI5_IPG] = imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x4370, 0, &share_count_sai5);
 	hws[IMX8MM_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &share_count_sai6);
 	hws[IMX8MM_CLK_SAI6_IPG] = imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x4380, 0, &share_count_sai6);
-	hws[IMX8MM_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", base + 0x4470, 0);
+	hws[IMX8MM_CLK_SNVS_ROOT] = imx_clk_hw_gate2_flags("snvs_root_clk", "ipg_root", base + 0x4470, 0, CLK_IS_CRITICAL);
 	hws[IMX8MM_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
 	hws[IMX8MM_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
 	hws[IMX8MM_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 92fcbab4f5be..00011b7ebd8c 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -522,7 +522,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_CLK_SAI5_IPG] = imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x4370, 0, &share_count_sai5);
 	hws[IMX8MN_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &share_count_sai6);
 	hws[IMX8MN_CLK_SAI6_IPG] = imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x4380, 0, &share_count_sai6);
-	hws[IMX8MN_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", base + 0x4470, 0);
+	hws[IMX8MN_CLK_SNVS_ROOT] = imx_clk_hw_gate2_flags("snvs_root_clk", "ipg_root", base + 0x4470, 0, CLK_IS_CRITICAL);
 	hws[IMX8MN_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
 	hws[IMX8MN_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
 	hws[IMX8MN_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 18f5b7c3ca9d..420876c4affc 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -654,7 +654,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_SIM_ENET_ROOT] = imx_clk_hw_gate4("sim_enet_root_clk", "enet_axi", ccm_base + 0x4400, 0);
 	hws[IMX8MP_CLK_GPU2D_ROOT] = imx_clk_hw_gate4("gpu2d_root_clk", "gpu2d_core", ccm_base + 0x4450, 0);
 	hws[IMX8MP_CLK_GPU3D_ROOT] = imx_clk_hw_gate4("gpu3d_root_clk", "gpu3d_core", ccm_base + 0x4460, 0);
-	hws[IMX8MP_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", ccm_base + 0x4470, 0);
+	hws[IMX8MP_CLK_SNVS_ROOT] = imx_clk_hw_gate2_flags("snvs_root_clk", "ipg_root", ccm_base + 0x4470, 0, CLK_IS_CRITICAL);
 	hws[IMX8MP_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", ccm_base + 0x4490, 0);
 	hws[IMX8MP_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", ccm_base + 0x44a0, 0);
 	hws[IMX8MP_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", ccm_base + 0x44b0, 0);
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 83cc2b1c3294..3af0c5e875f5 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -557,7 +557,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MQ_CLK_SAI5_IPG] = imx_clk_hw_gate2_shared2("sai5_ipg_clk", "ipg_audio_root", base + 0x4370, 0, &share_count_sai5);
 	hws[IMX8MQ_CLK_SAI6_ROOT] = imx_clk_hw_gate2_shared2("sai6_root_clk", "sai6", base + 0x4380, 0, &share_count_sai6);
 	hws[IMX8MQ_CLK_SAI6_IPG] = imx_clk_hw_gate2_shared2("sai6_ipg_clk", "ipg_audio_root", base + 0x4380, 0, &share_count_sai6);
-	hws[IMX8MQ_CLK_SNVS_ROOT] = imx_clk_hw_gate4("snvs_root_clk", "ipg_root", base + 0x4470, 0);
+	hws[IMX8MQ_CLK_SNVS_ROOT] = imx_clk_hw_gate2_flags("snvs_root_clk", "ipg_root", base + 0x4470, 0, CLK_IS_CRITICAL);
 	hws[IMX8MQ_CLK_UART1_ROOT] = imx_clk_hw_gate4("uart1_root_clk", "uart1", base + 0x4490, 0);
 	hws[IMX8MQ_CLK_UART2_ROOT] = imx_clk_hw_gate4("uart2_root_clk", "uart2", base + 0x44a0, 0);
 	hws[IMX8MQ_CLK_UART3_ROOT] = imx_clk_hw_gate4("uart3_root_clk", "uart3", base + 0x44b0, 0);
-- 
2.26.2

