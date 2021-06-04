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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7EAC07E94
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70773613EA
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 09:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhFDJMm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:12:42 -0400
Received: from mail-eopbgr60053.outbound.protection.outlook.com ([40.107.6.53]:37379
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229936AbhFDJMm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Jun 2021 05:12:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qr9zWbHCuG7nYwCII09PrfWM9ISVY8qf7zpzonIS03fxJHTyi1XFm4i4oKpZJHxKEv5oRgAcT2ww/iKy9ll5u2tCzOSA4f/abyzrwtHfBpDsxfzcQ5wMRhIi0GVQZPJ1ciEYB4kYtmB3dt0yIz+0PudcsoY3xbOhVxxQ1453ubeBENkWPN9vjmIQYdk5cnrECNZOSTfGiXS9+BAYCjj1m+deSlnKPWc5SF+RwBnEDUBevSLQXOy/O5tKvi/f1+gBLxwH7006qGbdlkYb2kPqCnGMqPF05x/Tnl7DyYbQ9irMXMRv/+amX2pU6u+IQREwgMytHVHmByhyC2DhQOrnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvpcO1XxcacsOkPCJzFT8CtTe3Dob/y8olf6Zwr8gEs=;
 b=PMx6igrli1KJH1gZ8P+pn1tMN+vpF65sSF065gjMABQdYFgkXT8CPGA852jU3W1utUaRPDJu9WPTSmtH1VZOKq1Q6onckaTPzmpRWaFIdMCVPI23LJFCkHv/hwz1jZj5s7rMKYMYwzUe7+Oa1WKo6mRDqFXoeGBBMhnxuclZdWtCx2nUXRUbOi8joczhqs1nSYzH6AcjlVaiVoVTlJIcUs/UICwkzfHdkYnGw3BB6+Q8eQrFA39RoSzRvISb7Mysru3U1iVmFQR4AeLxfS9nqyX8w4Om693VWhZXyelwj+vp5o1iQiFDKeVwwtl9VItP0AMMmXskVMAYqMO5GESL7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvpcO1XxcacsOkPCJzFT8CtTe3Dob/y8olf6Zwr8gEs=;
 b=SzkJHOE/6uEk2AC90/EdXoldjOc/tyqNC0OUmh4UzHLjKJWMHbfhBXPErMwVQ1JKr2h5/GO1LoHJLiy/JdqYEpOTscNAEMT1/ZQK5jKfhwmoyKJS3wB4JyYS5BrhbjnFR5gBDi76jdA58TKnNTE2ZGzTH/XSElOdK6FUZePOIDY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8917.eurprd04.prod.outlook.com (2603:10a6:10:2e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Fri, 4 Jun
 2021 09:10:54 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 09:10:54 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        dongas86@gmail.com, shawnguo@kernel.org, kernel@pengutronix.de,
        abel.vesa@nxp.com, Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 01/10] clk: imx: scu: add more scu clocks
Date:   Fri,  4 Jun 2021 17:09:34 +0800
Message-Id: <20210604090943.3519350-2-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604090943.3519350-1-aisheng.dong@nxp.com>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20)
 To DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0601CA0010.apcprd06.prod.outlook.com (2603:1096:3::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend Transport; Fri, 4 Jun 2021 09:10:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10049efc-00fe-4310-9201-08d92738a84a
X-MS-TrafficTypeDiagnostic: DU2PR04MB8917:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8917455585E226EAF78ABBC4803B9@DU2PR04MB8917.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Nxb0AqWaqplFheA2tMTHHafm8ReKOTokfuPlignSc8nl/zVKDu3XvMGb5tRrDQpCpVqqA6v+rXT5aIIGz7FnBz186tXgFunhxUpa44qm7ynTjXC1j8uqNramlXEhJZ1zq9MrZJn4CuMGquc3mBVFyEGBKPNMHjZaWng/VZSl+VWCE48foxUXx8n4z7f3ENgbwNK33tMfWho7aPBlLT87uxmYsMPcuNiElkq92K5H0RCQ/75kCJCS6XtqxG6RAzRIbzi0MUgMNp5XF6kIwm2+SjS27qL6BuqqZjomRh2zdklq98N8noJQdcaZRAXeE2haVNqxx8J5Xnp0AlHta90XWJ+KeALLtyWIfuI//lWgEru47+BGO3o41x1i/kJVzmgCAcruYFOIQ+vUubFqprQF8X8HQIAuiBqbspHXy1CepOf4ia0yY3sVY6gdPv/x5tq0dAPb5YNOUljIe34jPiy+KE2XR59uuBJiJ41gY+23TZZGEKgFzMYFeLyZXVr1JhBpiClr+kCkiLUIDz+asIVh34gBKPuj0oZKk9JKkS3lp20IH/FKsdqH4rjk0IpcvAZbnwvxacXzSyU64dQEMVIpH3of2z/hBD5ZZS3rZuox7HCmm3BYW3VVwYD7I9X/4V8QnRaQ2jc0Ca8DxBUVDgDx1kd7EuJSdcxm90DR0aeIDcMdNUBNs9+RDnz5gmvEnKx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(186003)(16526019)(6506007)(2616005)(26005)(956004)(2906002)(478600001)(66476007)(66556008)(83380400001)(316002)(66946007)(86362001)(52116002)(36756003)(30864003)(1076003)(4326008)(6486002)(5660300002)(8936002)(8676002)(6666004)(38100700002)(6916009)(6512007)(38350700002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1n2xnZ6/0ukElfXKkp1WpADv0+sOQxFp7Ya+kNkwXhtn6ZptQEkICA3PiELN?=
 =?us-ascii?Q?X8aBx18t1aTLAoIhTviwwT3f4Ek1j+2PdxZBFNJt9jo5zrUeIJeg86O0Pz51?=
 =?us-ascii?Q?5o8sgzxl5q/1+HcsLCOeW/TF5DZGtpqjlHAw/sFqZIOwnl7eKKSwm0dsQ7XI?=
 =?us-ascii?Q?m3aST4Qm2wOp9yK7cFemAteXVg/eJjCI3EAZZjNjvyfGkhSYQ8pk3WyIqD1u?=
 =?us-ascii?Q?D2x2M5rZ/gSAw2tkcOWgFhKrZJw0dfzd9M7Ai5IV0jrK6gWOaX8Eak8+Ntue?=
 =?us-ascii?Q?QfOKGiH8B+GLjXs+yB0hISCy1INA0dERGKge+ja1FMZe8YpLJHlD9XP2QKvc?=
 =?us-ascii?Q?BJ48H+plOiLbqBysYjz/yJ3owOCN/lmikszKFoKDf+hRn9CzkSljAo9UUzlD?=
 =?us-ascii?Q?e+IeKnCpEClQ3/6NwJ0MwwmlV6lXuvnVyCEaSPTT4BfiKb32qjOaG7LAMqe6?=
 =?us-ascii?Q?PxtB+VhaE4078LGOpjIk1qhIdRqF5mQmZ47+Wo0/SKpvCemhZnCdxeHrZT3D?=
 =?us-ascii?Q?uArBG82JZVmmGdBtyML/0A/QnvWYdAfhV3otDgK7Z65oWre4j+eoBNdb6D7i?=
 =?us-ascii?Q?UQsDs/s/rmCjXZtq3aWqtIiefafMdFA5L+i0FAvm5ne7GjJrQISxCcS10Ude?=
 =?us-ascii?Q?UB8vSNwQQ7d5VEmRaO9D4SJrYRNLb1A02ojS0axeMcSDx5oFvxwH9kuNXpbi?=
 =?us-ascii?Q?6vHCru+Q04cSNPVXc2/sYoHT/YRCkBki9SMs5uTqW4yERZRn1+3u2MCCXf8x?=
 =?us-ascii?Q?RdF/CAQPNxVLQ+eipk+BmVH1tQNdBbs8Fi3enFYi4crtwdXtlxLmWrHvjx9o?=
 =?us-ascii?Q?5ZQSCUVnI6+yk7Rtnh2qspE745kBLeLgD/s1XmdUBf3FGdLo77VBMCLA6PZ7?=
 =?us-ascii?Q?XfOGLykdbHhnHruXIU0AGPYzmY/rv/aVYHWmPeX91HsVNjKpBEotgVzbQWWV?=
 =?us-ascii?Q?rLNoPIo7J9LyEE57r2lSvyCk1wrRT6CPwAsLMgzJ8M60X2MjVUUQ/tNxlaKR?=
 =?us-ascii?Q?kDgFI11gcQQmzJHJoa0dRbV4ONxrGo3WsJKgZrDijlaEsiALrZQ2ahVmhaXC?=
 =?us-ascii?Q?uUMLr4DLCd3K3cdeOoeiRv4i2mjEqamtJjLC+tZvBtxfVY9SRTeUacKE7YO7?=
 =?us-ascii?Q?TymeP+H5J9IfI7hDg7wkvvK2yvx+UUExZTsNJ+MZvxxBWLIfkgDkpCK7m8lO?=
 =?us-ascii?Q?z8B5+fxgO62A2gG6nyttCdjNVQ/K8gbc44BlfjzUoIkC9hRWAxIwJxlX8KkT?=
 =?us-ascii?Q?xpO0RO6VvFQTjPHke5dZjyW3+Udn/13QLnXUHdMbyXvNaHkgjmsF0fWxYiyq?=
 =?us-ascii?Q?GYj4ZDaBqoOled0FdNjlfsqi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10049efc-00fe-4310-9201-08d92738a84a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 09:10:54.7126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz7mW4ZefgNLzU3k/CU+uPIoWLvdVC4QmuAR+Deu0J2tLsHvbmZGZxu9yxyMnnNf1/bWxC0AQEK8yyosinS9Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8917
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add more scu clocks used by i.MX8 platforms.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-imx8qxp.c | 152 +++++++++++++++++++++++++++++++++-
 1 file changed, 150 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index f3cdd6449212..b1dd6ed685f9 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -25,6 +25,14 @@ static const char *dc0_sels[] = {
 	"dc0_bypass0_clk",
 };
 
+static const char * const dc1_sels[] = {
+	"clk_dummy",
+	"clk_dummy",
+	"dc1_pll0_clk",
+	"dc1_pll1_clk",
+	"dc1_bypass0_clk",
+};
+
 static const char *enet0_rgmii_txc_sels[] = {
 	"enet0_ref_div",
 	"dummy",
@@ -35,6 +43,54 @@ static const char *enet1_rgmii_txc_sels[] = {
 	"dummy",
 };
 
+static const char * const hdmi_sels[] = {
+	"clk_dummy",
+	"hdmi_dig_pll_clk",
+	"clk_dummy",
+	"clk_dummy",
+	"hdmi_av_pll_clk",
+};
+
+static const char * const hdmi_rx_sels[] = {
+	"clk_dummy",
+	"hdmi_rx_dig_pll_clk",
+	"clk_dummy",
+	"clk_dummy",
+	"hdmi_rx_bypass_clk",
+};
+
+static const char * const lcd_pxl_sels[] = {
+	"clk_dummy",
+	"clk_dummy",
+	"clk_dummy",
+	"clk_dummy",
+	"lcd_pxl_bypass_div_clk",
+};
+
+static const char * const mipi_sels[] = {
+	"clk_dummy",
+	"clk_dummy",
+	"mipi_pll_div2_clk",
+	"clk_dummy",
+	"clk_dummy",
+};
+
+static const char * const lcd_sels[] = {
+	"clk_dummy",
+	"clk_dummy",
+	"clk_dummy",
+	"clk_dummy",
+	"elcdif_pll",
+};
+
+static const char * const pi_pll0_sels[] = {
+	"clk_dummy",
+	"pi_dpll_clk",
+	"clk_dummy",
+	"clk_dummy",
+	"clk_dummy",
+};
+
 static int imx8qxp_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *ccm_node = pdev->dev.of_node;
@@ -48,6 +104,8 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 
 	/* ARM core */
 	imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
+	imx_clk_scu("a53_clk", IMX_SC_R_A53, IMX_SC_PM_CLK_CPU);
+	imx_clk_scu("a72_clk", IMX_SC_R_A72, IMX_SC_PM_CLK_CPU);
 
 	/* LSIO SS */
 	imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER);
@@ -66,25 +124,42 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	imx_clk_scu("fspi0_clk", IMX_SC_R_FSPI_0, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("fspi1_clk", IMX_SC_R_FSPI_1, IMX_SC_PM_CLK_PER);
 
-	/* ADMA SS */
+	/* DMA SS */
 	imx_clk_scu("uart0_clk", IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("uart1_clk", IMX_SC_R_UART_1, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("uart2_clk", IMX_SC_R_UART_2, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("uart3_clk", IMX_SC_R_UART_3, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("uart4_clk", IMX_SC_R_UART_4, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("sim0_clk",  IMX_SC_R_EMVSIM_0, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("spi0_clk",  IMX_SC_R_SPI_0, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("spi1_clk",  IMX_SC_R_SPI_1, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("spi2_clk",  IMX_SC_R_SPI_2, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("spi3_clk",  IMX_SC_R_SPI_3, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("can0_clk",  IMX_SC_R_CAN_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("can1_clk",  IMX_SC_R_CAN_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("can2_clk",  IMX_SC_R_CAN_2, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("i2c0_clk",  IMX_SC_R_I2C_0, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("i2c1_clk",  IMX_SC_R_I2C_1, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("i2c2_clk",  IMX_SC_R_I2C_2, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("i2c3_clk",  IMX_SC_R_I2C_3, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("i2c4_clk",  IMX_SC_R_I2C_4, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("ftm0_clk",  IMX_SC_R_FTM_0, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("ftm1_clk",  IMX_SC_R_FTM_1, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("adc0_clk",  IMX_SC_R_ADC_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("adc1_clk",  IMX_SC_R_ADC_1, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("pwm_clk",   IMX_SC_R_LCD_0_PWM_0, IMX_SC_PM_CLK_PER);
-	imx_clk_scu("lcd_clk",   IMX_SC_R_LCD_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu2("lcd_clk", lcd_sels, ARRAY_SIZE(lcd_sels), IMX_SC_R_LCD_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu2("lcd_pxl_clk", lcd_pxl_sels, ARRAY_SIZE(lcd_pxl_sels), IMX_SC_R_LCD_0, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu("lcd_pxl_bypass_div_clk", IMX_SC_R_LCD_0, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_scu("elcdif_pll", IMX_SC_R_ELCDIF_PLL, IMX_SC_PM_CLK_PLL);
+
+	/* Audio SS */
+	imx_clk_scu("audio_pll0_clk", IMX_SC_R_AUDIO_PLL_0, IMX_SC_PM_CLK_PLL);
+	imx_clk_scu("audio_pll1_clk", IMX_SC_R_AUDIO_PLL_1, IMX_SC_PM_CLK_PLL);
+	imx_clk_scu("audio_pll_div_clk0_clk", IMX_SC_R_AUDIO_PLL_0, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu("audio_pll_div_clk1_clk", IMX_SC_R_AUDIO_PLL_1, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu("audio_rec_clk0_clk", IMX_SC_R_AUDIO_PLL_0, IMX_SC_PM_CLK_MISC1);
+	imx_clk_scu("audio_rec_clk1_clk", IMX_SC_R_AUDIO_PLL_1, IMX_SC_PM_CLK_MISC1);
 
 	/* Connectivity */
 	imx_clk_scu("sdhc0_clk", IMX_SC_R_SDHC_0, IMX_SC_PM_CLK_PER);
@@ -94,11 +169,13 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	imx_clk_divider_gpr_scu("enet0_ref_div", "enet0_root_clk", IMX_SC_R_ENET_0, IMX_SC_C_CLKDIV);
 	imx_clk_mux_gpr_scu("enet0_rgmii_txc_sel", enet0_rgmii_txc_sels, ARRAY_SIZE(enet0_rgmii_txc_sels), IMX_SC_R_ENET_0, IMX_SC_C_TXCLK);
 	imx_clk_scu("enet0_bypass_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_gate_gpr_scu("enet0_ref_50_clk", "clk_dummy", IMX_SC_R_ENET_0, IMX_SC_C_DISABLE_50, true);
 	imx_clk_scu("enet0_rgmii_rx_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0);
 	imx_clk_scu("enet1_root_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_PER);
 	imx_clk_divider_gpr_scu("enet1_ref_div", "enet1_root_clk", IMX_SC_R_ENET_1, IMX_SC_C_CLKDIV);
 	imx_clk_mux_gpr_scu("enet1_rgmii_txc_sel", enet1_rgmii_txc_sels, ARRAY_SIZE(enet1_rgmii_txc_sels), IMX_SC_R_ENET_1, IMX_SC_C_TXCLK);
 	imx_clk_scu("enet1_bypass_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_gate_gpr_scu("enet1_ref_50_clk", "clk_dummy", IMX_SC_R_ENET_1, IMX_SC_C_DISABLE_50, true);
 	imx_clk_scu("enet1_rgmii_rx_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_MISC0);
 	imx_clk_scu("gpmi_io_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_MST_BUS);
 	imx_clk_scu("gpmi_bch_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_PER);
@@ -114,30 +191,101 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
 	imx_clk_scu("dc0_bypass0_clk", IMX_SC_R_DC_0_VIDEO0, IMX_SC_PM_CLK_BYPASS);
 	imx_clk_scu("dc0_bypass1_clk", IMX_SC_R_DC_0_VIDEO1, IMX_SC_PM_CLK_BYPASS);
 
+	imx_clk_scu2("dc1_disp0_clk", dc1_sels, ARRAY_SIZE(dc1_sels), IMX_SC_R_DC_1, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu2("dc1_disp1_clk", dc1_sels, ARRAY_SIZE(dc1_sels), IMX_SC_R_DC_1, IMX_SC_PM_CLK_MISC1);
+	imx_clk_scu("dc1_pll0_clk", IMX_SC_R_DC_1_PLL_0, IMX_SC_PM_CLK_PLL);
+	imx_clk_scu("dc1_pll1_clk", IMX_SC_R_DC_1_PLL_1, IMX_SC_PM_CLK_PLL);
+	imx_clk_scu("dc1_bypass0_clk", IMX_SC_R_DC_1_VIDEO0, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_scu("dc1_bypass1_clk", IMX_SC_R_DC_1_VIDEO1, IMX_SC_PM_CLK_BYPASS);
+
 	/* MIPI-LVDS SS */
+	imx_clk_scu("mipi0_bypass_clk", IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_scu("mipi0_pixel_clk", IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("mipi0_lvds_pixel_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2);
 	imx_clk_scu("mipi0_lvds_bypass_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_BYPASS);
 	imx_clk_scu("mipi0_lvds_phy_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3);
+	imx_clk_scu2("mipi0_dsi_tx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_MST_BUS);
+	imx_clk_scu2("mipi0_dsi_rx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_SLV_BUS);
+	imx_clk_scu2("mipi0_dsi_phy_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_PHY);
 	imx_clk_scu("mipi0_i2c0_clk", IMX_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2);
 	imx_clk_scu("mipi0_i2c1_clk", IMX_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2);
 	imx_clk_scu("mipi0_pwm0_clk", IMX_SC_R_MIPI_0_PWM_0, IMX_SC_PM_CLK_PER);
+
+	imx_clk_scu("mipi1_bypass_clk", IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_scu("mipi1_pixel_clk", IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("mipi1_lvds_pixel_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2);
 	imx_clk_scu("mipi1_lvds_bypass_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_BYPASS);
 	imx_clk_scu("mipi1_lvds_phy_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3);
+
+	imx_clk_scu2("mipi1_dsi_tx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_MST_BUS);
+	imx_clk_scu2("mipi1_dsi_rx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_SLV_BUS);
+	imx_clk_scu2("mipi1_dsi_phy_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_PHY);
 	imx_clk_scu("mipi1_i2c0_clk", IMX_SC_R_MIPI_1_I2C_0, IMX_SC_PM_CLK_MISC2);
 	imx_clk_scu("mipi1_i2c1_clk", IMX_SC_R_MIPI_1_I2C_1, IMX_SC_PM_CLK_MISC2);
 	imx_clk_scu("mipi1_pwm0_clk", IMX_SC_R_MIPI_1_PWM_0, IMX_SC_PM_CLK_PER);
 
+	imx_clk_scu("lvds0_i2c0_clk", IMX_SC_R_LVDS_0_I2C_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("lvds0_i2c1_clk", IMX_SC_R_LVDS_0_I2C_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("lvds0_pwm0_clk", IMX_SC_R_LVDS_0_PWM_0, IMX_SC_PM_CLK_PER);
+
+	imx_clk_scu("lvds1_i2c0_clk", IMX_SC_R_LVDS_1_I2C_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("lvds1_i2c1_clk", IMX_SC_R_LVDS_1_I2C_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("lvds1_pwm0_clk", IMX_SC_R_LVDS_1_PWM_0, IMX_SC_PM_CLK_PER);
+
 	/* MIPI CSI SS */
 	imx_clk_scu("mipi_csi0_core_clk", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("mipi_csi0_esc_clk",  IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC);
 	imx_clk_scu("mipi_csi0_i2c0_clk", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("mipi_csi0_pwm0_clk", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("mipi_csi1_core_clk", IMX_SC_R_CSI_1, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("mipi_csi1_esc_clk",  IMX_SC_R_CSI_1, IMX_SC_PM_CLK_MISC);
+	imx_clk_scu("mipi_csi1_i2c0_clk", IMX_SC_R_CSI_1_I2C_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("mipi_csi1_pwm0_clk", IMX_SC_R_CSI_1_PWM_0, IMX_SC_PM_CLK_PER);
+
+	/* Parallel Interface SS */
+	imx_clk_scu("pi_dpll_clk", IMX_SC_R_PI_0_PLL, IMX_SC_PM_CLK_PLL);
+	imx_clk_scu2("pi_per_div_clk", pi_pll0_sels, ARRAY_SIZE(pi_pll0_sels), IMX_SC_R_PI_0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("pi_mclk_div_clk", IMX_SC_R_PI_0, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu("pi_i2c0_div_clk", IMX_SC_R_PI_0_I2C_0, IMX_SC_PM_CLK_PER);
 
 	/* GPU SS */
 	imx_clk_scu("gpu_core0_clk",	 IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_PER);
 	imx_clk_scu("gpu_shader0_clk", IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_MISC);
 
+	imx_clk_scu("gpu_core1_clk",	 IMX_SC_R_GPU_1_PID0, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("gpu_shader1_clk", IMX_SC_R_GPU_1_PID0, IMX_SC_PM_CLK_MISC);
+
+	 /* CM40 SS */
+	imx_clk_scu("cm40_i2c_div", IMX_SC_R_M4_0_I2C, IMX_SC_PM_CLK_PER);
+	imx_clk_scu("cm40_lpuart_div", IMX_SC_R_M4_0_UART, IMX_SC_PM_CLK_PER);
+
+	 /* CM41 SS */
+	imx_clk_scu("cm41_i2c_div", IMX_SC_R_M4_1_I2C, IMX_SC_PM_CLK_PER);
+
+	/* HDMI TX SS */
+	imx_clk_scu("hdmi_dig_pll_clk",  IMX_SC_R_HDMI_PLL_0, IMX_SC_PM_CLK_PLL);
+	imx_clk_scu("hdmi_av_pll_clk", IMX_SC_R_HDMI_PLL_1, IMX_SC_PM_CLK_PLL);
+	imx_clk_scu2("hdmi_pixel_mux_clk", hdmi_sels, ARRAY_SIZE(hdmi_sels), IMX_SC_R_HDMI, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu2("hdmi_pixel_link_clk", hdmi_sels, ARRAY_SIZE(hdmi_sels), IMX_SC_R_HDMI, IMX_SC_PM_CLK_MISC1);
+	imx_clk_scu("hdmi_ipg_clk", IMX_SC_R_HDMI, IMX_SC_PM_CLK_MISC4);
+	imx_clk_scu("hdmi_i2c0_clk", IMX_SC_R_HDMI_I2C_0, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu("hdmi_hdp_core_clk", IMX_SC_R_HDMI, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu2("hdmi_pxl_clk", hdmi_sels, ARRAY_SIZE(hdmi_sels), IMX_SC_R_HDMI, IMX_SC_PM_CLK_MISC3);
+	imx_clk_scu("hdmi_i2s_bypass_clk", IMX_SC_R_HDMI_I2S, IMX_SC_PM_CLK_BYPASS);
+	imx_clk_scu("hdmi_i2s_clk", IMX_SC_R_HDMI_I2S, IMX_SC_PM_CLK_MISC0);
+
+	/* HDMI RX SS */
+	imx_clk_scu("hdmi_rx_i2s_bypass_clk", IMX_SC_R_HDMI_RX_BYPASS, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu("hdmi_rx_spdif_bypass_clk", IMX_SC_R_HDMI_RX_BYPASS, IMX_SC_PM_CLK_MISC1);
+	imx_clk_scu("hdmi_rx_bypass_clk", IMX_SC_R_HDMI_RX_BYPASS, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu("hdmi_rx_i2c0_clk", IMX_SC_R_HDMI_RX_I2C_0, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu("hdmi_rx_pwm_clk", IMX_SC_R_HDMI_RX_PWM_0, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu("hdmi_rx_spdif_clk", IMX_SC_R_HDMI_RX, IMX_SC_PM_CLK_MISC0);
+	imx_clk_scu2("hdmi_rx_hd_ref_clk", hdmi_rx_sels, ARRAY_SIZE(hdmi_rx_sels), IMX_SC_R_HDMI_RX, IMX_SC_PM_CLK_MISC1);
+	imx_clk_scu2("hdmi_rx_hd_core_clk", hdmi_rx_sels, ARRAY_SIZE(hdmi_rx_sels), IMX_SC_R_HDMI_RX, IMX_SC_PM_CLK_MISC2);
+	imx_clk_scu2("hdmi_rx_pxl_clk", hdmi_rx_sels, ARRAY_SIZE(hdmi_rx_sels), IMX_SC_R_HDMI_RX, IMX_SC_PM_CLK_MISC3);
+	imx_clk_scu("hdmi_rx_i2s_clk", IMX_SC_R_HDMI_RX, IMX_SC_PM_CLK_MISC4);
+
 	ret = of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_src_get, imx_scu_clks);
 	if (ret)
 		imx_clk_scu_unregister();
-- 
2.25.1

