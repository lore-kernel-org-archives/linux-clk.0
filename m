Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CD2C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  4 Mar 2022 08:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234682AbiCDIlZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Mar 2022 03:41:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234783AbiCDIlI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2022 03:41:08 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7351A12BF
        for <linux-clk@vger.kernel.org>; Fri,  4 Mar 2022 00:39:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eo1B9c7HgVCeib/c2FjupHd9KDe4lHxTOJkO5NAN2pObbt7Iw7KPuTCI+dn3T99Y1RkvxPd75avMN30rImGwzHxZiNqzvrqvIcVvxJDuYTBTf9GzutdDL3bchwlZKiupqZKrN/pECftd+bx1yvT9yYQyMBRod+VRtPhIbAAHhWsaAV7E5G8poqaUFflV46I0O2WBiqv+YB/e+vLOOScmjaOru1rC1HQZzAVGNJ6/navvoO1Z5mMtdLxFgL17VB2KZTJ8gogSUwTszex/2zd/FMGA7xxudPS5eOkflS9MqqpY2iPyr/P97cKQcxkQHFd5KO42KAm8g+HC7M2iTDUDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4P3uigAMJ4Bo7B+V4Gi0hdUzPUMnH5uODhLvxRdBJI=;
 b=WftZbUgXeRMe94IqXleLsZ9M6N3PT7wOx7xpZLi87ChGsD9JBX4a+DXmIz/uK4iaA+xygbYzilErlFHy0a6uT4/dct6lvvYDLz0sjlWOl9tbW/rYbGgEYfp1VTeNi6RLzALmFdrLph/UElQFRDzTLZu6gkIUxv1mbUdbmXhe1U9ZXwydHMWWj8XWIsdL2p42LKrpCkHkBUMPc0Hh0ODtU3noKT/C63wTcRO0k9SQxmIq+Oz4sNkeAKWQx+AbnJc+ZY3Vx6biD/tJEx8RLHulg9t8pW2uRH7M22OEabefZWMsa+KY3o/9Vghav7ZD66UXtxm9CcvLpjThuTYvRx7GGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4P3uigAMJ4Bo7B+V4Gi0hdUzPUMnH5uODhLvxRdBJI=;
 b=PMsnpVB7HsBNwOg6fy+CT3iW1sTJ0uvurNJg0VMcA86C1jjWy81smtX31BRGc+V/AsZ/gqk/VJEQaDS4LRKMnjXG1li9VCKvfWmJNw8pVGX6eCmWRPGDpehbaKfceIHhCIFEYTrbM7DHA1NXhHVXhiRO/nqb8Yb+2dbX3q4cw/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 08:39:21 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::98a7:fbac:5cec:776e]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::98a7:fbac:5cec:776e%5]) with mapi id 15.20.5017.026; Fri, 4 Mar 2022
 08:39:21 +0000
Date:   Fri, 4 Mar 2022 10:39:19 +0200
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
Message-ID: <YiHQN3yeRsFqH96I@abelvesa>
References: <20220225082937.2746176-1-s.hauer@pengutronix.de>
 <20220225082937.2746176-9-s.hauer@pengutronix.de>
 <Yhjj8o3vEQy0qysO@abelvesa>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yhjj8o3vEQy0qysO@abelvesa>
