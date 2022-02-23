Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE7DC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 11:35:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239949AbiBWLft (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 06:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239356AbiBWLfd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 06:35:33 -0500
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00085.outbound.protection.outlook.com [40.107.0.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3385292850
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 03:35:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6BPAMbEEld/je8izKL0lTfBm/CtP5+shGPIj9B6/dyEyGXo37JzEQt7RACFKQjQt2ivirskLF64bt4mcwhuCoR8brWdbHZpUjeXp8Adh6rCizFp3L17cVC2jRliZGFzFcH3cpu7DIvJdIU5GKNaNNVf+p/n+ieWeRYjF0XF+IbxZMRzuQsUKq6cvmbl7i2tE8hbYgMNEKRY9j3I4x3aVQtKYEo6iNe36t9zkb9bSUin8OyrFKMh2zkR5i3YxP/dztoFuoY3PkGgzsr7t7w403riNm4g9LoREzvM3o6rqGaCexJr8xUleQcnbJUl0KNWMW/uTl0QbTJP0/WxpGfcfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJN5OQkjfaLlXcdpxnbOOLOd+/8txEzXvejlYKb2axo=;
 b=CGCBM/XwIbqwdvcqADSiYrCPIJl6vMK/2wtYMkoKWSYGfaYCsZYydKK1s3o9PejLjEmkS5rF2FVVl5PuEGuAT2CtA9bYVY9aDmlCe1VXwfAjUDe6AMVxk1syDjZ5hhwjxgHyW8P5PyFmaP3W1KTioWRC8Jgyk6g+WmsTtHIvtJ/3GjdKlWcgs3fbnX6k7/Rm93/kqQV9PBKtl7VtY5xXHnnQ7ltXogJYHU3yhuTDhU/k66nh5gbHSwKEIIqbpsNSt050qPwYzDPSyirz1kbmsrNMrOc/xuladp0NL2dxaioV6f1yHhExc77ZOwMaqHER4MeeDo23RFGVTN6zustPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJN5OQkjfaLlXcdpxnbOOLOd+/8txEzXvejlYKb2axo=;
 b=bructNXNBYZY93Awymk9Il2XFrMjirDNqkgpNO6Np6mnsgz95sDDHJzN2c2K6BLMCZi+AcTA3Zer/2n3spd3mJlLzYfOMTLU+mZIxPfRPFNxcHCrcKOAVcwacojs+yXwoOn6gZ3tJdvc7FiFQxDired4Y5nPRvtTlpTsaSeY/3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 11:35:01 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::2936:6a6f:6e6f:161f]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::2936:6a6f:6e6f:161f%6]) with mapi id 15.20.4995.026; Wed, 23 Feb 2022
 11:35:01 +0000
Date:   Wed, 23 Feb 2022 13:34:59 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adrian Alonso <adrian.alonso@nxp.com>,
        Mads Bligaard Nielsen <bli@bang-olufsen.dk>
