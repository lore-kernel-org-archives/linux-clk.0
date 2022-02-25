Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1F2C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 13:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236229AbiBYN0R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 08:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240999AbiBYN0I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 08:26:08 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50063.outbound.protection.outlook.com [40.107.5.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54214223100
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 05:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iO6C8KNGRulGJxI4lkRl9Z1y1y0vwu2mX234gbqoXrsLMnJ5wL5VFbyuoM5HU+WdynPqYR4b1f+kRVFi1tleCVXZsmGyMU2wQF/cF595aj5sgbLctPoHQ2VnzgsH9c1nZi7GDGjxlW2rPJTJgDpMPXjeEDZ+1ZCiazE7bLXI68iVl3lSSpaUv6/uNIJD8HAJdEkfb/tzWYHt2J5JSey22rhJXr7cAKSGPAjkKJxMcBq65Fi3YrDteme8sHTpnLbS7lGXz8KZsHU2G3a4cQPDJ/ocsYG4erH5hnW9jeqdgRRqyjJOUdkjVntUld27GsJfJCaKOqI0rnWAHO3AjCD2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2aAR4UfqQSlAOEsKchppQLxoANkfwF8F8Ie7CEgfUY=;
 b=D/vUq6rq+FUZEKO0DW7Dhz2CQdz1Afrv74vGcQ/OrLvrl31vbdrcie/XpunqP3JosKyB3AEwmOGXlJaXABnrQJawnhhBp5FDuXTn1l71STZHRUNPKqFDDP8mbvZ0ej40PHfDHxekNN8e3b0xDxFD4d2N2YUyZuWfBMoMgQaDo1vsMtpJuy26cT0QzSfzMuOLcBBeWUcvlzsOoEmPw65JKKjx1z+eDZT14kYS36M4N3nNHo9o6JZPAoZxhSvItvGZFHQ2HsAT2znLyzuhkIbXOkV1R+bAAoPY8N4iksMCX+GOGowJ17bbe2O9j8w/LCd93lpmBl9ZRPPdPwPEp7Glvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2aAR4UfqQSlAOEsKchppQLxoANkfwF8F8Ie7CEgfUY=;
 b=j4TMxn0wIdMtItzUrnERzK5bGHuPaV3b1F5EHjzDogcqfE/n8iRy6My+IyoUr/dSnjmhsKeLofVSqCEx8e/hby4uatvSTkgFt1986mAnG3ZSOg96TMrN9NNHTj8io6GKs+r2Jr7DKyScz3AqO2c9ggNl6nI1v+nULCk2SOtgMEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by AM6PR04MB6661.eurprd04.prod.outlook.com (2603:10a6:20b:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 13:25:33 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::144c:129e:befa:2602]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::144c:129e:befa:2602%5]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 13:25:33 +0000
Date:   Fri, 25 Feb 2022 15:25:31 +0200
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
Subject: Re: [PATCH v2 5/8] clk: imx: pll14xx: name variables after usage
Message-ID: <YhjYy+cl35kMz/o6@abelvesa>
References: <20220225082937.2746176-1-s.hauer@pengutronix.de>
 <20220225082937.2746176-6-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225082937.2746176-6-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1PR08CA0183.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::13) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1097149b-0edd-46b2-4a77-08d9f8624d03
