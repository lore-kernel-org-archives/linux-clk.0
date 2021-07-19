Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73C8C07E9B
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 10:36:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC5BD60FED
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 10:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236315AbhGSJ4G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:56:06 -0400
Received: from mail-eopbgr130077.outbound.protection.outlook.com ([40.107.13.77]:17407
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236073AbhGSJ4E (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 05:56:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klDYMixkuWvkXsGI3nVBmgjW02Iq/IyrMOeGSqI89o8NoDZplirjsdIhILqQedLlteNJFuxiaEaJOUpWfGxtP/rYZvarDK+K4gtX7BtQvWgTEDZYipNLNm8zR4su2X/Alrj/GlKdQNMd+u48OfPRsDsdQrk8c9Wkivpbu7tBMYl+Yt24vid0TpKKVaSkoT8J86tkCUmjBJVcEw+aZDXSLMUPuu/nduM3nEU5dbG9AG06hjXyrokJ/QHMzkGPaZqt5sXZ5Sf3LfDfi19zyvaxxjh9lW1GN0MYhDa7ev4xQ1oFwuSSn9eRqVrb3fL4oDxGyi4IKAugIcbh3ECx9PdQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLmws6yPW0CAtYYeP35uot83lIF9qdAvEmJJWfjQhVs=;
 b=aHN/Sr1sdM9YHYz2Ko4eMjIsjplaKzwTG9EO2PBDE62svQAyTXYMFf02h5h4F3WUcEfhspl2Zsg8I7lzoc7hDlEqpio5ccN8VC2H/FiUKr62J6MDU7EBFcXjFmlXhe4OD/ZtRQl5YelaJHzqRnC2yvSX0bKCKC983qdAp/7zqPhkul8RivBEBCxvtLXIduvoFpfN2M460oHjmmdoyPX/+SlgSLZX+BAluUasWGbeot9xqZtvcn8VP3anKR1AkSxItMfSj2LqHcBc0Fw3RGfZJB5iwR1M1KO62XdRWdPkvgyAYQC0EnQRlqMGAAuZkmaoAjSapXcPPgcRrmA6mB2BtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLmws6yPW0CAtYYeP35uot83lIF9qdAvEmJJWfjQhVs=;
 b=GTfIDNzr13HoNeRb2e8Axr+ijFYeBQt/7S+X2vmx0eaOtEoqoaEXamc/I1H2m72jK+h2aShOF2fvj/DsSovlJBA5Fv4HV3GuQR8JU6d4Z+Hx87WBBbl86WStCa2MWfvnoQ4UvG7j7XRy7oxyuaAHiXi/pV7nxB6iGlZLb5iiGus=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VE1PR04MB6493.eurprd04.prod.outlook.com (2603:10a6:803:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Mon, 19 Jul
 2021 10:36:41 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::1dc0:b737:bf34:46b]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::1dc0:b737:bf34:46b%3]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 10:36:41 +0000
Date:   Mon, 19 Jul 2021 13:36:38 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH 1/2] clk: imx8mm: use correct mux type for clkout path
Message-ID: <YPVVtuj1imTTnwo9@ryzen>
References: <20210628211554.2510238-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628211554.2510238-1-l.stach@pengutronix.de>
X-ClientProxiedBy: VI1P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::27) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen (188.26.184.129) by VI1P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:2b::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 10:36:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 743863ae-d631-4491-b47e-08d94aa1183e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB649326326A1772B1E711476FF6E19@VE1PR04MB6493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PAsy7bObzY37zHoDa1dkK2mtiZAwohKgxw3LDfWU2h+6sfH1zFKAf/yA826aeqo/52DqyyDWJR6iU5qzaFwk1lTJzhMfwRAyhPiTCuiojHUua52z0gTNcOu7WIOjHNbA2x4X7EjLMXF8Mh6E7415+trmyBJdTKhe2UZ/rxS004FtbBDoWBY9mQ2J5K3QnEdDwO4weDCApuBJvqX7HVK//YvAQO5EpZnVXed1Fioxu6V05vg7MizvA/8p5dCYRjTcZhywbX5tSzV1SvsXlOFeI+sKuPmLFUMUHHh6E58UcTBO4WvpLrLQhytP7lY6qC+E00xgwk1SrCYaV7qz8emaZ0yR9UNBJvZ6HJdm8puFSPYOQkJgVpcTBbYFTOZn+1GYMoBB2Q59tg5ePjSgF4tzS7T+UMBLopJ20RARdtmmB5+jwbnP2OpYOj9k0nLQKIGN1cbFfcIeYdvYyN4qkNztHEbVqBhpgBt7Z3H1IEZqFxyGjAZEo1eoZ0hwWJtj1fXgEm/B52UT/QbVOL5txPcyFSCHUoSuH2NO4X7t27RFdwJCB3+b11GC9SVJLptWy6Eq11lral4uZKA7grhfWxtAMqOTs7RWsP0v7TnOic+UHzKiJZYZvsm+oUGsCnvl+xMNq3YIqROVqnyj/wyRq8tBxcP1MIzufIWpkidSDb7Pdz+jv2HL3csckcEpFaKXbrKThJQZDbDEmOCs0S4EQb12VeDPXDjgOWqzuuXbDX5+NmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(478600001)(8936002)(52116002)(6496006)(33716001)(9576002)(186003)(8676002)(66476007)(66556008)(66946007)(26005)(316002)(83380400001)(2906002)(38350700002)(38100700002)(53546011)(55016002)(956004)(5660300002)(9686003)(44832011)(54906003)(86362001)(4326008)(6916009)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IyJ8bOig9lcP17djIGmfS6utFZWnFAzU93x7+KVKZdTyh8VpJxZp6XPrsFsc?=
 =?us-ascii?Q?Ppx6nrm1BjD5cvpZQ96ohDYiLZFe6JNj2JWXsxvDnAShrRNkbNLrEu/koDT2?=
 =?us-ascii?Q?Fe8VA7wIWj8/D/S+OWui2CygdeMDn1grqR8uyNJ9E1tfhYK4RDLb/+VzyKRS?=
 =?us-ascii?Q?Mjy6oW+MHKsr6vWEzYwNCj7OS0qIre5sNVEqwRH1dQBUhpiO09iq5zXcPiK/?=
 =?us-ascii?Q?7S8fTE+peCsiBbKqnQlMmwt8e7wzce8AAZDEuDxc383sIe3eeyADfnEFn/U9?=
 =?us-ascii?Q?lq0YSgIagzeu2e03tipyJymBI0xXt2kT6UC6HblW0upzvHGvLpz/P8AIzcdL?=
 =?us-ascii?Q?IqYGWVXxUtmTmDRUNDzof2/S6WOAjfRsnRZ56o4GbgJ8zbdUOEWFL15Yie6/?=
 =?us-ascii?Q?P5bmwiVH4HkSz5myXgGr6mPN8jX65q0iDuEsLNrrEzA+bIsM/PYr1A7LzI7d?=
 =?us-ascii?Q?oXj8QI9EdnSDERDE+mVqP8mOtAlmiIYAChaGanmMWRl7lutoWLG55kcUniYS?=
 =?us-ascii?Q?vMw9eaiK6b2bnBE1iXnFY0ITJ62blQii+XSFIjCcS9Bfo+ZondhP8/GD0qTb?=
 =?us-ascii?Q?4NBOT7T4B9ukpu7AatQX5ea6qWwN+WCR4DXipWB5ROWYCvktAUDvKMv9sDla?=
 =?us-ascii?Q?Zn0P3uPE+oy3Znvwf0MMN0C4pJGHoDxESDqbZSKgfVBPbU4YnzfPY+1oEkZs?=
 =?us-ascii?Q?dZjQfpEoL2dpb2aBUNqLtu62dCNCmjy+IGCKa5XbW/5QBL7ikGqlOdfFbdIO?=
 =?us-ascii?Q?T+/pH9MZRlnSAEAR2KXFJgkcTTpV0qwSmzb4LU63/oaBbkEm7AOYr6w+hov8?=
 =?us-ascii?Q?WYjitwNRjEbv4Nof3vGDQ0JB/sMTLKwhulBxi/cG+nbCkqNEbE2HMFfEl6NC?=
 =?us-ascii?Q?7HkXTtpgY412cqgR8AbIVYaEKxIzPgYyz8fbOdngrjzthnzLCoA6YmYHffDu?=
 =?us-ascii?Q?fb4AmVc1/jAT6fnEFPRtX1bfX7acH7TLlKP4h5wFrOoUN6P7tIFqYYqdg7QK?=
 =?us-ascii?Q?4NCBrg7CmKFsyfURvmG1+g7yo5VjuQxiQS/xasdIbjJaLWXIPo9a6GBA87Q2?=
 =?us-ascii?Q?43TPrL5Mo3KUuInAqscqYmZeomaeSbvQXTHdqdJSYJcKH8gjP4xhSrM9TMRf?=
 =?us-ascii?Q?xVVsgUboa2QMiK9TOj83avXbRGNBI+2TRdR49PjXUi/Fs3VbsYQDRIirBeaY?=
 =?us-ascii?Q?y1cOwMdRUkBiQ1uTC4emSkzLfE5hPHHd2M3x5fjrhZmPBfI5YOyha8/2ezml?=
 =?us-ascii?Q?zXufniKupwoy0JGNPkzNJqldUI1EIfdfEbcF2FSWj7Yby66s9FKhxd9dRgFg?=
 =?us-ascii?Q?RuIaVbrVHGD/iK1Euj6vfp5K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743863ae-d631-4491-b47e-08d94aa1183e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 10:36:40.9167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BYe7DiPwHxYdYU6GokCV4qQmpiTkdW5UJvg8gjxd31ccrOMV7rMWQwm00NrMXRAPJhOJHznsdY82GDVxVmpKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6493
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-06-28 23:15:53, Lucas Stach wrote:
> The mux in the clkout path needs the current selected parent to
> be enabled for the the switch to work. Use the correct mux type
> to have the clk framework take care of this requirement.
> 
> Fixes: c1ae5c6f789a ("clk: imx8mm: add clkout1/2 support")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

I'm OK with this.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-imx8mm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index f1919fafb124..ce7127ccddab 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -407,10 +407,10 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MM_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_500m_cg", 1, 2);
>  	hws[IMX8MM_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
>  
> -	hws[IMX8MM_CLK_CLKOUT1_SEL] = imx_clk_hw_mux("clkout1_sel", base + 0x128, 4, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
> +	hws[IMX8MM_CLK_CLKOUT1_SEL] = imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
>  	hws[IMX8MM_CLK_CLKOUT1_DIV] = imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128, 0, 4);
>  	hws[IMX8MM_CLK_CLKOUT1] = imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
> -	hws[IMX8MM_CLK_CLKOUT2_SEL] = imx_clk_hw_mux("clkout2_sel", base + 0x128, 20, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
> +	hws[IMX8MM_CLK_CLKOUT2_SEL] = imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4, clkout_sels, ARRAY_SIZE(clkout_sels));
>  	hws[IMX8MM_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128, 16, 4);
>  	hws[IMX8MM_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
>  
> -- 
> 2.30.2
> 
