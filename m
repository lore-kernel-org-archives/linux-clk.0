Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A28C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 11:29:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235644AbiBWLaK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 06:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239861AbiBWLaK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 06:30:10 -0500
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60040.outbound.protection.outlook.com [40.107.6.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5739B90264
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 03:29:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5F8waa7gnWjNoP7V1zhfRLAAZAWZfh3r8j0+OfEhAerGnyCPbcU31Nf8xVZF0XO4vOUtAyKUfMKmWuys6PmPfIw2aXe6ZH+lsEtQ0wNZhrvdov5hsBnUfAzcQbf7q/q7U4iBjd21P4KXCDTcs3S72OepX5Kj5BCyPNtiiNmqOF+DJivEk0MX7FcmCqz9t+veK92SGmUwsWwuoj2erEYlcaTyWNPfhttTPGSepJDWGCHoGYTz8k5Icuw4J0CFKlMBvsLHHS1i1dpO9yCf+IdeGwDe8abXJcRQPH+Dw19J7XxTlS/wEI7pshZe71bVqf9ZG5sU429N2hBcpme9VzhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aivSqT6pnIUA+G050nkTm7Y1YsQazWI62hWoLgfywEQ=;
 b=CKocfuuHbIQ+uYloPuMcQzxd7lI2Y+TixVpNK+ZmNNs1Py69hz6z43YLOKWNbdtTcNJ9fVhVn9zF+Lv9pv+I34Et8MFeo7h3W9X1qdiG1355aKcARIdjvS0FZS8grZ9qGKUmpQBArRIgZ3xerBfiRXCtpG5QRHngr01TudQO75GWsY2PWSMRZ1wEByymsSw4tWgrlUbUsSTTt3EmjGZqFyH/aTNLR67Sfy827355eDIoYU8rF+yQCsX0B9d1jlr59c98C62UuUyf9VBEY1yQLXMBx4pc06Cbv0ybUGlq2dZR+BgI5UDl3ElH3XiY8NhxHZIqWgid3aloFlHesT3qlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aivSqT6pnIUA+G050nkTm7Y1YsQazWI62hWoLgfywEQ=;
 b=r/sTlBHP/OSLfkBl5O+YmU8Txv2G79e9zyii0ikX5X3LN2nelDG4gxvr6W7ioFV8xUfO0xCDP4J/Zs3AVZbR19yuP0M3sg1Zhq+EktJlx0sQJhZg0Fz43XkBPp+1L8q/sKidKPnClbT07NPNB5KKIOQ2BsX0lPUzdhdX9915Lk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 11:29:40 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::2936:6a6f:6e6f:161f]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::2936:6a6f:6e6f:161f%6]) with mapi id 15.20.4995.026; Wed, 23 Feb 2022
 11:29:40 +0000
Date:   Wed, 23 Feb 2022 13:29:37 +0200
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
Subject: Re: [PATCH 1/8] clk: imx: pll14xx: Use register defines consistently
Message-ID: <YhYaobH4B2DE867n@abelvesa>
References: <20220223075601.3652543-1-s.hauer@pengutronix.de>
 <20220223075601.3652543-2-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223075601.3652543-2-s.hauer@pengutronix.de>
X-ClientProxiedBy: VI1PR09CA0088.eurprd09.prod.outlook.com
 (2603:10a6:802:29::32) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fdde2e1-8317-41a7-2b2e-08d9f6bfc7b4
