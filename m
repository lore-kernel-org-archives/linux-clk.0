Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A45BC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 14:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235464AbiBYONq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 09:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241667AbiBYONp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 09:13:45 -0500
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20065.outbound.protection.outlook.com [40.107.2.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDEB81903C2
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 06:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZqqrm6QLSjHYiFX7l02GDSYNbwAmLT0Ne1P1/CFOIB9O3BYpCNQzipT2WKpYrXPNnU9drxt59mJTMRQJdV3mqIPdIIQyGSxsa7S/K7/YxTiylm1Lp7JpMhLLflK2rQUoi5PdiTrN77Yzcak3ecuXPD39r7TwMmuPHltPjOJELaK9ZdC5pwaiA+0QpuKE/6qhtuGLzgKs+ADgX0Qftt4VRKvTRdnLciRQuHZwMwUzDz6y4Ozkgy4ttGXhjMnUEFVk2fk/ryTfurYThfillAWv4HDhcJmCE7qXnVNvb4AGW//QNtY/lj63HzyW+lDSf3rVNyt2OFm2A5hl1sBvWkM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqsKgMivD4bANNluT/B/oliH0fBUpLvb4xc418moJxg=;
 b=HV4pn2Jwn65jBWwR8utMd7aMjdqIKAl4WQY42+Vm88THXRN+x0gSdAciiWdfTrFeX2r6PUtNo1wUzoBTANizAJtT77Lxpq6TYeeAbdCYDOkJ04zrGj83c0HENTK6tKm1enk0GQnGmbXdonZgD+T/Zls4mj/Xe07aJwjV8MlVggXnPHNqaaE6h0deK8JeHc1Vz3hQymI611AMr/Y3zDvXv8SJq8/MUXN8mk7AQfFEw3I/K1rA8k39aIVO1SOjB7pILGfJQ1ILjwvS3XhsZhb4FZ/QgAn9eZBcqJDxpEM3FlhQ6dmeUJKMT4kLi0N4t3E8cTkCOTyivA/fUSVujELmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqsKgMivD4bANNluT/B/oliH0fBUpLvb4xc418moJxg=;
 b=L9+sCP1jDQDMCb2f/WQvlXMCai1NNB/H7Op41GwW5colz/NdTJLSpUy0j6XBWTrcA/CWcwm3lE0KOmyZuSsgCrWxJr1kPO/l3ZynLF5sVE4cM1C2Rumvh+HoTRRGlffoGsQmszLyTb19O4OwP2K4R+BTXMpAmLonECLgCWNte/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by DB9PR04MB8234.eurprd04.prod.outlook.com (2603:10a6:10:25d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 14:13:09 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::144c:129e:befa:2602]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::144c:129e:befa:2602%5]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 14:13:09 +0000
Date:   Fri, 25 Feb 2022 16:13:06 +0200
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
Subject: Re: [PATCH v2 8/8] clk: imx: pll14xx: Support dynamic rates
Message-ID: <Yhjj8o3vEQy0qysO@abelvesa>
References: <20220225082937.2746176-1-s.hauer@pengutronix.de>
 <20220225082937.2746176-9-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225082937.2746176-9-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1PR0801CA0067.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::11) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: def9384f-f540-44cb-a55f-08d9f868f357
