Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A3F388876
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598780; cv=fail; b=CetCG/T4L8/MyQ2BLWPCTELnXiuZT5pM0KnJ5negEOFCa6vy/aFyqk/brH5qmWlMDodYxKIHTUzAUJMuloUGaVc6R4knaasaNk+t93vC3BnA17bWdFpZ5UppEwzQhE+01Gv2XYzqnjihYieCWYSXD/nv79yldA9kP7kHc1tUmdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598780; c=relaxed/simple;
	bh=pfArHd+XLjRyWkHh0exC1qRYMr/6O+x170WbJL1egfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ETUZXIbkHprUOlQ11IKCoF6yJWbm6Ry8kBRwWsz/RYKZI/l/o4EvcntZqDWdBspjftoDRN57J6C89QkjhUMuHVmSN8lSb1zeNBzWviqMqKYZjmwgg6KttPtdoc/KAB/JYsjnXxFdNXbHk4YLDR/q05IPj8E0+R+OULArCGhWcWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y242gxDB; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y242gxDB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nekuVKhQVcAtXlxUN8gulouwazI/76C+vFnAQPq8lghzrFBBNocOjj0mg8zvSNNZLkEjLj4U51Eh2PZUNCwTYcsNULbbYvgXaSQUH5dSJbJddpi8TeZblaTxqc5YySKFk5fECzpam5xfAkk74dZQ3G6jbv0lMjDBhNSsZuxV/d9iKuPuoGnT1TSf4JIAnra/425waR+MznhTKODMgEgX0oGkFwPmJjb7uvXueGI7qP/HowW4qep3agQ1F3KvLw7XJ8P4IobYzeGAjl+FCesoHKGvuYbuJkKZinH7mNFtp3qoH265LqzLItHC9vK/v/pdxcGqZnMRbtkIgFW4ok+Kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ev8vh5ns96+Mwfb2pHRZUX8j/pGmczCVQ0yRoYyUO/4=;
 b=l3ZoEEyYijSvKZU6ffa0spVQtMP76gW+pjikJFPmJlyHbCOjrXYAV7hzuXmocnxKhuXvgIsvPcOCRjZFbuHSOsNL0KZfRunFQk1XbBAYjP0mCQjjYDhP/yNzGGuPwpUC9+8Q9i6dylxf0YxPAeJi9Sd5fY23QwSB1gDlYvgidxhDxf/ddmAOfuyTN6zw0C3KECQFCqEM0JsMXkKdYAzghLI1lWJ68XoaUCeFITof90Sag1RssZNgzU/AjlmeLaZE9QtDUr/w9HMyYQs+TmZtdsVTjJBP2YMC0oK1JSqbPrIARil3a2CrM56DIPoth0vTgB2H67Pzg9ipQPxONY1+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ev8vh5ns96+Mwfb2pHRZUX8j/pGmczCVQ0yRoYyUO/4=;
 b=Y242gxDBwXbnk9dTztkKn0okayy+/JVu/wFvj1+YuWgxYq+58vT5Zwfa5+4Sn72yUdt36lp/c1lQ32U411itQTiVFzMXQXx7+WS+feDcGWXMkDNCjeP+vI+1Sys2mS9QLu0343d62sr9ecvbTtxADKrvHmr2WVsT4kGYbpTxQqRi3eZF8f2kF4KpuTKjrg1ccROi2PSXGKURtSm6iHfwykozzCzL5jj3qHimHwfm08dQUsY11V34uyI6p4GmtrIbQu1FWCsrnsxOX34hFe3wFZ4YglNJMgvMpKlhx4vLCNq9TiYTHiWegS74f1t+rjTObsNGdleodpZtD/aPssKGBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB9966.eurprd04.prod.outlook.com (2603:10a6:10:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 15:12:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 15:12:55 +0000
Date: Tue, 12 May 2026 11:12:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx: Add audio PLL debugfs for K-divider control
Message-ID: <agNDbQsJn2jcnA9q@lizhi-Precision-Tower-5810>
References: <20260512-imx8m_pll_debugfs-v1-1-e1e44b21be90@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-imx8m_pll_debugfs-v1-1-e1e44b21be90@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DUZPR04MB9966:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c1f0bc-9f2a-4e5c-5c2e-08deb038f15b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ak6mnD7QbAXRbhmoDh95bR9vJMBAnoXmahaDrXr/u/GaewJ/SvEmy+mhKIIyZX9Ht83ZFKL2WlCA2xC4H1mzjvwSheshm36t1WAldCnS/wFUqGY5qOMKDVXaXSdGMWeVzGgLLsBkCqoGeNRrJ64wzGjnzGpkYBPz+Cgg95rxS//1oJcnI2vZbTFomcEUTyBV/aX6OvuG6iin2ofKR32gY/tf/6mULwza0wMOMVixeYxt4vsXYO/dyIGD/sJTJiL+/Rv8BUT0HqzJ6mBS2hDPrq2OiPWxl8V7vs5QEzwE0F5olNwgZELhxfKhU1FVNDtrEaW3gqkXcxXdNotIcgXOq6aZgT6CH1tTR4CK9pAtkbiu4dGugJmAea6R0eqGugLH/WPbyfpb7NT6dF4bkzSaMNfZiPlYvi4t9uitJ3pFD4BSTCnMapYL7v2JimUqVQi6wIGtenDr4fh4lXsylxHix+7FhshZoNrY4DrIeE+xjBBki5AhWCRzbDxGdznInf5vNJmLCL85KU7vkyBlBEAhzkJbRUTy707b/Aiu8Wt0RjoVH/nNu51xbgOVwfo2yUQmEeQYJh1lVvV6lkP1Bra498WEjmGmQwnLu8b84dd4cNGLRre9eiwiFIssMLYAe3kgjel5EnwSAgGscAtsgkCgIZ09MkLpRwlj6Qru1jBPk7c6Jwt+8XDAGWmzF662IXJpPgyqCXu0gLb0vZEVbh06ngx1fxd7ypQZpTSgaCaSii1RgaN8/BcS8/tYQG0KRO2N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VHjNMUMSxuNHz5d7hGXDLtpG1psDNr4mz3W+O2JdFBBDgcsj+BfBH1LvDo+7?=
 =?us-ascii?Q?nknq7RmZPRoinHye5/piNmhij2SXiJKl6x7TpN26BCQoxzpJ2CAd/tnCWacH?=
 =?us-ascii?Q?0+lVeEStkfK2JoEVh84//3wweXdcO3WGLqfDHZXiuo98J2I7XQ3JEDXUWeKO?=
 =?us-ascii?Q?7BEa88RXxDUx7Usjf/jeV6/d1Y4XSacHvPvqGG4bBLNwokFMshSSUGAJMMgw?=
 =?us-ascii?Q?73WXLzsHH8LyAvzYvZQZvY4OhSDilmYOStQ+AZL0MRUdD3n2W+SVwKGSaGHd?=
 =?us-ascii?Q?KKFBoO4oGcNRVsfTV4Pki3HJ6Hiu4FoXQJp0B3ktsGYCZ/OlWo7gur5ySchm?=
 =?us-ascii?Q?nSY9MZU6rR+TpBYkhR/6KZuNph4KdrRHq3ZoLWfaESgd4U9ngA9/sPO4wG9b?=
 =?us-ascii?Q?GTjv22YBpCFdal6ykuPhshHj0P7jR1Ilwmi3KajyJdPTXwLV92SOMEqdk+ub?=
 =?us-ascii?Q?mam2Pjo9abWkuvHRJhtUeu5WT3UYfbcs/R42uoy2Kf5Xq6m5AD30Uzg4f2iP?=
 =?us-ascii?Q?c7xN+DxditW4PZdkVT2UAysDcHNWj2RX2OVnFAxbwjcpPclo0xiCUDO6XJBL?=
 =?us-ascii?Q?Egku2Yhiz/X9c9cjMThKK921T8cw0P0mIokbOnTKnj5WeXa1Dw2bdRvRZMaw?=
 =?us-ascii?Q?ANXGoYRo1VHZS9U9PsRxrwrffQiRoH1H3xWm1s9HQ4eRqrhgWg7QbFPnCMg/?=
 =?us-ascii?Q?HMopm8k4v6snEl+ovY29NpFjbWuGCPRPmd5rRMobtZVEzGanSx1LmRA8rlwu?=
 =?us-ascii?Q?zAggzN+7CSU6/Lxeuc/6zTD7s6Rjen4ZOBGtbqD05/cF+IrtdQtvOdOqnT9d?=
 =?us-ascii?Q?99kvOBnPoHf/Bb9NfwP9ZflClxR2BHsBUUQ0wcFnSQuAejVQ1OsnZ1pIY0MK?=
 =?us-ascii?Q?PBjdx6gtTs9clu4LGbtbntZ/0il7a2Jy2qME4w8gLcwj6TmepUqR2fFkKyES?=
 =?us-ascii?Q?wEKPPIPk4O6U35rXnrFmvmKYfKW28BGM4IdiOxz1/y6KiDdhKM+QQjy51Wbi?=
 =?us-ascii?Q?/TvIxmGKc+IVB4gdXWLisaEHBG5FR3RfDjHB8ZVPA76edU1ZEdTKjEd8oOfb?=
 =?us-ascii?Q?fytTY1ZpWOEGm80peSMcwJhzF+Iu0Rl2mAtwA6DeduV5zs2tIpsy4iR3gqHu?=
 =?us-ascii?Q?iBFNlPT7SU0sTMcT2OYW1M6o7v0LTW+AhG8Oa7HSWUJGfvjqOHmKqG4tN9ZI?=
 =?us-ascii?Q?JV4zq2ZNuoYcFN9RzLWsof219a/AaXA5vEtne2gBgcoTw57n8mD/Fl7+ew6E?=
 =?us-ascii?Q?6aAurN11VDJu8b1tPRtfBjoe3Ji0twQYHHSrOeLw+gi2qoS6cKAdNeI83+gx?=
 =?us-ascii?Q?RTRjGiaZydruvx6x3IQECTfpezxjNrXE6awvpdadOScgzcxNJBYS+NZ2clCw?=
 =?us-ascii?Q?WXPbthM8dBSN2sBe9ytNjElT6DPpoAxKtJZWeRX2IhO3/PNYK8w3mJOmPbIS?=
 =?us-ascii?Q?qoC5e0LDfGx5jx2viFcDkKuJZwXAjWuSZxuNtvsPwBgEXQGEJI3RB4NtF8o0?=
 =?us-ascii?Q?p/120C7glxslbwRiAIi8RfXV8b1fD8CuuQmED/WfdQQZJEXh6P7Vu+VLyxd1?=
 =?us-ascii?Q?VUy4LDcrieAfiINUPTRsSYJpPHP9sauadlbvdxzna0D4W/4qYnbNGegIlOHt?=
 =?us-ascii?Q?s2NoLQ5TTYJeZY5wd/sRF+WBpqkAO8QIoVubUG2LJ8XhC/j7VdN3hKSX2d+z?=
 =?us-ascii?Q?Zhut05IR2tyyoRYq3eRx3whfZvhjT247eiSEEqeYEUc/5sFn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c1f0bc-9f2a-4e5c-5c2e-08deb038f15b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 15:12:54.8810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Piq+HnruPQ7AyLpg1Qlmcm44DKzjzpwBfwcyP/CFvBuoIiYSJZA9Fl7zPewcuFIdhe6eeIxX9kUs3a3Ucf9n5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9966

On Tue, May 12, 2026 at 05:08:10PM +0800, Jacky Bai wrote:
> Add debugfs support for runtime tuning of the audio PLL K divider,
> which enables fine-grained frequency adjustments for audio PLL.
> This is used for:
>   - Audio clock calibration and testing
>   - Debugging audio synchronization issues
>
> Two debug interfaces are exported to userspace:
>   - delta_k: It is used to adjust the K divider in PLL based on small
>     steps
>   - pll_parameter: It is used for get PLL's current M-divider,
>     P-divider, S-divider & K-divider setting in PLL register
>
> examples for the usage of the two interfaces:
>    1): Get the current PLL setting of dividers
>      cat /sys/kernel/debug/audio_pll_monitor/audio_pll1/pll_parameter
>
>    2): if want to adjust the K-divider by a delta_k '1', then
>      echo 1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
>
>    3): if want to adjust the K-divider by a delta_k '-1', then
>      echo -1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;

