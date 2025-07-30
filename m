Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E811D54EE
	for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753907860; cv=fail; b=UDIdmjzxJgmTUjQcjPnXziwZYNZMGYQwzMxyrmeUhYfossgDsQddFxiMWNQ3xx05FQb+9yfU0pUnYHjmV0+oHdKedhdHoS3j82ZDcei9Hqscz+OJk5AGOSsQBXgjy4EeGypuwnXCW06EOd9BEKdxuQET8X3q8OruhlKvYiJGDqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753907860; c=relaxed/simple;
	bh=7F8BO38waVeaG7/4/thyD/jKyKs/iOrDpZb+5dziskc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AlKEX2HCuIXznRxRQUXTYIO7+BiyVmu2mqkwzYBos18on35HksQ3UnfHBDNuZTgXoEBA6AhwspVIKrMukhoHacpbiEt/y6A8r4S9Pbd73LCz+W3kxKSsLU6w6Sb/09caGMsCO8IPueMvYk3gHK8MOKI7uVgb3HT3Ct7G6Y6u/io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S0QzHpAi; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S0QzHpAi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDgmJBCTkATlJwNQqW98677LebIL4jdlwuPWmxiSkB7Xk0ezIrQDZVd4x+SiO/jnLYXfmK9PXgJ6VTQUZJI+mfbKlu9iLQrt2kLuWhgnTKKBu7cvwEwhv1vt753fvbcJDzcQgqBfBgwpNN/ZaIRvZMqvgGGrLOforzeEw9DUKvR/STtL6zyKROJZWWN2VHCALRiRUUXFNA8qtIE9CAFNd88Q8oUDaFIHdIrAx5YHaZf5LeSZKROb/1vVfXcCQT2zP0vXYF4IwAZ8TrsZdnA9k2N7lhSY7zOj2gobuR6cN2eE2qn78+esz3DrrP3z0oB91VxhPEmsrXJC7byvkn6v3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I/3OO3ptfvUNtWZMBp6onIXxNtHdVhAORh96c9UTYY=;
 b=XVqGQDcxdrBtlzIT7D90CdbAQWP395Th+bei+uPt9ujOwDpiuRxdKSo/QPCcFqkOwFFnpHHDXEFlnqdmausl74AUI1IyOj9XnTuFXKS1KIX0OAShRemZFFeoAbG46zAKj8GBDp57uqjgRlzBUKLYC2d+qKkv8b8F3zH9ZTTSX9Ix26WysVShw7KHO1r83Dzf2+4vYBVn4rKBCgVuMvy9dkvm4icMpTgo+JKR0OUJCEYiIUdJUzGvFwqn+uJBV1Mi7UMdYAGd3vjndvKtne5Yhs7fZHDye97N60noFk6dgEsFSCkqX0yIbwqJ4Mby4Ov4V0MQgmqCK7nCrZPrh2DyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0I/3OO3ptfvUNtWZMBp6onIXxNtHdVhAORh96c9UTYY=;
 b=S0QzHpAiDETsDPaDok5cSbqrYY/LIyCGfz1GkTOapJpPBULdG6wVzKaiaz2CFMfM5UHFFFL4TU64dcP0U30yWZBguKq0r3NVgAUx7VBRgEAQES2f+QLivy1a+o1mT/yAMgulDwqbSFnYvrGRFALGhz9+Cbmc++J6h0DSOv4RHX+KXgU73OAKxD05VkaafewgpPAf1m+0kaIaIEE0yu7WK+3c0D7idwDJvTywLihKrgYWVS9+JVZqXESYQBC8hcbckPMpn5hLq4HOoh6qGzZ3VIdhbq16423vGw3Z+PHZYc9b+3RrkkDwdTS0zIlezvwRP0bbgp4/NA4Hyq3FxnGkDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB7071.eurprd04.prod.outlook.com (2603:10a6:800:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 20:37:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 20:37:32 +0000
Date: Wed, 30 Jul 2025 16:37:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] clk: imx: Add some delay before deassert the reset
Message-ID: <aIqChYG0c2d9yCEL@lizhi-Precision-Tower-5810>
References: <20250729033817.1239646-1-ping.bai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729033817.1239646-1-ping.bai@nxp.com>
X-ClientProxiedBy: PH0PR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:510:e::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3cf795-4eb1-4bd3-025f-08ddcfa8e8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ioJp6mOMQpl67sY/o+kfDq6SGVAhmPsCu2iaBk8J+ghiO0wwLqrwsT2FleSk?=
 =?us-ascii?Q?no+FlUPipZ7wIF1vORPxXB9EDTFxV+6AL7AUtH4VaeWT3vBbbLroWnm+VEks?=
 =?us-ascii?Q?XYEQFNZugXF8ymIb/gq0B2zVethKnVcg3VUWr3grnswN5K14wNS4ZieWCFg5?=
 =?us-ascii?Q?Q3Sgzub2trvTYuOeMmH2UBDg+071ioDqG8OakMElxMMD1oNLddHrC2HZUTg5?=
 =?us-ascii?Q?K+D7kTxBcr9FaKLcpJf88e6nY4e7+jIBQ0d579FpfYniSYJi/c2Qspj6yW0B?=
 =?us-ascii?Q?RIPeABvUcCtpbF98sV6L1EL0syAvphlljUakn84z5bwd3ao0SZbPJ9u4fyQg?=
 =?us-ascii?Q?QkkpFusC+W0xVuxohcD5UUFLfE/84tGLGHb5K4o2WkS1N9ZuPFsZNfA5YlqL?=
 =?us-ascii?Q?nxLPsd0lGwB80Yq99XU1sMB17HfrDezRQ3Jzjca5QEv0fJfwE7c4qD6nB8pP?=
 =?us-ascii?Q?IvJTB0Ps2ZXyWH5aqkBMh0vzF1RdLdSQW5Z/K7dEf82G9stfEhxPhZjv9KKo?=
 =?us-ascii?Q?3JKdVf6p37jEJQZsobyWE/77fzfl7ZPsdruhPzEDUDYjkzAae73Za90rfFlz?=
 =?us-ascii?Q?t/w43gV+G7Oye88Tne9gpTMQymWx2sqm0qj3vBFvM8ZszRkCj7wOBTRutaie?=
 =?us-ascii?Q?fQ/hWd2nIQklcymO67IMdH35vYHw20NVTRjrz/xS006MGWQsdDNt1Intzr1o?=
 =?us-ascii?Q?hVraLWwWEiwPmaJ902TzSvEqLSV/2++7r042N2IfrLevVOd/X+N2elDKNigh?=
 =?us-ascii?Q?nko7Zd92BqY3HV6RrfNlsShWMYt1e6GMxik9xmqHiO7LDuSXk5ffFj+HqlGd?=
 =?us-ascii?Q?sIjLs/9M0MnpxwLss0LFDyK0pz7BheeUzkNXTKWqg9mTTLlZTTo/jT/iLGZc?=
 =?us-ascii?Q?nYDIT5TBWBAZSVKh55mxb1c55qScZUP6FcSWlXF6Y7OThLb1GrG8V7MWtiwM?=
 =?us-ascii?Q?cH9b+16CYknbPVWcwHYjiZeR9O8CusV9nbuNjcfrT7CDXKWMv5O3Mo2fjzwN?=
 =?us-ascii?Q?xNgPjV5vZLDZ3PGkdZyST10u+oQtUMlKaKRHicwCjXX07Mf1DFJLOHg/6emc?=
 =?us-ascii?Q?whvGuznLLL7Fh4JP6CNptD5KA86OPUC2C96BWooLJPyDjkZj3BJK/6xE+c76?=
 =?us-ascii?Q?TOv18BGmMd5ow0CbT7ToAQA5gbEy++6mkl12Pm3nI+fk5Wh20JcAwi0wCf9C?=
 =?us-ascii?Q?CHIz7KD8Df9prN4RyL4Uvw9EBAf4nOSD/k4/mtmaS4JL9y9sD+HwYXgbkzM+?=
 =?us-ascii?Q?/sS5WuJlVkvhQAA+OAZ7DQfmBnRfUzT2EMA9fQns6ZqHQ6ppfWFH8TAcUJ0K?=
 =?us-ascii?Q?jzc44egh33Y6Ig2+E1CJHmudN/+HVa4sQ4i5hOfT/VKwl/fjlPPMxpa03sKb?=
 =?us-ascii?Q?kH4FgHgRL4ir7kbtbV53aRUZlfS1LYxNoA5/XVwcXSgtGg4c8pOJIYsoWCp0?=
 =?us-ascii?Q?m8D/363gEPTiujSVtb90w64KtfbgbE1kEM6aJ30hPSABm1eJ8513sQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OcAoh6hN6mrSjxl8kEMBm9uPrd/aw0l8zoyqPmpmlt0+dz+wupyS636dL54s?=
 =?us-ascii?Q?XZMCZ5hIvBMkaHIV+wTkBs7c3nL5qQLBD3mrvKqNDdhNj6oXkyNmJPErvhuR?=
 =?us-ascii?Q?ABomQvw/ReMChbekz95nT7mExmsb7vk75y7ugdTOx/PZawMmpzuITBX5apZt?=
 =?us-ascii?Q?v+8SJuLS1LK+B+6eGVSa1mG4dZVCiwfFi4scWKo5AqFzSA2m9Y57knf8eqrp?=
 =?us-ascii?Q?CIxU+uzEMMSPTyVrI4OAgubfLMGb4PApsHX/i6OsKGBudsQjmPqD+IAMXeu6?=
 =?us-ascii?Q?JxCQ8RLfLD6PaaU0OUpVjL/CjDiluXSwTQzgHnWYQzDcuZUCgsD9lccUsmCG?=
 =?us-ascii?Q?D91/0fqFjBtcu0NHfWg0hXEJmKVpnwxijXUtvjdSFOAgxGj8NUeFj03K7eGZ?=
 =?us-ascii?Q?j4Ndk88TFLxmw6qQv+POCSjRQm3rcHmCAdPx7aL0XKgt+gpWK8EFKxFKMJGq?=
 =?us-ascii?Q?y/e3qatQzm2AiKxONQ2ZXAVns58MYgIOUS1PX+IVgST/c2K2oqmx+Pw6XdRH?=
 =?us-ascii?Q?ezpv1LzOX/6fJhIaoyK578zrhwYrmvToI4fS7hIYvN+JMY0MF17T7ycTQ3bI?=
 =?us-ascii?Q?xHvM6Gfo58NrCKfZyA18B/obWbLVLTkyNvFhAiYNcZKG7ZMe0FL5e1yL1CuX?=
 =?us-ascii?Q?U6C79QMpK+N6lYbZbjELmdEL8dzib6e1PWG1TejZZIPWxp+PqZ7g9L7t+JrB?=
 =?us-ascii?Q?ZPUsa4LsLnOtj2LUB8cf2jJTEAU7YcDaJDPT1IYjXVTHPS6ccL3d/R4NnqeX?=
 =?us-ascii?Q?8b/wCDEfrbbk6WZSWu7kXC5d9bNrlsMIQs2MMb7+tOOshaSxexDsY0mIuCbI?=
 =?us-ascii?Q?5QwKYevGbIlU1OonqzaZiUV8btFbLQEQvfKKMTdYU6/qxp25coHJOGh6g+io?=
 =?us-ascii?Q?IV70b84hJ47tlROPZ0hNg8mfTrAze1IMDeSLB3AwoQGJIsl1ixw2snh8tNfe?=
 =?us-ascii?Q?bSiW4iYbL1Zt2OMrQlDfCKdCAPwx7SoDVaiuQdWiKCBdAvLniLVxl5ffrgg2?=
 =?us-ascii?Q?an8HD1VcqHPGOG93J9Zfimp3FbJHipwW5yEcGd2mX9pujPX2Ze68rhlwJ18F?=
 =?us-ascii?Q?/oRzwCne9TyT5g5AC9/QjE1lgpbDkplsgYZbBBlUSvOQnRZxi3PBbYJo1mPF?=
 =?us-ascii?Q?VJx5nF82aLFX44rFIEuTsfDAgbzS8yWnJxHUWSSvJdCbdBAhUDnBAviOFmxM?=
 =?us-ascii?Q?w2Zjv2Q/TKjaC+hQZBoFoDSYC5ncDE43NstwntjcBOsN2fTs29lteLOPCXAp?=
 =?us-ascii?Q?F4bLkfWrvbl/R3B6R7bICHit0f+G+lFZkAYASCDBuSSzo2y/atuRamFk2m9C?=
 =?us-ascii?Q?7kUE8Xn1NZA0voI94j0FujHPJAtyW0J9Xz54YfYLKTW3K3WRvxIb5zUxKjCX?=
 =?us-ascii?Q?8Xa9AquqbP9HwuZXJmcNZbpa+6j9NDFPSQ5Om7SLiXCwLoQUHNMMNitn0D6k?=
 =?us-ascii?Q?kOh+e8LmNkEq9Mi8kSl8WU/M0ZwO1xebV7DwpF5pqmA4ECzctwecQUiKcJu1?=
 =?us-ascii?Q?fF7PcCB4of5gpKzscpl1tMku2tnjOt8VxcLM4Bnia+V3po27s2BZoZIEnpxy?=
 =?us-ascii?Q?XZdtZs8Q6c36R+AYb/Y=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3cf795-4eb1-4bd3-025f-08ddcfa8e8ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 20:37:32.3562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsIPUDn5m5ABXdN0XuevtG/qqjmQ3UrKPfRqbg50cGUGLXkhHtjpiUmnNCRUacc5oM6SgLVlSfWpwwcRgSr57w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7071