X-MS-TrafficTypeDiagnostic: DB9PR04MB8234:EE_
X-Microsoft-Antispam-PRVS: <DB9PR04MB82343DA9E9BE2468BD4672C6F63E9@DB9PR04MB8234.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dz7dFOgG32bwkXp6IguEIJ6L6wpzhw4kN/4sEPjy/do/OibaLh7H9SDBr5ok2w/0kxan6RH9f8dYYGhEgwcCcANDMlRp4KMVbbULZuibeZ1ZIXlB6ve9zbENyC/N9uY6UTKnQ7XO61CUG2YO16+Q11qhY+roqSY7XG0ohmH8tdw00nB99auCRc1wrYNuLZouvYowu+uvrYDBpdycp7Dyr0TfoJO0UlvIsDcwyIe6F1czpUnYL5NAX4vDS8AV8x9dyZs3rHMeePpQkQGrILtRCc2OLiqswMdV0ZAycC8AQnarHzPxeAMu1q0lTguj2bYAcNkJqUeIh+vRAqVSb5d1mQIyG3lKXkK3OUywTTYDzTN/t2q2kHD4g3nnNtE0To8Ef/iy/gNEiBk2piiKGnYMoYj7uha8mhQ/AquTPJdlXdVqSOKDBcJ1dEsZjtFS4T5UlEf26qJXBvUCwXMJ/zeMpMaDqmNMyW7whq99cYrTQfuG9k8EMWTrLsVIsXA6lVGbxapH6QlsED9c++wcrM3XDXJwq5rjD4xYdpK/2g3VwX19yPIWbvcNGnEVixLkXH68NDIG928Xh/9ZaMUgztvC1VSSGwAfDr5XeDWgyMDw5vSyVosVY+D2you++S2JTT6C7YeodC3qet1fTCjxq9CtN5muaX3V8uxtf7RRijkR9rHEY9H9XkMZw4eBaugxozCLx1Dc6C5VWQDWpvW0pvkgbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(316002)(2906002)(33716001)(26005)(186003)(38350700002)(66556008)(66476007)(66946007)(38100700002)(53546011)(86362001)(52116002)(5660300002)(6512007)(6506007)(6666004)(4326008)(9686003)(6486002)(508600001)(54906003)(6916009)(8936002)(8676002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dkfC/SJESoqg0u4YR0rxRQSDVUg4romvXChBOmar9fBgfBv9yEZRu5+9nSO9?=
 =?us-ascii?Q?jfMQYPxbFMrhCrcO0n1iBn0sEY8uUoyLALlSp3PNOWc6kxvKFBJzpVwo38GZ?=
 =?us-ascii?Q?J3MfVTxX5oy9EVbRuHbZqUtxosy1q3IyIP6djsIh2vg7+5HI8/DQzwtEpc8u?=
 =?us-ascii?Q?lgbyCaUPSoY9peJiyNONduhPEsxEFU4KtmdY0zBrBrgqRJ54PbGhhFZC9g0r?=
 =?us-ascii?Q?/+7G5k/4VGAWFcXFqRKsP5urUwa+fvQOLQmcvSVcNzGcgg/26vXN5IFxvEa+?=
 =?us-ascii?Q?pCCuvczAPvX1O5paM3p1+pMrnKaUyxkGTq1NAWaOre5Tkz6JjnFeOlKeFiqT?=
 =?us-ascii?Q?1CVcxl+WvtA4pyMqXzUAqwp10oJoegxDnWFamxpG5Y/xtJtY9vCB5+y2bJyT?=
 =?us-ascii?Q?zPriasHMBV071nilgdBOax1bBSs9nYQiYwcdm6eHxU5P+6EvPAxGbwi03rpp?=
 =?us-ascii?Q?9nZIkPh98842+g3qUtxXaTOklTicw0+jfM/zHBSyfB4fDXyl38SUoL8iYCjj?=
 =?us-ascii?Q?0j0VrftZBC4p+dbc9yl1mOXNqtbKF4LAKDNWQKmw9e0z9uOomvSaDWvJbxhP?=
 =?us-ascii?Q?+8CLNaOzs+oeshxCSD96eyjURDguP1kCDGWnGaqJmkZGkungnT2elymOFTrq?=
 =?us-ascii?Q?jr7pZqGgNNox/IzCXo0WvAPNgCEJYkzA7UwqeVANP6r5P3LRflAcEpxw0cZm?=
 =?us-ascii?Q?oCndLBHS9fa6rGN4GSQfINo10XuL7Plk8Ay1/wSCJYn/XgNRwSYtEFTv0hQl?=
 =?us-ascii?Q?xGRK2NV+OAfXjYMydWJ2tLXlwBxg9B6QrTVsKLgonsgxXmXS2/iKdfrkj8+M?=
 =?us-ascii?Q?E2CvjEVRWDBRMR//al6Lkh+o8qOeFUspiqjwK5PLWAlLLeXInuNUU/WStZo2?=
 =?us-ascii?Q?y3Hgv72MF6MHG2f2+6BEDuEgEMs5ZThy4/+oTJNDFHr7/EQvpA7n592piG0g?=
 =?us-ascii?Q?4YxNSMGja32/csbpIk/tC+e4adNhF+QrL/9yVlDG1keI0Ia2KCx3m5gpshmk?=
 =?us-ascii?Q?U2TClMSmNgZMF0g4DlQKRPAWmszEO6M1R8/9PvhPl44Y4RPJsJZ1uKf986oe?=
 =?us-ascii?Q?Z7Js3p7Jp7Icudo7g7w3SytKnqONwDJKFxLmQb1nlJF9OXb+IF2l5594lcwC?=
 =?us-ascii?Q?suG448VmR+TUgisu42y6v56e+DvoKDMkUEli2fFUBmw6MYG4vYDb2bGrxxvi?=
 =?us-ascii?Q?LnheelORe2s0OJsI1IO/5DqEmYwNzobbogdf0p93rAv27dfMbH7jYUrVC/Du?=
 =?us-ascii?Q?B9XEZ6uKg8UybZFMHbGIRnqGiQvNt0EGMP5JdzbTkH/it8/p/WfkYKO+x9U5?=
 =?us-ascii?Q?kXGweHo5bFHORDKFyNNc3ck+UyU1RFyyK4XhMjpeU07RubbTyDCjYwi0VMV7?=
 =?us-ascii?Q?j4AuCgGxqcOKlq1benYe1k1q0jTlT2nYn4hne3f62nI3oRoVTJiaX6+aBmI5?=
 =?us-ascii?Q?klq8HEskgJ3LAnqNRlPDr55Uvm63F2K3iGvq5QbYtnygqPOeVmGnv16TWofF?=
 =?us-ascii?Q?qozLvbKEx9N/2eLFVbHwojKanprRa+9/abBvpGiFJku26oB1p1eXzzEssMGY?=
 =?us-ascii?Q?/UwfxIoE0mPmHm7qZd2T1K/fiO8y1OyANk8Np/QW34Uzjz9mGbuhKZlhE6FF?=
 =?us-ascii?Q?lpvz0rMx0yJNWaznf0PziE8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def9384f-f540-44cb-a55f-08d9f868f357
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 14:13:09.4874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLKjOqeMywvGPQJYQHiYaU9OB3ec/4Z1wVFpgjqvAWYZJaBBpQxya6h4OoVptltYnH/qzs7sDBv3yY/XOxq3IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8234
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-25 09:29:37, Sascha Hauer wrote:
> The pll1443x PLL so far only supports rates from a rate table passed
> during initialization. Calculating PLL settings dynamically helps audio
> applications to get their desired rates, so support for this is added
> in this patch.
> 
> The strategy to get to the PLL setting for a rate is:
> 
> - First try to only adjust kdiv which specifies the fractional part of the PLL.
>   This setting can be changed without glitches on the output and is therefore
>   preferred
> - When that isn't possible then the rate table is searched for suitable rates,
>   so for standard rates the same settings are used as without this patch
> - As a last resort the best settings are calculated dynamically
> 
> The code in this patch is based on patches from Adrian Alonso <adrian.alonso@nxp.com>
> and Mads Bligaard Nielsen <bli@bang-olufsen.dk>

Hmm, I wish this was also possible for SSCG plls.

> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/clk/imx/clk-pll14xx.c | 143 ++++++++++++++++++++++++++++++----
>  1 file changed, 126 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 646e0ce7d6242..eef0f3b693ed9 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -29,6 +29,8 @@
>  #define PDIV_MASK	GENMASK(9, 4)
>  #define SDIV_MASK	GENMASK(2, 0)
>  #define KDIV_MASK	GENMASK(15, 0)
> +#define KDIV_MIN	SHRT_MIN
> +#define KDIV_MAX	SHRT_MAX
>  
>  #define LOCK_TIMEOUT_US		10000
>  
> @@ -113,7 +115,106 @@ static long pll14xx_calc_rate(struct clk_pll14xx *pll, int mdiv, int pdiv,
>  	return fvco;
>  }
>  
> -static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
> +static long pll1443x_calc_kdiv(int mdiv, int pdiv, int sdiv,
> +		unsigned long rate, unsigned long prate)
> +{
> +	long kdiv;
> +
> +	/* calc kdiv = round(rate * pdiv * 65536 * 2^sdiv / prate) - (mdiv * 65536) */
> +	kdiv = ((rate * ((pdiv * 65536) << sdiv) + prate / 2) / prate) - (mdiv * 65536);
> +
> +	return clamp_t(short, kdiv, KDIV_MIN, KDIV_MAX);
> +}
> +
> +static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rate,
> +				      unsigned long prate, struct imx_pll14xx_rate_table *t)
> +{
> +	u32 pll_div_ctl0, pll_div_ctl1;
> +	int mdiv, pdiv, sdiv, kdiv;
> +	long fvco, rate_min, rate_max, dist, best = LONG_MAX;
> +	const struct imx_pll14xx_rate_table *tt;
> +
> +	/*
> +	 * Fractional PLL constrains:
> +	 *
> +	 * a) 6MHz <= prate <= 25MHz
> +	 * b) 1 <= p <= 63 (1 <= p <= 4 prate = 24MHz)
> +	 * c) 64 <= m <= 1023
> +	 * d) 0 <= s <= 6
> +	 * e) -32768 <= k <= 32767
> +	 *
> +	 * fvco = (m * 65536 + k) * prate / (p * 65536)
> +	 */
> +
> +	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
> +	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
> +	pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
> +	sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
> +	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
> +
> +	/* First see if we can get the desired rate by only adjusting kdiv (glitch free) */
> +	rate_min = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MIN, prate);
> +	rate_max = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MAX, prate);
> +
> +	if (rate >= rate_min && rate <= rate_max) {
> +		kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
> +		pr_debug("%s: in=%ld, want=%ld Only adjust kdiv %ld -> %d\n",
> +			 clk_hw_get_name(&pll->hw), prate, rate,
> +			 FIELD_GET(KDIV_MASK, pll_div_ctl1), kdiv);
> +		fvco = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
> +		t->rate = (unsigned int)fvco;
> +		t->mdiv = mdiv;
> +		t->pdiv = pdiv;
> +		t->sdiv = sdiv;
> +		t->kdiv = kdiv;
> +		return;
> +	}
> +
> +	/* Then try if we can get the desired rate from one of the static entries */
> +	tt = imx_get_pll_settings(pll, rate);

