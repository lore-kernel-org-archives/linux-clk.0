Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D180329E4B;
	Tue, 18 Nov 2025 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480755; cv=fail; b=AyNzT4MPdfuzrLHKPiSseJG1VtOe9WczXmv8W8wiFom7JAN78hdeOch62aLWfCBVdllhiVXWgkUXk7+2EBAcoEncAoAN91m7M291BvIMbzg5XolKm2y/jbjwGd2S8Fe8XmuCWq1T0doDDa6b+5HkI/qhpK7HmA29XZ7nIgGu+cM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480755; c=relaxed/simple;
	bh=VEU9Sc/Pu14gNsH8XPauLIJMyG90rqH5Z5RnV+nl+FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZfWMC1mgoyzHKOnboke71CAfveXvjSv7Yu5FYLfJEMJ7lw/fG0+9FpCWZIaNSBlTWUfFck7OFBgsV2nBtjLwBjZ7hbNzraQnljaenEjP5JduSogGnb2xmOfP3TQFGupRZ8zlV0eU2bkVSXOAN3qlK/GQ4ZA8OTjZwDSPvYJjeiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PW5Pwhdr; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PW5Pwhdr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URWknI0cIiir9uuwvwytU2XxVhH2u7x165OE5kYoHJD5cDRMNwy4icLKLYdCqrLpPWqtC6vnwUoKJvT1Ta3GEvjwuHlC67wXMLmZXXrfCkx2kYC0YqL5vKQvgQVG/wzlmmypcqzgj3xa2C/l2WheSO6EHxzzRRR5/Fmu4/3ewyvghzoQlsPjsOQaKIhW7Zd9iHZLnM8hePU+krUU4WirUWhaiQG84ZyfpewJPXvd5FSlliFjxe62IGVBpKGGKeLz0HqmWSpwLtzqiFpKjQ5eQnuXqunr4NOA7nYMpzSlgNfmsmrJDp17rckTZZzZlVFNULG4hez9dG+uLKjSbFJIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQPFmvOR2uFbJQc+XVbd+6Lk26ZPUXa+No4Rj7pe3D0=;
 b=AHP4dgoOoUe31yFPUk5o4OlXAdHFhiB5LL+906JGBNH6akm3h1Ryc8omfZ/I7S5ter4ksLqNeb2Bp/bzPwfd1nDRcr8W9oWnDytf6XN8RBq7ix4qMgyEWDZCOsRLyS46ha4hlVEUMQqju5Wln+ybTC1HXZd1aQHCgm+1PwhHJp657PPoDkqwdQzUP9B9YIO2nrFGjalxMXNGiG8VWDeIJ1GkaNo644WhP7BchKHQpDmNzNfuiL41zxhrSdwNV/dTR6ZAAfvr0nJNqxPvs+3vjyRn/+nQaCStX1YqEokElYBQ7VLlsZpx+9vCyRHIkYFWD/f9L93CVDsC/QG4CDHu1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQPFmvOR2uFbJQc+XVbd+6Lk26ZPUXa+No4Rj7pe3D0=;
 b=PW5Pwhdrcp+R7z3lDPZuD4viDq6qutOoMvJXcLu3ZZ+acPuelFmJbYpBkb3GL6CvcZmOqUeurIWvED/et4u9xkEZx6UFgN05284Scqt/3oloYY5HuhbonBwjfyBor0x7poPPkxOjxbk3MBjhqTzFwTtLSFGHt5/M3mIZSrgttRpqHtbLMK1J2naS75SCrTJnA40UheHt8lrfLUT2YCqzVDIZBEwRYv6EJwi1QmBOFhbq8mfvSHvs5bs6C7KAX4fWcPd1LLl2mUZ+5akZFv3C/q4v8qzDl74yPZRN+TFgdYOjr9s0WuYQtwXGktECQRKRGPkiYktefAA7a5p/HQvyVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 15:45:47 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 15:45:46 +0000
