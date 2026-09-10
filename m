Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013020.outbound.protection.outlook.com [52.101.83.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80E83A75AC;
	Thu, 10 Sep 2026 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058242; cv=fail; b=cqykIj2lZtU1jRpS/AQJgIDrgcjysnYN0A03qt9vwYbMAVbCMDH22iGyoz7VoXfWGBQwukelU6sn0duEvzaewbHz47+hlic4JGU70lp+11d+7v7i3gE+TpnPUt+Rt3rkcnR6M7hplGuubIGVJanOxPcPaVxO2GgbQCjiA33Fy2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058242; c=relaxed/simple;
	bh=3lHSzrvMcwxwdkHcNkaSS4ti27gj1UcZQKtrfNv8rDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ef4AaUB8pi6qZhUGCGnoR3cCp9CVkl/mfpZZwrRocwlPCjP1q2bv2D/p9aIVxiZ/f7cnSYRl6qR1HTYKUaUmkk4TJiuiSilGXVB4MMgMNCzyBWu2xmruIgI0eYFxNUMvS4oTuj4Uz2d3fjRTRJ35wIdJ9dg0P5U6CAjYcnuyeo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JDaoOjic; arc=fail smtp.client-ip=52.101.83.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JDaoOjic"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+bsbQ87l7sjj2IAK8HVna0+/yINEsMr6MdB/RH7fEc7CJMedm1PncOoApoS8qNExZQJEUkl7ELgLLHeH4A63QjxaaSlEKrQQo0gQRc7+L0TcucIm1Fg748HMpRNpOng0amYYy+5dK5PzqcjwJUv4Q+VX1s7uDl5gZKy/EcGWmZZXj/N0Wi2Tz1S8CNHgDSbTDgoN1A0xZjtKLsDe5NIj2bfs/9KW6sjJywMHQXKH7eZWObF/zYUYgKKGw0Bg8uXWZ0uz41aWQIulqJpQ1kaSmX24hdGRHz6yVj0c1cWYC8c8/LotNlPUHmsMOxPJjRDGMpKfFDBLcRc3emwpmfv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvYB7Sk0tJgpOEfZyUQRlKfRKv+bmOWl8sbAG3trAwA=;
 b=R40bspBeSUl7vGUGW1I7whig3KIZ/yMFEMWj9nm5OFUDx0AIJu+mkMBugPPfO6FUxYCKwbwO6nAk9Zr3vyJMb6W0XRbpTpKRGFzkRV9+g/S+MU07J2I0j4Cb3n3rEeajTgzyOg1Qu+gf/lfVWET9uI97eg02Y1T7ofYnMT/4gwjGjuRw2BbYqF2hyl0YMpVouya8SID7+vDRoWCo0o/jIrGskZb3fwM/JfQJ+8V8BQvpu04TMTMvpkwx6pQlFEY2fRtV9AhYn2lLalfe//LBbpBUiiI8NeKT//twYO6ffF3xkrbebUjVeoxOmgywCYWrGAn22tUtpF6Ww24O2cw/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvYB7Sk0tJgpOEfZyUQRlKfRKv+bmOWl8sbAG3trAwA=;
 b=JDaoOjicUORsvrNSLn5Tx/sGu15rSBPhG2peto59nEn9SaDZ76nOZpighcHw7sONHeO1qpBeB2aouoEYzGGb0kDjTdUwRguctHiF+FTGlJsvdM4a+IXpFCyqAGMn1X/wDrwMpXHc/ig5ekCNgxVR6nC+rPQA8W1aWoJB7qU8OGckQL4exUJoxfLQxoFmlIqD3RS7F6N3EFwLADe3YGYLlv3IvUrrpk8sY24nLZzcgluC+UQPHuiPq80b/RoOfXOHICfRU4UFVwTC1dXECrFudaVn2D+WmBFBL8LQYVkerRXyiEfbIc7yS76rQSrUQHWH/LSqIWyyM4c8Zubfso96gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Thu, 10 Sep
 2026 16:37:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 16:37:17 +0000
Date: Thu, 10 Sep 2026 11:37:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Subject: Re: [PATCH 2/2] arm64: dts: imx93-kontron: Add support for Kontron
 i.MX93 DL
Message-ID: <aqLcsc6SROjv6FRv@SMW015318>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
 <20260910-upstreaming-v7-3-imx93-displayline-v1-2-bb9446e6ed6e@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-upstreaming-v7-3-imx93-displayline-v1-2-bb9446e6ed6e@kontron.de>
X-ClientProxiedBy: CY5PR15CA0155.namprd15.prod.outlook.com
 (2603:10b6:930:67::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e20645-4797-4ea3-9b47-08df0f59c69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|7416014|1800799024|22082099003|18002099003|56012099006|3023799007|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	VNypQszlb0JbBJjoC7zuzpPoEL6TtByra3wz4vQ2BJaVBK10nnek3ej3x1m8K5Pq6okGatsAQB9qtPWdeUdT3Pojht+FDTWSkTAVlKH2yPlChm2e5+FuTKoWlyy08oUpQw7HiVTJpvT/slCTHxYultCc34XNepCrRyj+yBB0O5I+xVB8qjCbhm7RO4c3U9PL2UBtFSqwOkbhQIsyRtcceWlHbSy6W+Lrf7GMEqX9HzmBA5UbGNzM4uzdYNWzDna4Qgt9q3mAMUhHzMF5IHALLqCI2QbhOXhLqUoXyZ9eQv+EXJCAOVAbb1ZGXyBXta5kpCX/TVTEuoxrBepcZM8xO1O84Ay2ybRs3Y82S+dHn6vCzX26tggPfNEUo1q9YN7v5R1pvkoK9r6hGIQROlqjg3vrtKeox9QmSxPfgmcbEQiv/cYMJtXZygyz/aLazXFIu6tKqsV7j89wTkw7ocx7vmo65GBGzIhYjw2uTbiWqC4I+cuN8rMaDMdxpHYHC/CIXE0e0teWWNGpK4a7RfNVqYp2RDpvHccPxSorZgB4TLQow9us73hb7rTTXutyOLk7yMJqdw+j8c83b5/1KakhUAlcLHyYHERXYf0t2bOmHy0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(7416014)(1800799024)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nxNaR9+7aYOWr4rj1PKoI5A49gnkvNhsCorYNoQqcY3RZdbup15mHK3eL3s/?=
 =?us-ascii?Q?xUrhQz01mYDMc/iTQBtgci16BJ4hJubLQm8bYwmteXzZN9+fdumHQnWItztm?=
 =?us-ascii?Q?5/1ETdL/Bw0tkl3cH6fYMJKy0r+8COz6luXWIDt+CAnQy5QTUDxpD/C2g6h2?=
 =?us-ascii?Q?k9HO9Aj5oP34mIrBUmeYrFl3GfWAyvh1LdBSM8y25aiXNe6s34lEcUHxGWZn?=
 =?us-ascii?Q?opyD/4YsEuQUVi5xPg2/+8TYmS/lgrILVxAJJlaTnR65GEnW3/QTl+IPvY66?=
 =?us-ascii?Q?7oogC5BAjRKlI+xjA1TH4vqs34EvOqdcnHGK09LyObLU8ePI2zFcoDQc1j0K?=
 =?us-ascii?Q?YlqbITOCDnhxvO2Yb+QdVVvYuGYotMcZhAY+NGNNSh6cz8IKX4q4xxEhAkx0?=
 =?us-ascii?Q?rGXw+G0HkVSsawOrZm6x9GrvTnCQOLjW0924PQ3kqW6NksyISYpcZWHCA4fB?=
 =?us-ascii?Q?wrvfluqR+BSLlmBlLEUYwW/QmHmX1/8WpCJGGmahZBEQ5ixlj0MLNPe7d4Zy?=
 =?us-ascii?Q?KDTvaVGVODwIWfcdfyQy7azpT8fYthytmnEm7lgFaX2nQ36Br4KBkV1D01GZ?=
 =?us-ascii?Q?h4L8Es8o9RnAOXi78VK+spRMmfN10t2drmeEedZ6rV7FM1F5MuR9OKYzVrYX?=
 =?us-ascii?Q?g/JJR863yDHviFli1zLSK96K6nFSGjrzyvGh3IVddzBuf2/9KFi/VWllLBOy?=
 =?us-ascii?Q?FFcne30WKyoZ7S45J8fLfbAYj3KaKiU81Rp6joX4cgyszDutcUMETzN9rNcd?=
 =?us-ascii?Q?4xfPRZhEThq0lPrpCETi8B6u6IXPDKlnAlFuBaQRTuyapcrT3XH3W61Pkc6+?=
 =?us-ascii?Q?FaT/dNgMc+O7OEOHM9RwcEtqPrw9INcyPkz1nwXwWCAV3vRceQjDkitWBxUT?=
 =?us-ascii?Q?RgMVb2pwI1l2Bg8PbFRe0nLyx47ykj8ZuBDw9B/o+PjKq+Pzu7VhcA/31VBm?=
 =?us-ascii?Q?/8hiWptIH6zc7uMkW0tO2qBr326wqM5TxKpjmDJm04ShQ6C0lU64eZnUGYv0?=
 =?us-ascii?Q?kuwNE13F2UKokYUArZ0AD8DzNMCWN+3eXW9VCUmyIW3gFzJSq9noQX53gvFr?=
 =?us-ascii?Q?iixy88KNpFNtlpDWMz2O8dreVuW6I7q8+mrTon+3wtv9EnXz9lH8JjSMCDOG?=
 =?us-ascii?Q?VHlg/Q+4J89R6UFSxTPD2BTaVSiIgGgbZIROSxXcJlyZqxXZr0EaiG/7G9M8?=
 =?us-ascii?Q?0wF0/Vq2+S5HMM5lCdH328ajjidzO/IPcl2so1kJGHFUyuFhw1IPgHqzfkQi?=
 =?us-ascii?Q?CGnFRPvvOa/+3wsAV7PFDKUcoWmfhiDByx96c7blrfr9suftwVImZ0QfeW0x?=
 =?us-ascii?Q?zvGiV8USWVrF/hROOCLhqG7JOhX+VQz6FEbTGcw7wMM/0tTrMjFWN7f7f7yC?=
 =?us-ascii?Q?LT9q3Z3jk8tpFOje8Tf9JpTvDRmNgTdBrcg81o+s1piRcSnOqAbBKN2emavs?=
 =?us-ascii?Q?x2D5BNOd+4L2zcP2G//HH9aIAEnu1ZbWqY3yUMAt/PiIVDvDoAn2x97PBcUV?=
 =?us-ascii?Q?qiGhZgyyV/wR2Y+5pKSRRvv9bhD4dhvl3eRLYeFDcaOF6nJqSnN7yvtb0kPr?=
 =?us-ascii?Q?6EA0Hxh4PYC0m8K+WwYbruZ8UX9aXYyrsPLCQh5xfrtslJSbWkrgibZweDg4?=
 =?us-ascii?Q?8NSHzn8/KEEwqJYyOvrKGhB8aD1hXJs2MOn31rRh2p/djLnstjy5vkw4DYtE?=
 =?us-ascii?Q?ciVbHmvmLbPBXGuGSXNdmheauEsvnDgak0kNVW31/DDsCBXXGwQofxITHDWa?=
 =?us-ascii?Q?4Vhl0wsjGht9kU3zEE2gvHO7LcYwZrp5uu4Niz4h9dOFsUOf5xn2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e20645-4797-4ea3-9b47-08df0f59c69f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:37:17.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZnQjVZUcM6zbyCx2v6S5Z2Qd1kqTSD+hf1vv62wmb3kQ+Vg3Qy9tAIcr6LNT+cCMkeEqgAelq4wIPGxzZG7ImoijesA4eP0USLS3Yrf8U2VbaJ0rGwkQYVdOqR4qreh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341

On Thu, Sep 10, 2026 at 05:19:07PM +0200, Frieder Schrempf wrote:
> From: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
>
> This provides an overlay to enable the 7" LVDS panel on Kontron
> i.MX93 DL devices.
>
> Signed-off-by: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---

Can you use similar method to share 7" lvds for other boards also

https://lore.kernel.org/imx/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com/T/#t

Frank

>  arch/arm64/boot/dts/freescale/Makefile             |   4 +
>  .../arm64/boot/dts/freescale/imx93-kontron-dl.dtso | 104 +++++++++++++++++++++
>  2 files changed, 108 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 95ae85ab4adf..2f0d3378c050 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -653,6 +653,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
> +
> +imx93-kontron-dl-dtbs += imx93-kontron-bl-osm-s.dtb imx93-kontron-dl.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-dl.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx93-kontron-dl.dtso
> new file mode 100644
> index 000000000000..2d962823dfeb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-kontron-dl.dtso
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Copyright (C) 2024 Kontron Electronics GmbH
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +&{/} {
> +	model = "Kontron DL i.MX93 OSM-S";
> +	compatible = "kontron,imx93-bl-osm-s", "kontron,imx93-osm-s", "fsl,imx93";
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&tpm3 3 50000 0>;
> +		brightness-levels = <0 100>;
> +		num-interpolated-steps = <100>;
> +		default-brightness-level = <100>;
> +	};
> +
> +	panel {
> +		compatible = "jenson,bl-jt60050-01a", "panel-lvds";
> +		backlight = <&backlight>;
> +		data-mapping = "vesa-24";
> +		enable-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&reg_vcc_panel>;
> +		height-mm = <86>;
> +		width-mm = <154>;
> +
> +		panel-timing {
> +			clock-frequency = <50000000>;
> +			hactive = <1024>;
> +			hback-porch = <160>;
> +			hfront-porch = <160>;
> +			hsync-len = <1>;
> +			vactive = <600>;
> +			vback-porch = <23>;
> +			vfront-porch = <12>;
> +			vsync-len = <1>;
> +		};
> +
> +		port {
> +			panel_in_lvds0: endpoint {
> +				remote-endpoint = <&ldb_lvds_ch0>;
> +			};
> +		};
> +	};
> +};
> +
> +&gpio3 {
> +	panel-rst-hog {
> +		gpio-hog;
> +		gpios = <26 GPIO_ACTIVE_LOW>;
> +		output-low;
> +		line-name = "panel-reset";
> +	};
> +
> +	panel-stby-hog {
> +		gpio-hog;
> +		gpios = <27 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "panel-standby";
> +	};
> +};
> +
> +&lcdif {
> +	status = "okay";
> +};
> +
> +&ldb_lvds_ch0 {
> +	remote-endpoint = <&panel_in_lvds0>;
> +};
> +
> +&lpi2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		compatible = "goodix,gt928";
> +		reg = <0x5d>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
> +		irq-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
> +		AVDD28-supply = <&reg_vcc_panel>;
> +		VDDIO-supply = <&reg_vcc_panel>;
> +		reset-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&lvds_bridge {
> +	status = "okay";
> +};
> +
> +&media_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&tpm3 {
> +	status = "okay";
> +};
>
> --
> 2.55.0
>
>
