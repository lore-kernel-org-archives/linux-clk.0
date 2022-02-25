Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D623DC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 13:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240992AbiBYNZI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 08:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233879AbiBYNZI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 08:25:08 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50040.outbound.protection.outlook.com [40.107.5.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293511BD077
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 05:24:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTOu1Xs5Yufyd89EVgAqoOQV572kQV0SUmt5GwGy6eiQcHn7wuzBx17HFmzY0YAF/M4S03pL69IkQ0tWxtIPIJDoVdEg/iIFPIc4ItE3FkfNdQGa+ZeaSeLvQPpXLIUyA6WbPqK8Rfhb3PETi/G2CjkRLFSEbg9dV1V1U97bYEAP3NesvdWP1ti+4btJdNQvTmo85rTHzxRXMnx5IeFvZVncCs379Qy5FinqAjaZDl8dtUpGO+Y7cFhntG6qivavlP77wdBiz0oVVH0B3BSmyvLB7MrJbnszPb8fnjYLdWeyEZxO7Mmhxao3ICViUHeDlk2Hu3OxpuUBnqgQ2DTzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrhKrcHPkUZdxmylTr0eevRwU7qT+xKF9sndyAjRV2I=;
 b=So6B2/V0NHo5NAcjbX+UWuNe6iO4/HfoUN/0vkwK2SdV2hyAZHC3dn9Vr+c32vbVg4aBpxmb+hYbUdKBsyrL56vkF7jqrvmuACKDBqBwiyD/7UmlnV/oBPto9Cf9RqXV6XFpTPJ54xlkc3ZOIgdPFl266ZH/uqTpijf1aIs7YjtoQf48QDSvGSFh2WYmfK5M+29P269Kgl/SQ93bJ+DYu2ne91ThZV+IXGjFsGYBszRGt0rifr+gpmKu5Vb5TEr73UgQroOGXqZdZ9l4iVMH/IEBzgGkS3fgFeYMJIZQeruuhGzLAx4l15MEYBevjPSin3g0WwSQ4RTOWjptB+AngQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrhKrcHPkUZdxmylTr0eevRwU7qT+xKF9sndyAjRV2I=;
 b=hbmJqDRZfL2XmRgkheNsCt6bHiVEhJhphlK3XlIvuUEk/J/vVRpRpqKjTppY7AUBvqh0vudU7/uG4MUDM15u+t/bAA6B4tueH751lxulghGt+c2HPuX0IgrgsQeYnsKHCuHfmRB99XrpsXSmSHIdPw2CcW2eDAOccm3Km5P+07I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR0402MB3327.eurprd04.prod.outlook.com (2603:10a6:803:2::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 13:24:33 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::144c:129e:befa:2602]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::144c:129e:befa:2602%5]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 13:24:33 +0000