Date: Tue, 18 Nov 2025 10:45:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com,
	mturquette@baylibre.com, sboyd@kernel.org, hongxing.zhu@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: imx95-blk-ctl: fix hsio_blk_ctl_clk_dev_data
 reg offset
Message-ID: <aRyUoaelqkQTPiPr@lizhi-Precision-Tower-5810>
References: <20251118074055.2523766-1-xu.yang_2@nxp.com>
 <20251118074055.2523766-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118074055.2523766-2-xu.yang_2@nxp.com>
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS4PR04MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: d6785bbc-a715-4b77-bf30-08de26b98a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XJqEdg+C1dkPem9X5MMbbA533W7O5HFWORv0uGV+geSaCvDkgIfcvx41cMpg?=
 =?us-ascii?Q?celGrJVpYnLHiFmThvP2aXMi+2xmPeQnaXIpqmz7eC8WsUReFpguq5Ae63dq?=
 =?us-ascii?Q?xp0Ot99NoqhFkhJCQARPYHtv0CD1xCSTXaStdY58C2me6S1TdmEqYAZxx4/6?=
 =?us-ascii?Q?JqPD5GX2ILTs3fbQARkw4MlOc4anULDQmNJ1jbTIKavoh5E+crQLJOQvioCR?=
 =?us-ascii?Q?9wnl7fNGWD+PE4gy4gPaquQZKnNdX0DC6WkKPxCJ6A065iGF0I2nkhq6T4Y0?=
 =?us-ascii?Q?/CcGVl74z9G8jSWJjP/vJL3KKBhs9INoocVfbGYEJvZNHOv+pl9qOW/w67G6?=
 =?us-ascii?Q?hPe9OjTep3JoUVNAFCxm/gOB18zMr/KHPaAgAdtiMZJOfdBOpBBI9XQ6qGXh?=
 =?us-ascii?Q?2soP7L+dArjlYTycyjTTXWIz8UuyQ3YR79IQ1vrAptq1ykn2Lqgskk2E3O4n?=
 =?us-ascii?Q?ACvnB7ErfnmahIHr/aWvKh5bSQqBLLdaR4UxOizFFUpan1iLalXHCcYr8Cht?=
 =?us-ascii?Q?8GPavQUT9Lln3PzELgy+TiEMuOA/v32PrDxhyqDH+e4NSiu9EZOloTd91fOO?=
 =?us-ascii?Q?4a+RviGQX3lz2g7fJm9uipmLf8JTulDw8LA/NDTlwZYNdcJQd/owIUB8IAK3?=
 =?us-ascii?Q?oLdc+UZM9ASuP7XFSiRZBROtGP5SDtMe9r5StPqjeGClVYdWrQ6SDB9/agtT?=
 =?us-ascii?Q?DHxh05dyU772vmfNuxT5oA72VXB4GSqU20LxRrQ/k8xf3hglHodDUwheP3Hg?=
 =?us-ascii?Q?O/EAAKUYm/wzGLYsGDueBZTPGuDlksmTSz8YkG0u2NKUMLgaTOF2AMpGGf80?=
 =?us-ascii?Q?P0zeWkJnL/EQr3eZNqISM4j0fSq/ZP9u+9B1kWc4Sv2FSA3mIERzq/Rl8Oz6?=
 =?us-ascii?Q?T2LiogdB+M2uz2OTVdUtWx+HTnnfJ5Gn/+T+CxDUbbhll/8eQic/BohRY624?=
 =?us-ascii?Q?xccQ4pLkjgU7LcF7DtLZb0GEmoyj1kF/8fGr7mJhq/44j2O8tVP7Fl3M2nq2?=
 =?us-ascii?Q?OdWBP/BLHrbIamerOL5dkw0P05lXZomsFKtA4XM/cbXLxD8gIoJsV4sMUbC/?=
 =?us-ascii?Q?L9vTF5scTTUKmLinO5d1X0Xz0WaUuAWOz75NB7gAIEWTaVELKfIjE2t0uMKx?=
 =?us-ascii?Q?SN04SRYEay3nReHDfNGY7vJs0SwzMT20ghBDeYTCoDWnm41rg3aSGzZU/Q5o?=
 =?us-ascii?Q?0Fdm1SLmPuIFF9cH5XlxhKARg/oxRKq7ElxPMZKecZW5JE36oNGqrGWtUQfg?=
 =?us-ascii?Q?islNKe+gUgbmNF3FJPvTR3PgiwZZPwsa7N69gcVvvloja152+eiWon29pNuJ?=
 =?us-ascii?Q?O+A+yFIaL79kTV+CV7E7i0p9enTlMzu29zpohvJSnPICWvKqRrbrKzbVF332?=
 =?us-ascii?Q?UjSKOFTzBgzLyJ0hqGckeOrM3j9ExSy5n24yJoJXI8NIPvIrG6/6WuHL/heA?=
 =?us-ascii?Q?fK+Fo/0/EMVChm8kz5CIs0f93Opx7/Qa2ULKHnHFOEu2bmjX1zuUo4c7wCsA?=
 =?us-ascii?Q?NFlcSjZlydXBoLEEXCsuSYYO59veQWRdt6fw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XQnogAPHRYmpfyjaoahNke3zoc2O/Mgf/4285k0qcInEpfRPb8m72ua4aCrr?=
 =?us-ascii?Q?1Oseptt7OVHV+io+0FSqJNf7DoGiT0IpP6fl2mgHUQe8zTRzMt71ocCiT3X3?=
 =?us-ascii?Q?5AeS6bp2llNM4hwAwnz68vkEi2igHuBoCA3oielfOrPrxdxKrIllTJ9RiYNK?=
 =?us-ascii?Q?6pbNEio16MkwdrOpmizGGcWBwVehrY31zO/ZNAgErFeO0bmQU5XHDrldHTP4?=
 =?us-ascii?Q?p96h6n19LL+R6X/KSUq83X+11eIRTTcwBX20QxSuk3VBI+FZyBZRjd8ae9Iu?=
 =?us-ascii?Q?6L+xOvHcVtG/GLGTHGV7UQ/TgU9h0NsV50p01KvzmKSkdAAlcqhFYyRIBFDv?=
 =?us-ascii?Q?Pr0qlS4w6t3q5L7BPQCpVoX6YKLsOMHyFrVQEq6+QMBjpKtB6Fr1a44BLvTw?=
 =?us-ascii?Q?HSxdDt971Vb5js2pggxNJG5Z7AtXp4arZRbowmawlDTMoLfv54+qC3N/B0FP?=
 =?us-ascii?Q?MJLswScXRFJwCWQfeqefNf5GbMI+7xAd9FQ757Y0tTP37bImewKRb6b8kEi2?=
 =?us-ascii?Q?W/UVjtFA5K1e67fbCeSoomtovxqo7Obdbd/m5H6ZEvF665Ebaiy5v/ZLmvNr?=
 =?us-ascii?Q?2T7l2kXy6o71spfPxjcXXwtWpTZlVKMpsBJc62BPbFNpXC8UzZbU4Gyp4PvA?=
 =?us-ascii?Q?gk6/L3i6VM6EYyytMb6U4I52mj2kdRYO582KexRtUiE/ICoY7B54qu769giC?=
 =?us-ascii?Q?0Qq2pJUom+N/QpthOgRcUNvuex42xfvhh+wgejY3UofqLwjlkbYslxCu2z+r?=
 =?us-ascii?Q?0AfvPxaExkyen7nSIPHvt1uoWI352T4RObPoBI9vAsMh7WF6wCuoMquqnxRb?=
 =?us-ascii?Q?xfoL0M+12cozEgqWrTadt1p1m5qmMqU2TNu7S6BfGRJQx35R+D2ed0HGNAjj?=
 =?us-ascii?Q?mvE4YCcXseDryceCEbx2jFh+dd1/qGRiebBXI9ALRFC/BRkAUoRe6neHRbd/?=
 =?us-ascii?Q?V2RBxj2F6KV3Yte9wi8Y9+gdmO32SUxLsor8n0NaO/1CKQ6eyYdqIniAlOJ+?=
 =?us-ascii?Q?QRDXVkcPJUWS8bJlLCN2V0QXoCPd1+iMwZordKlfJ0qch4CRN526070lqh+b?=
 =?us-ascii?Q?hK7cpnFAjU3IQaZLg1BxtBbu/NWfOxP5OoXQX8P6ejVTBmigfAnJpyTWeR4z?=
 =?us-ascii?Q?qo3Ayl2nxFRDcrI9bdiUeI/9lxwOjnMVm3Udx44aeUmQNW0nQjez+EjG34OO?=
 =?us-ascii?Q?2RShGDDtBNN0vNR8uD4hbOoZ5MuaFVHIbowqy09BB3lLEmGVAW5k6fYlFpkT?=
 =?us-ascii?Q?+qZ6LRIjQVUqmpomq78x7s9GMhG3vWquy0/0voLfVeioEAMiq3508yZNDvGr?=
 =?us-ascii?Q?cfgyRSjA8YEjnopt6MhQW+hkjZsryZjAKHWLIerrZJMXo63bg2mYFc6QYE8e?=
 =?us-ascii?Q?yML46j3y7Lcy8HGLF4GXFMlHncQNHbpte6reICu+KOEh5jJxZjAmvgukmoR7?=
 =?us-ascii?Q?g5yA53LZg4oYNyWFkERUnZTti6F4b3uCan4gC25klZ1aorZizY+SvWYqKeWH?=
 =?us-ascii?Q?Jpp5vFaSSwQFdCwdU7Zex8iIvnHujdnvPKya/wgokJOAnqiOmKVmHF1bTfvL?=
 =?us-ascii?Q?gQ5VieWK2LmN6TXU42UreoJsZP7YvR6bZur+QEf/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6785bbc-a715-4b77-bf30-08de26b98a61
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:45:46.8374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMU6c/PfI9FR9ASGn5cW4aHxRN0KG8sMRwkAImkjDQka2TuBNQQnJodfKCfFX7vD1Qt/ijlbfz8BSGUxtHkBgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9576