X-ClientProxiedBy: VI1P189CA0015.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::28) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d2212bd-2fa0-46f3-00b9-08d9fdba7a6d
X-MS-TrafficTypeDiagnostic: DU2PR04MB8599:EE_
X-Microsoft-Antispam-PRVS: <DU2PR04MB8599CF15958F0A99375387D6F6059@DU2PR04MB8599.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ejENtjeuz5j+cDOdYD54CZp8yALiBIjjn1VRO2nTPitf7bMmKq/W9tWCpBnjOauJVi/f7BkgOZwkU1aVc1ZZL5aGNuj5PGA60Cs+YYptgBGKrwycVyijtfW2Xgsq6Ltc+SpCDzkycNlTGi8XElNjdunrJFoJGS1JVKTOZ2uJ9HvJG8dT2/MJYxLpJEWRGkdirRAPL+L3iXikcvSLQDRjLJHgvdCfxDYw8dSWls5UR1KNi9gYfouUUn5V9GJvphyAd5g648Ho2pf5KPFhDasYxhA7Ln/Tk7+FApHsEIXGYtmlye+9wq7iQR1UAMcrM1tEvFP8+27DWEWzQp9JSGnV+KmKSRHL6qSjhLzEtOxigxl4GIuJRvhUs/WhwhogB86Z6UaxmyJJ1YL7AsGX6ezcAQ/nw16jawqv24gEXH3DaejLTf5TgFDw1pQwFtLrBCuv5aXA0zp6HeXgAnev7fknpQGPH7lcMkGzH14BOd6t679mCf/Q7zZLlOoXXPByg1DXDPyS6VcyDek5yUG+90tOVfmmmYsTm77mFv43Crpw2bSM2lwGeOs4XNmVWMDuiwN0113Ly/Y/q1E7juB36kSc5vxmNeFYyPEdspB0Hrr09MCl7zUYDMgfkQrVrPtMHWh6/DxB3PG7u8jUwf0Br8PXGUZDIbyVnnbeM0lNzeol3Pzab/bG0Fw1qG65VF33f62E7E9uPRu45+d+b36ybp1dVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(26005)(8936002)(186003)(83380400001)(9686003)(2906002)(38350700002)(508600001)(44832011)(6486002)(53546011)(6506007)(52116002)(5660300002)(86362001)(4326008)(8676002)(66476007)(38100700002)(6916009)(33716001)(54906003)(316002)(66946007)(66556008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rti14xvjmAEhcQJTnOQtEk+k3tH/8MmDBjf+Ykw9jokWzH9E41N6LaHtfluz?=
 =?us-ascii?Q?gTa9w/Q3MFffgFHA9raHFXCveKAJeHm/ueCrAMvj6NNUU3H0u9DOOKTdaO3v?=
 =?us-ascii?Q?WK1wdbX0GmQFdVRuTuGevzsznlcXYrLBmaSm9q6FAazFrA3LNShbpF54fOY3?=
 =?us-ascii?Q?g6kM/TMVCb7GqZy2fLIaxSDTAcu2cxvcLgJwslHGeqFmUkVlPPgKeCXrGtsl?=
 =?us-ascii?Q?pYZ16TGjAlkbvZPZYI+THzEkPn3pKr4i0p6Zu8yBqCAuEmAHqqypQBAZZgZr?=
 =?us-ascii?Q?3S9+eVRoB+j86I3qGkT9lhVkWmHq+4f0cQ6Fl1L/7zSQK6tiElyI4qwGBVbW?=
 =?us-ascii?Q?z0qsrsihtPcnTjv4qbUfb5Lp80EoXhWaDXvNtyor748I2zhwSGUbtfXwCu37?=
 =?us-ascii?Q?6OfQKXtqO7VoFKbzcf34UfbIrh19cvknTGrw/PqqME3Het+NbZYWin7K6Flf?=
 =?us-ascii?Q?/zJncHjYPKxK0g324TioyeRwtbOsjQ8JOjctP54LhRQfvOFrefm7EM+CYMyy?=
 =?us-ascii?Q?LjAsFcpLXtL1rfwDpfqUTnGKgo2ARaQLE1VSQf8baMKTn0fGTLXfhCT+fw1A?=
 =?us-ascii?Q?9BhqaoR1G8CLLFXvN1VQMc+xYZ2E65VQjA0CJrI16aqBX3zgur2sRo/Vg7T8?=
 =?us-ascii?Q?F3rTzUdPG1S4BcJWV7iO9RX4xwX/wN5eWamsdA3bmxd6tYauEZrJwnhjaK2O?=
 =?us-ascii?Q?VWiY06wW+rfemYHveejVeWUUCHfjxrWwy84ZAhtTHtLBdvCpaG/NPqCBDSeS?=
 =?us-ascii?Q?QKDQlCcD4qKWoVWKSOhK1WYHztJGvjTMqXOAVbnoEc4hIYkCVT7I2bjLCjrL?=
 =?us-ascii?Q?rbwdhsV8l7zU7xTzWGhqmQAhK+XYFBpF09m55pJCkeuzRYul/LGOLW8KN6N6?=
 =?us-ascii?Q?z/Gtm2rEmb0ziQewR5EdL6cM0+FoGo2RfMzMxH645sXypIu8K8kprLbXdUyZ?=
 =?us-ascii?Q?abRd2+Bp26Yym1cRgwUCS+r/zlfiWVSDPuXccnr9Q+gyga+9obAZIq8CP+97?=
 =?us-ascii?Q?gwb8fhs2iFTsClPQN+Qoy5SEbrRWJwlybf7qIAZIEf3DFaoupvS2PaIC6rlM?=
 =?us-ascii?Q?q4i+fRVz4PG1b2MxvoaTibUat9grD18hGNg3uWDOfQ67tLgTiiQYKKrN8pBM?=
 =?us-ascii?Q?M7TWs/MUxrkLOiPrzYHB6bnqZFJm127tZi1A/0QrwDkFDMrJeicTHj8fwc05?=
 =?us-ascii?Q?SxEe7tqnUOCOccInfybgJtmlPI4Vg8htkipzD7ROXHQgpVzHi/FH9DSOerud?=
 =?us-ascii?Q?g6teyeo9y+rheJn3daj2ADb+TZcb5XHn1Vvm0PsERbOLyQ+QCiP6pdMc/A3e?=
 =?us-ascii?Q?WDdqm7yQ5J9nyXk6brqyZrdOgrk/TCEDz8nNUTI5EuA9nzsWkSE8u4AZWQsv?=
 =?us-ascii?Q?X6/EwytM8lcX/8dvSZy/ST83NaoYIxcZNZNv4seXQyxepuNCaD5LFAF2PmKT?=
 =?us-ascii?Q?Qqvsg1qMd5f0k9+/BOKlU0CJI71lE/VGyb835NUnvX6ofjioQrYvDBCrRkZI?=
 =?us-ascii?Q?NaTRbstu4NPI1yR95FZ8tUHxSD+9sh4Kes0kD/2noy1xrFO/Us0NDByWCIx6?=
 =?us-ascii?Q?HEDItLIfC7IIxjvDR7tUFXkdYbwT07Ymw8r3liy3BEYCz0g2Ac0aWftrWkwH?=
 =?us-ascii?Q?JWEdV6RHUopRT+5MSRlbF8Y=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2212bd-2fa0-46f3-00b9-08d9fdba7a6d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 08:39:21.1219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioMbN7zoRbNZySER+o08bJt9qO9Hralhi5vgJvyhMj55VjcguWBV7JsFjs97swtO3VBr6qeCbZ5njSXod3e18Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8599
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-25 16:13:06, Abel Vesa wrote:
> On 22-02-25 09:29:37, Sascha Hauer wrote:
> > The pll1443x PLL so far only supports rates from a rate table passed
> > during initialization. Calculating PLL settings dynamically helps audio
> > applications to get their desired rates, so support for this is added
> > in this patch.
> > 
> > The strategy to get to the PLL setting for a rate is:
> > 
> > - First try to only adjust kdiv which specifies the fractional part of the PLL.
> >   This setting can be changed without glitches on the output and is therefore
> >   preferred
> > - When that isn't possible then the rate table is searched for suitable rates,
> >   so for standard rates the same settings are used as without this patch
> > - As a last resort the best settings are calculated dynamically
> > 
> > The code in this patch is based on patches from Adrian Alonso <adrian.alonso@nxp.com>
> > and Mads Bligaard Nielsen <bli@bang-olufsen.dk>
> 
> Hmm, I wish this was also possible for SSCG plls.
> 
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  drivers/clk/imx/clk-pll14xx.c | 143 ++++++++++++++++++++++++++++++----
> >  1 file changed, 126 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> > index 646e0ce7d6242..eef0f3b693ed9 100644
> > --- a/drivers/clk/imx/clk-pll14xx.c
> > +++ b/drivers/clk/imx/clk-pll14xx.c
> > @@ -29,6 +29,8 @@
> >  #define PDIV_MASK	GENMASK(9, 4)
> >  #define SDIV_MASK	GENMASK(2, 0)
> >  #define KDIV_MASK	GENMASK(15, 0)
> > +#define KDIV_MIN	SHRT_MIN
> > +#define KDIV_MAX	SHRT_MAX
> >  
> >  #define LOCK_TIMEOUT_US		10000
> >  
> > @@ -113,7 +115,106 @@ static long pll14xx_calc_rate(struct clk_pll14xx *pll, int mdiv, int pdiv,
> >  	return fvco;
> >  }
> >  
> > -static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
> > +static long pll1443x_calc_kdiv(int mdiv, int pdiv, int sdiv,
> > +		unsigned long rate, unsigned long prate)
> > +{
> > +	long kdiv;
> > +
> > +	/* calc kdiv = round(rate * pdiv * 65536 * 2^sdiv / prate) - (mdiv * 65536) */
> > +	kdiv = ((rate * ((pdiv * 65536) << sdiv) + prate / 2) / prate) - (mdiv * 65536);
> > +
> > +	return clamp_t(short, kdiv, KDIV_MIN, KDIV_MAX);
> > +}
> > +
> > +static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rate,
> > +				      unsigned long prate, struct imx_pll14xx_rate_table *t)
> > +{
> > +	u32 pll_div_ctl0, pll_div_ctl1;
> > +	int mdiv, pdiv, sdiv, kdiv;
> > +	long fvco, rate_min, rate_max, dist, best = LONG_MAX;
> > +	const struct imx_pll14xx_rate_table *tt;
> > +
> > +	/*
> > +	 * Fractional PLL constrains:
> > +	 *
> > +	 * a) 6MHz <= prate <= 25MHz
> > +	 * b) 1 <= p <= 63 (1 <= p <= 4 prate = 24MHz)
> > +	 * c) 64 <= m <= 1023
> > +	 * d) 0 <= s <= 6
> > +	 * e) -32768 <= k <= 32767
> > +	 *
> > +	 * fvco = (m * 65536 + k) * prate / (p * 65536)
> > +	 */
> > +
> > +	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
> > +	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
> > +	pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
> > +	sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
> > +	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
> > +
> > +	/* First see if we can get the desired rate by only adjusting kdiv (glitch free) */
> > +	rate_min = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MIN, prate);
> > +	rate_max = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MAX, prate);
> > +
> > +	if (rate >= rate_min && rate <= rate_max) {
> > +		kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
> > +		pr_debug("%s: in=%ld, want=%ld Only adjust kdiv %ld -> %d\n",
> > +			 clk_hw_get_name(&pll->hw), prate, rate,
> > +			 FIELD_GET(KDIV_MASK, pll_div_ctl1), kdiv);
> > +		fvco = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
> > +		t->rate = (unsigned int)fvco;
> > +		t->mdiv = mdiv;
> > +		t->pdiv = pdiv;
> > +		t->sdiv = sdiv;
> > +		t->kdiv = kdiv;
> > +		return;
> > +	}
> > +
> > +	/* Then try if we can get the desired rate from one of the static entries */
> > +	tt = imx_get_pll_settings(pll, rate);
> 
> Shouldn't we try this one first? Maybe we don't need to compute kdiv at
> all.
> 

