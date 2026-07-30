Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA483A641D;
	Thu, 30 Jul 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422705; cv=fail; b=Vzs0ixuNwtL85mp3oRzna0JDnR5FWVYEjKkFtsrbxVE8S5otRJwMl/Tz2EzWd1gS0PmefT6/30S3A+pdIJyeq6HoWyBWk4Zi7cM/sRVShxLtFP0aCY9Nso/XF6GGi8tZuOcBx0C6mrL023EA50+mYM/G8CfARcubG9Gd2tJ+/XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422705; c=relaxed/simple;
	bh=lgq2tuh+bkVT6XWX9ucgBBR6bVLcROXM62a1YpWPWoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BC0GMyEz2mHnBOIuIAyO06ULx74stiVml8EfrwF4N9TZazHW5RWzSTObgRtdiy92U5J//7GO4N4iruB8x7Ryq5CMg8vy+VZuZ7fyjZ2x0FLNSBzpOZOWFxnayRpTk+J89sbvhXo5LwnNhvaTsFtU69V1hjVYwjXCaAuQhzuvRRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nLyY2fHG; arc=fail smtp.client-ip=40.107.159.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nLyY2fHG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPvGFcTIK4VEceOwvcrC4sn1aJylaSU8bdYyxsM48XtFo8hpazLDG9VWY5eKX7Q7/HVSG5Bmdw7Mbou/F3x7lYlDLBmOMJuE4saZbEhTbzyJWVYupMsTG/AI1kvkMCvMdtHP4MZEMOXoDalCYwe5SirLnGGzQyu0EW6WeIAI1Eag50TRcCC8RFBFwqGSd7MHpqp7rPxvG5/WH8+oXOM9WYP2zyH6SJmQeZY7DaDPw+68iKTckgiWH3mw+/fr3/x1rthmoHPmPe6e8G5cVmK9O4sCvNwDCDSZxEzZ+8im7c7Hx2pks+ktXdzCq9N2ZI4C/Riqw9ABBO+XBCBr7K3DeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUfWc/jz5vzDsGJuzK9hplQfDpoIVwoR2hWe5TtCuTA=;
 b=D7GXP7nG6bF8CIHsf7487euDR927pa6sIxsaEWibQIzLQJRMFD5hOXOHQ2DRLgijkMkyVOgNv1n7DBklvITU3wfMKLny3tBGIy2fKbpP3CcZF2HFbyugrL0ypsZHFh1QRayGen1ZLBtEcjZvKtlqRdBnh9K4OdJUqy1Cm4Wx/d+SlOaylOXEt7Ia3q8OLxBwvIEcvjrw2mayxwviKmU1yjrgtBsdOybKYyGkhxtX7EpvKbz8oV+skCPNvqd1pnDrZxb3X4jdur4OreqYGo/Mg+r5cD/Mtdwm4le6872tLLHxFSBAOUvUtWDiHM9JoUn120sYoEQu7EnMF9UldVuiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUfWc/jz5vzDsGJuzK9hplQfDpoIVwoR2hWe5TtCuTA=;
 b=nLyY2fHGYLrBVoF3y1pBKycyunWJ87aBXWJ/GHzQmYxfwAC/ytALdlhu6XGtL+XKWpuNDaG7OIk9FkODT+mlFDKcFe+UPtzEXBKesCNwQ8+uytjO4aHswuCptP3GlMZhtg82yvx5Gjah5+3VskQWJQSNEz5FPoCKvpWCgzDKtSFpYS9yFi/WpiwdRLpidqg9BL2I1CLnt3Lx3l3w9b9SmXOEquLoC+rbeRX58niAvSgcn3jF5x7gUw0iPqm5l0+SlJJrEUIm87a8Y9rigYGMjov09axYZhEHJDiNT70awlqcR5/LI1AZ5i0dLO55FwIhMySmMFaSA4uHOYnebrEfoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9141.eurprd04.prod.outlook.com (2603:10a6:20b:448::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 14:45:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 14:45:00 +0000
Date: Thu, 30 Jul 2026 09:44:49 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: hongxing.zhu@oss.nxp.com
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com, kernel@pengutronix.de,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [RESEND v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on
 i.MX95
Message-ID: <amtjYeJzOrO7WY7f@SMW015318>
References: <20260730090447.271109-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730090447.271109-1-hongxing.zhu@oss.nxp.com>
X-ClientProxiedBy: PH8P221CA0040.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 08206265-9837-41e3-1b58-08deee492194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|10067099003|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YnqeUm2pMKFb6bHjZN6EaSELgYAD5NgDKSWxVE/benN+b1jG3izuiEOnfW8uvLZx1woPu9U6WvBk+VbEIHKwyx43aQPSqi5M63wI2FOfQpRb/vOnANkMHTGphpmJHC8aWf0To3G3bTvxCw2wzRMBDSdjg3g3gQl3WiBlzNDIGMf5oL7TteTr4imQLUY+eilDQM7SIVBjFIAfBcdCZZI8GX/0KEixgZs/i8Ot9G0F98YzSo03/exCIMQOUvLQrvR1usg2Lm9dOBzowoJD4/SSLV6kWz/rzmV2DWZy3NMMEpK4UyyL6inyK/2W70nL+ADbOit2pGn+qwO3UOqBJN+hL0xMUnQY2drlGQkjtW6yyFeoU6PFAmhYQVQzJYrGtr156ijAyN4lZHlodswu55yOEy769mzLhzUP/3Z00vINy1QA06OflvgVmB71CqCaqG8XcEiJlEX9i088CVgoiPR6UBxvRVFpyymAzvaiT4K2KosrFK9QLsazRgry2Z2lMC78ZG1dudNm7WclkUl26HSbhIS436mtFoCIzRVG5OgF0AfE5NkRJRsOT/xA9FL0i7uxUug35rT7YXrYMN0kltoBiJ6276EtBg89CltBO5Yke0c5sHJESUmp1kvl41YpFBbgPj5czUSG8C554JawFcxw2MoHVJx5++Ejj3gWBpBeQlU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(10067099003)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NqQ+327iZ6MCor0p3lg00pQK1A6dB9ORWkrGdFMMmV76JoqIOJAVlhlP1PgM?=
 =?us-ascii?Q?u0iaFiUd6JBngU/pWbUzU3w66+tbsSHZ4P8/bKjGYO6DXTO+nsSdG7cZd3ej?=
 =?us-ascii?Q?nfKubUAA2hm9n2aRXQGMhiyoG0reFhbj8s9hQJWGcv76SNnlK5+0jxdYrR0x?=
 =?us-ascii?Q?Gbe47NqobU0TNGSwSkF30NJh+1BD3rID3p8Et2F7AzFDlLXaUjygmgVj8Dt6?=
 =?us-ascii?Q?QtNJbgM6IH7cAMkjANOIYUvA+dHeNIzAAdhrzPw8vVZDRbL1wEjaj0xutqIC?=
 =?us-ascii?Q?1c4SI43QeKWq8PKcqMMN48b8kdvIX7gt7TVQ98SZgjJM4Fl7uZC904UQ313K?=
 =?us-ascii?Q?R8K/q/Qd0bURaPFarUzdELj8cSvgb/FIGEiUOdugxwskZuHBpjojpyDkuJwf?=
 =?us-ascii?Q?Exy6IhdgUgqVyGJnyJOgoz+v8umK/VEYyk5/DNhBkFolSqV3V63QGqswK0P8?=
 =?us-ascii?Q?MKV534O3J4RjSe8UQG2NCVo0hpGvo01DS2G24y6uRQZ2Zv060xNDP0n67+T8?=
 =?us-ascii?Q?QNcqkX/OXdPQkDrPHxu+a6u0DNj2Xzjo4GCjZ0rF/w6ZoSX49W1j7psfn6a8?=
 =?us-ascii?Q?ut7tFySH2M+fR7pMmNAr8qe8WVgJLeXgfWT4ZCqc+j741xzbfC76VmYc0suU?=
 =?us-ascii?Q?v+G/f70AgWDbTanjFyzf3SNUTipA8G3gmpBncM6UNVl/V7ir+vpSTWHCv/Sn?=
 =?us-ascii?Q?WDqdNynOzqG5m32obQ1xzxlBStR1QHECbjh6e+Jh3cC+oQ8t9gU/DM0+PDeY?=
 =?us-ascii?Q?H7M09wJo403XrAx3UsW4XQuKKB7m54c4qpLA3nR7RunT5lB/aBbf6qdF6SM1?=
 =?us-ascii?Q?cDtgm5hDfKydpB57NFeFJEoerq0K0s93EWZYYBPamFjk9uL7IrKCZSviEHBr?=
 =?us-ascii?Q?+4EVIaYWiJLgBHk09beL24rLd2FdSxaz1fZCrA5a86r+nF1+LBo/+zPskEAe?=
 =?us-ascii?Q?EYEAiK919/cF06JQBHCda+Z67jKs5hNQWFwQuZ8PXJ/9mxFoBE1HiNcER2a/?=
 =?us-ascii?Q?+Vcz0WMqIkCDxrrcR+o8KwuTeCIR1KqYjIo3+RakwUCpW8KUXE+a+JVshpXS?=
 =?us-ascii?Q?yT2GxdRh1frP4qkT1pdzMD7DJkpJye2qPA95ArX2R7Ha9A0s5iwGqdnNPFdy?=
 =?us-ascii?Q?6uwKjeyHgboJiJNhp72Z0iK543I8478ft1UB0M6YKOzsV5xU+UtrAOVml/xl?=
 =?us-ascii?Q?nfoO5LcCPZGn9VwHhageBUGEgzNXRf9TX4xKndJHVQhDHKeATf/lRF7ra8Db?=
 =?us-ascii?Q?M5cSs9RrXw6TXP47A5U6lf7ZZ9ejJCCtOEypunbBolurS47fhvjsyev++RmO?=
 =?us-ascii?Q?OgLCGtMEIYuSOSD88XTp0fqb/yol07BHnpFIRanY207p7BAmGecb78D8hfBW?=
 =?us-ascii?Q?WmAeJsbkbxdlQhWITVej6HFBo9ndG0ALHO3wfq7shPtgOakTu11ekL6WoAOb?=
 =?us-ascii?Q?Gg1cQ0oP2kmRfcySbirPcgvQesFG9FUQhXQz2ak9gRMtut+Sp/fQ+dKMQMfn?=
 =?us-ascii?Q?eAjwd4wotACjo6pyttFE+8rbgqyW63b0wU2g6+PkLwVoo3odpSFZ3Lk42DlG?=
 =?us-ascii?Q?meRKAqYyxBRecUUyToXTO4GpyKJMimuHLeBCCfBE2LyU5UXrLB45kRNGLh3k?=
 =?us-ascii?Q?jr4Q41DvYE11Ng9k3bZPoFFWSPY8QmVQSEpbbOX3NIJgTlj1OJjeWzVU61S3?=
 =?us-ascii?Q?hKvkGc2Gh50ouOUkD4hoAuBqzg7wIr7TPReNIxuF9HUUl0XsYGd1CF92IEWp?=
 =?us-ascii?Q?/P8SYkvdBslnMet0xCiuKVyI/ZbkKMNNRRDoemWYEx3ut0SvCAuF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08206265-9837-41e3-1b58-08deee492194
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 14:45:00.1243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/DiKsfsJs+jdiaCk/Pm0a0sR6SRflfCR4nCiERtIlQWPdFMSueNwdy1n9Wzbq6lVmE0WeT0lWsA/xSl2S/ABhKiwh1e/5BV9sjUXX0HZ1eug1uPxxFnR/VrPuD5z3y/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9141

On Thu, Jul 30, 2026 at 05:04:47PM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
>
> When the internal PLL is used as the PCIe reference clock source on i.MX95,
> a REFCLK rise-fall time mismatch is observed during PCIe Gen1 compliance
> testing with the Lfast IO analyzer.
>
> Fix this issue by configuring the IREF_TX field to 0xF (15), which adjusts
> the transmitter current reference to meet the PCIe specification timing
> requirements.
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/imx/clk-imx95-blk-ctl.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> index 1f9259f456079..bc6957299ceca 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -44,6 +44,8 @@ struct imx95_blk_ctl_clk_dev_data {
>  	const char * const *parent_names;
>  	u32 num_parents;
>  	u32 reg;
> +	u32 reg_init_msk;
> +	u32 reg_init_val;
>  	u32 bit_idx;
>  	u32 bit_width;
>  	u32 clk_type;
> @@ -289,6 +291,8 @@ static const struct imx95_blk_ctl_clk_dev_data hsio_blk_ctl_clk_dev_data[] = {
>  		.parent_names = (const char *[]){ "func_out_en", },
>  		.num_parents = 1,
>  		.reg = 0,
> +		.reg_init_msk = GENMASK(10, 7),
> +		.reg_init_val = GENMASK(10, 7),
>  		.bit_idx = 6,
>  		.bit_width = 1,
>  		.type = CLK_GATE,
> @@ -410,6 +414,9 @@ static int imx95_bc_probe(struct platform_device *pdev)
>  		const struct imx95_blk_ctl_clk_dev_data *data = &bc->pdata->clk_dev_data[i];
>  		void __iomem *reg = base + data->reg;
>
> +		if (data->reg_init_msk)
> +			writel((readl(reg) & ~data->reg_init_msk) | data->reg_init_val, reg);
> +
>  		if (data->type == CLK_MUX) {
>  			hws[i] = clk_hw_register_mux(dev, data->name, data->parent_names,
>  						     data->num_parents, data->flags, reg,
> --
> 2.34.1
>
>
