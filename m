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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE65C63798
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:39:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71DA424248
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 08:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BHG49qeX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgKRIip (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 03:38:45 -0500
Received: from mail-vi1eur05on2041.outbound.protection.outlook.com ([40.107.21.41]:41633
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726158AbgKRIip (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Nov 2020 03:38:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y05LibMqQXaO1i9o0uQiU1io6q/FKdr3WZhFsmA2LU9OOuPuZmQIqYsROcOwvw0pmTkZ/nDpBAYCeMWvMzHAKeg3I8o0r9vNkscsjrFfDJ2CvWhNicKbRB3IaspHxv5n5zIqj1NAzFwCYo06FzhFGNIG951ZXXcJZ/hFdKYGzQINtZjRYbmuDlz6gUjREchJyAVjmd6Ef9lHkCXCnLmneEk4JImYNXk+KQQkqEVgmKmR/vrYJUzLnGVPuAR60VELBVtN1jYJ1ZOESbmmdlVwh7TVv5sp2QYS6c8Bg90+y27Koiacs5UHDYhgb9N+/QC2xwKVw4A0rRMY9C3c88E3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpXSFDOeAZcHyMC4FZdey6Gm8GmvA6/CETBj7E740R4=;
 b=PmzXGG6LKl8zycpMdChR+EBiqYmiKCJwLdoQqgI3QY+LCoesBt1ixHX2mkPR9BZse1AHnTxufkohnvNjOrspNJ7FIw/8jxwt0rOdVB5Ri7lTd1/BcpsP4NO4D57MgHbuhEkbkcE3GYtHcyn3TEVlGYIYeB6BykaIAA7bcqFfzZpazVYICc2HrhxnBRgdmXz6aaWqIRZSt+0c80RU1sdtHgNP4PaNLYQclxMn8EuwLH7qzWXfBfB4RJ/Yt6y5xGi9t74fu+xz6DDk2X9k+QRYOFRZm59wjk80iYl5rBIjYF8WEc83y7MShYdNki/OVf1S8awOiWBGOku83EeXVthI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpXSFDOeAZcHyMC4FZdey6Gm8GmvA6/CETBj7E740R4=;
 b=BHG49qeXX3FU49r1fQz9BsUH1fQpQOu0M5VeqwptoZowi2Gt8OYLIdwTnZzjh4Kn46h1m5RKq8Zn10muZVg+01yFe6cVWRHOgUlZPZP3KfH/LSThOMnD+Di0wxLLEe195FvT2cDQldTCPjd6aQ8ovXe2pantepWWvkDZ1tmJlyw=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 08:38:41 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 08:38:41 +0000
From:   Liu Ying <victor.liu@nxp.com>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, robh+dt@kernel.org, aisheng.dong@nxp.com
Subject: [PATCH 2/5] clk: imx: clk-imx8qxp-lpcg: Add display controller LPCG clocks support
Date:   Wed, 18 Nov 2020 16:31:27 +0800
Message-Id: <1605688290-21805-3-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605688290-21805-1-git-send-email-victor.liu@nxp.com>
References: <1605688290-21805-1-git-send-email-victor.liu@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0166.apcprd03.prod.outlook.com
 (2603:1096:4:c9::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0166.apcprd03.prod.outlook.com (2603:1096:4:c9::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.17 via Frontend Transport; Wed, 18 Nov 2020 08:38:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0ce8f45e-fa71-4793-6d67-08d88b9d5a23
X-MS-TrafficTypeDiagnostic: VI1PR04MB6990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB69903B0976C996C2E09058EC98E10@VI1PR04MB6990.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BIVNyrKHHatlt476MXZxYhqLZr6vP9arFVzBJMm+9w43KjoYUtpF3oRr5RUu3nRqflCT7AOV+XR1WtE99VR6r7ZTrBXtGy32ExLw7JTDdEuaMdy8Faln9vZI7Y3Ev1ZWyvOocaVKdh59Ieoih2bMA328n1OdqLI+dCh9zp6l1I28vY/QOV3UfnoeMjXcCj02fYAcUR31ogr8RIepuTj+zfHVxl4/o6Cc7Y4r+Q2u2+eoa+98IjIPPRSH8m85cLBAf99bkrU/nCiRyO+rpsTsddnux+9Y2a30gWGt7Mthr+5H43fQ8Zkedy2q/iutUAAY/CbAXtbu1VPjN+bIEhhvYwY1rPOd03BslTYOGey0kIIymkdhcDhYql6lbM/yl4la
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB3983.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(2616005)(956004)(66556008)(8676002)(5660300002)(86362001)(6512007)(4326008)(66946007)(186003)(6506007)(6486002)(478600001)(316002)(66476007)(26005)(16526019)(83380400001)(52116002)(8936002)(36756003)(7416002)(6666004)(2906002)(69590400008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: QzyrjNZ75D/T6Zuz/QP/5hxb4SFCu0QGU6jdGWrjmbuxNkC7MhOVJ50uOwbzGi6VgKW0FJeCUdessaeY6Hypa3uv6rAWfW2xcVuse4twTbTerniMpGXShYBzylxL5nINpT4ijlzyYqmSnACYhRzgJeZioqiRtNX+nUeeExzvfUsp4IlSqd+9yJ4PjJU02qrMvTV+dRbTBqSc/u49BgJ+oeETsmrY6iz/ghTlJXpWWj6/7WUsLNA/58eyaxLfnlaoe/drvAHrzrO/RCop4w6pPaL735pIm9HjzPtH5arB5P2r82iEUq1dQ0SC/4mNDgUn3Uq1ZxhGtVRj2vBisVd3zs4qxpIQ9kBJgq5JUgn6H/t3iKYyCG1ldkVoEmn0DlXcpunpJZgJ8wuYPg7XhgCyXMU4YbQF1TE3t5PEh7AUQenCmnUisLgobqZmBo5em7zNpmIwFTjorE7+he7Dm7AiMEkH9umoTzYr3T0OeVftQmZTfqgoWJWJohrgGFnai6raBpqNRAZNREIHkTeJnIMBADh5xYZHgRxgksXYzamDtvpDHipSdo9fPbSj5Q0qcACPssRF08ZlqBqv+H8C71qsNcbrUTmCcYgUj1h4let6qEmuixqAEnHUxx7+ln2IMPdqQOPHqwDIXP8qngQo00/L5w==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce8f45e-fa71-4793-6d67-08d88b9d5a23
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:38:41.4740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UXg0vxkUmi7DY4j6CAlxsNAdkSKBbX0n+HLei7xM84umtHpXAxgui1p9orxwvsAni2ypfogYN2aUo+u2icX0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6990
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds LPCG clocks support for display controller of i.MX8qxp SoC.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c     | 41 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx8qxp-lpcg.h     | 20 +++++++++++++++++
 include/dt-bindings/clock/imx8-clock.h | 35 +++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index d3e905c..176d426 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -115,6 +115,46 @@ static const struct imx8qxp_ss_lpcg imx8qxp_ss_conn = {
 	.num_max = IMX_CONN_LPCG_CLK_END,
 };
 
+static const struct imx8qxp_lpcg_data imx8qxp_lpcg_dc[] = {
+	{ IMX_DC0_LPCG_DISP0_CLK, "dc0_lpcg_disp0_clk", "dc0_disp0_clk", 0, DC_DISP_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_DISP1_CLK, "dc0_lpcg_disp1_clk", "dc0_disp1_clk", 0, DC_DISP_LPCG, 4, 0, },
+	{ IMX_DC0_LPCG_LIS_IPG_CLK, "dc0_lpcg_lis_ipg_clk", "dc_cfg_clk_root", 0, DC_LIS_IPG_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_DISP_CTL_LINK_MST0_CLK, "dc0_lpcg_disp_ctl_link_mst0_clk", "dc_cfg_clk_root", 0, DC_DISP_CTL_LINK_MST0_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_PIX_COMBINER_APB_CLK, "dc0_lpcg_pix_combiner_apb_clk", "dc_cfg_clk_root", 0, DC_PIX_COMBINER_APB_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_DC_AXI_CLK, "dc0_lpcg_dc_axi_clk", "dc_axi_int_clk_root", 0, DC_AXI_CFG_LPCG, 20, 0, },
+	{ IMX_DC0_LPCG_DC_CFG_CLK, "dc0_lpcg_dc_cfg_clk", "dc_cfg_clk_root", 0, DC_AXI_CFG_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_DPR0_APB_CLK, "dc0_lpcg_dpr0_apb_clk", "dc_cfg_clk_root", 0, DC_DPR0_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_DPR0_B_CLK, "dc0_lpcg_dpr0_b_clk", "dc_axi_ext_clk_root", 0, DC_DPR0_LPCG, 20, 0, },
+	{ IMX_DC0_LPCG_RTRAM0_CLK, "dc0_lpcg_rtram0_clk", "dc_axi_int_clk_root", 0, DC_RTRAM0_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG0_RTRAM_CLK, "dc0_lpcg_prg0_rtram_clk", "dc_axi_int_clk_root", 0, DC_PRG0_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG0_APB_CLK, "dc0_lpcg_prg0_apb_clk", "dc_cfg_clk_root", 0, DC_PRG0_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_PRG1_RTRAM_CLK, "dc0_lpcg_prg1_rtram_clk", "dc_axi_int_clk_root", 0, DC_PRG1_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG1_APB_CLK, "dc0_lpcg_prg1_apb_clk", "dc_cfg_clk_root", 0, DC_PRG1_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_PRG2_RTRAM_CLK, "dc0_lpcg_prg2_rtram_clk", "dc_axi_int_clk_root", 0, DC_PRG2_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG2_APB_CLK, "dc0_lpcg_prg2_apb_clk", "dc_cfg_clk_root", 0, DC_PRG2_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_DPR1_APB_CLK, "dc0_lpcg_dpr1_apb_clk", "dc_cfg_clk_root", 0, DC_DPR1_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_DPR1_B_CLK, "dc0_lpcg_dpr1_b_clk", "dc_axi_ext_clk_root", 0, DC_DPR1_LPCG, 20, 0, },
+	{ IMX_DC0_LPCG_RTRAM1_CLK, "dc0_lpcg_rtram1_clk", "dc_axi_int_clk_root", 0, DC_RTRAM1_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG3_RTRAM_CLK, "dc0_lpcg_prg3_rtram_clk", "dc_axi_int_clk_root", 0, DC_PRG3_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG3_APB_CLK, "dc0_lpcg_prg3_apb_clk", "dc_cfg_clk_root", 0, DC_PRG3_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_PRG4_RTRAM_CLK, "dc0_lpcg_prg4_rtram_clk", "dc_axi_int_clk_root", 0, DC_PRG4_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG4_APB_CLK, "dc0_lpcg_prg4_apb_clk", "dc_cfg_clk_root", 0, DC_PRG4_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_PRG5_RTRAM_CLK, "dc0_lpcg_prg5_rtram_clk", "dc_axi_int_clk_root", 0, DC_PRG5_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG5_APB_CLK, "dc0_lpcg_prg5_apb_clk", "dc_cfg_clk_root", 0, DC_PRG5_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_PRG6_RTRAM_CLK, "dc0_lpcg_prg6_rtram_clk", "dc_axi_int_clk_root", 0, DC_PRG6_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG6_APB_CLK, "dc0_lpcg_prg6_apb_clk", "dc_cfg_clk_root", 0, DC_PRG6_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_PRG7_RTRAM_CLK, "dc0_lpcg_prg7_rtram_clk", "dc_axi_int_clk_root", 0, DC_PRG7_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG7_APB_CLK, "dc0_lpcg_prg7_apb_clk", "dc_cfg_clk_root", 0, DC_PRG7_LPCG, 16, 0, },
+	{ IMX_DC0_LPCG_PRG8_RTRAM_CLK, "dc0_lpcg_prg8_rtram_clk", "dc_axi_int_clk_root", 0, DC_PRG8_LPCG, 0, 0, },
+	{ IMX_DC0_LPCG_PRG8_APB_CLK, "dc0_lpcg_prg8_apb_clk", "dc_cfg_clk_root", 0, DC_PRG8_LPCG, 16, 0, },
+};
+
+static const struct imx8qxp_ss_lpcg imx8qxp_ss_dc = {
+	.lpcg = imx8qxp_lpcg_dc,
+	.num_lpcg = ARRAY_SIZE(imx8qxp_lpcg_dc),
+	.num_max = IMX_DC0_LPCG_CLK_END,
+};
+
 static const struct imx8qxp_lpcg_data imx8qxp_lpcg_lsio[] = {
 	{ IMX_LSIO_LPCG_PWM0_IPG_CLK, "pwm0_lpcg_ipg_clk", "pwm0_clk", 0, LSIO_PWM_0_LPCG, 0, 0, },
 	{ IMX_LSIO_LPCG_PWM0_IPG_HF_CLK, "pwm0_lpcg_ipg_hf_clk", "pwm0_clk", 0, LSIO_PWM_0_LPCG, 4, 0, },
@@ -355,6 +395,7 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 static const struct of_device_id imx8qxp_lpcg_match[] = {
 	{ .compatible = "fsl,imx8qxp-lpcg-adma", &imx8qxp_ss_adma, },
 	{ .compatible = "fsl,imx8qxp-lpcg-conn", &imx8qxp_ss_conn, },
+	{ .compatible = "fsl,imx8qxp-lpcg-dc", &imx8qxp_ss_dc, },
 	{ .compatible = "fsl,imx8qxp-lpcg-lsio", &imx8qxp_ss_lsio, },
 	{ .compatible = "fsl,imx8qxp-lpcg", NULL },
 	{ /* sentinel */ }
diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.h b/drivers/clk/imx/clk-imx8qxp-lpcg.h
index 2a37ce5..e1423a9 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.h
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.h
@@ -99,4 +99,24 @@
 #define ADMA_FLEXCAN_1_LPCG		0x1ce0000
 #define ADMA_FLEXCAN_2_LPCG		0x1cf0000
 
+/* Display SS */
+#define DC_DISP_LPCG			0x00
+#define DC_LIS_IPG_LPCG			0x04
+#define DC_DISP_CTL_LINK_MST0_LPCG	0x08
+#define DC_PIX_COMBINER_APB_LPCG	0x10
+#define DC_AXI_CFG_LPCG			0x14
+#define DC_DPR0_LPCG			0x18
+#define DC_RTRAM0_LPCG			0x1c
+#define DC_PRG0_LPCG			0x20
+#define DC_PRG1_LPCG			0x24
+#define DC_PRG2_LPCG			0x28
+#define DC_DPR1_LPCG			0x2c
+#define DC_RTRAM1_LPCG			0x30
+#define DC_PRG3_LPCG			0x34
+#define DC_PRG4_LPCG			0x38
+#define DC_PRG5_LPCG			0x3c
+#define DC_PRG6_LPCG			0x40
+#define DC_PRG7_LPCG			0x44
+#define DC_PRG8_LPCG			0x48
+
 #endif /* _IMX8QXP_LPCG_H */
diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/clock/imx8-clock.h
index 673a8c6..c9dd0c6 100644
--- a/include/dt-bindings/clock/imx8-clock.h
+++ b/include/dt-bindings/clock/imx8-clock.h
@@ -290,4 +290,39 @@
 
 #define IMX_ADMA_LPCG_CLK_END				45
 
+/* DC0 SS LPCG */
+#define IMX_DC0_LPCG_DISP0_CLK				0
+#define IMX_DC0_LPCG_DISP1_CLK				1
+#define IMX_DC0_LPCG_LIS_IPG_CLK			2
+#define IMX_DC0_LPCG_DISP_CTL_LINK_MST0_CLK		3
+#define IMX_DC0_LPCG_PIX_COMBINER_APB_CLK		4
+#define IMX_DC0_LPCG_DC_AXI_CLK				5
+#define IMX_DC0_LPCG_DC_CFG_CLK				6
+#define IMX_DC0_LPCG_DPR0_APB_CLK			7
+#define IMX_DC0_LPCG_DPR0_B_CLK				8
+#define IMX_DC0_LPCG_RTRAM0_CLK				9
+#define IMX_DC0_LPCG_PRG0_RTRAM_CLK			10
+#define IMX_DC0_LPCG_PRG0_APB_CLK			11
+#define IMX_DC0_LPCG_PRG1_RTRAM_CLK			12
+#define IMX_DC0_LPCG_PRG1_APB_CLK			13
+#define IMX_DC0_LPCG_PRG2_RTRAM_CLK			14
+#define IMX_DC0_LPCG_PRG2_APB_CLK			15
+#define IMX_DC0_LPCG_DPR1_APB_CLK			16
+#define IMX_DC0_LPCG_DPR1_B_CLK				17
+#define IMX_DC0_LPCG_RTRAM1_CLK				18
+#define IMX_DC0_LPCG_PRG3_RTRAM_CLK			19
+#define IMX_DC0_LPCG_PRG3_APB_CLK			20
+#define IMX_DC0_LPCG_PRG4_RTRAM_CLK			21
+#define IMX_DC0_LPCG_PRG4_APB_CLK			22
+#define IMX_DC0_LPCG_PRG5_RTRAM_CLK			23
+#define IMX_DC0_LPCG_PRG5_APB_CLK			24
+#define IMX_DC0_LPCG_PRG6_RTRAM_CLK			25
+#define IMX_DC0_LPCG_PRG6_APB_CLK			26
+#define IMX_DC0_LPCG_PRG7_RTRAM_CLK			27
+#define IMX_DC0_LPCG_PRG7_APB_CLK			28
+#define IMX_DC0_LPCG_PRG8_RTRAM_CLK			29
+#define IMX_DC0_LPCG_PRG8_APB_CLK			30
+
+#define IMX_DC0_LPCG_CLK_END				31
+
 #endif /* __DT_BINDINGS_CLOCK_IMX_H */
-- 
2.7.4