X-MS-TrafficTypeDiagnostic: AM6PR04MB6661:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB6661AF6C68A632CE6206DA84F63E9@AM6PR04MB6661.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92IG6OeJkQftdCz8I1vXGWd0JDsWxhfnCrp34ZrIXa0v3xQHLxY9dB3ze5GVm8H5T6isOuGfdmPBGBTW9bTxelYSqn4cYjFCVdCEE/vRPCWW8wWUXlGFTtprAB6eBIVdWaY9NBx/VdTNS9FV1NFSVII7j54tJZNYFXsSk6hWDyJiBF9K6v+mAxK490UcTKrNqbhfyihu57lSnF1lOE2AP86JL0rqVG5f8wAqb7jRhKJ/0++rJXSc5EBncUjFzehcXbFQ2zD4rK73ptQ5I9gcgREL0Fe4Su+6bUyYXySDLsxtIh9siDwGHvg++gTnQLvoKMqhjkOYFk0uweyOSb6KAKsK9OcRf0YItyOnPlWqKKIYeMrAXxoGmEZUiK0iN888tG5baWd9oCsd87OZX0Zhp36R3YzSSVmVJHGCcdNOBTYnLGS08IzrjsOW1N9zlwWS5gYcOvezWCUV37EumAQxRfj+28/gl46J8vXlca2dODTKlpTyOofaF5jZnRT/cz5k3JThO7ANdXwmY/pWvzVV5TLTRTF/aO8NkQTAwkXIDTPBY07souUFuwocwSb19YCAG67Ijg3t4qKQOrGQvaJfcEANDvJdf+7VPrFtYsy/nuwplKN62rQHbTg/5uh2ihjaWqEntB3r8xY++R5jQXKxysgqy/jaZCzZ0YMw2qQjwtmolw2wbj6ks0ZliK7lT57gAIlsue40fuXUkisgmcjF8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6916009)(6486002)(54906003)(316002)(66946007)(66476007)(66556008)(4326008)(38350700002)(38100700002)(6512007)(8676002)(33716001)(86362001)(508600001)(8936002)(186003)(44832011)(6506007)(53546011)(52116002)(9686003)(83380400001)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fIWofXXk4J+unrH+0jQFCC7MqngIhJq0rcaxp0cgDcJoY4VwQnw39vQ+vUPd?=
 =?us-ascii?Q?KRVoWOeX500BD3vNZ7cWlYy8kLT4iKVvv9H3gJYkIrrp9Bv49B1ek0lToJje?=
 =?us-ascii?Q?p+aWPe/RYt0cU9JsjlyzIVrhcP8ubltD9IGe2T7nnoOYETUdTxZQssAnYhw9?=
 =?us-ascii?Q?gmO6S9V5vlAZ5Ftg//hswK6lAl259MHjVA6jUvMDgFeB0m/FGOv3kHrH09k7?=
 =?us-ascii?Q?qOfGNCdLt5+FyMwBvU3jNIQ7jcoCVijT5OvhZEmAMcip7aSxQF0AM9fexdjB?=
 =?us-ascii?Q?x9+Lij/TvClfAAHA9NITafpfTV0ksIJ5gOrNU14GNVH2HZaIakBgEizXVvB9?=
 =?us-ascii?Q?uBRa7/rQdZcK8kgoFSqL3qXi+4elRqqw10TlmOVgnLfx5bFBdAqjORQfgTUp?=
 =?us-ascii?Q?vvkzcepB21BnQAmp14CapZmWj6KyQkhOML+bfc3/wNVz64DbdD+MR2+orv1f?=
 =?us-ascii?Q?ykfcn+7/PXmaVwWxv0klqAiyGhAcnxxQL8YkR/VCRhkF5rHPYl4uivDcByvG?=
 =?us-ascii?Q?DQ0BdQ/b9uU+9x/sD/lLaylh+wpnH8+nlE9oPvIZ2zthz/G5UEQ7/fST7wu+?=
 =?us-ascii?Q?PSXELRg1L0lYbmkhptUnWXSaRGaYAshADlCJCF/H048Ehixskid/yDiFDUQd?=
 =?us-ascii?Q?jY/SMlBzo4moADgkiMN/oHeZoseUv+dukot3xoUxY/7se0YYTdXk2qRNPvak?=
 =?us-ascii?Q?1ME/k3Tu5bF8eSTwE9wmuZd5HzERilQMezF6aD/b320S5vUSXm6koYtBwpaY?=
 =?us-ascii?Q?+zZ6ENF/DSeGnTmlwmPXxEzNs3kzkbPIMlXj0zEiEL7jD9LtsBtdFW19Whc4?=
 =?us-ascii?Q?pgolsstYh2ngLgYefhI+iDno8gCDMxnH+GGWCpDgJfpLtbJuGxXCUxRQcREy?=
 =?us-ascii?Q?41ydmoeusTjeRSVABKAHtSHbfuFOT8B7qjhUjV8FPuvlVlTgqU7yo73VfweK?=
 =?us-ascii?Q?+FwfG4IEw8XzV9iYVLzCw3/ZpwiX8Y30N9kCaPWSHWy9K6J/Wu/G0woMs+Lh?=
 =?us-ascii?Q?60xHtL8IbVfI9Sid7jnVMVFBadX78Ecqjd6Q5hAdUK3mHl0Ih8NHO/Xv9bE3?=
 =?us-ascii?Q?P6FD5X4PUpTJ6wvD9NdQgKSAAZUWGWM3UOaWe3yvip3PxGtdccFXmyIj2fly?=
 =?us-ascii?Q?mkwxNb90TVAqtDGRGStInd960UjXr85SPopTAyaHLu4KJF+8fgser2wXAK4l?=
 =?us-ascii?Q?OIhaNAVW41ST1ZcNDlraY5rIATOkRG5SakpkBd/i9Xw4Q2OC6qRzPLTUxSZb?=
 =?us-ascii?Q?z7Am594R5BmxoKHVkL7EMyYx+Kd1CylSvxLrGKzMcSH3GC/4/Nd/EWceOXI9?=
 =?us-ascii?Q?4PLl1MMOLsZaGgWmBq+phLUQp5qrLzAKE3+h7ZM9hycKPdKc0kv5u856xr2+?=
 =?us-ascii?Q?emKmjV114N4cMYQMwF5r8I2RwS7boUFLZ0PEMGRHOKGTUh7LOMYKZ+76C0ih?=
 =?us-ascii?Q?3/IOYak47OWIruklVjJ/sQ4nq0rU5iUQhMGnfle/1Ouj6shQuPk511cJR5Z6?=
 =?us-ascii?Q?8nSyA97vJdWpWHgvjTd04YvuIyd9UruIDI58/85qRv3d7oQlV6pVEPFmYJ2g?=
 =?us-ascii?Q?1kZIBpJO6JofQ9xh0hq01bFkUzBrkClz7s7SmnO7NGfMdViR5UCa0YxT5cWQ?=
 =?us-ascii?Q?YwAszpRqH6CRzWQEzEURUXM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1097149b-0edd-46b2-4a77-08d9f8624d03
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 13:25:33.3274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YeK+TJBIcBbSLjXHt3CgD5o3uO6FTwOA41ALxRHYZWDkbbBdlT7FHKxnpGzd/yp9/SvktchR6Zj4ja7Gzv9leg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6661
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-25 09:29:34, Sascha Hauer wrote:
> In clk_pll1443x_set_rate() 'tmp' is used for the content of different
> registers which makes it a bit hard to follow. Use different variables
> named after the registers to make it clearer. No functional change
> intended.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-pll14xx.c | 42 +++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index ebd5d888fea6d..b464e1155e25b 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -238,7 +238,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  {
>  	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
>  	const struct imx_pll14xx_rate_table *rate;
> -	u32 tmp, div_val;
> +	u32 gnrl_ctl, div_ctl0;
>  	int ret;
>  
>  	rate = imx_get_pll_settings(pll, drate);
> @@ -248,32 +248,32 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  		return -EINVAL;
>  	}
>  
> -	tmp = readl_relaxed(pll->base + DIV_CTL0);
> +	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
>  
> -	if (!clk_pll14xx_mp_change(rate, tmp)) {
> -		tmp &= ~SDIV_MASK;
> -		tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
> -		writel_relaxed(tmp, pll->base + DIV_CTL0);
> +	if (!clk_pll14xx_mp_change(rate, div_ctl0)) {
> +		div_ctl0 &= ~SDIV_MASK;
> +		div_ctl0 |= FIELD_PREP(SDIV_MASK, rate->sdiv);
> +		writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
>  
> -		tmp = FIELD_PREP(KDIV_MASK, rate->kdiv);
> -		writel_relaxed(tmp, pll->base + DIV_CTL1);
> +		writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv),
> +			       pll->base + DIV_CTL1);
>  
>  		return 0;
>  	}
>  
>  	/* Enable RST */
> -	tmp = readl_relaxed(pll->base + GNRL_CTL);
> -	tmp &= ~RST_MASK;
> -	writel_relaxed(tmp, pll->base + GNRL_CTL);
> +	gnrl_ctl = readl_relaxed(pll->base + GNRL_CTL);
> +	gnrl_ctl &= ~RST_MASK;
> +	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
>  
>  	/* Enable BYPASS */
> -	tmp |= BYPASS_MASK;
> -	writel_relaxed(tmp, pll->base + GNRL_CTL);
> +	gnrl_ctl |= BYPASS_MASK;
> +	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
>  
> -	div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) |
> -		  FIELD_PREP(PDIV_MASK, rate->pdiv) |
> -		  FIELD_PREP(SDIV_MASK, rate->sdiv);
> -	writel_relaxed(div_val, pll->base + DIV_CTL0);
> +	div_ctl0 = FIELD_PREP(MDIV_MASK, rate->mdiv) |
> +		   FIELD_PREP(PDIV_MASK, rate->pdiv) |
> +		   FIELD_PREP(SDIV_MASK, rate->sdiv);
> +	writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
>  	writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv), pll->base + DIV_CTL1);
>  
>  	/*
> @@ -285,8 +285,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  	udelay(3);
>  
>  	/* Disable RST */
> -	tmp |= RST_MASK;
> -	writel_relaxed(tmp, pll->base + GNRL_CTL);
> +	gnrl_ctl |= RST_MASK;
> +	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
>  
>  	/* Wait Lock*/
>  	ret = clk_pll14xx_wait_lock(pll);
> @@ -294,8 +294,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  		return ret;
>  
>  	/* Bypass */
> -	tmp &= ~BYPASS_MASK;
> -	writel_relaxed(tmp, pll->base + GNRL_CTL);
> +	gnrl_ctl &= ~BYPASS_MASK;
> +	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
>  
>  	return 0;
>  }
> -- 
> 2.30.2
>
