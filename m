Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F5F386C0D;
	Mon,  6 Jul 2026 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353031; cv=fail; b=ElS55GNPGbXnfyGs5VWvtPEzDiPOuEgP+Jk9g7Pg5uxC+0/BbxlHM3m5ZpvtlAYK+kZmcYScoVelxmdTYfdbEUyk64IM7BfE3mm7szcSgtUm9A76O9oql4E4/hN9oiZjQmteiYvve8vWW/okilllTZxWN86sYqLocjAQUAO3uYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353031; c=relaxed/simple;
	bh=3Xm6EgJOiF5vhVR0sH3oAAtHUPYG60rbjrrQQsenvXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A3NZlce0cU0Vh3Vr8d9CFD2kuzEu5AKY6M31WwG0v2Oih1UYmvhq00PcdypAt7C01lwhoe3lh2oKbqzyRFu1HnGQMr4QEXpaK1O02r25BwCNQ6qWNcEMp3s65X0kded7VFotUI/oVEMqY/cXzInGHQEvS+07W0mHBcOvH1UfEdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OZVxocqf; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OZVxocqf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kr/htAEddDKPeX/IH6n4imW7obBuPZvRUMN2BcIFIbdVEFts2Q67ruDyvxVXSfhi/17k8vNdJG56KwalVx2Z7RZub41XJZMTj04kEJOnfmce6/qVPAANY9IukikHZL1b1WNSak11Erchel/mXyPTR0cremgfRiBtyEbUJNeoB/nH1UFTShCsT0ujkXovidkOSjkfI7HnI3qpNAu/Ux0ereyVkPoFLcD7VFmqHh+FRutA6NVnA8o5UqzFVB3YCElu2U6G1KfxjvSyyqu6obiOnnTx9mfzjSTzpforU8/SLmvbhahlRfSc3YpO0rVp8fhRdIukZzMcPTJp2qiI+oXn2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jXc6LakvAm4FYCsB5QowdufmnIcYg/2w1ksv3XTejM=;
 b=sT8JL0m/JDrYcbtvRQpmiboUbiZA6Qi77UV4+Qs0J2j74ooQZWs1wTKZm+VoypQDCbuKbjdyyoIEKaMUM3DH/zHNbM9/IhRa1vQwaBDdLV7D/vEP1xrzMbphaC0HZav94T8+1NDSINetfKZv2UWeSFRWJFImUQXefuYn9HAVIqx9Nvhvr/BK6j3bcPd0YdqfZr3vVaGYhST7+DHcF+E8Ex/Gu9EGSy0U293dBaOQ1nptchuUG7CzFocbLqKhnHmEsj/RaiGGGsNW9Ss9hF7cLeRtYYb9JFDb0EI/96bCw7xudfO6XUrS8Y56ctdnlZsR5umVRmGysp+3/4XLv5WfnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jXc6LakvAm4FYCsB5QowdufmnIcYg/2w1ksv3XTejM=;
 b=OZVxocqfNOfRtTuLHxlnm1grVsxVn8wTqs115q7YWTnmPr1JHd/sECdWq40kRTfjyyrzwyWCKpCM3CxLH8h8aANGpiCcCmYD3SM6krUl6dvB2e+K9FhZgliOMDcjmS8U9VKQogOHnrnKZzHLAL+Tey2y7Q9aqRa0gcEE3iUufve4oX6IUwZmP8FmEzhQZITRosC2ioOYYViDDrmdiyRXTJSvwlKf0Yj5du9HPhLzH/LaMgyNcxMF6kGnlbqOyVPKShyPZ2CW3ju7JOu1u3MNl9MOc/bLJhWh2Fnu0q4G21VS9PcedGK2cAt/2g+N6yEJSkmv2Vzsx1SICrovHtQotg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11826.eurprd04.prod.outlook.com (2603:10a6:150:2d1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 15:50:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 15:50:26 +0000
Date: Mon, 6 Jul 2026 10:50:15 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
Message-ID: <akvOt2_Qo0rWDC-8@SMW015318>
References: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
X-ClientProxiedBy: PH7PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:510:323::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11826:EE_
X-MS-Office365-Filtering-Correlation-Id: b271931d-f07b-4954-36b2-08dedb764c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7JsOMi2GoNPltTcO31v13Co4F09ut7qurl+PFQPSJ9C89YN1xH9RoN2/05IiAfLF3YNrof8soGRcpbNKjUivHXKrKp0Um1SoZ0qoGtAlHBvM6bQuWM4RLlMPFNTlqumGiNZN8SDj2ecYL2solquJ3Q+jacVV/AE72H0SN2wLuUnEBKDZsEaUM9GuWnHxvI1zEw7XW9R2hg/MTaGiEaDQlp/fsw5G/D2R+YNisu+pLuqn8GA6ZRXd9TBpUzxOxelumQSEb8qHOrn3A5zibyeNNX2c8vGF51UMrKPDgf9JecRbUzeUkNHPuMcunMppkTmRvFN7avNNvji2QYBItpu7aeqGgcC27FRMZ+7ngQfnsB+t8v0yeR1hZapWR5FpsW3p2+oGCvm9bhnJfYNvdv/PA7JnQZcbdhdJ+AYThzP8trCt9TTzxtt1tIP8HYeL5f0eP9Uf9+ZcYffV8AReJEusWL2Q5JnSNkFvxCaUQrlyQ+tZooCRFs0GQkZy13DgoLiNFN/ViANt1HozmnwbedIAUO9XdwzPQsgGq62yLVWIOsMGrb0V/Xmjo71moJyTOTFDv7Cw2fs7ZAnLeuxpJig1z20ZQv+C0VYzsEFRulCWyLNJlgSPMB4vXVTL3mL0mkmW9+gtFvnYxq5Ao3k30Yl2WSg61cdIP/GIQd7FxGEmVkQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TZ1UfkOsfotM3Gp6A0c2EbPi0cofyohePumvK0CO5DDJyt9a39OxvTzLu/bI?=
 =?us-ascii?Q?vRTBScHYgm0iKVrBAnhHcTdmx2k1QgoZvAm98AKYY0/hRoaPQ7jQB4+yfGtT?=
 =?us-ascii?Q?iGKTHx1fyMsABm8931sGUZsi7iWW2J4zuqyMXwI2DwdpD094HnVZ+aIgo0OP?=
 =?us-ascii?Q?wsVCz0FEzrJ7NsIM8s1+vHBAUxDdPYM+SlknmE2FvHvsrUCDpLjYrQ8nfVpI?=
 =?us-ascii?Q?d5p0rQ0jOCkxna06z5m9x2fVGCg4Mj/dKEGe0+KuSnoDcwjvCchx4SojOFnJ?=
 =?us-ascii?Q?IfkoDreAhAl7hQecqE8CtDxovZd8Ic8/2DKH4DvHuzsy8gL6mQz9hc5HgCWi?=
 =?us-ascii?Q?+5viJFxQnLNXv5GWzs23zLtpDCr3bXLU00K1RTYouwbwjwM0FPkJC6CiZDxa?=
 =?us-ascii?Q?ZlBIwkAt3DBqw1GHI9cJU9EgDXttSlhVcPJtQyflzmykKwQ11dQr2GrBZcpm?=
 =?us-ascii?Q?tUMHXCcpkqApayzM6D8Gh+jOcGl7FoCwMRcokDh0sLTk+K0gO25Q3TFpn+fr?=
 =?us-ascii?Q?um1IWHVMfgIcjjKjRnthhbrBdJqcm2pGh2mNpC0pTNgm9DXRDzpC9DtYQ17D?=
 =?us-ascii?Q?ttm23Uwb+DQXti4AJkBSelFGEZQ1+G/0opT1LynaLRUHtKC8wjoYQgt6me27?=
 =?us-ascii?Q?ULLqEhKn6CtzPMiXl/vrdR5nCZGURG4xcmgPk29OMCQarBvME5b8ZdWbTwJ9?=
 =?us-ascii?Q?r+B/4PYVpPQn8OTkWQLrAYWs4XcSMRUMVSslPOcGukXCiLEpAfdhkMaOoyKt?=
 =?us-ascii?Q?fl9iAtmZqvtOBYWnGloIy7bY+qC0xl3yvNyhx8/s/76IE1W0Xz7WXPmayoUE?=
 =?us-ascii?Q?a5ezuYexPKA6RK2Nen3SNA1BiACUKJSPg7MqPpaDKjJv0REyqyOSbM2nRLg4?=
 =?us-ascii?Q?lxc3Q0Tm3pPB0aL8U0FW/B3EA6gt+bjOWTmgnn/4MraTXuB5TGJ/lAphFR/u?=
 =?us-ascii?Q?+Oa38Zb/xa0c4sG5Mvf/c5BtMaowlAt80SmSuclELYA7IQgrFt5Fu5HbZPBn?=
 =?us-ascii?Q?ZqeJ3/2e09ELtYI/9nlhHC/5KUnCbLNxki9K6v92w1GqutGAy2mCInpCEWDf?=
 =?us-ascii?Q?W6qDnOLO3T/pJNAA8Va51Z6CkNM2G4FYPvEF3lcfta6I+cfTXb1IxIWIoN0+?=
 =?us-ascii?Q?u/i5tbeNYQYdiIlylKcLCS950F5fT1apfXmQwzzKu4YwFAoRRsPcqajInpJ8?=
 =?us-ascii?Q?EJLfIoUPvIF2ZWFL/IQhqfGuApXYXAnCo9deQkMQ/0U3airkfyGHR72FUTYo?=
 =?us-ascii?Q?fCjt3+Qr3g7/XXU+R5YcSaJ9yKxrkcBfsjB7iMu8b3TPu29MyHF62IjZ59/G?=
 =?us-ascii?Q?n9tBhfoAaMw+5fBjgfW2iiS/U033pNJ55J1uunyBI9YLOhi/dCP8TQp3cJLN?=
 =?us-ascii?Q?YztbAHzbYTUHjbIFwPxJESVCpYif9pSAQ8Q7ie/YDF33veq6LvrhDB6W46aU?=
 =?us-ascii?Q?OGkebwCvwU0k6kWtRabcmZ+1p08CrnezEkcokJYIl8KKpugbbjUYi550HZCl?=
 =?us-ascii?Q?gkeX0g/VlSob1s6UvdRTx4NjWR7aD4ZTIuoRMdgR/stW72HsCayC5JS+cMal?=
 =?us-ascii?Q?MmlxdWK+aHXVOWAGbOzyj7D/WI6qzuGh1Jy1VqA6dQPCgoHcIbT6g4zIIB/K?=
 =?us-ascii?Q?K8UIl4PydeSeaDPh2Th7d+RGVox/pdCwiGfmvaIoswGTm1a7BuHWCR03rs1Q?=
 =?us-ascii?Q?5tzqAQexDsx8PtYP2XNZe6O1QRQ5gk3sNlWht8s2aNYLQ5A6gNkUBKh8wu5T?=
 =?us-ascii?Q?WL+3iaY0AISvlfJl8xzmn4ah1t4/trPPMdAA0+2x5+NCktchvoYt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b271931d-f07b-4954-36b2-08dedb764c26
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:50:26.6733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gm3KI4iUUTqxNRgWK98pasm7jsItxAHdLdY4zBJEhdpHNYXGOZYybQBSwvYeT5QvviFVGCIt/kIjz4GZadU0UXNxfwm3G+fw74J3onHfPL8g2TCt95V3SMnnh9a4aAfE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11826

On Sat, Jul 04, 2026 at 11:01:41PM +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
>
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
>
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index 1dae3410ee99..f0cf6cf91899 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -354,6 +354,7 @@ static const struct of_device_id imx8qxp_lpcg_match[] = {
>  	{ .compatible = "fsl,imx8qxp-lpcg", NULL },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, imx8qxp_lpcg_match);
>
>  static struct platform_driver imx8qxp_lpcg_clk_driver = {
>  	.driver = {
> --
> 2.53.0
>
>