Shouldn't we try this one first? Maybe we don't need to compute kdiv at
all.

> +	if (tt) {
> +		pr_debug("%s: in=%ld, want=%ld, Using PLL setting from table\n",
> +			 clk_hw_get_name(&pll->hw), prate, rate);
> +		t->rate = tt->rate;
> +		t->mdiv = tt->mdiv;
> +		t->pdiv = tt->pdiv;
> +		t->sdiv = tt->sdiv;
> +		t->kdiv = tt->kdiv;
> +		return;
> +	}
> +
> +	/* Finally calculate best values */
> +	for (pdiv = 1; pdiv <= 7; pdiv++) {
> +		for (sdiv = 0; sdiv <= 6; sdiv++) {
> +			/* calc mdiv = round(rate * pdiv * 2^sdiv) / prate) */
> +			mdiv = DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), prate);
> +			mdiv = clamp(mdiv, 64, 1023);
> +
> +			kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
> +			fvco = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
> +
> +			/* best match */
> +			dist = abs((long)rate - (long)fvco);
> +			if (dist < best) {
> +				best = dist;
> +				t->rate = (unsigned int)fvco;
> +				t->mdiv = mdiv;
> +				t->pdiv = pdiv;
> +				t->sdiv = sdiv;
> +				t->kdiv = kdiv;
> +
> +				if (!dist)
> +					goto found;
> +			}
> +		}
> +	}
> +found:
> +	pr_debug("%s: in=%ld, want=%ld got=%d (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
> +		 clk_hw_get_name(&pll->hw), prate, rate, t->rate, t->pdiv, t->sdiv,
> +		 t->mdiv, t->kdiv);
> +}
> +
> +static long clk_pll1416x_round_rate(struct clk_hw *hw, unsigned long rate,
>  			unsigned long *prate)
>  {
>  	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
> @@ -129,6 +230,17 @@ static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
>  	return rate_table[pll->rate_count - 1].rate;
>  }
>  
> +static long clk_pll1443x_round_rate(struct clk_hw *hw, unsigned long rate,
> +			unsigned long *prate)
> +{
> +	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
> +	struct imx_pll14xx_rate_table t;
> +
> +	imx_pll14xx_calc_settings(pll, rate, *prate, &t);
> +
> +	return t.rate;
> +}
> +
>  static unsigned long clk_pll14xx_recalc_rate(struct clk_hw *hw,
>  						  unsigned long parent_rate)
>  {
> @@ -239,25 +351,21 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  				 unsigned long prate)
>  {
>  	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
> -	const struct imx_pll14xx_rate_table *rate;
> +	struct imx_pll14xx_rate_table rate;
>  	u32 gnrl_ctl, div_ctl0;
>  	int ret;
>  
> -	rate = imx_get_pll_settings(pll, drate);
> -	if (!rate) {
> -		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
> -			drate, clk_hw_get_name(hw));
> -		return -EINVAL;
> -	}
> +	imx_pll14xx_calc_settings(pll, drate, prate, &rate);
>  
>  	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
>  
> -	if (!clk_pll14xx_mp_change(rate, div_ctl0)) {
> +	if (!clk_pll14xx_mp_change(&rate, div_ctl0)) {
> +		/* only sdiv and/or kdiv changed - no need to RESET PLL */
>  		div_ctl0 &= ~SDIV_MASK;
> -		div_ctl0 |= FIELD_PREP(SDIV_MASK, rate->sdiv);
> +		div_ctl0 |= FIELD_PREP(SDIV_MASK, rate.sdiv);
>  		writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
>  
> -		writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv),
> +		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
>  			       pll->base + DIV_CTL1);
>  
>  		return 0;
> @@ -272,11 +380,12 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  	gnrl_ctl |= BYPASS_MASK;
>  	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
>  
> -	div_ctl0 = FIELD_PREP(MDIV_MASK, rate->mdiv) |
> -		   FIELD_PREP(PDIV_MASK, rate->pdiv) |
> -		   FIELD_PREP(SDIV_MASK, rate->sdiv);
> +	div_ctl0 = FIELD_PREP(MDIV_MASK, rate.mdiv) |
> +		   FIELD_PREP(PDIV_MASK, rate.pdiv) |
> +		   FIELD_PREP(SDIV_MASK, rate.sdiv);
>  	writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
> -	writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv), pll->base + DIV_CTL1);
> +
> +	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
>  
>  	/*
>  	 * According to SPEC, t3 - t2 need to be greater than
> @@ -359,7 +468,7 @@ static const struct clk_ops clk_pll1416x_ops = {
>  	.unprepare	= clk_pll14xx_unprepare,
>  	.is_prepared	= clk_pll14xx_is_prepared,
>  	.recalc_rate	= clk_pll14xx_recalc_rate,
> -	.round_rate	= clk_pll14xx_round_rate,
> +	.round_rate	= clk_pll1416x_round_rate,
>  	.set_rate	= clk_pll1416x_set_rate,
>  };
>  
> @@ -372,7 +481,7 @@ static const struct clk_ops clk_pll1443x_ops = {
>  	.unprepare	= clk_pll14xx_unprepare,
>  	.is_prepared	= clk_pll14xx_is_prepared,
>  	.recalc_rate	= clk_pll14xx_recalc_rate,
> -	.round_rate	= clk_pll14xx_round_rate,
> +	.round_rate	= clk_pll1443x_round_rate,
>  	.set_rate	= clk_pll1443x_set_rate,
>  };
>  
> -- 
> 2.30.2
>