Subject: Re: [PATCH 3/8] clk: imx: pll14xx: Use FIELD_GET/FIELD_PREP
Message-ID: <YhYb494fSUHIueic@abelvesa>
References: <20220223075601.3652543-1-s.hauer@pengutronix.de>
 <20220223075601.3652543-4-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223075601.3652543-4-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1P193CA0002.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::12) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2af5b7cc-8602-4d2e-be89-08d9f6c0870e
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_
X-Microsoft-Antispam-PRVS: <DB8PR04MB685868105B9F1ECAF53310E3F63C9@DB8PR04MB6858.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kpQ1Vsh7DoAheBbTm/UBJ5DM+wfYxM1cKETdyXtZtd/t335i4VIfs/0LDnJhyUMgHFoL0ATZUT4muL+NlgThFyamVzxEcMrLmhBpYch5QarF2I+pvyDrdSR03bfHmwoouBSvOo/nzRWJRskwJd1FuxQKp6+WojNfsWjeR/1O709tMTXXlpkm/iitRrQ5SKFFqkDJ55hbnMc/C43Zgo1UxwAzEcrOKk3Ywzf3+R2QIcwCMyZ4AhJBki7ABGDRiHtADGg3tjoa81wVlkyXEuOrGnaDa3lwGBPBBDU8G5qbk+22Q0a5dcTEsvWh/TplCvtooXz23eJ27RblqytGOQf4FjQbzAsRzvkkqQG1IWCiY1T51fH46QaGey2Mgu0NJzenj+aM95iJkxloYxZGOEzxgmNbhNI9P3NRDRO6FHWQCNghBAe2vL5R6sL30HRCgbeUtw7NlW1/mN44kgLvcUJprrW+VniXxtWaCevitr9zDQB0Ls6vByvn+RJC6eIeMK+E0VNBtnUW6TeZAuzeihfr3zaDooUmE36LnBFdSWMqU6/0Ny7I1sI89ZjF/FuoXroCcPq5Xx5Bvxh+m0NHUm8XEd2Fu3Cyfi3eCkw9oUqRbRrxVn7R31qCxHL+KTLAA+hmC7w0qpBGEfu9CKf1fqPtUqDUa0hDS9AW5EKjCXDDNYhwlMYxPRltCKuMksohyNAe9QF0rpF5Lg+v+GJL9vwn6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66946007)(4326008)(508600001)(8676002)(316002)(86362001)(54906003)(6916009)(66476007)(66556008)(5660300002)(6486002)(38100700002)(44832011)(2906002)(38350700002)(8936002)(6506007)(6512007)(9686003)(83380400001)(52116002)(53546011)(33716001)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HfZZHGRyW8Rw11IYu7I/K3Ieqhafh2i9XYDXCtSDAFE0zda3OdD2hLoYlOXE?=
 =?us-ascii?Q?KiPMHAL5ZkTcfnld6uoXn2Nmjv5VXaU5NjOgO/3d1R9p0wrRWKVdj23bism0?=
 =?us-ascii?Q?DlXPQwS7BXtjDZcu1tmekwkhuGsWszAR779g52cAPtPVaSeFZT8V+cWTTfu/?=
 =?us-ascii?Q?a7HM8CdnX5IisDJk7mn++WyB3AdQcUSp7BJ7QdBZsXIEeUoHP/Cmf1ZFyfNs?=
 =?us-ascii?Q?i/LV5ZxNLL84+n8wCpIF3xv/m37Rzxcoi4Yaf98pSKTrFXV/tGS2zEk3Ak+7?=
 =?us-ascii?Q?2S0SMPAdpMAHm1dIy/6mJEVvHueek3B8KL1oIGqduPl50mdDCCmr0dtf/kQL?=
 =?us-ascii?Q?QzUFVRPKOsHMUUJ6kYVHnr5EGhvmYjTIrqb1rm+jrXeZ4q0VGZQkBSUBpBu2?=
 =?us-ascii?Q?EC/OtGyGoZX6Dzgb6qIjj3W3Gff2eU9s5nvMgII7M8UYtQsR4iPo3HUft8Ks?=
 =?us-ascii?Q?Ge8+6StQ67ofryCmRP1Os+2/YHkmZNmSGn752tLfDaNOfsvZtNvVrsAuV0He?=
 =?us-ascii?Q?cNgnqcuGQuFvR+/5dji/fAajwEsO6cugvbyXXSfHU1M0KCunXwq3Fuu5Hjs6?=
 =?us-ascii?Q?WPhyo1XjooB49t0isOh8X5fgY78M4a09gXQAAjLZ+J26c9FRZybFH226+DRX?=
 =?us-ascii?Q?3wv6IwGn1N1T8CgAwaaAdSWRDamkRWg3P/rMFp5u1McsJpZUVSIe546leqxd?=
 =?us-ascii?Q?HsGC4k6LOQiLTyhUb6cKWuDbCI/OEtVnCYamgx38gR2tYiWNEIOhizsqNjXS?=
 =?us-ascii?Q?jQcaIzvCAEb5TS2cuIcH6OIB369jnM71siHFGpGW1/ZGljjEMnyiZE0aNX9l?=
 =?us-ascii?Q?+ENPb8BdGfkbl68azOl/mfeHegn9gCPxQr/FFqHDbC/4P+NR9qdzCZb7It5f?=
 =?us-ascii?Q?oc0OKVOnHMu/zAY5QwLIPTTz3thoOGWWNRtuLojCIJ1hQ9AquQ/crKBGiO/E?=
 =?us-ascii?Q?2vturH62g9VTJvX0luLVXg0wJ972qZ4Rv4PUJszML92M5tqrAkQh07lFGT3R?=
 =?us-ascii?Q?uVeGLcTw8vU9+2ifimk5U6FbuK+r4RI4Z0KqzP5/tl9aJDB9rmz2Dvz/LOjL?=
 =?us-ascii?Q?/40SIZTVVOV+mA7gwBp/Plsd712mKcfTf14exmgI+Ip1GQpib8lXUgdxLxFY?=
 =?us-ascii?Q?ovuR2GBmVwp0jViJyXRXUR3/A986/bBT3C4z1AD/b4YByhBoltocSSbW7JdY?=
 =?us-ascii?Q?KDK+gpxq7oJe13zEBZI1skouRicCNJ2ay55+3pr+sgSKCBvDkOjwlYMfcgOj?=
 =?us-ascii?Q?1Nl5thNGWOgErxFEcw2srBVwX1d9VPzPVM2xkhTKbFv85a6Sr+ts31HgG32J?=
 =?us-ascii?Q?CEqovxYLHAWW1lZuDJJPAZ71kaJ4JDuUcwUYZfxUAOOfF6Ab1D+ddlI/N9QU?=
 =?us-ascii?Q?V5/y+uU6uSoGH5+CTW4cFdTLt2jT5d4JWzFbj4yORJColuYWohbwJ304imIt?=
 =?us-ascii?Q?pGXEZVg3igKmbW/ni/0Yor0q8GkKmgMqdT8CCtnx8m9L1i1nzzv6iRAMMFLX?=
 =?us-ascii?Q?0nqOWfD127cV4FMtoD0Y6rrahIAEfmO4E8sIdD8wDnGaeN+4ndIFDRGahuQn?=
 =?us-ascii?Q?7A4pMny/lJrYlIQCHkx/m+NphBJuD3Difb4YE1gBqP2Oz+hWrreSjvODm+bG?=
 =?us-ascii?Q?DsLPBZp+tPyDQ05ViizMSqI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af5b7cc-8602-4d2e-be89-08d9f6c0870e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 11:35:01.2336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XgweKzItejhHdt7o93MmwxDXme7r/NGMNYAW0u5j/9e3vweffXqP0t1kjqWK+SsLciBs9WyV441benwwdajBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-23 08:55:56, Sascha Hauer wrote:
