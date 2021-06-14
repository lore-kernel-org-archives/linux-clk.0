Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39DCC4743C
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 13:33:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8902561352
	for <linux-clk@archiver.kernel.org>; Mon, 14 Jun 2021 13:33:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhFNNfm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Jun 2021 09:35:42 -0400
Received: from mail-vi1eur05on2084.outbound.protection.outlook.com ([40.107.21.84]:5920
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233287AbhFNNfm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 14 Jun 2021 09:35:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T05uAwR+Z/GIcFFdgYG0lhHx11OwJQk3bb8I7owVGw10A4qjjQxxWeZ7odrBFaCwrdt83ICudOk3A2+8Addjtiq1oEh0uzFf/5QOwkS7rq6v5rMzD4jhBk3pEYW9HMKPpGBgOtFEpJdA+bgoIL7cSyct8iyuVC8P68Uxxa0iyDVYDUvexVyCjt3ozzoy8AcZF17xwNUfEnQtEgykYhqQOp9RK7beUQwAa0W1yOOhSly3QWcEPuaQ1EMSspywzyRgh4JM95rzqKfbR7DrZWEc/XhQkV5kpbM1wjALZlW5T69EDPorYaG1nIpuR9/ID/8WUGh0qcdAj5f4cDjUq2g8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtskwRjjrZ1N0IIEaUPlO9H0VnTklMQyPhDcEZ3ugwQ=;
 b=dyTCfmIdAOFnzKd6u8ohhA5RFPEbxoEQK0IPWP9L2LiQRJ7b7iGW4blI94gb5Jm+EV7/FP1N3sCPuZlwwiN6NKx3PyQExhV43ua4vySkYss5ljDdvvxwXem9PnhMVQy7pnoKFitRPAccO4O5xmlIdf2QjGRhoAVv+yAZak9Qm4nSnkESq2V2ieIJhOOOcFVEyWkerqMRpPW2mrbb+0zi4k+JE/5ruHI1uP9RIhoaLs/UC43qdSrDm4AaXAEhNfzuQkq6odwlq8yOaRc4OViVjQ0OJHDbZ6KL95CNZkdlx8607DS7XOeLyMaI0Yt+N07PPOYaX8mT8g7znCSbZfRmiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtskwRjjrZ1N0IIEaUPlO9H0VnTklMQyPhDcEZ3ugwQ=;
 b=Kgu6TjXB8lYAjqOUuOT8KHFCFnHfpUkIr62fUmM/4MkRc+7nfSpbjnOU2HjIfiwJpGJGuhozZxNPvD1n7IhrFrYZhXH2vRv1JJ9cpnZr+yLKkhpNnIdvMMcwuXFEflS/dguKjmF9dRpEcULPwcwJepPrLsWSycPiZ+Gy3/P5o0I=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8)
 by VI1PR04MB3182.eurprd04.prod.outlook.com (2603:10a6:802:e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.25; Mon, 14 Jun
 2021 13:33:35 +0000
Received: from VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382]) by VI1PR0401MB2559.eurprd04.prod.outlook.com
 ([fe80::49a5:9:d201:2382%6]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 13:33:35 +0000
Date:   Mon, 14 Jun 2021 16:33:33 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH] clk: imx8mq: remove SYS PLL 1/2 clock gates
Message-ID: <YMdarftSzP072hBF@ryzen.lan>
References: <20210528180135.1640876-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528180135.1640876-1-l.stach@pengutronix.de>
X-Originating-IP: [188.27.182.130]
X-ClientProxiedBy: VI1PR06CA0226.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::47) To VI1PR0401MB2559.eurprd04.prod.outlook.com
 (2603:10a6:800:57::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ryzen.lan (188.27.182.130) by VI1PR06CA0226.eurprd06.prod.outlook.com (2603:10a6:802:2c::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 13:33:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c7f134f-d688-4dcf-712c-08d92f3902a8
X-MS-TrafficTypeDiagnostic: VI1PR04MB3182:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB31821565C04D6289F231FC9CF6319@VI1PR04MB3182.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVP6u5zA3XyGZ8RVRfSk68pIRDmoXKI3irzgqB2haFOmTpXrxIQm/j8S9mCg87Y5DoEvmWOFwl5r23iGi2+qG0k1o34VYMiZkyODrzOLh/QihuNxB8DTOgpte79Slrnnsn8KmJs6lTCH1TEUr/YoddcmqCdKW1ByiJ8ZnkVdZEdwS4zYFDla8GRp2B4cQzzbxcKBTKmoPRbYnRj/o+9G3F53yThffKp59KII7RYaDGSXBq+grZvsa93Y/FGrj8MaEBjRIfpkXZp0R35uBHOFAyv7bVIeoPU3n3LmCSnF8mdNrePdNEc5lzOhd+0Luy6og9+EOeWO0IvTwZTWfyl86JcMXP0E8+yirycSR7oMR3CjHmrbxAzFh1ChiTwYKNFwRcREdeWVESG2ht33Ao0ZyrjrETtCWGCTzOKtPFPkjuhDOaz+SbFpBW53YgTts/AZyZFinFK6UZbGb/qATnMP661HIFNQRscTEnRn5895Stc8ZHHm9a9qT0jJoXdphHllB3/s/fqbY22IerrI5IJG6wye9Ek1KHm8uB47KoB96ObV7CJ9srOtHTF19szZ7nC3H65K+6SfSRfmHTPRiF3PHoXnSKGnargsiSxsmW11G7mxN/4JPPn/n/a0oge6eOFJnytGwKJb1Sw9oqOhH+UZD9pI/wDlxnrpgOWAbDWQKezr7C74TDZuXLvhzB6VHUWK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2559.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(346002)(136003)(396003)(316002)(83380400001)(4326008)(8886007)(8676002)(7696005)(26005)(6916009)(478600001)(8936002)(6506007)(186003)(53546011)(16526019)(54906003)(5660300002)(36756003)(956004)(66946007)(9686003)(55016002)(38350700002)(38100700002)(2906002)(86362001)(66476007)(52116002)(44832011)(66556008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ibE3Irmwn4g5vhi006DFU8PzYaXNUvlUZrHlIU9W2uK5lgarNbjn45aTTRz?=
 =?us-ascii?Q?k94ohvhYEwyIG2KfYeKFXSys2pc6gTuJYZDcSSERCYCEkg68V0FldCyvYUp4?=
 =?us-ascii?Q?x3BCNV6t4oRw85n6F6COhoigxiMPgkyoPLIdDV1d0ACVfXoXpMqiy/3qzvh8?=
 =?us-ascii?Q?VVIqpuaNhuDkMw915FNgWJ4kdLqlJNtgejd5UnVEK7ImE9IorrWNo9DqCWLO?=
 =?us-ascii?Q?+22Cf/qVnjivALu8XAHTdrI2T2iKYUz4ZH8PZc1uXBekXtmt2iVcbgw9qSuq?=
 =?us-ascii?Q?MjuZmQLGlGCJ34XC+QbTeSwcBbMUJ1Anl69fC/iJrGfKiIm3oNSNpE3sXZSe?=
 =?us-ascii?Q?Xnib/SaZ4aPXhF2nsYM7ACR3s3ubCxxd04VEN+rrfBrUNLiJqhhS2UW8RV++?=
 =?us-ascii?Q?x1ve4cEDKyv9ibR3P/7g+1OYuQ0d3KCYDn8jcSo3JCfAUEXvHb0V30Cq3egH?=
 =?us-ascii?Q?tMOQKg4E5E/vUPF6xqiVWSTygtNfGbvBWPvDjuLDNi289xdN6R9nC0jMFlbE?=
 =?us-ascii?Q?jluknjzRTyUPSjaieqaz0cPD8g24Jn9H6xqfe2btKms/d2BFK4MjG4HMQwdf?=
 =?us-ascii?Q?d50E5Y5CeJCK9mGSrfjIRSY0skB09R80hVSvkXnBrf4/FHGR0GfDaLigqmm6?=
 =?us-ascii?Q?jnJbKcuWGyR3SXOgj/vBLVTgOEV+/xde25ca81Nk8xF6e0ktRDQRmofiH3PZ?=
 =?us-ascii?Q?Eux6MKcR7SAYjN2NG6iqsbebLN3hhKR0ftMJ12GzzOO0WtM2BazVjJcvrhT3?=
 =?us-ascii?Q?v8a1n8sb9NLb5pLvfr+d0KbcobFe6M3vgeRJImM6hsZx6dgM+pCIru2jDJuz?=
 =?us-ascii?Q?uUf0966dTkCC4Z67nb7UzailPc2ktBADcYrGF63KpIIlaQ4+haiyrt6fenTc?=
 =?us-ascii?Q?3eYI1VaR7OpEV1LgTAjjKoM4MnU3f7qtJDit+nzDjV5qyQrlCZRoalbNOHcC?=
 =?us-ascii?Q?rtWtLe8CjMnkzP/ZSTJv8nlX2J9Gy9LZ1fT2hvQ19kbIjebitZGq3uJfxvtW?=
 =?us-ascii?Q?RNWKvv8c+cGYqCiiX0UxoyV6d9UULOU2iDSOvK0rahiJvhjgfbRbrjHJwft5?=
 =?us-ascii?Q?raEMD9cRqEU/ECdXOmtuH5aT3ulOiAjI1zKouwn3dHYjXSEZ7qRT8SrnkFvi?=
 =?us-ascii?Q?dcCbnESydWj4hnitF6vAHG47g0OKG2GNixwv/v+5R8y/VV+hT4THHCaHaizm?=
 =?us-ascii?Q?Tjtn1W2ASM+JFZV8sBE0qbcNscMrfBpiRLiLku9+heci1zIb+EPpl17ev68u?=
 =?us-ascii?Q?9sCofxiGm4gdhjANxm4kbIKhoD5oKn/wMoUU6Ox/gQfb3n+DxCJBK2W6RqU6?=
 =?us-ascii?Q?gld9kIJ5v1Xv0L1sbyrsG4JD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7f134f-d688-4dcf-712c-08d92f3902a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2559.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 13:33:35.5639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gy1sbucByW0V/W3gURLGPG3riGrEGWuvx4GQV4xR8yYp6bLJn0Nbu7Q3wlO/vWfsvSUwfpWF3c8eKsA4qborZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3182
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-05-28 20:01:35, Lucas Stach wrote:
> Remove the PLL clock gates as the allowing to gate the sys1_pll_266m breaks
> the uSDHC module which is sporadically unable to enumerate devices after
> this change. Also it makes AMP clock management harder with no obvious
> benefit to Linux, so just revert the change.
> 
> Fixes: b04383b6a558 ("clk: imx8mq: Define gates for pll1/2 fixed dividers")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Looks good to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
> Previously this was a more targeted change only reverting the problematic
> bit for uSDHC, but Jacky Bai expressed the desire to just revert the whole
> change, as it makes things harder for AMP use-cases.
> ---
>  drivers/clk/imx/clk-imx8mq.c             | 56 ++++++++----------------
>  include/dt-bindings/clock/imx8mq-clock.h | 19 --------
>  2 files changed, 18 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
> index b08019e1faf9..c491bc9c61ce 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -358,46 +358,26 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MQ_VIDEO2_PLL_OUT] = imx_clk_hw_sscg_pll("video2_pll_out", video2_pll_out_sels, ARRAY_SIZE(video2_pll_out_sels), 0, 0, 0, base + 0x54, 0);
>  
>  	/* SYS PLL1 fixed output */
> -	hws[IMX8MQ_SYS1_PLL_40M_CG] = imx_clk_hw_gate("sys1_pll_40m_cg", "sys1_pll_out", base + 0x30, 9);
> -	hws[IMX8MQ_SYS1_PLL_80M_CG] = imx_clk_hw_gate("sys1_pll_80m_cg", "sys1_pll_out", base + 0x30, 11);
> -	hws[IMX8MQ_SYS1_PLL_100M_CG] = imx_clk_hw_gate("sys1_pll_100m_cg", "sys1_pll_out", base + 0x30, 13);
> -	hws[IMX8MQ_SYS1_PLL_133M_CG] = imx_clk_hw_gate("sys1_pll_133m_cg", "sys1_pll_out", base + 0x30, 15);
> -	hws[IMX8MQ_SYS1_PLL_160M_CG] = imx_clk_hw_gate("sys1_pll_160m_cg", "sys1_pll_out", base + 0x30, 17);
> -	hws[IMX8MQ_SYS1_PLL_200M_CG] = imx_clk_hw_gate("sys1_pll_200m_cg", "sys1_pll_out", base + 0x30, 19);
> -	hws[IMX8MQ_SYS1_PLL_266M_CG] = imx_clk_hw_gate("sys1_pll_266m_cg", "sys1_pll_out", base + 0x30, 21);
> -	hws[IMX8MQ_SYS1_PLL_400M_CG] = imx_clk_hw_gate("sys1_pll_400m_cg", "sys1_pll_out", base + 0x30, 23);
> -	hws[IMX8MQ_SYS1_PLL_800M_CG] = imx_clk_hw_gate("sys1_pll_800m_cg", "sys1_pll_out", base + 0x30, 25);
> -
> -	hws[IMX8MQ_SYS1_PLL_40M] = imx_clk_hw_fixed_factor("sys1_pll_40m", "sys1_pll_40m_cg", 1, 20);
> -	hws[IMX8MQ_SYS1_PLL_80M] = imx_clk_hw_fixed_factor("sys1_pll_80m", "sys1_pll_80m_cg", 1, 10);
> -	hws[IMX8MQ_SYS1_PLL_100M] = imx_clk_hw_fixed_factor("sys1_pll_100m", "sys1_pll_100m_cg", 1, 8);
> -	hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_133m_cg", 1, 6);
> -	hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_160m_cg", 1, 5);
> -	hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_200m_cg", 1, 4);
> -	hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_266m_cg", 1, 3);
> -	hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_400m_cg", 1, 2);
> -	hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_800m_cg", 1, 1);
> +	hws[IMX8MQ_SYS1_PLL_40M] = imx_clk_hw_fixed_factor("sys1_pll_40m", "sys1_pll_out", 1, 20);
> +	hws[IMX8MQ_SYS1_PLL_80M] = imx_clk_hw_fixed_factor("sys1_pll_80m", "sys1_pll_out", 1, 10);
> +	hws[IMX8MQ_SYS1_PLL_100M] = imx_clk_hw_fixed_factor("sys1_pll_100m", "sys1_pll_out", 1, 8);
> +	hws[IMX8MQ_SYS1_PLL_133M] = imx_clk_hw_fixed_factor("sys1_pll_133m", "sys1_pll_out", 1, 6);
> +	hws[IMX8MQ_SYS1_PLL_160M] = imx_clk_hw_fixed_factor("sys1_pll_160m", "sys1_pll_out", 1, 5);
> +	hws[IMX8MQ_SYS1_PLL_200M] = imx_clk_hw_fixed_factor("sys1_pll_200m", "sys1_pll_out", 1, 4);
> +	hws[IMX8MQ_SYS1_PLL_266M] = imx_clk_hw_fixed_factor("sys1_pll_266m", "sys1_pll_out", 1, 3);
> +	hws[IMX8MQ_SYS1_PLL_400M] = imx_clk_hw_fixed_factor("sys1_pll_400m", "sys1_pll_out", 1, 2);
> +	hws[IMX8MQ_SYS1_PLL_800M] = imx_clk_hw_fixed_factor("sys1_pll_800m", "sys1_pll_out", 1, 1);
>  
>  	/* SYS PLL2 fixed output */
> -	hws[IMX8MQ_SYS2_PLL_50M_CG] = imx_clk_hw_gate("sys2_pll_50m_cg", "sys2_pll_out", base + 0x3c, 9);
> -	hws[IMX8MQ_SYS2_PLL_100M_CG] = imx_clk_hw_gate("sys2_pll_100m_cg", "sys2_pll_out", base + 0x3c, 11);
> -	hws[IMX8MQ_SYS2_PLL_125M_CG] = imx_clk_hw_gate("sys2_pll_125m_cg", "sys2_pll_out", base + 0x3c, 13);
> -	hws[IMX8MQ_SYS2_PLL_166M_CG] = imx_clk_hw_gate("sys2_pll_166m_cg", "sys2_pll_out", base + 0x3c, 15);
> -	hws[IMX8MQ_SYS2_PLL_200M_CG] = imx_clk_hw_gate("sys2_pll_200m_cg", "sys2_pll_out", base + 0x3c, 17);
> -	hws[IMX8MQ_SYS2_PLL_250M_CG] = imx_clk_hw_gate("sys2_pll_250m_cg", "sys2_pll_out", base + 0x3c, 19);
> -	hws[IMX8MQ_SYS2_PLL_333M_CG] = imx_clk_hw_gate("sys2_pll_333m_cg", "sys2_pll_out", base + 0x3c, 21);
> -	hws[IMX8MQ_SYS2_PLL_500M_CG] = imx_clk_hw_gate("sys2_pll_500m_cg", "sys2_pll_out", base + 0x3c, 23);
> -	hws[IMX8MQ_SYS2_PLL_1000M_CG] = imx_clk_hw_gate("sys2_pll_1000m_cg", "sys2_pll_out", base + 0x3c, 25);
> -
> -	hws[IMX8MQ_SYS2_PLL_50M] = imx_clk_hw_fixed_factor("sys2_pll_50m", "sys2_pll_50m_cg", 1, 20);
> -	hws[IMX8MQ_SYS2_PLL_100M] = imx_clk_hw_fixed_factor("sys2_pll_100m", "sys2_pll_100m_cg", 1, 10);
> -	hws[IMX8MQ_SYS2_PLL_125M] = imx_clk_hw_fixed_factor("sys2_pll_125m", "sys2_pll_125m_cg", 1, 8);
> -	hws[IMX8MQ_SYS2_PLL_166M] = imx_clk_hw_fixed_factor("sys2_pll_166m", "sys2_pll_166m_cg", 1, 6);
> -	hws[IMX8MQ_SYS2_PLL_200M] = imx_clk_hw_fixed_factor("sys2_pll_200m", "sys2_pll_200m_cg", 1, 5);
> -	hws[IMX8MQ_SYS2_PLL_250M] = imx_clk_hw_fixed_factor("sys2_pll_250m", "sys2_pll_250m_cg", 1, 4);
> -	hws[IMX8MQ_SYS2_PLL_333M] = imx_clk_hw_fixed_factor("sys2_pll_333m", "sys2_pll_333m_cg", 1, 3);
> -	hws[IMX8MQ_SYS2_PLL_500M] = imx_clk_hw_fixed_factor("sys2_pll_500m", "sys2_pll_500m_cg", 1, 2);
> -	hws[IMX8MQ_SYS2_PLL_1000M] = imx_clk_hw_fixed_factor("sys2_pll_1000m", "sys2_pll_1000m_cg", 1, 1);
> +	hws[IMX8MQ_SYS2_PLL_50M] = imx_clk_hw_fixed_factor("sys2_pll_50m", "sys2_pll_out", 1, 20);
> +	hws[IMX8MQ_SYS2_PLL_100M] = imx_clk_hw_fixed_factor("sys2_pll_100m", "sys2_pll_out", 1, 10);
> +	hws[IMX8MQ_SYS2_PLL_125M] = imx_clk_hw_fixed_factor("sys2_pll_125m", "sys2_pll_out", 1, 8);
> +	hws[IMX8MQ_SYS2_PLL_166M] = imx_clk_hw_fixed_factor("sys2_pll_166m", "sys2_pll_out", 1, 6);
> +	hws[IMX8MQ_SYS2_PLL_200M] = imx_clk_hw_fixed_factor("sys2_pll_200m", "sys2_pll_out", 1, 5);
> +	hws[IMX8MQ_SYS2_PLL_250M] = imx_clk_hw_fixed_factor("sys2_pll_250m", "sys2_pll_out", 1, 4);
> +	hws[IMX8MQ_SYS2_PLL_333M] = imx_clk_hw_fixed_factor("sys2_pll_333m", "sys2_pll_out", 1, 3);
> +	hws[IMX8MQ_SYS2_PLL_500M] = imx_clk_hw_fixed_factor("sys2_pll_500m", "sys2_pll_out", 1, 2);
> +	hws[IMX8MQ_SYS2_PLL_1000M] = imx_clk_hw_fixed_factor("sys2_pll_1000m", "sys2_pll_out", 1, 1);
>  
>  	hws[IMX8MQ_CLK_MON_AUDIO_PLL1_DIV] = imx_clk_hw_divider("audio_pll1_out_monitor", "audio_pll1_bypass", base + 0x78, 0, 3);
>  	hws[IMX8MQ_CLK_MON_AUDIO_PLL2_DIV] = imx_clk_hw_divider("audio_pll2_out_monitor", "audio_pll2_bypass", base + 0x78, 4, 3);
> diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
> index 82e907ce7bdd..afa74d7ba100 100644
> --- a/include/dt-bindings/clock/imx8mq-clock.h
> +++ b/include/dt-bindings/clock/imx8mq-clock.h
> @@ -405,25 +405,6 @@
>  
>  #define IMX8MQ_VIDEO2_PLL1_REF_SEL		266
>  
> -#define IMX8MQ_SYS1_PLL_40M_CG			267
> -#define IMX8MQ_SYS1_PLL_80M_CG			268
> -#define IMX8MQ_SYS1_PLL_100M_CG			269
> -#define IMX8MQ_SYS1_PLL_133M_CG			270
> -#define IMX8MQ_SYS1_PLL_160M_CG			271
> -#define IMX8MQ_SYS1_PLL_200M_CG			272
> -#define IMX8MQ_SYS1_PLL_266M_CG			273
> -#define IMX8MQ_SYS1_PLL_400M_CG			274
> -#define IMX8MQ_SYS1_PLL_800M_CG			275
> -#define IMX8MQ_SYS2_PLL_50M_CG			276
> -#define IMX8MQ_SYS2_PLL_100M_CG			277
> -#define IMX8MQ_SYS2_PLL_125M_CG			278
> -#define IMX8MQ_SYS2_PLL_166M_CG			279
> -#define IMX8MQ_SYS2_PLL_200M_CG			280
> -#define IMX8MQ_SYS2_PLL_250M_CG			281
> -#define IMX8MQ_SYS2_PLL_333M_CG			282
> -#define IMX8MQ_SYS2_PLL_500M_CG			283
> -#define IMX8MQ_SYS2_PLL_1000M_CG		284
> -
>  #define IMX8MQ_CLK_GPU_CORE			285
>  #define IMX8MQ_CLK_GPU_SHADER			286
>  #define IMX8MQ_CLK_M4_CORE			287
> -- 
> 2.29.2
> 