On Tue, Jul 29, 2025 at 11:38:17AM +0800, Jacky Bai wrote:
> Some of the PCCs on i.MX8ULP have a sw_rst bit to control
> the peripheral reset through SW method. For peripherals like GPU
> that need sync reset, some delay is necessary befere & after release
> the reset to make sure the HW is reset into a known status. So add
> some delay before & after release reset.

Nit: wrap at 75 char.

>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-composite-7ulp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
> index 8ed2e0ad2769..710fe4f84465 100644
> --- a/drivers/clk/imx/clk-composite-7ulp.c
> +++ b/drivers/clk/imx/clk-composite-7ulp.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
> @@ -36,6 +37,9 @@ static int pcc_gate_enable(struct clk_hw *hw)
>  	if (ret)
>  		return ret;
>
> +	/* wait before release reset */
> +	udelay(1);
> +

It is quite small value. udelay()'s implement is not necessary to access
MMIO register space. (arm64 use cp15)

writel(val, gate->reg);
udelay(1); // it may less than 1us as what you expect, because previous
write have not reach target place yet.

It needs a readl() before udelay(1) to make sure value actually reach to
target place.

Frank

>  	spin_lock_irqsave(gate->lock, flags);
>  	/*
>  	 * release the sw reset for peripherals associated with
> @@ -47,6 +51,9 @@ static int pcc_gate_enable(struct clk_hw *hw)
>
>  	spin_unlock_irqrestore(gate->lock, flags);
>
> +	/* wait sync reset done */
> +	udelay(1);
> +
>  	return 0;
>  }
>
> --
> 2.34.1
>
