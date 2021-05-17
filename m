Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79891C43611
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 10:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A216610C9
	for <linux-clk@archiver.kernel.org>; Mon, 17 May 2021 10:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236179AbhEQKHK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 May 2021 06:07:10 -0400
Received: from mail-eopbgr80053.outbound.protection.outlook.com ([40.107.8.53]:65102
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236325AbhEQKGv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 May 2021 06:06:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+Vde7+nUYNNakM+/zKwVkA565ZRQagOH1iTD8VJ34jb+Sua8z9/SjhemNUeJQwKIoQ7oTnMwXc5nRkD57+P6ok+OL03H+ir2qP0qz5+TnJADbKnOTwrjfEcM1qiU9fF3E2zdPq/JYxDMtc3ACYg8v+Jos0n5nGynTgKIpt8PHEJI3rJN4fMgjpMvPEQqMwT9onzN9UgPzmT46lojyj9okmIwD1WPYuA4DyF5K/wZn+FtEm8OD58wy/5R07ciglLbqD2xSUcdxfRhOVaWq7QETbFYz13xQzAgj5Wbpk6kQUw2ccW8RmxgLY1KZybhKTKRLsl5N/5azzdqstsIAz8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Gz4+rSyPFVJfypbOFnYh1pFmKOvoZhTo212wuoYLB0=;
 b=WuFBqzbpcGCOfzVB/nPB/NDaU9dXasvdc1+mpnPfdAvqApfRl0Dwewh1UyKvZjeyhhaUa8Cvbw9fZO/OYJbUiUSwPay4vxWcHHu0C6riGcd6xvOtd5dNYMkTcXZq/1vDoyHcBOp4tHH6xagcZ79o+H6wPGlPByNnYfmX0ctWqBFuXFIhQLhlWpwaBmwpXT+oFjHnfA8OKxScbtbtk/ILWVLOgVXH5m/IaGaz8jn89ItcSQRPUPX+wuORDf65hT48fKOcTdxW9KXJkrpKiwKx40brX36fmjNlXzwIO/sjNI+6QwGTxq6ENacvZvkvGnXhVEHoXCV3EDsiDOyXda2mjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Gz4+rSyPFVJfypbOFnYh1pFmKOvoZhTo212wuoYLB0=;
 b=D4f3Nhokv8NL1Rhcc99RXj+/wtNY/LwQaw9T8ixGK6aECZytc7O5PV6mDTS+GmfojxQY5bpHxAySU4f7g5oKxSwrKMJ49Yn4d03mk+uu0lmY0kwtRbuI+VoJl7f5WuAdwl0HWtg6WyH9/eyDzDxWGziEUL+97d6xEWGmNfqopZ8=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VE1PR04MB6749.eurprd04.prod.outlook.com (2603:10a6:803:129::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 10:04:41 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 10:04:41 +0000
Date:   Mon, 17 May 2021 13:04:39 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: imx8mq: prevent sys1_pll_266m gating
Message-ID: <YKI/txpAZUQJvOem@ryzen.lan>
References: <20210507171028.157728-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507171028.157728-1-l.stach@pengutronix.de>
X-Originating-IP: [188.27.175.31]
X-ClientProxiedBy: VI1PR02CA0078.eurprd02.prod.outlook.com
 (2603:10a6:802:14::49) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.175.31) by VI1PR02CA0078.eurprd02.prod.outlook.com (2603:10a6:802:14::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 10:04:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d539671e-10af-44e2-85f8-08d9191b3032
X-MS-TrafficTypeDiagnostic: VE1PR04MB6749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6749DF7DF0AF57AC592D28B2F62D9@VE1PR04MB6749.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/cKeQs3zX1iHllvhg2lsztvaBvOlq67DbZtc+o7tZAyjv6k100wQgQBxVauJ/8jMJGxW6r9DYtX0Q8e30GUhOahHeytZQC39cQT/VtZlU/SYnEjqsiA0+Frz/QyUPKP9ERfSFkLEJt3HPbvw6+okZbtcJH8lUvHJBNveTF9qdDfCPWhILfQ5NFNy8XABjLCYvc8py/uOpMPWUGSV88SP+nUZYM1+DUqXYTqSB/XDKsPnVZ5uhjWDxBx0JwXHCjSJbsXya6WT0iEXWMiw6nYUOi9Cxto8JLSVu4OVSvSmwBR8I+v0X58lM0+9PyLtYFQPSmK4arB3680BPYbJCfTCuUdoyvrgW3myxDIo5WyNel7m57bOklALbqfxD6KxtWPXZUB9xENbDzficDKmxUHj9U2JQH65ABYnMxHZI2bZqupSdXTMCxcCIVM0Lnzjuso+P1MaVgpkfe/WzEs9SEnlqpv7El7dcIegWOCcDnbO04ryLFWpF2aDeChxcZlTs4zd1V++I5xikgx0//SmlgYZ/xugVuIhEM6vL25LxWe+wYbRrIirilDhsN91wkTupS4LBZE2F2j1WqI+c+uV4y6W1FAHSSbt3+JUGPZNiJHpMdtpHmaN2LOTKrFGGFeDEDT9cqyAzy6QE5tqS59GAFS6VLsDwf0D6agm6vwwJOBPUS2g+ZxdmyqYvxyWIyQIn9q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(346002)(136003)(376002)(44832011)(54906003)(478600001)(66476007)(66556008)(6506007)(66946007)(8676002)(55016002)(7696005)(36756003)(8886007)(8936002)(5660300002)(26005)(4326008)(6916009)(38350700002)(38100700002)(186003)(16526019)(956004)(86362001)(9686003)(83380400001)(53546011)(2906002)(52116002)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Wsi2FrDTrJGG3OoyK4QojmDzSf4OkJqFeXDkjjWG4QG7wJL2jQQNZlFoGGEn?=
 =?us-ascii?Q?Xo8dvDzpgq1D1FBZGztuWiULFWDbdspkESwBEDJZqROlQMAKBTu+ybxJuHD0?=
 =?us-ascii?Q?kiYnwc6VjgsoOH19XdDiY/9KyaUnIeo06los+oTlAyfWPepLHeOn2Ma125YA?=
 =?us-ascii?Q?2+cTIV9ThWsYs8N3GQYi8iYIdRb0TMiowqhukZ5rQOFg3oE/P68XDQGtgihA?=
 =?us-ascii?Q?x73qlT44UbBguf2EYDReZ11VTZSAC6DTEXwWaaWyHMEEj8lnvPg5eOEZs8cu?=
 =?us-ascii?Q?LkrAgnIlruJYpJnCmV+xg9ndQtDMGoYD/Te64YH8z9OwwNns6if+KF+t/yNE?=
 =?us-ascii?Q?5IgZRRrC85epXf1Ztjrg+w1ErOK6A8odQghVwDOnMGW/5ct9I49I9ZsngBNv?=
 =?us-ascii?Q?/Yl5Nw7oOfWqm6Gm+4Mlb46lZS4pPtl3DZq7LA6/VUbP/HmzGzdZ8TNT6TBP?=
 =?us-ascii?Q?gLHC2zrpF+8Wqn6kzT+BrAxMRvJ/B+WBQyl10qEJr8lyP5A2DmCOErBVUcAO?=
 =?us-ascii?Q?L7swPvcToXSDsH7qUmn3iistdGQnR/92UzZEygvYAXGxjqrnGg+gw84vsFSb?=
 =?us-ascii?Q?3KBORjJgsGXwzW1KNOHXZ09UMgE5c3nyxzAJanmgjnXU6GiAiu9UkSCwnEY9?=
 =?us-ascii?Q?6jZblAYt73G7CiDKkdVqWpUnpgOi7ucgb1Q1z/bPeV8HdJuHY/aUfLn2N09t?=
 =?us-ascii?Q?g9IbPMreA0q0zlLOwQRPKWOUaiEfjl/0wsjO3Pw2LOzRBMTClqu3uzgFneol?=
 =?us-ascii?Q?wYtgfYjlO7b6/zb1Bi3kojCPAemOS6btNsEFui1Npxeiqslm1p1rFt5/ZyId?=
 =?us-ascii?Q?e2EbW9+2EEM8qCMVEshbDnvMtv4g98XLlmL9QNWLeNAq29v4hlgmaZtiCumU?=
 =?us-ascii?Q?JNNsKSyZ7DDJL8+nBQ+nI8nFpe1ReeRoYWAp+CvRMbCbQHfRP5NwHyK6iydF?=
 =?us-ascii?Q?BT1lMU/ZDeHrGWNzX8mhSf/QpXj/mNwpAyc3mYkBdbwEqZdUuJu7kH7HEBlG?=
 =?us-ascii?Q?TMhEA8FlyZg+Tnk+xBApNPF8kALcB6iWBC7gNTLaQpavIRjjhbVVEQMQorXF?=
 =?us-ascii?Q?+9RqZrS245/xgGSkFnyF2GYaTgJEPINFJ6umcegY2eEyeO0W67Fk9DNFLJdW?=
 =?us-ascii?Q?CQ5/FPmLrqxy06gE+HJI/LsevASbpjLpZLW0mo/NshqPXbd/nRXZR9rSkeUW?=
 =?us-ascii?Q?KHWR8sTBjr1E0RTv2PgRlmVBPtr/zU9PdLVXZoA3EUmW0UfhRKZt90AIckCN?=
 =?us-ascii?Q?jRafJ+TgRYn2dqvap7B4xdvgWFC/X7M66Nt7fJ3hHGDL+CjP1If31b17EyCR?=
 =?us-ascii?Q?8qPjSMVKcyKaTbaAutTqTSfq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d539671e-10af-44e2-85f8-08d9191b3032
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 10:04:41.5393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qo30qG9UhnC4vhm5O9JusZ/Pw9C2SgJiGbSGqCzSSTtBjSLHcx5GRC4jVpMz1A5Ulb3qNVd4S99lDnxVaE+8bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6749
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-05-07 19:10:28, Lucas Stach wrote:
> Gating sys1_pll_266m while the usdhc_nand_bus clock is still active (due
> to being enabled in to bootloader) leads to spurious failures of the
> uSDHC module.
> 
> b04383b6a558 ("clk: imx8mq: Define gates for pll1/2 fixed dividers")

Maybe this should have a Fixes tag then.

Then Stephen will pick it up himself.

> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> We probably need some solution to keep parent clocks active on the i.MX8M clock
> architecture, as long as any consumers are active, as the reference manual
> states that disabling a parent clock may lead to undefined behavior. This needs
> more work in the clock framework and/or driver. This patch fixes the obvious
> regression until we have such a solution.
> ---
>  drivers/clk/imx/clk-imx8mq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index 4dd4ae9d022b..fce983add1fc 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -372,7 +372,6 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MQ_SYS1_PLL_133M_CG] = imx_clk_hw_gate("sys1_pll_133m_cg", "sys1_pll_out", base + 0x30, 15);
>  	hws[IMX8MQ_SYS1_PLL_160M_CG] = imx_clk_hw_gate("sys1_pll_160m_cg", "sys1_pll_out", base + 0x30, 17);
>  	hws[IMX8MQ_SYS1_PLL_200M_CG] = imx_clk_hw_gate("sys1_pll_200m_cg", "sys1_pll_out", base + 0x30, 19);
> -	hws[IMX8MQ_SYS1_PLL_266M_CG] = imx_clk_hw_gate("sys1_pll_266m_cg", "sys1_pll_out", base + 0x30, 21);
>  	hws[IMX8MQ_SYS1_PLL_400M_CG] = imx_clk_hw_gate("sys1_pll_400m_cg", "sys1_pll_out", base + 0x30, 23);
>  	hws[IMX8MQ_SYS1_PLL_800M_CG] = imx_clk_hw_gate("sys1_pll_800m_cg", "sys1_pll_out", base + 0x30, 25);
>  
> @@ -382,7 +381,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_133m_cg", 1, 6);
>  	hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_160m_cg", 1, 5);
>  	hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_200m_cg", 1, 4);
> -	hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_266m_cg", 1, 3);
> +	hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_out", 1, 3);
>  	hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_400m_cg", 1, 2);
>  	hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_800m_cg", 1, 1);
>  
> -- 
> 2.29.2
> 
