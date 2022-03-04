Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9F1C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  4 Mar 2022 13:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbiCDNCT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Mar 2022 08:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbiCDNCS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2022 08:02:18 -0500
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20082.outbound.protection.outlook.com [40.107.2.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBE21965E5
        for <linux-clk@vger.kernel.org>; Fri,  4 Mar 2022 05:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn4iWdBz2N+dgNzU4Q8b5KdrMWoxvjKUUfHtFn8dgn8KHcGwAFkKwvSxQ7jAIZW6ugzfiTAY25dL6cnlw8wvEsxCxgU2J4nk0F6PLM5eE02JPz5Ed1Vrtb+ADTyBr4Fjln+Ff/ARQdzsLxLYSdptOelu/ddj72km3PtS974zFpGfmFZ2xxSYdJEUO9XRMvUGhFnx9UThvJOVfTEsyfbE/66wlm/1z8c4seCIYThAeXPvKwO4Lx1V+l/qJN6ysU4ejQM+t0/KvNlcZOrSGLFu1G8RCu5izJReRaX1jrxu4fr3yHfUIB9W36EmTFhz1nsxcORN+RTmFh2Swps/fUEmVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRx4hmpRgLBhK5eayhbbV7ZkFcXO5ZbygzcHwM0D4zo=;
 b=FEzCWQvdITaJMSKNnAK2UfA06Ng7r8gl55kvKjStOW1yFjRaz0Itcq/I4AN2kGETifHNqe5cF4XIDOCAWFyvPihuDTlp8kkiq7ok38wRpafRXMdepeN1rSlHb/cYv8QCqU7scRhh6gajPe8yDKMHsm2hdiw9dg6eU4fCgXh9Xjg76rBcsD+0QBV5LDN+f2OUSX47U7Rfftq56Z1kFPpCJ+PEp0kA8cSq0FZS1adqtwGKcmJ2S89BtPLrzZMo5mvK1EeD2VPDKDW5O2NMgb+bVmlm65FnpkgERts8w8+DB7UnF1LKGZ2DhW0LvdIr/8HLccqqTz4AoSWZGMw8xbqNMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRx4hmpRgLBhK5eayhbbV7ZkFcXO5ZbygzcHwM0D4zo=;
 b=UsnQQsw5WCjS7V5RomIXWkh/mwfeacAgBM/hwQu6YQMuM0ghQmsUFCYSCj0Y1vnwXcujyijBRyxPQ2MwlZuWHd45FtOY1y3JIfz+adddzIw0Dz0Z+KHq1UlJ+kfX4eSzpCIGcb2ghOjGUXOK6p8tSdwzDXbm0LVAxbiS+X5mKXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by AM9PR04MB7635.eurprd04.prod.outlook.com (2603:10a6:20b:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 13:01:26 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::98a7:fbac:5cec:776e]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::98a7:fbac:5cec:776e%5]) with mapi id 15.20.5017.026; Fri, 4 Mar 2022
 13:01:26 +0000
Date:   Fri, 4 Mar 2022 15:01:23 +0200
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
Subject: Re: [PATCH v3 8/8] clk: imx: pll14xx: Support dynamic rates
Message-ID: <YiINo4u/YryWGMTe@abelvesa>
References: <20220304125256.2125023-1-s.hauer@pengutronix.de>
 <20220304125256.2125023-9-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304125256.2125023-9-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1PR0701CA0070.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::32) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 400f0b4b-c18c-4f04-e673-08d9fddf179a