Date:   Fri, 25 Feb 2022 15:24:31 +0200
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
Subject: Re: [PATCH v2 4/8] clk: imx: pll14xx: consolidate rate calculation
Message-ID: <YhjYj3KJc/ROFAdR@abelvesa>
References: <20220225082937.2746176-1-s.hauer@pengutronix.de>
 <20220225082937.2746176-5-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225082937.2746176-5-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1PR09CA0165.eurprd09.prod.outlook.com
 (2603:10a6:800:120::19) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 467fa377-20d3-4504-5637-08d9f8622900
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3327:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB33278D8567DC0EED2D9A189DF63E9@VI1PR0402MB3327.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4/nIF/+eDsD6GHt64NfiR4IghEbbiLKZxxlOJ2oTuLqFWvUUasSW+VMNly83A1D8rtW9KH59mxFcFJ07wxe4LF2qpZZvAzFpuwTXF1bc5WHfDzP23Zx5SXRgclLK1qMUK3OP/3ty0PZNZ96mEhwfmkbvab1kBEPkTJ2Xsqhp7bkxj+Mo7EHdIoKRsrMTLEZnDFVeGx1JPf/SM0XKgP6pJvYeSOCYnVvi+iRCgsECbbwgC8zG8NgE9gdybjRRe6KjZZZlcPq6xzER05gBtGmXL+LYKICrVmv8wzWI2SqPcXWZ/BOsMapPOvNh/9jUqp0x6hAq2NaoHD/fymccXMNMvPGqvVvBbipIHW0Y9OwBDysa7Mjc1+iO1EZcvKxomf1uHgbiBF7OMphKILlfrQV4qgX7Q4Rlj59kYakfa3/yzu3J9AF8VQNdgTYAS2NyST6pcy1Rr4ggC1wpZrBbM1ffqcbuvIsFocU5hf/Apc+xj0+av7shJMRyYXYZpkhHXn2W9BktJH3P0T2GHspXfNr32vJlRw//JFgUfJT2VEq/8oazG/tF9JuHnZXW5wD7RYjtU2PsjyxNIqNOwxWtNRIbcKjZ73Enr26IsOP6tZQhyVi0I2drqQX8qkLZacixTV/Vir/8b9YtHh3aH0g1EZfQVI/u7cX7dDu+L1KnQpu7PhCUR7uWNRGLJVE73X4sNk5SgIJ9BT/SqBIJ0wcCOCp+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8676002)(4326008)(2906002)(33716001)(86362001)(6512007)(54906003)(6506007)(9686003)(66556008)(66476007)(66946007)(316002)(52116002)(6916009)(83380400001)(5660300002)(6486002)(8936002)(186003)(508600001)(38350700002)(44832011)(53546011)(26005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YKkfIgy5j7Ie4vSwyO2ObkfMgwyiNOxizyZZ0e+kWFaxOCdvLyo6i9lNCfYm?=
 =?us-ascii?Q?A4ox+fH8ah+UwxpNDuH7qxrFtU2aYmXS78remMBvJ5tU6gVl9arg0nCmv9LH?=
 =?us-ascii?Q?eqkSiAjqrBsE3e/Q17z+Bsa80/HoE1POV73ZHde3rsKbQRR7bidl7IZLZTIc?=
 =?us-ascii?Q?gPVW5VR0Q5+Rw2V/w7sTSack+avS9PzHnRsYeTnPGPwWJtJYW/eHnCOsZOkp?=
 =?us-ascii?Q?hkm7zsAl78ZpvCxtaHLULpUj1vcZo651mOs2WW8ACD5pOg0JYtTr/GIkZc17?=
 =?us-ascii?Q?3sqOz85/QEowrXPlwpOKuMovrpOBYyImMKHopNffGzsNIYguwrQRrpu6XUSU?=
 =?us-ascii?Q?1MfOWLLlYit9D4Lj8rg70RKu290Y6E8DPPrmQOxCC3jWvkq+kq0NRhVtAbDh?=
 =?us-ascii?Q?Nlbpz+/rFQZEl2rdKFuwH6sq3vkU/p6rzxkQ99MhDXrDPMhnxi8FWBfIt6bG?=
 =?us-ascii?Q?q2uIlG1sqoptYH/l3537Fx8ltjMGtLdosN+CSaJiT0c23OtCgcfXqd1t/16K?=
 =?us-ascii?Q?xL7kt6M3wQRQRBgsP5dJ9HJl2TdK6XUat20lY02V2ZN2801mh9E0/F5YLXEM?=
 =?us-ascii?Q?Haic2JqW8Ksjhpu5cSTwILnXYqG3mMUFSsV88SDKlY8cI6G8hbeLkUlV8dDq?=
 =?us-ascii?Q?BOyUGT6DUueiOxb4egFK/qR3iNWEe2DqN4LLYSH9rP34VXOPRGvm+EpArl3h?=
 =?us-ascii?Q?12Q4ugAO73eyLu8jo6V+lCmZK3kzwP+NSsVfngooOgQBjfJ10HaqeAQSq9C8?=
 =?us-ascii?Q?kDtV68QjSk9RQujHf96gJRBpteU/Zt7ntvk2grVK2mm8gCOLSs+Q1XNrWroH?=
 =?us-ascii?Q?xCGQWbgezcq9gOM899moIUw6OXd9+TxhYWx90WC5LCABG7BNfAcfK+/v6CCT?=
 =?us-ascii?Q?iNrblqBhOzjGvvqXQCN7eB84CzWbH5yD3zKXsn8seDjb5tNa2AWwv9CNr4wM?=
 =?us-ascii?Q?wvwKiAEEnyzEmxoS8rE7Urn6uAqvXVOhX5GPTUqFUdIgLt7XqyFL8Via0wdV?=
 =?us-ascii?Q?19n1lWcyEY9qQdhzcGxbE2LWOHljSkEcaR/tUualZWU1XimXq5Rfkz0r51/R?=
 =?us-ascii?Q?Yaa7H6h0v55qho626x+FO3eifzhdne05c0t7AbrM6NoG/bsTG0jCKfn5cOtq?=
 =?us-ascii?Q?Tx5yh7mUgLd/FM6J1Rf0yigeEwhVk4WMFq0jCSC6grFAq1w2VwJ81XFzsOdZ?=
 =?us-ascii?Q?Sv6LbOGrIKw/3Z2Nq3hRmEC6Pm6OIltUBPTKDcXbyh5QK8uXnwdYpsszkLol?=
 =?us-ascii?Q?2KX2rYJVrojJjPs8qQyAutjXM4zG85FVOsmpd6wQgc0oTYKh4nejJR3edI3T?=
 =?us-ascii?Q?lrEFYh+bqts44v5PrWJUDywYpfECvyk0NkupeGehPqTTFicUBvHjXApLxDZn?=
 =?us-ascii?Q?ORLyqnvZvp5WhZompAnEB9gLxwJT3gIzlG+DvU1nn4nnxKWORmKqwY6ZP5uS?=
 =?us-ascii?Q?oQj6+1t13tWIxaRXZ7k3fdx6inNTuxQCAZ7giN7N8hrlBc5g8ARf1PVm/IYD?=
 =?us-ascii?Q?Xd10GTI0LhvxXtsCC+3ASqLNqATpy9vGcUzwjIqN4Awyy3qjmU0MZe/0PkPx?=
 =?us-ascii?Q?byQwoF6gTxGTsVatLCauFM4Ec7ZbmglNZYS05Z6rA2JIbZeVjhVSCZThyfnf?=
 =?us-ascii?Q?K+bieoNSARXysUgdZ+gsb+U=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 467fa377-20d3-4504-5637-08d9f8622900
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 13:24:33.0038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxHhkLaq+U1OSVRi3+c++Liq8QdaG/3DRYkJxeTTF2kCsKPdSIjsO3Qmkk0ptkUwAyoG3bxMNQrztVGxZX97kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3327
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-25 09:29:33, Sascha Hauer wrote:
> The PLL driver has support for two different PLLs: The pll1416x and
> the pll1443x. The latter has support for an additional kdiv value.
> recalc_rate can be the same calculation when kdiv is assumed to be zero
> for the PLL which doesn't support that value.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-pll14xx.c | 59 +++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index fabb380b87305..ebd5d888fea6d 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -97,6 +97,20 @@ static const struct imx_pll14xx_rate_table *imx_get_pll_settings(
>  	return NULL;
>  }
>  
> +static long pll14xx_calc_rate(struct clk_pll14xx *pll, int mdiv, int pdiv,
> +			      int sdiv, int kdiv, unsigned long prate)
> +{
> +	u64 fvco = prate;
> +
> +	/* fvco = (m * 65536 + k) * Fin / (p * 65536) */
> +	fvco *= (mdiv * 65536 + kdiv);
> +	pdiv *= 65536;
> +
> +	do_div(fvco, pdiv << sdiv);
> +
> +	return fvco;
> +}
> +
>  static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
>  			unsigned long *prate)
>  {
> @@ -113,46 +127,25 @@ static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
>  	return rate_table[i - 1].rate;
>  }
>  
> -static unsigned long clk_pll1416x_recalc_rate(struct clk_hw *hw,
> -						  unsigned long parent_rate)
> -{
> -	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
> -	u32 mdiv, pdiv, sdiv, pll_div;
> -	u64 fvco = parent_rate;
> -
> -	pll_div = readl_relaxed(pll->base + DIV_CTL0);
> -	mdiv = FIELD_GET(MDIV_MASK, pll_div);
> -	pdiv = FIELD_GET(PDIV_MASK, pll_div);
> -	sdiv = FIELD_GET(SDIV_MASK, pll_div);
> -
> -	fvco *= mdiv;
> -	do_div(fvco, pdiv << sdiv);
> -
> -	return fvco;
> -}
> -
> -static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
> +static unsigned long clk_pll14xx_recalc_rate(struct clk_hw *hw,
>  						  unsigned long parent_rate)
>  {
>  	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
> -	u32 mdiv, pdiv, sdiv, pll_div_ctl0, pll_div_ctl1;
> -	short int kdiv;
> -	u64 fvco = parent_rate;
> +	u32 mdiv, pdiv, sdiv, kdiv, pll_div_ctl0, pll_div_ctl1;
>  
>  	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
> -	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
>  	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
>  	pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
>  	sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
> -	kdiv = FIELD_GET(KDIV_MASK, pll_div_ctl1);
>  
> -	/* fvco = (m * 65536 + k) * Fin / (p * 65536) */
> -	fvco *= (mdiv * 65536 + kdiv);
> -	pdiv *= 65536;
> -
> -	do_div(fvco, pdiv << sdiv);
> +	if (pll->type == PLL_1443X) {
> +		pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
> +		kdiv = FIELD_GET(KDIV_MASK, pll_div_ctl1);
> +	} else {
> +		kdiv = 0;
> +	}
>  
> -	return fvco;
> +	return pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, parent_rate);
>  }
>  
>  static inline bool clk_pll14xx_mp_change(const struct imx_pll14xx_rate_table *rate,
> @@ -363,20 +356,20 @@ static const struct clk_ops clk_pll1416x_ops = {
>  	.prepare	= clk_pll14xx_prepare,
>  	.unprepare	= clk_pll14xx_unprepare,
>  	.is_prepared	= clk_pll14xx_is_prepared,
> -	.recalc_rate	= clk_pll1416x_recalc_rate,
> +	.recalc_rate	= clk_pll14xx_recalc_rate,
>  	.round_rate	= clk_pll14xx_round_rate,
>  	.set_rate	= clk_pll1416x_set_rate,
>  };
>  
>  static const struct clk_ops clk_pll1416x_min_ops = {
> -	.recalc_rate	= clk_pll1416x_recalc_rate,
> +	.recalc_rate	= clk_pll14xx_recalc_rate,
>  };
>  
>  static const struct clk_ops clk_pll1443x_ops = {
>  	.prepare	= clk_pll14xx_prepare,
>  	.unprepare	= clk_pll14xx_unprepare,
>  	.is_prepared	= clk_pll14xx_is_prepared,
> -	.recalc_rate	= clk_pll1443x_recalc_rate,
> +	.recalc_rate	= clk_pll14xx_recalc_rate,
>  	.round_rate	= clk_pll14xx_round_rate,
>  	.set_rate	= clk_pll1443x_set_rate,
>  };
> -- 
> 2.30.2
>