X-MS-TrafficTypeDiagnostic: VI1PR04MB6894:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB68945F5815E628020200B9ECF63C9@VI1PR04MB6894.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cfai1Vvi9LSCEl/d5fRZ5Hp4eolw9ftdDT+4zx+q3x16asXNXgpsM0mWG71RZXTlcZClSrm3D/Aa2tz7jqgPN0o4CyM9X/pHYDpivFus2uJCr1S5ogVazzqZpcy1Ia5RZAklfZcf/+wHI6R+k0jD9eXpcwL/GMraJoR0ZD6a56jbRIvfVKy0s8k2hCBCcauc2sVALiMtnN3+8htxnkhRZKm/bMJb2rzvZxrTBhKLg8mbMdSsGqCKJBfQLhTf42XM5KOeXcsQ7hfQ9/UZKsOBgcNOQoGnqAy0FFDCAi7sCTXhA+SLHgO7rhSsslv4cdAXkof2CWZ27orWbGEj81ifc+ABFnU4nRansujjrUj119G3IPLzg4Hggfkbd2v0iYatFMxa8BIFsuzmcX3uIdyEDqdJOQG+3o40O3bgP5gNToa9oXrfw4ezautgWX/W9LShEIBl1IEO4kGDZ39NDYQneuzO2ekaImjRnM4RmmSqSw/kHCrDJj/DQA/YWjGbX4pLs+4sMxzrQfVa6OMnc5LMqZWUdv0PZKABf8hnNzNlyCY6W5Y6HJjk9F2tngxYBXPyEO5DAdtQcw7GfDwzGwgmVdzkiQsbkS35CazLKxPfCnbhf/NYliyw76fhoZukkZaX1aZGpgAtGstAWzNLci0qlNAD4P8h77iS421Yp58HC9W055MCrXZlUjyiBbO4TfkVQ+akKMM0Q1AnMUC9/vOIFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(2906002)(26005)(186003)(44832011)(6512007)(33716001)(9686003)(6506007)(53546011)(52116002)(8936002)(86362001)(8676002)(6916009)(54906003)(4326008)(38100700002)(316002)(5660300002)(6666004)(38350700002)(6486002)(66476007)(66556008)(66946007)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EwX1GQXmUDYBXD0N0sHuU1eBiXn7xWObVyjYSq405zmjm4datO5i6OLnsNrg?=
 =?us-ascii?Q?ScN19veQb3Z+MHC5sTdkjSFGZ1j4uQYk4SDWBcUN/6t18vDgfQ7yUp6608w9?=
 =?us-ascii?Q?t8FNYkIEyC4oc4rv39+FZpgMUURMqlPyCJIOHyVaNsEfO42a/6oxDF41YHaZ?=
 =?us-ascii?Q?gljTsyqvuNU6c5+fnHTpdqf6Eer9VhKN49aSmDBtcmWJzBW22trRD6DEZh6W?=
 =?us-ascii?Q?8gBv86t4g1VAYzdjV+e6Ey/U1zQh0+aDcKUfXib/b4GYb/WU6ihoZHpD1+ra?=
 =?us-ascii?Q?Lsjs8ul0SUs5frRdhL7Tns9fRY7h8mysXiehIYcWl4troaTljkEmUqVUhPdb?=
 =?us-ascii?Q?nXomJcpfmaFuiyFe6y71CEK8Gg2rnxmIorpJxKxuS2vvGYnCdZ57UQORWgEI?=
 =?us-ascii?Q?phLD5qGVv/jaacvGtPs72v3r50Uds+ARSph25jnz+VwAWS1NWs4ziXYsOJY1?=
 =?us-ascii?Q?9S+ubpNDAJ4+3sZUf3wqXzipOCDZN8DWl6pGRKk+KfQYgYnQI9e2A5jihD9N?=
 =?us-ascii?Q?pBJxHjkuq8BECELkCEpEpfglF0L3JoMBgNauNvIQPFFtrvd9JxRSdqCDgka+?=
 =?us-ascii?Q?e3js7PhVsXlV6UR8rjQwcuJrrWj2L0pbKCg2dX05KFcrGYDnhvq8N2PSuMEz?=
 =?us-ascii?Q?CYJ2sSIIE126i/1FULYO3SIgtdzjH5J11CVXIBAUWBC1lD/7UlHnPxYI4xlV?=
 =?us-ascii?Q?eWEn7roFhQXIsbOOqqOq0Z3dhiYWeCveE/vFU7WwjwA/be0AJ7WQuUwvjDJg?=
 =?us-ascii?Q?g1FdVmdjQDFwaN8T08sCKmQxFJwO/ENSf3H+wMYCsGP9kIvzFOCiH46CmzkN?=
 =?us-ascii?Q?RT9fRezvDOCHFSluPF1ZjPli/Ddl4EpN0WnZ7x5HB8ZvPcPjB6Df/Ld3fR+o?=
 =?us-ascii?Q?K7LjmAflA8c9xATqWLIcnMzND2TmCK0iH6EvhP4iQeXTI7O1UM2ZQfGAYHj4?=
 =?us-ascii?Q?IrHHBQTe+qXeyFN4Q7B9QMUwlLCSO8mdtZedUHqHXkrlzQtElO9BAohmDwML?=
 =?us-ascii?Q?JWQuuRg6pCYL24XuU/xXpET/OZKrjMFY6vG9rcwh2xkXX2d1Zi0zSKNyXUeI?=
 =?us-ascii?Q?mIwY5iY8AgDZKtcKKvJYrXnmXJjPKHB3ZV/jnJQbtxcL0vOSH+dlEAPklRfR?=
 =?us-ascii?Q?SQURJLYJsPe3dGtP2IPBAUwF3maloi5fGUhdsLoPXsQBkYTOT1Un0uH6sW9f?=
 =?us-ascii?Q?egl6Jb/wLoz5laAYUy1DQaSEak1uHZDkrJUoGJ0XEJKdVMdik8qOVoHizwNq?=
 =?us-ascii?Q?gUuw/+j/6EfZBxpzx0fwn8PDjHGZTE3bVkuFVqEwvvtZQslzhWwzYPPx9zbe?=
 =?us-ascii?Q?e6uzo/mNo5jFRBaOJXBZc9I2/bSRKPoaMvh4Fe1idydh1TFLdkoYPsN39p2B?=
 =?us-ascii?Q?vUPIZIRc2kGFTp/nLE+bNdmyNPJ68rYt69mHuC31Qb4XBN00e1rKF/v1M4uD?=
 =?us-ascii?Q?EhA0hP2s5p3GqP/eyaJWmdKGc4si06fBGxsgSuG8oSxjtYTWKtULpUpv432D?=
 =?us-ascii?Q?P8Sx5nGMJvzK/8mI22av1B3KN0FKAWRZPlqVSfnKMNVXykXQx/Ro0YtrmFiJ?=
 =?us-ascii?Q?QURAGRYjbgp1qz1Ku+OlWZujOThDVLVQZTGE2sa0E+N9DlykFBvLv3vmSyoC?=
 =?us-ascii?Q?b0CYb9MCHbcC9KKDgnVeBZM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdde2e1-8317-41a7-2b2e-08d9f6bfc7b4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 11:29:40.2108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkKpRevRH8ZyZxv5wkqxpqjElX4th6NQ7Nzfs1IFo/FJvieq6Ubt2IHyGhmHB8u2h7B3ecPNdKG9O4dgf5/uMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6894
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-02-23 08:55:54, Sascha Hauer wrote:
> The driver has defines for the registers, but they are mostly unused.
> Use the defines consistently throughout the driver. While at it rename
> DIV_CTL to DIV_CTL0 because that's the name in the reference manual.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Pretty straightforward.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  drivers/clk/imx/clk-pll14xx.c | 49 ++++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 2b5ed86b9dbbb..cae64d750672e 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -15,7 +15,8 @@
>  #include "clk.h"
>  
>  #define GNRL_CTL	0x0
> -#define DIV_CTL		0x4
> +#define DIV_CTL0	0x4
> +#define DIV_CTL1	0x8
>  #define LOCK_STATUS	BIT(31)
>  #define LOCK_SEL_MASK	BIT(29)
>  #define CLKE_MASK	BIT(11)
> @@ -122,7 +123,7 @@ static unsigned long clk_pll1416x_recalc_rate(struct clk_hw *hw,
>  	u32 mdiv, pdiv, sdiv, pll_div;
>  	u64 fvco = parent_rate;
>  
> -	pll_div = readl_relaxed(pll->base + 4);
> +	pll_div = readl_relaxed(pll->base + DIV_CTL0);
>  	mdiv = (pll_div & MDIV_MASK) >> MDIV_SHIFT;
>  	pdiv = (pll_div & PDIV_MASK) >> PDIV_SHIFT;
>  	sdiv = (pll_div & SDIV_MASK) >> SDIV_SHIFT;
> @@ -141,8 +142,8 @@ static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
>  	short int kdiv;
>  	u64 fvco = parent_rate;
>  
> -	pll_div_ctl0 = readl_relaxed(pll->base + 4);
> -	pll_div_ctl1 = readl_relaxed(pll->base + 8);
> +	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
> +	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
>  	mdiv = (pll_div_ctl0 & MDIV_MASK) >> MDIV_SHIFT;
>  	pdiv = (pll_div_ctl0 & PDIV_MASK) >> PDIV_SHIFT;
>  	sdiv = (pll_div_ctl0 & SDIV_MASK) >> SDIV_SHIFT;
> @@ -172,7 +173,7 @@ static int clk_pll14xx_wait_lock(struct clk_pll14xx *pll)
>  {
>  	u32 val;
>  
> -	return readl_poll_timeout(pll->base, val, val & LOCK_STATUS, 0,
> +	return readl_poll_timeout(pll->base + GNRL_CTL, val, val & LOCK_STATUS, 0,
>  			LOCK_TIMEOUT_US);
>  }
>  
> @@ -191,32 +192,32 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
>  		return -EINVAL;
>  	}
>  
> -	tmp = readl_relaxed(pll->base + 4);
> +	tmp = readl_relaxed(pll->base + DIV_CTL0);
>  
>  	if (!clk_pll14xx_mp_change(rate, tmp)) {
>  		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
>  		tmp |= rate->sdiv << SDIV_SHIFT;
> -		writel_relaxed(tmp, pll->base + 4);
> +		writel_relaxed(tmp, pll->base + DIV_CTL0);
>  
>  		return 0;
>  	}
>  
>  	/* Bypass clock and set lock to pll output lock */
> -	tmp = readl_relaxed(pll->base);
> +	tmp = readl_relaxed(pll->base + GNRL_CTL);
>  	tmp |= LOCK_SEL_MASK;
> -	writel_relaxed(tmp, pll->base);
> +	writel_relaxed(tmp, pll->base + GNRL_CTL);
>  
>  	/* Enable RST */
>  	tmp &= ~RST_MASK;
> -	writel_relaxed(tmp, pll->base);
> +	writel_relaxed(tmp, pll->base + GNRL_CTL);
>  
>  	/* Enable BYPASS */
>  	tmp |= BYPASS_MASK;
> -	writel(tmp, pll->base);
> +	writel(tmp, pll->base + GNRL_CTL);
>  
>  	div_val = (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
>  		(rate->sdiv << SDIV_SHIFT);
> -	writel_relaxed(div_val, pll->base + 0x4);
> +	writel_relaxed(div_val, pll->base + DIV_CTL0);
>  
>  	/*
>  	 * According to SPEC, t3 - t2 need to be greater than
> @@ -228,7 +229,7 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
>  
>  	/* Disable RST */
>  	tmp |= RST_MASK;
> -	writel_relaxed(tmp, pll->base);
> +	writel_relaxed(tmp, pll->base + GNRL_CTL);
>  
>  	/* Wait Lock */
>  	ret = clk_pll14xx_wait_lock(pll);
> @@ -237,7 +238,7 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
>  
>  	/* Bypass */
>  	tmp &= ~BYPASS_MASK;
> -	writel_relaxed(tmp, pll->base);
> +	writel_relaxed(tmp, pll->base + GNRL_CTL);
>  
>  	return 0;
>  }
> @@ -257,32 +258,32 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  		return -EINVAL;
>  	}
>  
> -	tmp = readl_relaxed(pll->base + 4);
> +	tmp = readl_relaxed(pll->base + DIV_CTL0);
>  
>  	if (!clk_pll14xx_mp_change(rate, tmp)) {
>  		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
>  		tmp |= rate->sdiv << SDIV_SHIFT;
> -		writel_relaxed(tmp, pll->base + 4);
> +		writel_relaxed(tmp, pll->base + DIV_CTL0);
>  
>  		tmp = rate->kdiv << KDIV_SHIFT;
> -		writel_relaxed(tmp, pll->base + 8);
> +		writel_relaxed(tmp, pll->base + DIV_CTL1);
>  
>  		return 0;
>  	}
>  
>  	/* Enable RST */
> -	tmp = readl_relaxed(pll->base);
> +	tmp = readl_relaxed(pll->base + GNRL_CTL);
>  	tmp &= ~RST_MASK;
> -	writel_relaxed(tmp, pll->base);
> +	writel_relaxed(tmp, pll->base + GNRL_CTL);
>  
>  	/* Enable BYPASS */
>  	tmp |= BYPASS_MASK;
> -	writel_relaxed(tmp, pll->base);
> +	writel_relaxed(tmp, pll->base + GNRL_CTL);
>  
>  	div_val = (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
>  		(rate->sdiv << SDIV_SHIFT);
> -	writel_relaxed(div_val, pll->base + 0x4);
> -	writel_relaxed(rate->kdiv << KDIV_SHIFT, pll->base + 0x8);
> +	writel_relaxed(div_val, pll->base + DIV_CTL0);
> +	writel_relaxed(rate->kdiv << KDIV_SHIFT, pll->base + DIV_CTL1);
>  
>  	/*
>  	 * According to SPEC, t3 - t2 need to be greater than
> @@ -294,7 +295,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  
>  	/* Disable RST */
>  	tmp |= RST_MASK;
> -	writel_relaxed(tmp, pll->base);
> +	writel_relaxed(tmp, pll->base + GNRL_CTL);
>  
>  	/* Wait Lock*/
>  	ret = clk_pll14xx_wait_lock(pll);
> @@ -303,7 +304,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
>  
>  	/* Bypass */
>  	tmp &= ~BYPASS_MASK;
> -	writel_relaxed(tmp, pll->base);
> +	writel_relaxed(tmp, pll->base + GNRL_CTL);
>  
>  	return 0;
>  }
> -- 
> 2.30.2
>
