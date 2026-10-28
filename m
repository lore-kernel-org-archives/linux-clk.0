Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793206071;
	b=h5CcUxjhXKbT+Hl/wL0JCrr1hQ8G4xbaMLZ5rGIFzY3WO/FSSBpZ6iNR2EH3/Ldw+b/V
	 KWBkQeNwOhuAqjOm2a83VzczA0sScZEMPFb2Wn7eRs5FEju9zCmj5djjc1laSohJpez0z
	 HvlF0D7hrfd5PlOABN3KciOcQQ1HYOlSMpMi7L96trbAeCwTDZBq1JxriECt+2i+6cQsM
	 v+cc/z8OO39vqZoAT5zSqfkV3hRM/WWWoiCObh8PKRl/wpHb81vTWnRAyJGyj8OCcGZw2
	 418nde3wjCRwltRi5lEsrZ2QW0DmWBUQ2vyQiujzkmHXpNFQeeRWCRFyx8QtSh/l5Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206071;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=fr8gMIb/a/d2GRcfk0ea/VADIXIgtUMNzi8EVY0R5pg=;
	b=nSKqkINA0jgIytjwxjQ5iArOcBRnPxsHqxeOaMLY+gP2UBMsODDDocOaQGk/ZeVuCV33
	 nOXtfl9uNoXLWuggr+Y+Ng7PbWVUAZajsLTkBke1X0ryFgozvzG+FOyilt5l+I/LpQx8l
	 CBt53Oqg/9hsf/a6QYs9L1YXAllwe0ez2oPxxxgVHJxF+QZNcQBh/5TEDeMQlVUfmO9OS
	 2owhG3LdcW+4+Gel80oKG71TI5aaZ1Lv+7QiQwR5nQGB5Q2P11TPPAiWwoDDTJSkNdIKL
	 Y7b0jhKEKcTY9cFtcLoNScCfFtFPr2Bn5e4q7ek3/sV5GYDZRVZmMVK22x6yyFg8xAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KmBFEIoz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.61
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C33160A2604;
	Wed, 28 Oct 2026 16:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C33160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KmBFEIoz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSysch9ivDe9ibnDAQuBCjcnayd54IKwBgl7FG959O22dsrh1Q/PnlFd6wS2k3QqkgJ9KLpL+xvIg8z6XZaquEiMYb5svWDXSynbOLEX16XvIYSt36qKqTzvyDqHYa+nOZrUPOgQbChjHmo65J2a6VJaohqkJLIBTqIOTQYcKVI+JXm/KOVz9iHsLwC86m+HgwzqORcnmxgxebWfAgFAGiVjZlRzcI+bZXlhjqohQpwV0XOT/+uIoejaofa1EbkEwNqYejmE042yofuuZBw9D++fG3bQ1KyPr3zLSZw2Lpo7qXjDj64Mw8Ng3TMyNU60UBsnGikK9SfkkPlKszGegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr8gMIb/a/d2GRcfk0ea/VADIXIgtUMNzi8EVY0R5pg=;
 b=cR/dT1z5qlWx0zcRieCmLt0MqnAH+GP+wyfw3RLJkBdjLMHtDYYZk+nOGQ5Y8ygJV/xe4QtybzS6IRi5OdRO+BXYakdXT0KOlK6wB0jkwGRv3a9OVF6SoMcL3/4x3u5Byc4LgOjQHeHP+t8fBkgt4gDxtgK+G9/KtkxWB/mEvBkEabFoBbo4ke/CeIhpCpk/GYX+0qEGFC/7Z+fz41fLeJ/soXcq3UeaAwkQgs9UhQKo74CntFD1S7YrkeRmSfmUmZcBVZwCONNwZZZ6HIgk+7PFkdLBneIehZO1iFNUebkLwSF3hdhDfBwA/8KP4yBh+lmLXnDBB/VzOt5gAXY++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr8gMIb/a/d2GRcfk0ea/VADIXIgtUMNzi8EVY0R5pg=;
 b=KmBFEIozYbwDL5Vwsq8yTsX8rmUIqnOtnRwh+Lj+KBhU8xrlhUwZirw5dAE4fvoKSLHJJwnltydE0/qVpvhKI9nayfx1J+3VwsXL+Ujqz28ROQguVxEqckhkMIgV3pkkrkPgvUAIWwvl4w9CQjcV9roqu0ncM2bWTxlJm8C9lCmQoKK/QvHsozyhEofGM2GK7c9BzH0ZqgnWXqDah+R5/L21Tu2Mo3+cYWIZYm5wfv2N7tv5gBqs1i0knJPYSmdz2jRmMIU7xYoNVUOysxzQngwI1zVq2ndxpM+UBP9luY6vT1eTD3syKqH4KAbAdC3YrxDz78LWrQazlPdmq1QeGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by ZR6PR04MB424962.eurprd04.prod.outlook.com (2603:10a6:910:dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 16:47:46 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 16:47:46 +0000
Date: Wed, 28 Oct 2026 12:47:38 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v1 4/5] dmaengine: arm-dma350: Honour dma-channel-mask
Message-ID: <auInKn0Z7TUP8yl7@lizhi-Precision-Tower-5810>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
 <20261023093045.3248630-5-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023093045.3248630-5-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: DM6PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:5:333::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|ZR6PR04MB424962:EE_