On Tue, Nov 18, 2025 at 03:40:53PM +0800, Xu Yang wrote:
> The first item of hsio_blk_ctl_clk_dev_data is used to control PCIe
> reference clock. The reg offset should be 0xc0 in HSIO block control
> register map. Correct it so that other hsio block control items can
> be added later. This will also rename the name to "hsio_pcie_clk_gate"
> for better distinction.
>
> Fixes: cf295252f0d8 ("clk: imx95-blk-ctl: Add one clock gate for HSIO block")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
> index 56bed4471995..3c2019f428c9 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -285,10 +285,10 @@ static const struct imx95_blk_ctl_dev_data netcmix_dev_data = {
>
>  static const struct imx95_blk_ctl_clk_dev_data hsio_blk_ctl_clk_dev_data[] = {
>  	[0] = {
> -		.name = "hsio_blk_ctl_clk",
> +		.name = "hsio_pcie_clk_gate",
>  		.parent_names = (const char *[]){ "hsio_pll", },
>  		.num_parents = 1,
> -		.reg = 0,
> +		.reg = 0xc0,

This will break compatiblity. DTS is required related change at the same
time to match this change.

Is it possible to create new instance at dts

hsio_blk_ctl0: syscon@4c010000 {
	...
}

hsio_blk_ctl1: syscon@4c0100c0 {
        ...
}

You use <&hsio_blk_ctl1 IMX95_CLK_HSIOMIX_USB_PHY_CLK_SEL>

use IMX95_CLK_HSIOMIX_USB_PHY_CLK_SEL to distingiush which clocks.

Frank
>
>
>  		.bit_idx = 6,
>  		.bit_width = 1,
>  		.type = CLK_GATE,
> --
> 2.34.1
>