X-MS-TrafficTypeDiagnostic: AM9PR04MB7635:EE_
X-Microsoft-Antispam-PRVS: <AM9PR04MB76353E6EC0FFC3EA1BD011EEF6059@AM9PR04MB7635.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uW84uUCRLyqkIGknB/mUY0PHBZgxHU0meV0Ivqipfksf72XjoNOeqEPWzMwPDSjNGNVFx+GIMzZ0GHB8/0wgEjWzHTiASdPYBtgRICxPGvfET8uXXF0oPPNk9QxSwJjYvcW8b2DuyypByDTHnArEDOaDPKuGW4mIX9pS0FgbiQXto6TarOFM8+S9Oe+eM5z4U8k9WQQOJMqb7Rx9ux+OxWOsMrrf7Tv1Ttf8httmUB5JZ9OLf/jUP2moH7iI8vfSATFcsph2bTlOqqZ6EvwaPSHHyyaLpAAK9uSbo/bT9lC0cM0uVBQ9gN3bC1+Pi/NB3hIdpCmBEZ8FuFkWv6zhw1n+LhlUeNl15cC72VgU/oBOaWQFySf8aU7Hi+s8VGkY8a2AzEAnLgNjeSWTW7IidjJXxMJe036zivQK8KKl5la27ff4ib3160peWqzrR6sq9MA2TX8ZaQNI/8qnqqL/AcZDKfIv8HPO05IzLN89Eieq/DNO+c0udoYBgm2oH7/YYmJNgiwk1MBrVeW/TJ44tb3Abi8dAsyyVKuB/eWJ5i0Pw9RpdXZ0T8ZvzkTRm6comVVVXI58ay1tYjjENjlepEw2zvb77dvSlLnqMcfSTYpTr5sdTv7owMq89ExTlsuDjnStFgMxh1xKSn6jbraeW4U9VZo079Zkkccp531henXxsG/wln/jgTkRa6BMI/C8oBvLrlzCguY7uNn8CWeDfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(26005)(5660300002)(33716001)(86362001)(8676002)(186003)(38100700002)(83380400001)(54906003)(6486002)(8936002)(44832011)(38350700002)(2906002)(508600001)(316002)(6916009)(6512007)(4326008)(53546011)(66476007)(66556008)(52116002)(6666004)(6506007)(66946007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7/Czi3v5dG3IxHKWqlXBwx7Ddq79hO+BGtrfawzudaw2zbEVYsJOVZaO5BU4?=
 =?us-ascii?Q?PkJqa8sxyOkYQoaklj1yQrA5pJ73vunR2MnIrYqO4ezFhPBn2obf4jl/D+TM?=
 =?us-ascii?Q?1Dlun2zQ8TCwQ/VTf0PvlNFa+7l5LbUtrafUdEC4JdhrXnKeN/4Xfd7gmvvo?=
 =?us-ascii?Q?XmsO4giftxivjAbEgXWaMiKHNSIF9OXZWFM4pf/B5IX4e6nDTeeofGVwogNO?=
 =?us-ascii?Q?ReslA5wxy6koijwsibhhBgGM+Mu0akCXtArgt88t+xutvkA/PcQdMXIJOlPr?=
 =?us-ascii?Q?2jgJcHrYbXXF58C5AjqfXSuJTmbYgZ/b/SqstyOLntzlWszblW4+qRojFcIB?=
 =?us-ascii?Q?dkieGkw+ILobZ/JAUZ9SlFBHSKFFpyElpy9Sl2bnXA1x+fvxACi9ER0zBpNQ?=
 =?us-ascii?Q?KcsznqtfEmz3AWBfBVZwkSLNiMhD+3AxzeVyIBXriAMzxMy0w5FkLQx/uciY?=
 =?us-ascii?Q?Km05ky+mNGKCWPrwZ8QUZaWt73CavfR82smv1OHCrf2nT7KHYcg3+yXOuwR4?=
 =?us-ascii?Q?rbu8t3/GWIqlFajv5uWHHgLw9yBO7MsxRJEy/3eqFkN6NcR6wHiNBNJX70ra?=
 =?us-ascii?Q?9KasXL1jA2Vo/rcmnCNkodwOZIGzTnDVcPR0BB02/qkIoR5aOq7G1cRSEP6z?=
 =?us-ascii?Q?lsM91dni4V0kZLITNz5WLN+VxgtpvrZwBJcj7veyAwrI8/ZV4fySs+gXRbGf?=
 =?us-ascii?Q?+05OBCFhqmQDnVbY+vsai1cJlKIn7HGyjSyfxF/888GpJh2dZG/rXjb5qZ+t?=
 =?us-ascii?Q?zpjBWr30qgENoXtVL8INUxLX8x0bYX3oQui6xj/YWQfG4v1enwxqisTf2E+a?=
 =?us-ascii?Q?A5sFQy4Sk3z+N0Ne/i0WMJfVE+tcdMfYrOsJCNAZCEsxtXxvgo4Bw8gAkvI3?=
 =?us-ascii?Q?YHstIq7SY3UzIoau6AOfuQand3s1Y4SVSU71w3WknYQvLfnNwa5HGqunc8KV?=
 =?us-ascii?Q?vgoJMXbDZPPIYbJ0VZ7IGb12kQHTPCQtm2BbCanu/hJt+8TQfFKRf3TVyAAX?=
 =?us-ascii?Q?5ZDneziXow3J3VPjqxNaftwS99h19/urv4iQHKC5SICjZfOR4CQrhLwyGqv2?=
 =?us-ascii?Q?nIS5KT9m64h2b5GtM26PcTuoaAMOkwnl/L8NxtJTmNLlDrv+FVnQT3roW0VQ?=
 =?us-ascii?Q?lAxsyy28fkfY4Ms4bGGehvjyrxcS0hFOII298FkQgcvuokuj/QfWj8HzsCq8?=
 =?us-ascii?Q?5usnAPpGCohk8jl+abofXdb8YEXtR71kA28BbgvJLJaKhADND3rsZ+yIhwGh?=
 =?us-ascii?Q?YQB9LQ5aNutknjshNRdi7oetZWvRZgwSBNfeu85/XLvzR815hrpgozm4c3e2?=
 =?us-ascii?Q?5suOZLggrXQDpgRGU3Ev7+kWgdfVTzXMbmGLAwtOaUjrZIZ9rwkldnGTIKFd?=
 =?us-ascii?Q?CGFUFIr/hxBE0D0tNTbLBMGv0aK46fZ0A1azZnMwUsS/j4v/dNfxAyK4afJw?=
 =?us-ascii?Q?Lq+fJtIe8qyFcFVWb+W9PUkIU5z+RGO8EME73wHBDFC0MPtxCaeSkbB0eEAy?=
 =?us-ascii?Q?Q7RugIMm+ZALmcagofRxhylyk3naV7JHIoNZbiQUwaXunEfQSeC5vGZvX5L2?=
 =?us-ascii?Q?acKEHavAnLGrVvviliC0V7qNTeLRJ97D6NFzvJUZ1HzCB+rnj15xDsdfefwC?=
 =?us-ascii?Q?prIeHFTaR41/O+/8jccMz2I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400f0b4b-c18c-4f04-e673-08d9fddf179a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 13:01:26.6447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2Mg3eVX7P5NafFYmYEOta2yqpPNzC+N3odI5rWvTcvBJndU6YHFtVVcb2aX/4h+mhkEKdkbVnT7EtC+U4rLHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7635
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-03-04 13:52:56, Sascha Hauer wrote:
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
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

Thanks.

> ---
> 
> Notes:
>     Changes since v2:
>     - Look for rate in table before doing other calculations
> 
>  drivers/clk/imx/clk-pll14xx.c | 143 ++++++++++++++++++++++++++++++----
>  1 file changed, 126 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 646e0ce7d6242..1d0f79e9c3467 100644
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
> +	/* First try if we can get the desired rate from one of the static entries */
> +	tt = imx_get_pll_settings(pll, rate);
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
> +	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
> +	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
> +	pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
> +	sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
> +	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
> +
> +	/* Then see if we can get the desired rate by only adjusting kdiv (glitch free) */
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
