Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793821470;
	b=qz5kn+3h8UoXbuZQn6k7xbAJQ7R6c/gdLxOk1b84TghUWMEpRIL4uMxmEyDI2QE/M/ha
	 7Rsi0xIggTEWBF6vrA9YMv7OCuqJJ5AsN110m/D+H+oDQx61Bd/ZP7tzO7uM9a0YOY7HG
	 EcQ8uIxThu/xwL9qaDxg7FAJdzVB/IMTMbpK8fulEoKd6cjUXi2Uh5qeGmx8lesb7aK+M
	 CC1VWzrKCl1Ryv/ecX6ZmI92i+clhXE+ys5H+4ZbTTxz0iKAPDwQwDuZ7hLW79hBXzlOu
	 hQ+ZLO2fXbCtzlA8RrKizIdM35udg0JiWoiFsu9hFis+eN054y1kxZshQIdqfWxofiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821470;
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
	bh=28Bg4YpkIxeHR66hYThqqxPtMscbSd99+p1fYKc9Z4o=;
	b=EKvRatwyqSD2fI4K4KDdRQbQpQUg9xY3B1ncZo3tnb0uv1THGYQTeytbcefFHeQQXk6J
	 ayCS/GtzCbFcAH8SRQfE1AlycuxK1/BRXxninT3ydVEiFFQZILu73xUZPFDGcVrtCwYvy
	 ceM4CelnT08UXa3Legv5sSYDmOAsoe49JnOFh7QjrKY01MMpT2Fy0a2BgjCtJu794j1lp
	 GnVj0Am2NyK3Vexq/t8rn6OdmrLs9nJLbr3oXhLzFXG+BuNrVUtfb0tvQG1b0yE2a1d2B
	 CJaQQ1cUshFhmD2zJsW4lHM5s8+X/3wJrIgAkVYCTW+4kMDK+lXy+8/YZxfTgPfRBdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=I2Wbx9v5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.30
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013030.outbound.protection.outlook.com [52.101.72.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2467D607030E;
	Wed,  4 Nov 2026 19:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2467D607030E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=I2Wbx9v5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1dqX1zjeNhImHs7kXeYE3hFlB+w1WJwprkBHbKKDrev0zWp1awvHQrDGOv7wRkDluxMTAMWJyzgNi0xE9QzxW9z9aS6Y0veOJANizzU0lQ8CfhPof7JXegSC9GTGj8qW7ZnAed6y758m2warjb64FtBlh1uCHfwEiZ2memliSczIoNKzqZr81+1NKdE+70Ox8chhCOYFL3L5igz6pCj9rIadyyrnu4bN+Ag7YircyGQYrVk5TnfCsrLzA4F0NQNlCboGxpzoKl7nXCO3yAEP9v4D3+5JfeoHV6se5yItE4OWkthZrTUyEMoMynNA6J31vlM2Sn+pSWvoA+N+BpTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28Bg4YpkIxeHR66hYThqqxPtMscbSd99+p1fYKc9Z4o=;
 b=s1JHr7dXaON7BY6mOwKljQncexhIgsTTRqkvelmg9Ufcmcs/N0OyM8lxR7T13EclZemGl55eiS/Lz+aezPN91BEWNE5xXVU/Yu+/DM02NhVl9RldyfzgPwIp+fPmkBy2HUVWQudHSZuATu1fduolACp3z0DsnRxftvRYCN4XwA8XhwbPwGKfauK54dtboENyYiVzCrsI1KavKOPZvho/KlYft/2vHer8lT0neByxLvbRwtZfGreZFJK5iz0Dz1zlKsh2P8C7MJBOnXpC20KpenSTal+VdRfPyRnHl6meTRTzpddvjPiy6y0VRMuQUsFO4/7ui0x+zEV2YTNyNtkh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28Bg4YpkIxeHR66hYThqqxPtMscbSd99+p1fYKc9Z4o=;
 b=I2Wbx9v5iBwptNe8xtInRgqwmFZHm/XhxahAEflBMX0ihTBK+xfZmZLbsJ6vrpyrtJSq1bA2sOEKn3k3s9j+oK7MY1F195cN0QGuKl7MPUqY+CFhWTy8/T4PFMKd99PcZhAXWFxdEFKaxzSjkV6EIkTE+xcBvsTBYpPP56VLJDRoLbYEoPlyDSzz82nyxu5exd8HOOuphnKLl9U00BN+b1Q+nsGBMtUrJubddxZY6vd6sN5QKpgqu2e4988z+Lpe9Yw40P7/JsvmxU4mZcKs+Fqaz63ggOtWdsLPz3eD7F/kwtEGUGUt859FE9HRQ8NraVVgPLJyQ/l4qGx/s/9O8Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVQPR04MB658120.eurprd04.prod.outlook.com (2603:10a6:710:108::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 19:44:26 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 19:44:26 +0000
Date: Wed, 4 Nov 2026 13:44:18 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v2 4/5] dmaengine: arm-dma350: Honour dma-channel-mask
Message-ID: <auuLEgmZFGJ0Ol0g@SMW015318>
References: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
 <20261104124437.296753-5-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104124437.296753-5-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: DS1PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:8:457::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVQPR04MB658120:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa0eb96-22f5-4858-8b01-08df3aac08bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|7416014|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261026140227099003|261022105027099003|261028144727099003|261009223027099003|261021121427099003|261021123027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	r8B0bXDyJLQgRs+XQFx+R5/1IusRhR7cqrjfDde3iWDg+a1jrmUx1gabfPNb+1fnLvu+YOaJrCED9ZObBKnSq/DQEoU0Vn2F0nv5aVF/4wU6utiXbMhbtzTo+A3NRaHtpJy9czCR4mpjKguF/FRzvZagZcDEI3UIb4wz7ppQR+0AvcM9J2N3cw4YdxIdrCTZdY8V/a1h6YNhRGTi6KRjmh7EQWLrapB48dPzzHocz9I8Gz+60Y9EQkmiw6BbYwKIhPc8kdAwVGv3avEmPEPt0sl9uWxrO9vlJJYThgf/dGCrs6lxqoEGBWxjYRJJfxaMrxJRVnST1lGIrth74p3hMhpey429pL5+SLBHimM0hBVGE/DLW513aA88lTEyvE4Sj+jMBSPFzK7gMxa0k3O6tzfokK1EgYrXw+1wo3Tre9R64sMqr2CHZ76W1l6H4h9E/LReQhleqfe9WQGIEZSQ5CCSx5v9BDQ1otg3kFmthTzagHZ1dT9vmS9UbGEfe4csugAMQaO5PATrF5LhIIY1oaN0PVom7iTyXKvPsSOEVE0l/RUN9hP8kopCQje5AG7kut8JUrjUZWnuL0pNl+xb8secuQoPztPYeezol+0ogQAkCjqlhSfmgxEaaObB7zxIZzpZoyQzAh0+3VdRmCx/+KHfZ2YcKaMOvqK+vZQy0Z8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(7416014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261022105027099003)(261028144727099003)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4kF3Qp0VdoSct+Ka7zJbOJJ2NJpjyoox5V9/XPWWJsU4T3Q74+58P1IJOH6Z?=
 =?us-ascii?Q?JRnGRrQVga1ZK68pQBH6YM66TVhnj1Lv8URil3NjBb2E3loqcibIrAzjgzHg?=
 =?us-ascii?Q?GfGH5hmDTw4mreMACTxfbJHHAXvTAV9x3GNDpXsUks5lEzHvyRyWMPa5oFGm?=
 =?us-ascii?Q?Rfzl7Wnd4UYrEo3PGONJRsm5tlVH9VUUbiD2kn1g6JGC/2LumH6kBV/0AYsm?=
 =?us-ascii?Q?vNDQ136jLyfVdXKrcS6yD5jGjmnKZqYL0dxQK+iX2IQAtc3Jg04R6wLGglQ4?=
 =?us-ascii?Q?K7cziSDCHcRyM7mxlJmT/sxZEDxqtWWxM9lx50oKX/RkRCh3aLQpWxLVcPri?=
 =?us-ascii?Q?Kzovei+VrFXfvemM1xRLFwAhw5FcJm79PnZm6yDTbp3whfvje7dXBKeP0wzf?=
 =?us-ascii?Q?DEGbSrR2h+Ms7jFLptSNknhCxpaw6CLvc1WDPOvwp9mrsMr8cDxmSIn+215V?=
 =?us-ascii?Q?wU7sVDBmRN/M1lVEGmTV31TErDjFgJ9REDmpH/pWynkxzdRCMXmnnjO2vAwf?=
 =?us-ascii?Q?OzMsnON/TGLzc4xcFuuUToRb4jyCAgjVeEuaaoVRJqyuVd1BNNQnBfvV/BqG?=
 =?us-ascii?Q?lRlRSqsqEzRW+gLcafexM0w45QWE8gQTMkzAexR4Fb9Ryq3NXGmypkduGlPn?=
 =?us-ascii?Q?uS+DoBndGmgOqUB5W4akC3CNz8glNvfH2tCGJqrktvGwJw6xcd8QxFvyxfvu?=
 =?us-ascii?Q?/2zqu3FzRmBL8Ks+e5qGiHxZ6Sij33AJsPZgOmY2wJtAfmNQUh3E/xseNTXA?=
 =?us-ascii?Q?MgW1+4FhtWQkr3a7aAqkX78ceiAQA8/tAeECABYfP8e3227wwK3pKvrZ1fTL?=
 =?us-ascii?Q?JnFOs+sVZeF8yw/odmiIed3zho6hHqq6g/4ru/Y7M453wZ/YTotvGoju/vu7?=
 =?us-ascii?Q?JPceVTW67sYABtpE/otkcm0yEdd2tdMZphfa4rxAIjNAeHnF3hYHcX0VnIpd?=
 =?us-ascii?Q?CY+++g8tNOQ1KhVNJeV5e2Hhi4o4x7wocOguxBZ6MkDyj4dKMSHftJsa6v91?=
 =?us-ascii?Q?uDur89ZXYXWrEN0pjD7nhkv5vVurobjXHvFzVQxcAmDG5FOJD6aKJGlWuoAf?=
 =?us-ascii?Q?I74jbzPO6R3eoClfbP+uDa0B7YA1KOpKZ2on5eDYdk3zgzxM46JpGHCLE12p?=
 =?us-ascii?Q?OIlgbYxYVvTgPHaEYadEN0m59v7xH0kcfByx2Q2JqdCqZ0ZED+0R8ix+CATh?=
 =?us-ascii?Q?+DTpGcCmKNfzFQ6GugMD2Y+I/nPvSE5Ug31eZxB6y1FTHpBSNealJBfzdmxS?=
 =?us-ascii?Q?PYY0tQT/Ed2bBKq0/0V6gErh94xH20jBGOEPJsP9LOU0CF3SkrhfCY1kMvtj?=
 =?us-ascii?Q?2RTBSvuWhgB6ESoi1AWrpLdnG/88yDZy9HVlcyNedgX2AQDGMR1HFywEsfWA?=
 =?us-ascii?Q?DJeAStn6BDQV0KjL48HvxIruIa1igd4O11d5+rTrenKWzEymmwMWpFPXH+4L?=
 =?us-ascii?Q?e4FHhNyzzCw0WLUSVKnE/HdyTwa5k9W03fJeS7ingKGsbghj20396yYHyhZ0?=
 =?us-ascii?Q?D1FOO6nCTS/wgOmUA1nkL9cLuXww++yITbwOhOC2DGXj+iLv9DVv8M1BbFQl?=
 =?us-ascii?Q?catkQSa3dswAItDCVZehzPHE/zZlutwYN90Ziy2Me17kKvxIiq25pSyl53qd?=
 =?us-ascii?Q?4C8DCVIfj207KFFeXWCQiT4WDWXSBruhr4v56xTEAz6chyOQoLyGzSfz5mLY?=
 =?us-ascii?Q?HTA+VYgdMY/xIZs2lIXHa8VxrUZJdzisB2i01kwl/iMnOgVLQnb4mL6aTccp?=
 =?us-ascii?Q?1NpTBdYWiBmB6G+Kn1DntciVNdZnv4OD1WAqLScJcjd91PUipf/9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa0eb96-22f5-4858-8b01-08df3aac08bf
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:44:26.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0tRTX0k1y+ZvxOaIpQzqJdusJEH88dVoYRG0tBcDm6ts73VMwIdX+wRDDWJFL1NWQHJzk9NLoPL+AFkWbYkEDTKxdEgLrzro6ar9Qm1o4EjVQ4DJHAn2SWjYnEgP9KT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVQPR04MB658120

On Wed, Nov 04, 2026 at 08:44:36PM +0800, Jelly Jia wrote:
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
> index 2f22f8a0ab47..b24e569a1dd8 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -1253,9 +1253,10 @@ static int d350_probe(struct platform_device *pdev)
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
> @@ -1328,6 +1329,19 @@ static int d350_probe(struct platform_device *pdev)
>  	dmac->dma.device_caps = d350_caps;
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
> @@ -1337,6 +1351,10 @@ static int d350_probe(struct platform_device *pdev)
>  	for (int i = 0; i < nchan; i++) {
>  		struct d350_chan *dch = &dmac->channels[i];
>
> +		if (has_chan_mask &&
> +		    (i >= 32 || !(chan_mask & BIT(i))))
> +			continue;
> +


max nchan is 8 (in your cover letter), why need check i >= 8 here?

Frank

>  		dch->base = base + DMACH(i);
>  		writel_relaxed(CH_CMD_CLEAR, dch->base + CH_CMD);
>
> --
> 2.54.0
>