Ping.

> > +	if (tt) {
> > +		pr_debug("%s: in=%ld, want=%ld, Using PLL setting from table\n",
> > +			 clk_hw_get_name(&pll->hw), prate, rate);
> > +		t->rate = tt->rate;
> > +		t->mdiv = tt->mdiv;
> > +		t->pdiv = tt->pdiv;
> > +		t->sdiv = tt->sdiv;
> > +		t->kdiv = tt->kdiv;
> > +		return;
> > +	}
> > +
> > +	/* Finally calculate best values */
> > +	for (pdiv = 1; pdiv <= 7; pdiv++) {
> > +		for (sdiv = 0; sdiv <= 6; sdiv++) {
> > +			/* calc mdiv = round(rate * pdiv * 2^sdiv) / prate) */
> > +			mdiv = DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), prate);
> > +			mdiv = clamp(mdiv, 64, 1023);
> > +
> > +			kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
> > +			fvco = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
> > +
> > +			/* best match */
> > +			dist = abs((long)rate - (long)fvco);
> > +			if (dist < best) {
> > +				best = dist;
> > +				t->rate = (unsigned int)fvco;
> > +				t->mdiv = mdiv;
> > +				t->pdiv = pdiv;
> > +				t->sdiv = sdiv;
> > +				t->kdiv = kdiv;
> > +
> > +				if (!dist)
> > +					goto found;
> > +			}
> > +		}
> > +	}
> > +found:
> > +	pr_debug("%s: in=%ld, want=%ld got=%d (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
> > +		 clk_hw_get_name(&pll->hw), prate, rate, t->rate, t->pdiv, t->sdiv,
> > +		 t->mdiv, t->kdiv);
> > +}
> > +
> > +static long clk_pll1416x_round_rate(struct clk_hw *hw, unsigned long rate,
> >  			unsigned long *prate)
> >  {
> >  	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
> > @@ -129,6 +230,17 @@ static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
> >  	return rate_table[pll->rate_count - 1].rate;
> >  }
> >  
> > +static long clk_pll1443x_round_rate(struct clk_hw *hw, unsigned long rate,
> > +			unsigned long *prate)
> > +{
> > +	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
> > +	struct imx_pll14xx_rate_table t;
> > +
> > +	imx_pll14xx_calc_settings(pll, rate, *prate, &t);
> > +
> > +	return t.rate;
> > +}
> > +
> >  static unsigned long clk_pll14xx_recalc_rate(struct clk_hw *hw,
> >  						  unsigned long parent_rate)
> >  {
> > @@ -239,25 +351,21 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
> >  				 unsigned long prate)
> >  {
> >  	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
> > -	const struct imx_pll14xx_rate_table *rate;
> > +	struct imx_pll14xx_rate_table rate;
> >  	u32 gnrl_ctl, div_ctl0;
> >  	int ret;
> >  
> > -	rate = imx_get_pll_settings(pll, drate);
> > -	if (!rate) {
> > -		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
> > -			drate, clk_hw_get_name(hw));
> > -		return -EINVAL;
> > -	}
> > +	imx_pll14xx_calc_settings(pll, drate, prate, &rate);
> >  
> >  	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
> >  
> > -	if (!clk_pll14xx_mp_change(rate, div_ctl0)) {
> > +	if (!clk_pll14xx_mp_change(&rate, div_ctl0)) {
> > +		/* only sdiv and/or kdiv changed - no need to RESET PLL */
> >  		div_ctl0 &= ~SDIV_MASK;
> > -		div_ctl0 |= FIELD_PREP(SDIV_MASK, rate->sdiv);
> > +		div_ctl0 |= FIELD_PREP(SDIV_MASK, rate.sdiv);
> >  		writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
> >  
> > -		writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv),
> > +		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
> >  			       pll->base + DIV_CTL1);
> >  
> >  		return 0;
> > @@ -272,11 +380,12 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
> >  	gnrl_ctl |= BYPASS_MASK;
> >  	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
> >  
> > -	div_ctl0 = FIELD_PREP(MDIV_MASK, rate->mdiv) |
> > -		   FIELD_PREP(PDIV_MASK, rate->pdiv) |
> > -		   FIELD_PREP(SDIV_MASK, rate->sdiv);
> > +	div_ctl0 = FIELD_PREP(MDIV_MASK, rate.mdiv) |
> > +		   FIELD_PREP(PDIV_MASK, rate.pdiv) |
> > +		   FIELD_PREP(SDIV_MASK, rate.sdiv);
> >  	writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
> > -	writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv), pll->base + DIV_CTL1);
> > +
> > +	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
> >  
> >  	/*
> >  	 * According to SPEC, t3 - t2 need to be greater than
> > @@ -359,7 +468,7 @@ static const struct clk_ops clk_pll1416x_ops = {
> >  	.unprepare	= clk_pll14xx_unprepare,
> >  	.is_prepared	= clk_pll14xx_is_prepared,
> >  	.recalc_rate	= clk_pll14xx_recalc_rate,
> > -	.round_rate	= clk_pll14xx_round_rate,
> > +	.round_rate	= clk_pll1416x_round_rate,
> >  	.set_rate	= clk_pll1416x_set_rate,
> >  };
> >  
> > @@ -372,7 +481,7 @@ static const struct clk_ops clk_pll1443x_ops = {
> >  	.unprepare	= clk_pll14xx_unprepare,
> >  	.is_prepared	= clk_pll14xx_is_prepared,
> >  	.recalc_rate	= clk_pll14xx_recalc_rate,
> > -	.round_rate	= clk_pll14xx_round_rate,
> > +	.round_rate	= clk_pll1443x_round_rate,
> >  	.set_rate	= clk_pll1443x_set_rate,
> >  };
> >  
> > -- 
> > 2.30.2
> >