Nit: needn't example, it is basic usage mode for debugfs.

>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8mm.c  |  6 ++++
>  drivers/clk/imx/clk-pll14xx.c | 79 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/imx/clk.h         |  1 +
>  3 files changed, 86 insertions(+)
>
> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
> index 319af4deec01c188524807d39dff92bbd08f3601..6a031d7cd031c8b5f5b01e5531ce54360724ba44 100644
> --- a/drivers/clk/imx/clk-imx8mm.c
> +++ b/drivers/clk/imx/clk-imx8mm.c
> @@ -298,6 +298,7 @@ static struct clk_hw **hws;
>
>  static int imx8mm_clocks_probe(struct platform_device *pdev)
>  {
> +	struct clk_hw *audio_pll_hws[2];
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	void __iomem *base;
> @@ -610,6 +611,11 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
>
>  	imx_register_uart_clocks();
>
> +	/* Add debug interface for audio PLLs */
> +	audio_pll_hws[0] = hws[IMX8MM_AUDIO_PLL1];
> +	audio_pll_hws[1] = hws[IMX8MM_AUDIO_PLL2];
> +	audio_pll_debug_init(audio_pll_hws, ARRAY_SIZE(audio_pll_hws));
> +
>  	return 0;
>
>  unregister_hws:
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 39600ee22be3066683b562aa6f2a8b750d19c4cc..59f126f35474116bdad0aeda59777b9eb7f246cf 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/io.h>
> @@ -551,3 +552,81 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
>  	return hw;
>  }
>  EXPORT_SYMBOL_GPL(imx_dev_clk_hw_pll14xx);
> +
> +/*
> + * Debugfs interface for Audio PLL runtime monitoring and control
> + *
> + * This interface allows dynamic adjustment of the Audio PLL
> + * K-divider for precise frequency tuning, particularly useful
> + * for audio applications.
> + *
> + * examples for the usage of the two interfaces:
> + *   1): Get the current PLL setting of dividers
> + *     cat /sys/kernel/debug/audio_pll_monitor/audio_pll1/pll_parameter
> + *
> + *   2): if want to adjust the K-divider by a delta_k '1', then
> + *     echo 1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
> + *
> + *   3): if want to adjust the K-divider by a delta_k '-1', then
> + *     echo -1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
> + */

