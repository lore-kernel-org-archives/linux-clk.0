Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07607C48BE6
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 08:52:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D506D61019
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 08:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhFNIyx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 04:54:53 -0400
Received: from mail-am6eur05on2059.outbound.protection.outlook.com ([40.107.22.59]:20079
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232528AbhFNIyx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 04:54:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNp3Z0GdGNKfPbYo2wpt2VAHjrXc53BonldJ/hG8M3T8e313Ob1q02b6uxhqPfEuS7Z8RGI3fC0rAt15JZyVMYxYfsEsKf/r7kyE/iTIi+uiF5FIJ4aesOHk3oDJYhiADEumB80vveOKVA7DcrFwp0rgZpeqSBWQvz04ymbvubGPdV5EXD6Rp6P5IqWCyZp3Nv36ia+i6Tolt+LNzK5CCbEPZZA5shMn19uSO17i9DP7V1pxYCU7EXIVPhs3OBWevlM2PrrTwUpx82GtwTbqCAl5u1D2omtbWiWDXFV/KFE2aJCLHVXv03vVV5G/bYsnaRQ6KoQ8xy3aGqSDPlQuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcxTcNX1wfOIhJZXPD782gd8+7FIk+4FC+qQZrLl9zU=;
 b=V+hWKb0J1UQwbp2jFhy64GysoFgIEqgi8P9POBOYwUfNrn8ktbelvy+GKJuSXfmaSh3g9B9Q+FzR4QNLtogLqvNBm+BBJxxC1LV3rp0ZYtCAo5qm9n/O9EFd0cBycHdlPiGJuE/2gSNa7fHe4mdCjIoSxGn9C2lNxBI9nzFVMtl0/reFcAMNFObW3DkJ5GvRShFTMB/NsQZgy/h1FH2dpHazPrHwtbW1OPUcvLVEfovKx9W0IAvNNOgeddyr3KwS1iw4ndh5v6d+onNfIupJHaQDpAMTaVto9KvYKlXJwgFIyCzd6Qw7NZxRxPbbQRS80Qr7WSIL6S795zCpXCs7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcxTcNX1wfOIhJZXPD782gd8+7FIk+4FC+qQZrLl9zU=;
 b=LLEBfETOaA0gNcIbUOqLWN4kdTXFheFb4+/rB1cIoQD4DvnxE35Xdqxul3wPx6K1V69P39haj0LOYT7BDpk0h5XRRuxUUMdZSG6VBrhB84NWfat2FNAlmErS7ik+llI8xwkduNbZpQFcALJBQiA7cb8w+cWGMt6ptz2YdOwTXSg=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR0401MB2557.eurprd04.prod.outlook.com (2603:10a6:800:56::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 08:52:48 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 08:52:47 +0000
Date:   Mon, 14 Jun 2021 11:52:46 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, dongas86@gmail.com, shawnguo@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 01/10] clk: imx: scu: add more scu clocks
Message-ID: <YMcY3uV7RIeGoJre@ryzen.lan>
References: <20210604090943.3519350-1-aisheng.dong@nxp.com>
 <20210604090943.3519350-2-aisheng.dong@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604090943.3519350-2-aisheng.dong@nxp.com>
X-Originating-IP: [188.27.182.130]
X-ClientProxiedBy: VI1PR0401CA0016.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::26) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.182.130) by VI1PR0401CA0016.eurprd04.prod.outlook.com (2603:10a6:800:4a::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 08:52:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d7ac041-02ec-4772-37b7-08d92f11c898
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB255763EFC43426EEB9CD7F48F6319@VI1PR0401MB2557.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:285;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KW7oWrs3UXkwZ6FVbt+HG8OkEnW3wu0HeCaWcGbsXwn2meYs+XtbabSPWINntAbbzgaKjboYfj2KVln1nGBfJWLqz2X2MUuJYwpUPysVYRsuejsUmjhksyHVMbZNBlTDmC8eg1V5k4YEUJDjh/vdVBRVMXM9xunF5PXMPk+XOSy9r9yowVC7LnuJ1seSqgD5xGnO4d7I2JZ6USen0ZFL9lR9iv37ZngujCJwTGL7AOZ5Q5vyVRECFPCb78tA2aq0a9iCI94xwvtUySQek8ZUX/4PJ5DtWcdlRXxMufeUIeMOcYumRwDkkEaLYqV3+DwMYWZ6uDahm2zm9n+XprexPiddXsYWc4Qnae0MBa7TY/lXuHay1DhZAE1stdJnadKWeAY0PTcCC20EetZDIB3FTNXujfg3riI0AV4vHeMxlCRAfjF8TplI6fLbX/EapvEiCcXLQdoOM9xyJFYygTkmDEtyT5OEY24X3O9TMd0/NJHHZ+Ikw4F3qPTgysvRFU/lEYj4rNgGgn6XiD+N1pHYeQxQQxxuiDYmoesKg4IvZjqqYbEOB6cX4r2UPaOiMvJRIQhdP9I1J+7M/UXar2JxWohOHEVE9EsrhhUiQomd6U4ua8aILIZ/2g4/UZW8SEMd9J4fzeGMbj4SDXYGGp0CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(9686003)(186003)(66946007)(6862004)(2906002)(16526019)(8886007)(83380400001)(44832011)(8936002)(316002)(30864003)(86362001)(6636002)(26005)(66556008)(66476007)(55016002)(38350700002)(38100700002)(8676002)(6506007)(53546011)(5660300002)(52116002)(956004)(7696005)(36756003)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ymFfMAe3yCqCKeozHtbWZiwLq30IwcWOlej2mDjC4dfbN56e7iW++p2O50gO?=
 =?us-ascii?Q?8DVjCRmBB8ToKw+LKJSmxqJRIkeXXXb3ao31GHjGpzbybhW2hGz/a4cG8HG0?=
 =?us-ascii?Q?YyCVi6Kl7PhoDIVr0OZNJWGUqsUoJ+58nV0YPEaRGBqfdLSVT33XEltwxW+S?=
 =?us-ascii?Q?1iQH7Hx6lwzm/LMbiSXd4t2Y5qZ+rlL8MfWd0XK2NPajaxzQy6F9atz5P6Yh?=
 =?us-ascii?Q?gWZSuQO2X1y1oaOgXejgJHm6rDozRFse+1ugjNnBDmc20wiZVGUG3cuW18GD?=
 =?us-ascii?Q?RlHRddXBbSP6S99gvYaDT3c5w2ZGJv07Kzma5qDj2O48FD9OhC1xPRfgHb76?=
 =?us-ascii?Q?RzwiyzkoInYlBCGJH2Yb66C+QBVUwMoRyXbbeNsZ0IU+90SO0FPCDPH2vKre?=
 =?us-ascii?Q?ORKt1huQZy4nXMGbf8wyNohBQF5ujbrEJ/hxrn/0kEJW5e11IFjVhpzibG+Q?=
 =?us-ascii?Q?zQP8xfd7PUWHlt4hUgrZsdyPTwtYzpd8XhHabmTtteIdC6tpOVtLFP5GowMG?=
 =?us-ascii?Q?NgAR6UyDDvnBg8g4yzXLXk+Ibd3x8K95PGmLXbHR3IrzFMhoYOYvYwqhWKuQ?=
 =?us-ascii?Q?gq2sU1z+1Gjh0zZBEIH5O0jNFzGT5K37g9GVlvV5KoTDI3wch1CwX3KTQRhW?=
 =?us-ascii?Q?pNrovLclWMGGyStHjgabJ2MJtBSbsfaiLvC99ovq9UnBerRm0trk+f9rtlMS?=
 =?us-ascii?Q?I5FEDO9gjGXW3JbErGyVJoM/keKcSlrgb54zMj8Lwm44s4ZMgtyCNNfQ1Nso?=
 =?us-ascii?Q?glAmClNTlWXSP3ZKlQKtNnaf+a2CWqxj9e99UvmkftnkD5wIacvsuukB+L5l?=
 =?us-ascii?Q?YqNRxQ9F3gqWxYyTrJBfWI1OSvVnzKzaOnrEXNEkNa2NpCWgD3cqGSZg3ZK6?=
 =?us-ascii?Q?1R4YsfJz7J+Jhjz2LqmbPs+IY2SjL82cMPwBxYUX/VgB6LP0XsuP8mdcnc/P?=
 =?us-ascii?Q?4XsUlonoj/N0Vg7rOAjHOGdvWrde9BuFrLv1WNzF6vh3Vv4dbqBl+ODXxVj0?=
 =?us-ascii?Q?8DPB7+xRkbeNorB2Cevvq8aY+S1W/dHPHzhTMO4zJqQAig1KS0FTDC3eL4xb?=
 =?us-ascii?Q?rAJbSMMeTrQNrSmXq/O0oeVGw8Fn3NtOrZWhvXMhQzB2VupK6X8MDRkDL86A?=
 =?us-ascii?Q?wBSr3S6rpcJ3siwJdAzOcX041CTqoeC6BcJyJ9N33aVQMSuPxjPXf4Zz6sEW?=
 =?us-ascii?Q?A136eFYbhHgFwo8bZnrytNSyKrKiN3cylpGDOzFEFC5nYm5wtoxrpOY1706M?=
 =?us-ascii?Q?rx6HPC9MFPXAwcFoaEmsuOHx7urC8QSVWf4S0ONktUThx6XMnf/3jNYXdCsO?=
 =?us-ascii?Q?tJJNfnjSxijzukHUujW0eemR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7ac041-02ec-4772-37b7-08d92f11c898
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 08:52:47.8093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvW+i7BM/4mMTYEgXVevxpZLk82EjR87Wbvqz/zZDRc3sy9P8RnY7K6GYVfxYarrkTG39pIl6QFPoQgIzhyVUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2557
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-04 17:09:34, Dong Aisheng wrote:
> Add more scu clocks used by i.MX8 platforms.
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

This looks OK to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8qxp.c | 152 +++++++++++++++++++++++++++++++++-
>  1 file changed, 150 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index f3cdd6449212..b1dd6ed685f9 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -25,6 +25,14 @@ static const char *dc0_sels[] = {
>  	"dc0_bypass0_clk",
>  };
>  
> +static const char * const dc1_sels[] = {
> +	"clk_dummy",
> +	"clk_dummy",
> +	"dc1_pll0_clk",
> +	"dc1_pll1_clk",
> +	"dc1_bypass0_clk",
> +};
> +
>  static const char *enet0_rgmii_txc_sels[] = {
>  	"enet0_ref_div",
>  	"dummy",
> @@ -35,6 +43,54 @@ static const char *enet1_rgmii_txc_sels[] = {
>  	"dummy",
>  };
>  
> +static const char * const hdmi_sels[] = {
> +	"clk_dummy",
> +	"hdmi_dig_pll_clk",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"hdmi_av_pll_clk",
> +};
> +
> +static const char * const hdmi_rx_sels[] = {
> +	"clk_dummy",
> +	"hdmi_rx_dig_pll_clk",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"hdmi_rx_bypass_clk",
> +};
> +
> +static const char * const lcd_pxl_sels[] = {
> +	"clk_dummy",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"lcd_pxl_bypass_div_clk",
> +};
> +
> +static const char * const mipi_sels[] = {
> +	"clk_dummy",
> +	"clk_dummy",
> +	"mipi_pll_div2_clk",
> +	"clk_dummy",
> +	"clk_dummy",
> +};
> +
> +static const char * const lcd_sels[] = {
> +	"clk_dummy",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"elcdif_pll",
> +};
> +
> +static const char * const pi_pll0_sels[] = {
> +	"clk_dummy",
> +	"pi_dpll_clk",
> +	"clk_dummy",
> +	"clk_dummy",
> +	"clk_dummy",
> +};
> +
>  static int imx8qxp_clk_probe(struct platform_device *pdev)
>  {
>  	struct device_node *ccm_node = pdev->dev.of_node;
> @@ -48,6 +104,8 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
>  
>  	/* ARM core */
>  	imx_clk_scu("a35_clk", IMX_SC_R_A35, IMX_SC_PM_CLK_CPU);
> +	imx_clk_scu("a53_clk", IMX_SC_R_A53, IMX_SC_PM_CLK_CPU);
> +	imx_clk_scu("a72_clk", IMX_SC_R_A72, IMX_SC_PM_CLK_CPU);
>  
>  	/* LSIO SS */
>  	imx_clk_scu("pwm0_clk", IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER);
> @@ -66,25 +124,42 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
>  	imx_clk_scu("fspi0_clk", IMX_SC_R_FSPI_0, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("fspi1_clk", IMX_SC_R_FSPI_1, IMX_SC_PM_CLK_PER);
>  
> -	/* ADMA SS */
> +	/* DMA SS */
>  	imx_clk_scu("uart0_clk", IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("uart1_clk", IMX_SC_R_UART_1, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("uart2_clk", IMX_SC_R_UART_2, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("uart3_clk", IMX_SC_R_UART_3, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("uart4_clk", IMX_SC_R_UART_4, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("sim0_clk",  IMX_SC_R_EMVSIM_0, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("spi0_clk",  IMX_SC_R_SPI_0, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("spi1_clk",  IMX_SC_R_SPI_1, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("spi2_clk",  IMX_SC_R_SPI_2, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("spi3_clk",  IMX_SC_R_SPI_3, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("can0_clk",  IMX_SC_R_CAN_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("can1_clk",  IMX_SC_R_CAN_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("can2_clk",  IMX_SC_R_CAN_2, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("i2c0_clk",  IMX_SC_R_I2C_0, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("i2c1_clk",  IMX_SC_R_I2C_1, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("i2c2_clk",  IMX_SC_R_I2C_2, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("i2c3_clk",  IMX_SC_R_I2C_3, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("i2c4_clk",  IMX_SC_R_I2C_4, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("ftm0_clk",  IMX_SC_R_FTM_0, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("ftm1_clk",  IMX_SC_R_FTM_1, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("adc0_clk",  IMX_SC_R_ADC_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("adc1_clk",  IMX_SC_R_ADC_1, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("pwm_clk",   IMX_SC_R_LCD_0_PWM_0, IMX_SC_PM_CLK_PER);
> -	imx_clk_scu("lcd_clk",   IMX_SC_R_LCD_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu2("lcd_clk", lcd_sels, ARRAY_SIZE(lcd_sels), IMX_SC_R_LCD_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu2("lcd_pxl_clk", lcd_pxl_sels, ARRAY_SIZE(lcd_pxl_sels), IMX_SC_R_LCD_0, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu("lcd_pxl_bypass_div_clk", IMX_SC_R_LCD_0, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_scu("elcdif_pll", IMX_SC_R_ELCDIF_PLL, IMX_SC_PM_CLK_PLL);
> +
> +	/* Audio SS */
> +	imx_clk_scu("audio_pll0_clk", IMX_SC_R_AUDIO_PLL_0, IMX_SC_PM_CLK_PLL);
> +	imx_clk_scu("audio_pll1_clk", IMX_SC_R_AUDIO_PLL_1, IMX_SC_PM_CLK_PLL);
> +	imx_clk_scu("audio_pll_div_clk0_clk", IMX_SC_R_AUDIO_PLL_0, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu("audio_pll_div_clk1_clk", IMX_SC_R_AUDIO_PLL_1, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu("audio_rec_clk0_clk", IMX_SC_R_AUDIO_PLL_0, IMX_SC_PM_CLK_MISC1);
> +	imx_clk_scu("audio_rec_clk1_clk", IMX_SC_R_AUDIO_PLL_1, IMX_SC_PM_CLK_MISC1);
>  
>  	/* Connectivity */
>  	imx_clk_scu("sdhc0_clk", IMX_SC_R_SDHC_0, IMX_SC_PM_CLK_PER);
> @@ -94,11 +169,13 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
>  	imx_clk_divider_gpr_scu("enet0_ref_div", "enet0_root_clk", IMX_SC_R_ENET_0, IMX_SC_C_CLKDIV);
>  	imx_clk_mux_gpr_scu("enet0_rgmii_txc_sel", enet0_rgmii_txc_sels, ARRAY_SIZE(enet0_rgmii_txc_sels), IMX_SC_R_ENET_0, IMX_SC_C_TXCLK);
>  	imx_clk_scu("enet0_bypass_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_gate_gpr_scu("enet0_ref_50_clk", "clk_dummy", IMX_SC_R_ENET_0, IMX_SC_C_DISABLE_50, true);
>  	imx_clk_scu("enet0_rgmii_rx_clk", IMX_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0);
>  	imx_clk_scu("enet1_root_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_PER);
>  	imx_clk_divider_gpr_scu("enet1_ref_div", "enet1_root_clk", IMX_SC_R_ENET_1, IMX_SC_C_CLKDIV);
>  	imx_clk_mux_gpr_scu("enet1_rgmii_txc_sel", enet1_rgmii_txc_sels, ARRAY_SIZE(enet1_rgmii_txc_sels), IMX_SC_R_ENET_1, IMX_SC_C_TXCLK);
>  	imx_clk_scu("enet1_bypass_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_gate_gpr_scu("enet1_ref_50_clk", "clk_dummy", IMX_SC_R_ENET_1, IMX_SC_C_DISABLE_50, true);
>  	imx_clk_scu("enet1_rgmii_rx_clk", IMX_SC_R_ENET_1, IMX_SC_PM_CLK_MISC0);
>  	imx_clk_scu("gpmi_io_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_MST_BUS);
>  	imx_clk_scu("gpmi_bch_clk", IMX_SC_R_NAND, IMX_SC_PM_CLK_PER);
> @@ -114,30 +191,101 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
>  	imx_clk_scu("dc0_bypass0_clk", IMX_SC_R_DC_0_VIDEO0, IMX_SC_PM_CLK_BYPASS);
>  	imx_clk_scu("dc0_bypass1_clk", IMX_SC_R_DC_0_VIDEO1, IMX_SC_PM_CLK_BYPASS);
>  
> +	imx_clk_scu2("dc1_disp0_clk", dc1_sels, ARRAY_SIZE(dc1_sels), IMX_SC_R_DC_1, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu2("dc1_disp1_clk", dc1_sels, ARRAY_SIZE(dc1_sels), IMX_SC_R_DC_1, IMX_SC_PM_CLK_MISC1);
> +	imx_clk_scu("dc1_pll0_clk", IMX_SC_R_DC_1_PLL_0, IMX_SC_PM_CLK_PLL);
> +	imx_clk_scu("dc1_pll1_clk", IMX_SC_R_DC_1_PLL_1, IMX_SC_PM_CLK_PLL);
> +	imx_clk_scu("dc1_bypass0_clk", IMX_SC_R_DC_1_VIDEO0, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_scu("dc1_bypass1_clk", IMX_SC_R_DC_1_VIDEO1, IMX_SC_PM_CLK_BYPASS);
> +
>  	/* MIPI-LVDS SS */
> +	imx_clk_scu("mipi0_bypass_clk", IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_scu("mipi0_pixel_clk", IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("mipi0_lvds_pixel_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC2);
>  	imx_clk_scu("mipi0_lvds_bypass_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_BYPASS);
>  	imx_clk_scu("mipi0_lvds_phy_clk", IMX_SC_R_LVDS_0, IMX_SC_PM_CLK_MISC3);
> +	imx_clk_scu2("mipi0_dsi_tx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_MST_BUS);
> +	imx_clk_scu2("mipi0_dsi_rx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_SLV_BUS);
> +	imx_clk_scu2("mipi0_dsi_phy_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_0, IMX_SC_PM_CLK_PHY);
>  	imx_clk_scu("mipi0_i2c0_clk", IMX_SC_R_MIPI_0_I2C_0, IMX_SC_PM_CLK_MISC2);
>  	imx_clk_scu("mipi0_i2c1_clk", IMX_SC_R_MIPI_0_I2C_1, IMX_SC_PM_CLK_MISC2);
>  	imx_clk_scu("mipi0_pwm0_clk", IMX_SC_R_MIPI_0_PWM_0, IMX_SC_PM_CLK_PER);
> +
> +	imx_clk_scu("mipi1_bypass_clk", IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_scu("mipi1_pixel_clk", IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("mipi1_lvds_pixel_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC2);
>  	imx_clk_scu("mipi1_lvds_bypass_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_BYPASS);
>  	imx_clk_scu("mipi1_lvds_phy_clk", IMX_SC_R_LVDS_1, IMX_SC_PM_CLK_MISC3);
> +
> +	imx_clk_scu2("mipi1_dsi_tx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_MST_BUS);
> +	imx_clk_scu2("mipi1_dsi_rx_esc_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_SLV_BUS);
> +	imx_clk_scu2("mipi1_dsi_phy_clk", mipi_sels, ARRAY_SIZE(mipi_sels), IMX_SC_R_MIPI_1, IMX_SC_PM_CLK_PHY);
>  	imx_clk_scu("mipi1_i2c0_clk", IMX_SC_R_MIPI_1_I2C_0, IMX_SC_PM_CLK_MISC2);
>  	imx_clk_scu("mipi1_i2c1_clk", IMX_SC_R_MIPI_1_I2C_1, IMX_SC_PM_CLK_MISC2);
>  	imx_clk_scu("mipi1_pwm0_clk", IMX_SC_R_MIPI_1_PWM_0, IMX_SC_PM_CLK_PER);
>  
> +	imx_clk_scu("lvds0_i2c0_clk", IMX_SC_R_LVDS_0_I2C_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("lvds0_i2c1_clk", IMX_SC_R_LVDS_0_I2C_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("lvds0_pwm0_clk", IMX_SC_R_LVDS_0_PWM_0, IMX_SC_PM_CLK_PER);
> +
> +	imx_clk_scu("lvds1_i2c0_clk", IMX_SC_R_LVDS_1_I2C_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("lvds1_i2c1_clk", IMX_SC_R_LVDS_1_I2C_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("lvds1_pwm0_clk", IMX_SC_R_LVDS_1_PWM_0, IMX_SC_PM_CLK_PER);
> +
>  	/* MIPI CSI SS */
>  	imx_clk_scu("mipi_csi0_core_clk", IMX_SC_R_CSI_0, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("mipi_csi0_esc_clk",  IMX_SC_R_CSI_0, IMX_SC_PM_CLK_MISC);
>  	imx_clk_scu("mipi_csi0_i2c0_clk", IMX_SC_R_CSI_0_I2C_0, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("mipi_csi0_pwm0_clk", IMX_SC_R_CSI_0_PWM_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("mipi_csi1_core_clk", IMX_SC_R_CSI_1, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("mipi_csi1_esc_clk",  IMX_SC_R_CSI_1, IMX_SC_PM_CLK_MISC);
> +	imx_clk_scu("mipi_csi1_i2c0_clk", IMX_SC_R_CSI_1_I2C_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("mipi_csi1_pwm0_clk", IMX_SC_R_CSI_1_PWM_0, IMX_SC_PM_CLK_PER);
> +
> +	/* Parallel Interface SS */
> +	imx_clk_scu("pi_dpll_clk", IMX_SC_R_PI_0_PLL, IMX_SC_PM_CLK_PLL);
> +	imx_clk_scu2("pi_per_div_clk", pi_pll0_sels, ARRAY_SIZE(pi_pll0_sels), IMX_SC_R_PI_0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("pi_mclk_div_clk", IMX_SC_R_PI_0, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu("pi_i2c0_div_clk", IMX_SC_R_PI_0_I2C_0, IMX_SC_PM_CLK_PER);
>  
>  	/* GPU SS */
>  	imx_clk_scu("gpu_core0_clk",	 IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_PER);
>  	imx_clk_scu("gpu_shader0_clk", IMX_SC_R_GPU_0_PID0, IMX_SC_PM_CLK_MISC);
>  
> +	imx_clk_scu("gpu_core1_clk",	 IMX_SC_R_GPU_1_PID0, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("gpu_shader1_clk", IMX_SC_R_GPU_1_PID0, IMX_SC_PM_CLK_MISC);
> +
> +	 /* CM40 SS */
> +	imx_clk_scu("cm40_i2c_div", IMX_SC_R_M4_0_I2C, IMX_SC_PM_CLK_PER);
> +	imx_clk_scu("cm40_lpuart_div", IMX_SC_R_M4_0_UART, IMX_SC_PM_CLK_PER);
> +
> +	 /* CM41 SS */
> +	imx_clk_scu("cm41_i2c_div", IMX_SC_R_M4_1_I2C, IMX_SC_PM_CLK_PER);
> +
> +	/* HDMI TX SS */
> +	imx_clk_scu("hdmi_dig_pll_clk",  IMX_SC_R_HDMI_PLL_0, IMX_SC_PM_CLK_PLL);
> +	imx_clk_scu("hdmi_av_pll_clk", IMX_SC_R_HDMI_PLL_1, IMX_SC_PM_CLK_PLL);
> +	imx_clk_scu2("hdmi_pixel_mux_clk", hdmi_sels, ARRAY_SIZE(hdmi_sels), IMX_SC_R_HDMI, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu2("hdmi_pixel_link_clk", hdmi_sels, ARRAY_SIZE(hdmi_sels), IMX_SC_R_HDMI, IMX_SC_PM_CLK_MISC1);
> +	imx_clk_scu("hdmi_ipg_clk", IMX_SC_R_HDMI, IMX_SC_PM_CLK_MISC4);
> +	imx_clk_scu("hdmi_i2c0_clk", IMX_SC_R_HDMI_I2C_0, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu("hdmi_hdp_core_clk", IMX_SC_R_HDMI, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu2("hdmi_pxl_clk", hdmi_sels, ARRAY_SIZE(hdmi_sels), IMX_SC_R_HDMI, IMX_SC_PM_CLK_MISC3);
> +	imx_clk_scu("hdmi_i2s_bypass_clk", IMX_SC_R_HDMI_I2S, IMX_SC_PM_CLK_BYPASS);
> +	imx_clk_scu("hdmi_i2s_clk", IMX_SC_R_HDMI_I2S, IMX_SC_PM_CLK_MISC0);
> +
> +	/* HDMI RX SS */
> +	imx_clk_scu("hdmi_rx_i2s_bypass_clk", IMX_SC_R_HDMI_RX_BYPASS, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu("hdmi_rx_spdif_bypass_clk", IMX_SC_R_HDMI_RX_BYPASS, IMX_SC_PM_CLK_MISC1);
> +	imx_clk_scu("hdmi_rx_bypass_clk", IMX_SC_R_HDMI_RX_BYPASS, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu("hdmi_rx_i2c0_clk", IMX_SC_R_HDMI_RX_I2C_0, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu("hdmi_rx_pwm_clk", IMX_SC_R_HDMI_RX_PWM_0, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu("hdmi_rx_spdif_clk", IMX_SC_R_HDMI_RX, IMX_SC_PM_CLK_MISC0);
> +	imx_clk_scu2("hdmi_rx_hd_ref_clk", hdmi_rx_sels, ARRAY_SIZE(hdmi_rx_sels), IMX_SC_R_HDMI_RX, IMX_SC_PM_CLK_MISC1);
> +	imx_clk_scu2("hdmi_rx_hd_core_clk", hdmi_rx_sels, ARRAY_SIZE(hdmi_rx_sels), IMX_SC_R_HDMI_RX, IMX_SC_PM_CLK_MISC2);
> +	imx_clk_scu2("hdmi_rx_pxl_clk", hdmi_rx_sels, ARRAY_SIZE(hdmi_rx_sels), IMX_SC_R_HDMI_RX, IMX_SC_PM_CLK_MISC3);
> +	imx_clk_scu("hdmi_rx_i2s_clk", IMX_SC_R_HDMI_RX, IMX_SC_PM_CLK_MISC4);
> +
>  	ret = of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_src_get, imx_scu_clks);
>  	if (ret)
>  		imx_clk_scu_unregister();
> -- 
> 2.25.1
> 