> Linux has these marvelous FIELD_GET/FIELD_PREP macros for easy access
> to bitfields in registers. Use them and remove the now unused *_SHIFT
> defines.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-pll14xx.c | 39 ++++++++++++++++-------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index b295d8a049009..3852a42b539e9 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -22,13 +22,9 @@
>  #define CLKE_MASK	BIT(11)
>  #define RST_MASK	BIT(9)
>  #define BYPASS_MASK	BIT(4)
> -#define MDIV_SHIFT	12
>  #define MDIV_MASK	GENMASK(21, 12)
> -#define PDIV_SHIFT	4
>  #define PDIV_MASK	GENMASK(9, 4)
> -#define SDIV_SHIFT	0
>  #define SDIV_MASK	GENMASK(2, 0)
> -#define KDIV_SHIFT	0
>  #define KDIV_MASK	GENMASK(15, 0)
>  
>  #define LOCK_TIMEOUT_US		10000
> @@ -124,9 +120,9 @@ static unsigned long clk_pll1416x_recalc_rate(struct clk_hw *hw,
>  	u64 fvco = parent_rate;
>  
>  	pll_div = readl_relaxed(pll->base + DIV_CTL0);
> -	mdiv = (pll_div & MDIV_MASK) >> MDIV_SHIFT;
> -	pdiv = (pll_div & PDIV_MASK) >> PDIV_SHIFT;
> -	sdiv = (pll_div & SDIV_MASK) >> SDIV_SHIFT;
> +	mdiv = FIELD_GET(MDIV_MASK, pll_div);
> +	pdiv = FIELD_GET(PDIV_MASK, pll_div);
> +	sdiv = FIELD_GET(SDIV_MASK, pll_div);
>  
>  	fvco *= mdiv;
>  	do_div(fvco, pdiv << sdiv);
> @@ -144,10 +140,10 @@ static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
>  
>  	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
>  	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
> -	mdiv = (pll_div_ctl0 & MDIV_MASK) >> MDIV_SHIFT;
> -	pdiv = (pll_div_ctl0 & PDIV_MASK) >> PDIV_SHIFT;
> -	sdiv = (pll_div_ctl0 & SDIV_MASK) >> SDIV_SHIFT;
> -	kdiv = pll_div_ctl1 & KDIV_MASK;
> +	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
> +	pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
> +	sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
> +	kdiv = FIELD_GET(KDIV_MASK, pll_div_ctl1);
>  
>  	/* fvco = (m * 65536 + k) * Fin / (p * 65536) */
>  	fvco *= (mdiv * 65536 + kdiv);
> @@ -163,8 +159,8 @@ static inline bool clk_pll14xx_mp_change(const struct imx_pll14xx_rate_table *ra
>  {
>  	u32 old_mdiv, old_pdiv;
>  
> -	old_mdiv = (pll_div & MDIV_MASK) >> MDIV_SHIFT;
> -	old_pdiv = (pll_div & PDIV_MASK) >> PDIV_SHIFT;
> +	old_mdiv = FIELD_GET(MDIV_MASK, pll_div);
> +	old_pdiv = FIELD_GET(PDIV_MASK, pll_div);
>  
>  	return rate->mdiv != old_mdiv || rate->pdiv != old_pdiv;
>  }
> @@ -196,7 +192,7 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
>  
>  	if (!clk_pll14xx_mp_change(rate, tmp)) {
>  		tmp &= ~SDIV_MASK;
> -		tmp |= rate->sdiv << SDIV_SHIFT;
> +		tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
>  		writel_relaxed(tmp, pll->base + DIV_CTL0);
>  
>  		return 0;
> @@ -215,8 +211,8 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
>  	tmp |= BYPASS_MASK;
>  	writel(tmp, pll->base + GNRL_CTL);
>  
> -	div_val = (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
> -		(rate->sdiv << SDIV_SHIFT);
> +	div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) | FIELD_PREP(PDIV_MASK, rate->pdiv) |
> +		FIELD_PREP(SDIV_MASK, rate->sdiv);
>  	writel_relaxed(div_val, pll->base + DIV_CTL0);
>  
>  	/*
> @@ -262,10 +258,10 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  
>  	if (!clk_pll14xx_mp_change(rate, tmp)) {
>  		tmp &= ~SDIV_MASK;
> -		tmp |= rate->sdiv << SDIV_SHIFT;
> +		tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
>  		writel_relaxed(tmp, pll->base + DIV_CTL0);
>  
> -		tmp = rate->kdiv << KDIV_SHIFT;
> +		tmp = FIELD_PREP(KDIV_MASK, rate->kdiv);
>  		writel_relaxed(tmp, pll->base + DIV_CTL1);
>  
>  		return 0;
> @@ -280,10 +276,11 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  	tmp |= BYPASS_MASK;
>  	writel_relaxed(tmp, pll->base + GNRL_CTL);
>  
> -	div_val = (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
> -		(rate->sdiv << SDIV_SHIFT);
> +	div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) |
> +		  FIELD_PREP(PDIV_MASK, rate->pdiv) |
> +		  FIELD_PREP(SDIV_MASK, rate->sdiv);
>  	writel_relaxed(div_val, pll->base + DIV_CTL0);
> -	writel_relaxed(rate->kdiv << KDIV_SHIFT, pll->base + DIV_CTL1);
> +	writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv), pll->base + DIV_CTL1);
>  
>  	/*
>  	 * According to SPEC, t3 - t2 need to be greater than
> -- 
> 2.30.2
>
