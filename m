Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3BB37E302;
	Fri, 30 Jan 2026 17:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794644; cv=fail; b=Ao/EBtcoG5REWIG3dF3PXF5/tiNvxiMqEvNojChWAcHzTq7t/8BxI8yrp+KmWNid0nJphqJK2Y/7CFvWyo89gkcAij8xPQ3XKdloFHKl0zv0BTcd5cAuJprJaHOuR82YDmpiDlO76G0+AsyGYy6Tt8/bOWGy+jYYcoFH0EnTuHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794644; c=relaxed/simple;
	bh=deLYPZTBCS+dl97AlyKaKsKzgvUJYPXEK9SLAGGrLoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GKvMFGucohzhTEhdI3RO0JNIbGwb7qV7PHa5MeDw5kTzJo+w1EhnmM4GmEfNnhRY7FSeBhDOHLjvTYg0d6Iwq5XhYbFby+XWk+km1U61StM+TtRnuFKzpQURQ80eJYaidOE94TfQwxzTpB4WBHWk3aKyGx3pyzgvTbA+bg+96PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IM4W4ZR6; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IM4W4ZR6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DH7up2jycVw2EXbY7SPvwfy2mGginxngw/Yd0cAlrNd6V7bxb4XH4Jrc7KqWn0Na12ucV6Q1jqeNfWLSQ/6WIkPegqWJYn7uhLIelUQ2w3vZVQW8XRHboV3tvLzem1B1FFGJ3UoHGMYH7j6Z6QFgzTRLRz0N1GmHPH8m24c44O/HwBEd6LO4aufkRZZq36MYonvVeLJQDf2aZx5wGqryJM1melufVj0c9OoaAOAoJlaAx6GTaW5r2hH/MEML8l32j6VCohP+hXnDoyhVa3NfrJvIwIE3Djd6ZO+RbSzO5ZgUbrGofrWSH9e1FIkFHBk/6QtMoBG7InxQxzXlUOV1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sQx7V3tfd/kf/VPNIA5OSHZXgETARbGT+BXXb57bmY=;
 b=m+a0IhECO6zmYJmBU0hqvWLzHV/ayztfBiZOwffVnMDN0OlIvfANz5zfJpsx9+vHW3eeRwPAVcHPgv1py/CBxDH5xpUBX7dmHBz3mn/T+7Sbu2ZWuW4VkmEIZUxLBrWf0/MbVYbygaEduT9kg7DEzc84AlhuOR9eNm/+MAnFeTrzPH5IQ3fo/iqKN2W7Ua/q2C5x98RbKYRPxVY4T7vN1yaYdlhQURXZvqBoEbPlC5j9pHhRc7rGM3ggAQWEUM09NP9zL4f8WM5LRiy8uDDzyTFPKBPliKlTx9Vp/9CPFRXJ1rc3EeX/Ie3q0WitpTVsPTSp0A/Kyeocuqiis1pu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sQx7V3tfd/kf/VPNIA5OSHZXgETARbGT+BXXb57bmY=;
 b=IM4W4ZR6s71+Qpr6sWdJ7fiZ4EAaPuojnXR4xQPnG6cXipQwOSkR3qLQEhAKh3jPENAwL9zVWlLvYFVusgiqJIzSFU8NCwPTuTi59AanUZttmaTTz89DCWs2BblryEwE1qTQnrvgj04orHTIdnqSm4OniU2bWyI44pqGI26nHHqL3WtCFdAI+Ty6aKwLvqQe6wTdGLNpzgJpmXUnB0w/nF0Jtj3kkNbjJaERySCkaIFkaClUDwZBxvFqy6VqwxK+5S0i1unfeqL2smkiNoooAKB3acqf5BRB/3BxlTR+zV4xil0+bsKkYRmkaL31VKCdL6WhZZTE3erxLcln7xICGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8363.eurprd04.prod.outlook.com (2603:10a6:10:24b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 17:37:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:37:19 +0000
Date: Fri, 30 Jan 2026 12:37:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx6q: Fix device node reference leak in
 pll6_bypassed()
Message-ID: <aXzsRreLzaCB6cVd@lizhi-Precision-Tower-5810>
References: <20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b4ed81-e887-4c8a-f091-08de6026379d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Xl93n7b/cXC9nNyqz4nQjOL+XIPLW/ybULkTlFG6PTPVHZQH4Z3hef7eUjE?=
 =?us-ascii?Q?+NBfelTus9bv3IEjRJ6n/uVcpMLPUX9n8wP3Ic90zbFQa5woJqoQfHShkGXa?=
 =?us-ascii?Q?DSjGIMKsJXOsiaYDkdW58Rkim+OMmg3bxXRFGUNxQcb8zjD6hP67HmKJFtod?=
 =?us-ascii?Q?Z60y80M6BHMxo9/tEzsnzsYauwzTTXu/Vc7Ja1DiG14ax+G2iiMfi8LE2ADt?=
 =?us-ascii?Q?weQRVaQ1Yq7PUeQ5EazrP0mzhj3nLs/M4TBRVdi7ntkcIweYG74xbZgx0cGU?=
 =?us-ascii?Q?uyzAse/luMqvp5nhZu/MTDv4yKc/DB0N2kiuxtxyhFuAGnbyl890hXeiIgjT?=
 =?us-ascii?Q?UkXvR26lk74MwU+fBGJuYn+ruUCrk7fMBf1/SlfP3w2REyS7IJk2SGIv+qnH?=
 =?us-ascii?Q?VhUSwxqo38u4AXxxavJiYR9xU6Gk/fZ56wTCsjapdEVyAj78K8Gbv48tEwJE?=
 =?us-ascii?Q?Bq7x434aBGHz7IdJ9gVQyBebK8Vmetr5UNxKHr2DCiAeJPRSLyxDnp0VDJgS?=
 =?us-ascii?Q?kDX+4pukzisSFNbMy9zWMAUiG2bqtHKVdh7GqbRG/ppPGBGS8rxi1TZDiTl7?=
 =?us-ascii?Q?Gzd0uXUliPNj+XFX2ytDdybto3smwg+zui5WpUCoYxV2jF61TEQRdd3MOLQi?=
 =?us-ascii?Q?ZBsXSXYVDZel5ssHVo8iPH9ETOZ3Ldr3K5c1Kcy/B8fFEGOwyiq5WPuvDyd6?=
 =?us-ascii?Q?1ZUQ+57IFJwpl07qAnCk40QrhX6Kfwp9SOinz3omLgrdms8sKsFENWm/bacN?=
 =?us-ascii?Q?xSHAI5FO3NxN9GNU2WIuFpBWvvFYy5O6uRlPxWaT6EatDt/tIcz2DNxTMLZY?=
 =?us-ascii?Q?t2wh8BEUBV7ips9NI8MW9cT9CFSqzySCcNz8dTGzkPrnIWa5WFVpekRDqASH?=
 =?us-ascii?Q?sc3+dqW+KPtpnqjSYSZpnmngMtKnxM4lRkIyyF/1Uo3uA5MN30jbAj9PF5jA?=
 =?us-ascii?Q?S9EUkR7W1lKRRBNmMjO6ZxuGlwgNNBRuEqTnldYpo+b6CBLyLb/9yJdnZplz?=
 =?us-ascii?Q?QCVTMbEhk/OLbg/IWpApMF5H3kyZFFx27PjfJANfKUNw63F6/X8kyHQWwuTJ?=
 =?us-ascii?Q?Dt8ht1ZoSXMppyZZFfLY/aVBiD8ttpIlNtBXKTW8GT3UZ5TBg4xkXetjCyBM?=
 =?us-ascii?Q?ZvQbFzEogSWPBaTBFWhnxBSu8qNb6FRAcFLm4+SSZmleLJCfzt30y80/8sOa?=
 =?us-ascii?Q?/tLObaEKfHf7SuzxEvYmgVlkpbZeQ2rsIItQOGT5M/Gmd3iVoPgZ5u2bHRz/?=
 =?us-ascii?Q?zsxnEQk8qvQxqVJmxWtET8nM/8CCu4p9pQ891c8kQXovXi4FjwHzPhu+Hxrv?=
 =?us-ascii?Q?iVxsuezwissbNETItR2vyldFL1YJWb+urm9MS3lJ/Xy5ytWuxjfr1bWSAc5Y?=
 =?us-ascii?Q?njgOu1wchUd26yiuNZryw48LpJuovhnJNIp/wSf6iwxgxjpikG733H0+fniI?=
 =?us-ascii?Q?U2GNDqoGRGxur0qjsFM2wJ0YIDrK+zP8CZvDGXVSkdZpB8vSf+VkH3Pf5I2x?=
 =?us-ascii?Q?1kl3L6AegyZCaLuQxh19MvJRO4gVn0VpV+3W5UAKY7QaX9X+2Mt05XTpW+Zj?=
 =?us-ascii?Q?g5FqcTuRHRwzboxAKS1H/fVuTABth+iaTucyD10pDkH9xy7XuIskfR0cLBOP?=
 =?us-ascii?Q?n/idRjX1sGdGikqmhB7ipqI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RRA2bjdt4yb/syq5kMNFJ8RkLFRQPfMJrGqxVJil9+XLb4/bmNLNNVQjkKAU?=
 =?us-ascii?Q?A0LdIlg19udPmJnqcTJPtiP5233pZdSJLLZ8YZ/74PRpKnnEOdueXjmnP0Nt?=
 =?us-ascii?Q?RKD/yaFpoKVogpQ3OI+kWjQK22AyR8ILqQigf3s8JDp/MCDTxu8xcDhi+OCo?=
 =?us-ascii?Q?+mML4Bt9ossVRNpUwBmKg0ldpCVy33DjpifmQtQkIrCoAJLtL+I7+mtOFYcU?=
 =?us-ascii?Q?3JJb/5bhQK3zyNRYP6sL/BdDQc+rBY7IAXwWi57hvaxNpgby15QMYMjQ/1Mo?=
 =?us-ascii?Q?V9+O3ubUpOfPE9kMSFNa0bYaPO3XzblesO29tN3vai8JTsRApA62kygGZwKP?=
 =?us-ascii?Q?g4v+CFs92T+huZZrGA0ccE4nBeFqX/7Omw0wZyuyyvPb7O+a00EMLioW8F70?=
 =?us-ascii?Q?Rite5LRm1vYG4XWR7+HIgr51J7rl+S4Swi5wwppFqwHrYOCSPI7tyQHXQ4Ax?=
 =?us-ascii?Q?Uz/c7PIEw92mtUp4H4UT93MoiCM7/6WEwUpopnk+I/gC4ZU53SyvkECEd1yq?=
 =?us-ascii?Q?fpjBkzdcwn7rWEVqswAIZ14vxZnO/anMVnr9umu8XlmLBoMtHLFvG884AY0f?=
 =?us-ascii?Q?SJIlL9aBP+zwOY40RoEDAQjX0B6nxdkmbms0XKQVFhS0oexMBrlUPsjMhP2M?=
 =?us-ascii?Q?0ktPEfWNyZRPUQ/Jz3R7zIX4EGd1HZrbPMViURcqL7VNQ84rTMVxUMAy0XGm?=
 =?us-ascii?Q?HHlo7aW1qBIBJL5JI2DvySCoAKgoi52wjXZnHVxLlpU0sSlH/43NbokyBNH/?=
 =?us-ascii?Q?qD10c8sC55dZWfIfaCbsvW6DDKuc/fK29y0G4Vyf/XAmrVfd8jlxS1qTusk/?=
 =?us-ascii?Q?S4ZlfAcfYyRQJYaIP5vh+xHbiQ7bZ6a7OgmPiO93Kr4i82Za54J3MfpKrKss?=
 =?us-ascii?Q?K8zK14t1+Aq5DI3PewFWrKWXPGc5Zwt0Q7FZznhSLIzjEhT6fwxn6t8wWEMW?=
 =?us-ascii?Q?40D3Hpylvle6/SWgXZ0zqHSaEuPfA2iZuTgyE6QcgbunkND6S50ObQVxFBJg?=
 =?us-ascii?Q?6k5IM6VjXP/DpRy4oWtYxUBSK3ydv/3ZC/JwbrLczQkGBcilktriQP08xmIh?=
 =?us-ascii?Q?ET4vNReDOi8KleCKC5uGH3DyT1rSfywjuarPM49a/b+ublpy/ZAym1r9lakO?=
 =?us-ascii?Q?O/ubeTOYGF7xAQGNLpASOCGVoI621AIM858TmU69v+caz7X3t9WCtv8X/HUL?=
 =?us-ascii?Q?QI6+lThNEmRjT9b5FxofrxjuTSdlUL0dUf9VQQzmtb/CwYDXT1zdOgf7NGi7?=
 =?us-ascii?Q?MmStHx2WGDZme1c7s898qQRhXl3cpP36GDzqtUiUEHS4djZzudtYrEyyaWfx?=
 =?us-ascii?Q?RLq/4+PMkttHO3nkVXRhx0ALsI7UMltFZJxYhxAi5p1xM6bMl0+0aGEtR8e3?=
 =?us-ascii?Q?xP6ZA06esOtJdPEMCVlGAEXmvr1Ne/A+snl/ak9JT+NkIuDzwnhhZb1GBOrF?=
 =?us-ascii?Q?AW5kcSisn4LnCbJtvtKS2VELy2sDbttPi+i2P4HpRlQCtBsOzAtVnpa+ZSRZ?=
 =?us-ascii?Q?X9uSTBau9OeQeckLZS8qE1XY0TftzR38c0Ne+77YMSSff/2Iu3PVjsNibrP2?=
 =?us-ascii?Q?vkxkUE9Gy5L+9Zm2C5ujCaZobfj7IGQTsyNP+TG6WTfoRXmfyg+R1m+3OsdF?=
 =?us-ascii?Q?W9yE8/EPC/SDFu3VjLO/I/AGEaDE6UEucJnhEci+CmhY+fqXSCUZUnxVwqVs?=
 =?us-ascii?Q?KV9luIT9abZWTKpkSc0YFnnr1pl2Fp7gmybf2nNMa0PdOAxF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b4ed81-e887-4c8a-f091-08de6026379d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:37:19.2925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEq0krEjQbivqHpRHPIo0C5XX2tmf4YD9AOS3siTruU/+LFoBuw0lDZEMVv7JMogfj60TX4hQWNU/SNK0I/hnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8363

On Fri, Jan 30, 2026 at 11:56:28PM +0800, Felix Gu wrote:
> The function pll6_bypassed() calls of_parse_phandle_with_args()
> but never calls of_node_put() to release the reference, causing
> a memory leak.
>
> Fix this by adding proper cleanup calls on all exit paths.
>
> Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/clk/imx/clk-imx6q.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index bf4c1d9c9928..1d8e8f0891a3 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node)
>  			return false;
>
>  		if (clkspec.np == node &&
> -		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS)
> +		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS) {
> +			of_node_put(clkspec.np);
>  			break;
> +		}
> +		of_node_put(clkspec.np);


I think you put of_node_put() before if branch

rc = of_parse_phandle_with_args()
if (rc < 0)
	...
of_node_put(clkspec.np);


There are more places call of_parse_phandle_with_args() without of_node_put().


>  	}
>
>  	/* PLL6 bypass is not part of the assigned clock list */
> @@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node)
>  	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
>  					 "#clock-cells", index, &clkspec);
>

this one miss check ret;

Frank
> +	of_node_put(clkspec.np);
>  	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
>  		return true;
>
>
> ---
> base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
> change-id: 20260130-clk-imx6q-9c4b8835fc26
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>