2) and 3) keep one is enough, you better descript validate range for
delta_k here, which is more valuable information.

> +#ifdef CONFIG_DEBUG_FS
> +static int pll_delta_k_set(void *data, u64 val)
> +{
> +	struct clk_pll14xx *pll = to_clk_pll14xx(data);
> +	s16 delta_k = (s16)val;
> +	u32 div_ctl1;
> +	s16 kdiv;
> +
> +	div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
> +	kdiv = FIELD_GET(KDIV_MASK, div_ctl1) + delta_k;
> +	writel_relaxed(FIELD_PREP(KDIV_MASK, kdiv), pll->base + DIV_CTL1);
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE_SIGNED(delta_k_fops, NULL, pll_delta_k_set, "%lld\n");

generally, better also provide read for delta_k

cat /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k because user
want to check value by read it back naturally.

Frank
> +
> +static int pll_setting_show(struct seq_file *s, void *data)
> +{
> +	struct clk_pll14xx *pll = to_clk_pll14xx(s->private);
> +	u32 div_ctl0, div_ctl1;
> +	u32 mdiv, pdiv, sdiv, kdiv;
> +
> +	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
> +	div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
> +
> +	mdiv = FIELD_GET(MDIV_MASK, div_ctl0);
> +	pdiv = FIELD_GET(PDIV_MASK, div_ctl0);
> +	sdiv = FIELD_GET(SDIV_MASK, div_ctl0);
> +	kdiv = FIELD_GET(KDIV_MASK, div_ctl1);
> +
> +	seq_printf(s, "Mdiv: 0x%x; Pdiv: 0x%x; Sdiv: 0x%x; Kdiv: 0x%x\n",
> +	mdiv, pdiv, sdiv, kdiv);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(pll_setting);
> +
> +void audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_plls)
> +{
> +	struct dentry *rootdir, *audio_pll_dir;
> +	const char *pll_name;
> +	int i;
> +
> +	rootdir = debugfs_create_dir("audio_pll_monitor", NULL);
> +
> +	for (i = 0; i < num_plls; i++) {
> +		pll_name = clk_hw_get_name(hws[i]);
> +		audio_pll_dir = debugfs_create_dir(pll_name, rootdir);
> +		debugfs_create_file_unsafe("delta_k", 0200, audio_pll_dir,
> +				hws[i], &delta_k_fops);
> +		debugfs_create_file("pll_parameter", 0444, audio_pll_dir,
> +				hws[i], &pll_setting_fops);
> +	}
> +}
> +#else /* !CONFIG_DEBUG_FS */
> +void audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_plls)
> +{
> +}
> +#endif /* CONFIG_DEBUG_FS */
> +EXPORT_SYMBOL_GPL(audio_pll_debug_init);
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index aa5202f284f3d1b7c1b4bf65e2329831832b43a5..9611ab127dad6f23770c18e22e1acbe2fc22bd4e 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -487,4 +487,5 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
>  			       u32 reg, const char **parent_names,
>  			       u8 num_parents, const u32 *mux_table, u32 mask);
>
> +void audio_pll_debug_init(struct clk_hw **hws, unsigned int num_plls);
>  #endif
>
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260421-imx8m_pll_debugfs-246d0fbbb617
>
> Best regards,
> --
> Jacky Bai <ping.bai@nxp.com>
>