X-MS-Office365-Filtering-Correlation-Id: 739f9f4f-2052-4c9c-ab52-08df351331cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|19092799006|7416014|261009223027099003|261021123027099003|261022105027099003|261021121427099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006|4143699003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	5+N3uQdrLTFENG4QrpmjcNqXGGZIgQzZnmzgsImj8MTGSpqnBUfDNBIWR5DCC+3rU/pwToNwEmnoO6fJA1PXit1xIBJuUBy59sOHdoaqMKZAORiz1hDUWZxi/XKuGS6amfBkM59qcl2IqYy8bHH1Pryl3AcpfTOvAF/c61TgT8SKF1wilWrJTmnH/j6TgasaSGzluJN8Ybee6V/4S+Z35WYtO3VeqoL94RfRmRD9Sh93CgnhDJVPNCm9VF+WjmexmE9eB5M8Lyr25wxDGDNaxpib/7TRA4UGnjqSyD/8pT8OpuCOsvnNGg1Dhhiv+X9f2d9dgCzL/dpM1cKKhAk6L78MGy3szWufA1xlyU6uw+BYmcgHhIe7sd0GnsqnKBBr4O5LoVrcwWQXo9g9kpSnTpWtj6qnH55TODKJNnSlnYsc3HB8eiU9cvSpHAY5k7Au4UYHXD3ro3aUKp65zrkJ7dT2j6SbjJSrjYRm0bqxv2sxik9WcUcozk+n/vO0vpunhKqweIQYXvEV1HwVVbvk1efwYXzPlqe29m0HPopmstmZKFH/+8/x/vWjrhF34mbLZ15Dv/4lvvOd9ZHJzHC5MnRpdTJqstp8MfX3jHfT4XDqbw1mhmM1HwEGdNheC8CGpEj+vNWQ714DNw3jUKw4cklcRaQQnuOGlzxGqdKmti0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(19092799006)(7416014)(261009223027099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gfjzoHlCTHE+WS16GPd1Vbfn4TvzHOKfLkh3PHuDFpocyvqfJHmkmXluKrHy?=
 =?us-ascii?Q?WQNoszyKRz4S5for0zWa0RSoiz2Uq2ogQXuAQ86ji5MZcZc/Sh1ZHFUoDtqC?=
 =?us-ascii?Q?345G9ZLi163H7rY1CRP209sJ3nyx3mt656F1zsL0GldEgQccMOEGb8N8U3ks?=
 =?us-ascii?Q?v5jKHZzbBVZD8kvtsND1HqvwhRHkVyLKg4A+SZXYsgP3zJM8wFH/yTzailih?=
 =?us-ascii?Q?3WOJ9nK8d7F7b7C1+9/e5Qqc+MFcff7tpFPHmHq+d/l/VkQfS1C7ZS5IIbEb?=
 =?us-ascii?Q?QSvA/3PR0EvrXNFtXuO0vQ7zvjMgm7zMjnnC6+8xCLIa3r/mNX6Xjbj9niek?=
 =?us-ascii?Q?MhJjAifauWWzzQidTycEoh1yTWEfOaPEwOs9R4rDfNlPEJH6Si9ZR+wN6RnH?=
 =?us-ascii?Q?qz3Mg0PiuQ1QbtAEnUi2Va0mlXY0zXgawG34B7p6PWFCQmPiHzHhru3Ir7py?=
 =?us-ascii?Q?PlhMXgUOp/BvgfnrquOUOCNOmiYzv+hLphnvmVwlF2xc494APn7svhJpXvy9?=
 =?us-ascii?Q?vioTsLXAc64mCmMMSZiHGBR4KMbcpYIxki4yG8AJHUV1rVVL+p5TUsiySfry?=
 =?us-ascii?Q?ADK7Bvj+OTfWtOq8BZyOpID0gOJvWk0i+lrkwrB8MX/yevw1mnV8up6tbVgC?=
 =?us-ascii?Q?p28LlgFPE2gDZowmeWECTuBwvLFBp/IDtBQDkW4zy1nag+uBPFFGZL47Xlq+?=
 =?us-ascii?Q?R7agyj76XPjLT+0jT/6gMRED0TbMn9itZka3QdILm9/fnCSwM0ZUJ4J4IW53?=
 =?us-ascii?Q?mlb58ApP9I526gBEOTkzOq3DbSS7AEyXhiHxhpaf8FPA4lPud3y5utVkPfDl?=
 =?us-ascii?Q?/+eSd18L/ZFvsg/yIYffYNDNDx16ngDts0lFy8lRI9h0BSfLZr4WG2jK134S?=
 =?us-ascii?Q?6ZZPb7ZLMVE+G9IhDGjvroCyGKDTAzmunzfxYcwf9oQpm3m4gE3/uVItowge?=
 =?us-ascii?Q?MRC34jacia36Lcc6F1iJhPTobW2x4cYxFf3l8AdzdGpJD422KLyzidJQy8rv?=
 =?us-ascii?Q?niLBbQinlPCiMBrMXZ26D/qAsP2LS13C2M1lIs/S57yqUCrQkxuGMP7rZPxg?=
 =?us-ascii?Q?Tp7cAzHahMYbqDQ3hI8Tl/Qy13I++UDD3emYVQa+kKUUcAjp9qectAi2pOL6?=
 =?us-ascii?Q?zTPAkjO6QYK7wYKjgvFOGhlP29STWzofwmRtPc+/qWejwcONiEjyNWEQu4BE?=
 =?us-ascii?Q?/BjlFWLZhfVg2W77uckirXtMZ8mmud0m5akoB+yO2BLFohojMOU+AFz9gea/?=
 =?us-ascii?Q?BRRwv8muN6t2C78ZNAd/cGWMtrsv9/lkBT3T8rUj8eiPLgHccAl9n4DBAD00?=
 =?us-ascii?Q?pthvlgLTeJ234wSZahJZG1WOcKxZf1i4mixzX8iGG44hucsaliVsm2eBO6XN?=
 =?us-ascii?Q?QFIAqCHbNh3PPcARsRT2eCvT01r4Dx4m0wtdjcUniAbAAQIyHRCLga/uCfd/?=
 =?us-ascii?Q?xcZLXn2TjIL/GHUf+79GvkHMPcw82hXgYHUTDhTJF0S03+U56ihVGHt/Cmvy?=
 =?us-ascii?Q?zL0zhGCR59xdYF1t6J0SOHBOACO48vdQimYxf6zdS5T6aQFa3PDiKc1B0FIn?=
 =?us-ascii?Q?S8CLUtMm5uMqjxCVUhf8TPPBvUvYcEVSowO6T2ZmJKCiMBGyrq2xLKbvrxgg?=
 =?us-ascii?Q?EgY6bR+NkbEDwSWr55fU/Pc78op7Gc+EtVB4Eb14c5y9wGDqjyTg6/E/h2az?=
 =?us-ascii?Q?/4zUdi1hS2wr1U+9Xn62IBir7ZYqqpNiiK5liTpwsFhhyRv2ZzJrIB6IO11m?=
 =?us-ascii?Q?MVruEcZKyvXa9d8XIEKV+Wx5qAUBQD1YeNep1OIqY8SlJpVslbeM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 739f9f4f-2052-4c9c-ab52-08df351331cb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 16:47:46.6808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHmPZWorDekGesqQPwh0+Iih9X8FzvN2904ZF2EBjxwu0ePA98Il0Qv7MAKkS1utkTssmpyX1Z7rvo5umKK9b2dutlFbJc+FqSMA1HxgpTg4asHJOIIV3U1eAnFOhqIA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB424962

On Fri, Oct 23, 2026 at 05:30:44PM +0800, Jelly Jia wrote:
> DMA-350 channels may be reserved for firmware or another processor.
> Read the optional dma-channel-mask property and register only the channels
> whose bits are set. If the property is absent, preserve the existing
> behaviour and expose every hardware channel.
>
> Skip masked channels before accessing their channel registers or
> initializing their interrupts and virt-dma state. This avoids clearing
> or configuring channels reserved for firmware or another processor.
>
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  drivers/dma/arm-dma350.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 9cb5b2f03113..32ec6f061ee9 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -1205,9 +1205,10 @@ static int d350_probe(struct platform_device *pdev)
>  	struct clk *clk;
>  	struct d350 *dmac;
>  	void __iomem *base;
> +	u32 chan_mask = U32_MAX;
>  	u32 reg;
>  	int ret, nchan, dw, aw, r, p;
> -	bool coherent, memset;
> +	bool coherent, has_chan_mask, memset;
>
>  	clk = devm_clk_get_optional_enabled(dev, NULL);
>  	if (IS_ERR(clk))
> @@ -1285,6 +1286,19 @@ static int d350_probe(struct platform_device *pdev)
>  	dmac->dma.device_config = d350_config;
>  	INIT_LIST_HEAD(&dmac->dma.channels);
>
> +	/*
> +	 * dma-channel-mask is optional. Firmware-reserved channels stay
> +	 * clear; if the property is absent, Linux may use every channel.
> +	 */
> +	has_chan_mask = device_property_present(dev, "dma-channel-mask");
> +	if (has_chan_mask) {
> +		ret = device_property_read_u32(dev, "dma-channel-mask",
> +					       &chan_mask);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to read dma-channel-mask\n");
> +	}
> +
>  	reg = readl_relaxed(base + DMANSECCTRL + NSEC_CTRL);
>  	writel_relaxed(reg | INTREN_ANYCHINTR_EN,
>  		       base + DMANSECCTRL + NSEC_CTRL);
> @@ -1294,6 +1308,10 @@ static int d350_probe(struct platform_device *pdev)
>  	for (int i = 0; i < nchan; i++) {
>  		struct d350_chan *dch = &dmac->channels[i];
>
> +		if (has_chan_mask &&
> +		    (i >= 32 || !(chan_mask & BIT(i))))
> +			continue;
> +

dma-channel-mask is u32 array. If nchan >= 32, you should check
dma-channel-mask[1].

Frank

>  		dch->base = base + DMACH(i);
>  		writel_relaxed(CH_CMD_CLEAR, dch->base + CH_CMD);
>
> --
> 2.54.0
>
