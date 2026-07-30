Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA13921C0;
	Thu, 30 Jul 2026 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422801; cv=fail; b=AuocAS9AO0gRiyqWpxPSlsZXFnld3WmeUEmDrQ1yiHCY1KCsFs9teiLXMn/4kG3KKjxwWEBcMFagtV6UMWq/aH4z4kYe1LT6yHlhkQC8Y21EDt6AsJL58KSCJp7oeNosdpnKUPC7EmSNoRZGLPw6NBlXPG1/UefdfmY9t2C1FRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422801; c=relaxed/simple;
	bh=eXC/MJiJt2bniMiSAzfuiz/JwQi9BcGr+/AA27nMknc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A8Slf32+wKRkrrUF0VAWGRVRKQTrV91C4bvgHnMeoRRaAMUxqeISwwMtjjjxMxXXxoDRTzz3CwtBCin93rxZryGnhljhm+dPS6sghVEQvFLLJjFfsyUv4d2v36B+Kt6+Z5k2r3hRy95a/9E6zZllK3XmljXjhLtKoL5aF0R2cgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lS7uq1xr; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lS7uq1xr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNkPvNUXVWkojgVUe1Amf5wgPKyPgmkNGr49pSRrDnZV7Gsfz5Zk6Yy1kWj8PKH2BRfha210eOdQTJj4DoHAfhYXRycns9j2zxZDhFpF6rmsSHwr+2bOZQpAwiJ7zm3mMMTAFAbgqC+8LqPlL0qCPChJZRuDd6wkkcBB+RruxHnUHL4aSsciJ8tmo287fo1YiX1kLKB0pvF+bagElC5qM/8OJw1v6V3b3Kzx40LhD8sfs+vhH9AgezsLE4KyWS1+/p5Ns9AF3SMvmPDnvJhHZvyvfw77NxBIsqemd/+GidHFFpCO5wyy3zJP2SBcBaKqhXQGF7ArfoiQa5LL9CnNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4ahRdMc/Task0a1QlFl6Q1WaHpMIU3E1Rph+ytZRFo=;
 b=lOA6MW78Evp5DRrSU9a3hOXuGxjYbJHBDC20P9C7QewPr6sYJWosQHVPr4VJZQ5WFaspZQXXPvD/g/uG/zb5p6ffnMgp4WRnUjyDPurKie3P7GuCimBQJQoI84Mm/t8zrh8fLN94/O2jhgePF1VgLCCJn03RJNgw8J28DPykdjiRrQhubF5P7mUl+ddGN7KxH7kQnD4AMem/Ca7v/Gk6ANqNEgffMGGRkl3ze25Vrfj0rN0z2codth51KaDQNbb8eLZXvSXuz/DpLbLqHUuf+YYJy8xwUBarsTuO5W7PIrTZmOAAw6OqwmWaEsu4ije33HDnjtNyGun48YR2G0h/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4ahRdMc/Task0a1QlFl6Q1WaHpMIU3E1Rph+ytZRFo=;
 b=lS7uq1xrMSjvUI+NQ9QuK6kGXYG448Z2Cpd8G1ldWBM+38j0qkb6I/ESsfoLuSZmfKsG9AjjIMRpIpNCDDxQFRfXrvAHr9jAvvESYMfWCq9uI+F+48x7oPFgG9LfIG+m+VjCe4oumXkh7GXGNA8k5O3uYn0puKH+Q6AQi+4BYtnGpQWZr6s0yScRC66jwMyeudOchqiDJ7XjjSBsqpfG0G3Rf/atGVGOmHjnUzx1fUhHNtyYcwcs2UEYfCRiGk9Sieprox5qkyXPVqR4rFbKCTCqSQTV7zROzphc92YSN0A/4f/vqVVJ/sSrr8+uik4yoBJwX85xO2NVu3KGbQNF6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9680.eurprd04.prod.outlook.com (2603:10a6:102:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 14:46:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 14:46:35 +0000
Date: Thu, 30 Jul 2026 09:46:26 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: hongxing.zhu@oss.nxp.com
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, kernel@pengutronix.de,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [RESEND v1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x
 PCIe
Message-ID: <amtjwqUPTsOaKrlK@SMW015318>
References: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
X-ClientProxiedBy: SN7PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:806:126::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9680:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa5146d-6ed7-475d-aac9-08deee495a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|19092799006|11063799006|3023799007|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	rPNMrvlbWQmWuO2jtRc1Ut0pXglCJXrtQr/EDY/NS2AS8W6AyypOOZXERtPUj+3tWD2WWDmYa+p+BOi6bQ+Zyuki8149Q/TZTlJOzz45rrB0TXzWB2UnY/lpppYb63mfCwu+e+qQ3PrstRNJZvr648S+wywe6KWbunLTb2ZURbSNw7+qCLBIn+sK0viCpW3xkAskGOshCHoLbuB2CkrQjrtHfREEa6qtfmjYBouhIVMtIDWsoholfztdpSjcat+rMG6kBNvNLi9QF3JUGfu9l8jyrxIAU3RCW9WTLVnCIyekjuL5gYYpxuwKflSwCiiWAGs4TC8lzvv+xcJD/21iqQwxZezkTNPiZrFzLL8ihdXik30trRIe0d0bmeaZWEdjVqVPOKE0JmdS1GDG8x8eeWtPntRh+PijVgCDJFeCSrGVMY2UMFlMoJAaJg6vjaf14GPokRnckP6innxcCInssI9uXhddjOGocKuNBgi9LEAZqdYEWTDkTxAq4DO462vDXVBluztv3hzlXX8wGEJfUw86CvsSck6U548BXSMNciaG7F/bGM5XJRUIh01mCBWUquUGQTFBk5xfBNIwRZKaJQRj9JODXhaTYNOoCTtkqruJ1rOsjlVRNuP35A6RKPsz76eRQgLvyntOuv9rMhZQv7d7nt9tKKw6sSnMYC8sIrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(19092799006)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bJd4Li7NFrXe4C//kF7QdFW7O8Y9lNLi4g+p9cliZjpe/iFqaqvA3bQrQNEJ?=
 =?us-ascii?Q?vjHhVyOpoXkuRbCRcpUtKW+Otcm34HOhMaEO1Z/2YMOCWeqMmzQJGAvO6WuY?=
 =?us-ascii?Q?WAqqJ1WmHNGC0AEmhFvZbE6Ey520j1SYN3yKpGETm8JlN2c+gLEDfdybgncK?=
 =?us-ascii?Q?ji29QIFJmVRgXXEsm7tis5RGSeZeD/XHrX/W86FHVaDx11fht8Q+ri2cwMKc?=
 =?us-ascii?Q?BIHLTd/N0mjDlAww8OIabyyyRuJNCe3qiXucv8/5WNvrsq6PBjoVRqjYPUH9?=
 =?us-ascii?Q?4IuT8UEL9x0tAouyWV/+pNp5zIzIjYPQ0BHtYrt10y9AwjaZ0YndTEtBa7aB?=
 =?us-ascii?Q?7nxyEqo+bEnHfQ1WEq0Qpg36OYmas1IpIw6eDrIN8VW1fzYWWfYpoJJWQV7a?=
 =?us-ascii?Q?ffBFI1WjD7rjJK+5xvUrj/QX64GxQIQYH2SE3GqOCLOb8L7X/SJvdIYEtLIh?=
 =?us-ascii?Q?O6w8cljxggI3uuNrwNE2zQT7JCq0Pj32PhCVYZb0uflovaHZE9a1K5Dym42+?=
 =?us-ascii?Q?KgUQUBhY0AvBTQzVo10sShfE0yWu+VOF0saGZjPRCYAdoEUcbs9hYA71OgvR?=
 =?us-ascii?Q?TPDORtI/8LEqxiNxwgh8FGyuAI34Phix6abDGeFrD2oUbP2r3fH1qWjpVEVl?=
 =?us-ascii?Q?AuPMn/SzO3cjMCXr1uBhkOMIkRxPyaliWz19CWVXTnOiRCM8zQV0laslVVtn?=
 =?us-ascii?Q?bIBsQ8tNZbXdR1//AqelkDut/AfoHTOkRVmMG/bNJivma0LHzixmNpahRynV?=
 =?us-ascii?Q?9jyz6JS9rC0Eftm7CnGse/Oj1xPn9T69uj++SMV+qeHwoocdnisY1TnRPG2M?=
 =?us-ascii?Q?PDr57RlbeuH5oG67IH4sKHEoSG6trqLkbJ2dRqkltLJCuTMZ1Hv9iRHeave+?=
 =?us-ascii?Q?yByS3PK1Z4z9oVOCmTmNOgv5eRsd6SDEZgKU7KvuZutmHPNC4Phz0B13Ja3w?=
 =?us-ascii?Q?yG5LVgUpHexR5ok2HjDTpZ8TPdBpqsPw6Uy7dM2CgIhc2aEqG2bQrLZIKKvh?=
 =?us-ascii?Q?TGDVXZRJKKFuiTTYHilBiTt4dDPMSrBLb2c7AflrQ5Pyu9pc8ctUfNdduUJW?=
 =?us-ascii?Q?KyrYNtIaQKxbX8U6hm+p5TU/TJnSxplI9tI0Qon3eTZS4W8tFMj4Y/byhQJM?=
 =?us-ascii?Q?wRcSB108QOoIXM9ylOtw8SiZL+b49GvLc5w1j8/TkvoOQVSpTZbTLav+Kfod?=
 =?us-ascii?Q?AqhyfObEdsLkNflkcYq1pUY9gEqTNNyCb90oG38OWJ1XHA6FSiCaipYKwXus?=
 =?us-ascii?Q?0e6UJXd/bNlOTa6bmfC2d+7UHLmajDtkMk959baBukbnzVqCj+QAEmzwRtb1?=
 =?us-ascii?Q?TbEtTdDVXAiE17OkG+vJJ4RumjBR6jO0vo33/kqeGPv9apYdWHHax/qZi0h1?=
 =?us-ascii?Q?glUekA7roPdjh1470APRHIuSeCRdPS4J9a70wL+j+8JGxZs0oK4xngNQoFAx?=
 =?us-ascii?Q?bMc0nq/uYEqr4OCDkQypEK18J9CNsYqlPv/vQQ6YkXyPUgrCrlQx0mVJVOpm?=
 =?us-ascii?Q?EtPN2IhYi5XSHaAaT1l/+IwPRM5LRCREarFp5SSx6LZA1cOpy8odhYg5gAud?=
 =?us-ascii?Q?dqVf4qrM8GwVj9gz3E7Gu0rh9M3xDZJhYXiOTT/V+JqV1SVb771zZYaUIQM+?=
 =?us-ascii?Q?xjDHhtRaNc8gQ7tN71bs8ScWOGUSkOYFTYbwNn/dYXBraS+0VIXQTiE8WpCA?=
 =?us-ascii?Q?KHKB4z4hZnmXiz0mBhCiY7wK79ia0te32TmxKewaMhcSfcV9jXAKQgcQCEtI?=
 =?us-ascii?Q?d4sv9A1H4z8WJDQccPPBLGr63nQXr86faZAseNdL9sHC+7lqPEEh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa5146d-6ed7-475d-aac9-08deee495a9d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 14:46:35.6489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXRgQAvRPZfpWHFdkb+7u3h6BYkzKw2AdvLpBdwUDqlTo5LBlEG7stjjMAluFoRqb5dXaKL89/IyL5TlKR++ov3L0c4rjDnP4nQ39SAUntPOWZ11cDje8vrkVFGLx6sX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9680

On Thu, Jul 30, 2026 at 04:55:42PM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
>
> Add a func_out_en clock for i.MX9x PCIe to serve as the parent gate clock
> of the CREF_EN (BIT6) gate clock. Both of these two gate clocks enable
> the output of the internal 100MHz differential reference clock.
>
> When the internal PLL clock is used as the PCIe reference clock, both
> BIT6 (CREF_EN) and BIT2 (FUNC_OUTPUT_EN) control the PCIE_REF_OUT_CLK.
>
> If these bits default to 1, the output clock is enabled. With typical
> 100-ohm termination on the board, this results in approximately 6mA of
> unnecessary power consumption when the PCIe internal PLL clock is not
> in use.
>
> To eliminate this power consumption, add a func_out_en clock gate that
> serves as the parent of the existing CREF_EN (BIT6) gate clock. Both
> gates must be enabled to output the internal 100MHz differential
> reference clock, and both will be disabled when the clock is not needed.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/imx/clk-imx95-blk-ctl.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> index 56bed44719954..1f9259f456079 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -286,18 +286,28 @@ static const struct imx95_blk_ctl_dev_data netcmix_dev_data = {
>  static const struct imx95_blk_ctl_clk_dev_data hsio_blk_ctl_clk_dev_data[] = {
>  	[0] = {
>  		.name = "hsio_blk_ctl_clk",
> -		.parent_names = (const char *[]){ "hsio_pll", },
> +		.parent_names = (const char *[]){ "func_out_en", },
>  		.num_parents = 1,
>  		.reg = 0,
>  		.bit_idx = 6,
>  		.bit_width = 1,
>  		.type = CLK_GATE,
>  		.flags = CLK_SET_RATE_PARENT,
> +	},
> +	[1] = {
> +		.name = "func_out_en",
> +		.parent_names = (const char *[]){ "hsio_pll", },
> +		.num_parents = 1,
> +		.reg = 0,
> +		.bit_idx = 2,
> +		.bit_width = 1,
> +		.type = CLK_GATE,
> +		.flags = CLK_SET_RATE_PARENT,
>  	}
>  };
>
>  static const struct imx95_blk_ctl_dev_data hsio_blk_ctl_dev_data = {
> -	.num_clks = 1,
> +	.num_clks = ARRAY_SIZE(hsio_blk_ctl_clk_dev_data),
>  	.clk_dev_data = hsio_blk_ctl_clk_dev_data,
>  	.clk_reg_offset = 0,
>  };
> --
> 2.34.1
>
>
