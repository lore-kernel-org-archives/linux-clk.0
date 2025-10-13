Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22B2D781E;
	Mon, 13 Oct 2025 19:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382513; cv=fail; b=nOKvrA0bfC1Q7H08ZKGpLn6ZEznbQRXidqBr91gjJrSrKz2HNEYmaqio+OfeGIqWe7R6UfQvcmyZ7ekXRxHSC/njXYH/37p5o8TzAqj1ngrb+njIanBPuO7q9K6W9H9rGBwuAY40nmpQk5ZDs3PzJqOsxGHGyUkn945p1J3vKxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382513; c=relaxed/simple;
	bh=trAtlTteIoIBYw0xTwK12tnk3Q0sF1lqMXAb7UPGabw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JKcC4m6tMTJ+zeU65d+smqDbszMiJLpeh7fTLha7pOqSdiERKAvLOpb4VdQdkF2Ar+OKfehe2XEJwwnTkesQOsuBmI+heaM9IYS+HLEabpMh1axjRALWJRgwcJggtZJxrH2n4YS+nrNp04jEofpTqUxmnkGlrYLnIIQ23OHA0jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QS8vZ+yR; arc=fail smtp.client-ip=52.101.84.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QS8vZ+yR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSO2AcxiS0Kqz+E4a56uBB5h36Nk5H8mKAIfSipnMA4Qe028+ElCo79gKyMJ72Vrha3EG7HLjb6C/xssbhzZVNg1tkhtXzPud0KCPZ1aXCC9carFQfCkCPSuT2cU9KT6Gxh6LxieMvgUtRfQ26LXuza7j0mCGydPXrUnk7wGylpnk2JOd2utMs1X2DnqZQZ7neNM7mc+5ldYp2FLLHLKKV6BPEZ4YTElQiTkiPGIxPisoriC7oDfSQrxt8ZW+8S5IQUe/igFPrxqY69o4LoXA0wIp9zoa074PtLhcYaT2cUdjZVAyJUB1UTcEAVauF64qxxPEcK4M8wx2MCfDqVZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKJLCmIG9C7oORA/Aj3Sv6EcdsnWWfFckpRRziMKtyo=;
 b=TJhPsx0s98pU+NZD4IT3ft3+J7OpW9YYFfynVdbg8UYFlru1QG8wYu5rWMpXGljGPoas4DDPtj4E+aus00LtWcC5AYoIWAyrB6pLmCZSvWV/jaLPkSe7CvSF74VKWEy3JYnVhrgdkOFNVsmM41qXxlGrtNjg0ef15yo7Ygwafhk655GM8QnqNO8G4eLEDBF5k4QHdpsNo8u8R6p6GhTtufUepWwxhvSAT243cvhkr85MBXdhauxzQA0ZmwhN/qFFQchftxjBiay2R52SUqwqnXaiw04pmiR+sLxP9gANcBUdMR5wYmLM1Tf5gsGTBaRJ3zCe8KGjJ16rU+l1ELJJCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKJLCmIG9C7oORA/Aj3Sv6EcdsnWWfFckpRRziMKtyo=;
 b=QS8vZ+yRGf/d+/CnZSHQhMs6nkSENPYGOwYozvPoGVGHqXM9y6vlB0sVQl8QKQJhz/t2OkjBxWkFCanRlY/6bljhhi5rZdZs0NItxyi82LtM95krp270R6sbiqGWCuIrYKWaJ+esQsRvVKIMG4aJq9jbrGxoA5K0GZ8zuatFVC9LvhxBA6UqLfP0CN+bxvN1TvlaGsA64A5L7c+cFSU55/QBkmT+zDTY4EdSxF76XXEGAX8TzQfFTaAEycTjFvS2WYgM8EqKltuhPFGUjjtfbE3D7CGHkyqeka/6nMd1uGZsQ++/WUKt5dsn0dymzRy6JmV0lqB0JQKzZ/wRssBGKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GVXPR04MB9758.eurprd04.prod.outlook.com (2603:10a6:150:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:08:26 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:08:26 +0000
Date: Mon, 13 Oct 2025 15:08:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 27/39] dt-bindings: display: bridge: Document NXP i.MX95
 pixel link support
Message-ID: <aO1OIa86kNtboV+X@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-28-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-28-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH8PR22CA0002.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::26) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GVXPR04MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 18fb7773-bead-4b22-f476-08de0a8be303
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?rJ6fKMvIU2Mkn3ptxxpb2KCs5qikcVucZZuquVyo7++xd+QlbIzk9H/C+RT7?=
 =?us-ascii?Q?CSAxKf0atJ6rU2MwzU1bNV044Z5Kxw5C4Rim1je7wn9ocy04NcZHcx/W/SPR?=
 =?us-ascii?Q?8egQV556+IrF35SVJZYi7OjAj4v3eRCWNGtBErL4VU4l2Nh6Mk4tDMSnmHy7?=
 =?us-ascii?Q?hlpsVvJQcTrEjlxmlrLfLQbGOJvbEzZ0I+xd/FUZOk/4x+U2Xy4r4vAShFBh?=
 =?us-ascii?Q?+6UoX99Nz4g8Sb5UOXdHqUdYI0Qz3e0McFo3jHXRZasv4BTniOuT+L6ue0K/?=
 =?us-ascii?Q?C/foFdM2Haz4IHM4WusQi4atm7B6ZTw2kd5xj78sxjdue/4tEjPGSZb1s2lg?=
 =?us-ascii?Q?+3AzwiOpbQxEYLpyONikswNdC3+1XX1o+Qx88eQAStQWnaW2xntarvhxVhKE?=
 =?us-ascii?Q?lHnp5DDiaiT2PJhTeVVAv5B+U8RRI3hBcIVo26WNyu3jkF4oPEKkZ6wdvFgX?=
 =?us-ascii?Q?DJ5E8Y0NA8tJLu8sxK1kkYSWkh0E3vFEYi0nzfy9BBf1vDqwRj9rubK9U/EB?=
 =?us-ascii?Q?SybnQRBh8d4WrGmrpqiL75zmTtJnX4uujI7LwOvKU+j3G4IYsapklP5v+9CL?=
 =?us-ascii?Q?yNnxPMnu6kQaiplzwgDmFctEaXIqOXpgo2NoZLDzt3BmCeFrEKlUkhqy+Ybf?=
 =?us-ascii?Q?ufI/17Lxt2UROUYL8T9yfBe5uxF+AtB7KcnDqTHlkZlnusZHrWB4R6vAVsTR?=
 =?us-ascii?Q?FjZp1wH7AV2Jmj26DLfA+GOSN3CUBaecjEy18Fy96GiYpkOHzFjXPiwr7hL9?=
 =?us-ascii?Q?4MePC6ELIg7HDCoGbQj853JjibB/uXD1MNgZlujbAALfqVhY1Xg61sB6qBP/?=
 =?us-ascii?Q?Z5CoTFS1dD9D7So1oCD5Ih35y9+fcJPocGk16hrcmv6ORNb6HsgZBkHss+TL?=
 =?us-ascii?Q?EyLAB1rL9aNTMMpPeg1v3WDtBewrlLmbrbWj/w6d4y6wwVACycBkXMLgdqSL?=
 =?us-ascii?Q?fiWkGeDUKYEvsq3JQF9GvQzfxDXLjgXusBF4Q8dWV7SL/om82NNlk7l0QbVy?=
 =?us-ascii?Q?rxXqOJFqXoiILHz1zImq9BkR5bFf/l7Vu2/XOCU2cfCHh5dIcFaQR4n//nm9?=
 =?us-ascii?Q?QtSX2vAaVGZxCcTVw886c4tn9nmzN2rPjbrcegdooIb6SIMi8/45s/I51wNX?=
 =?us-ascii?Q?kI43h7DhO0WC7fbktMsBsvl1kODV+YE39my4azyEklcAZvAMSeACdBJe31E1?=
 =?us-ascii?Q?3QRpJMqII7rIXXWPDe/NFqhio05pJT30KiThi2+x06XqKpQQzP0mvPvwKWWg?=
 =?us-ascii?Q?si3Pr+wUG4KMeJVa6EV+rFZTK86V0tJ+pQM+yjksqNRSIR4fehSz9Rf+ScRp?=
 =?us-ascii?Q?6NdLfNUIUX2TprQaZZ00r6nQ8yDBd1L93cIXlDgf7SfnjcQJGtvlT/HXMuUK?=
 =?us-ascii?Q?d+HlMgKcB+cWcADr9MaEUG9suvV2t1QFoG7z2doQ4Z2w2XJs13y1izhNB8Ee?=
 =?us-ascii?Q?RvKK7WM7ZJrzfS+lW9r8+fCLrYVjEdWD6YQgD+vkTK9Xt5CSkIlcQQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?jx6Dr4sY/zlmp5FK+wm+gDFH7Oy4IIz4KH5gmCUbfNKii1fK8eEWEYBMe9jy?=
 =?us-ascii?Q?xA5+Seoq8U3EkiPN2fki7fk9L6Fedm+jSSqbo+tZoj4McUEJjei1B3Bt6rXF?=
 =?us-ascii?Q?YtJG9ySA+zdKNTxvAIdZNcvsEl+8s0/y2ugCCW3nwLeXcyAhQA+26HgtLUR6?=
 =?us-ascii?Q?v6Zxo8cR7a9z2f86TvYx1yhNNDLtne+AZaNPnoaDR4h0OnRMYCdAaXZdbQnm?=
 =?us-ascii?Q?sCYIP0FTfbhq7To+q5jIlCyrewUPsM2JCdkxQGydsAJ1n5u+L/nGaiNfPQHJ?=
 =?us-ascii?Q?2zf6aXFlvKjmpA1OX5wXN96mJF9TihOVAJjzP6Zmrz7vV0NpM72HgBGFGGlg?=
 =?us-ascii?Q?lINQ4rh2zn5GQptTZhrnGjIa2XYD5mmYUJwqH4S3R2UIyoybFp8CBv7Zxdg2?=
 =?us-ascii?Q?zg61xdNjvhEwbmIjc4Znxxes3Fffiz/dKLMNtdPSzcB8aqvWj/0pJ418ch2b?=
 =?us-ascii?Q?FF7LOMh1yZBFnk7GmN7QDnuiwtH1rlZrQIFtJzJ4sL2CpW5IWlSPB5GjCbu/?=
 =?us-ascii?Q?qdCpynyewhrMIWOa7ADQo536qqYrPmWYUtxWSWVAdsJ3vKrtAPKpQMcD18t5?=
 =?us-ascii?Q?D9h3SaBAFurLI/Dh5sWD+cIMuV7HHhgT4AO1RprWUOIb/XBmjpKLRPWLU20d?=
 =?us-ascii?Q?Ykq6xrk+sfQOmrEnCjYoN/n7JqS9Jrrm09llXD3xsPihenczGzY+fjlesy+k?=
 =?us-ascii?Q?1hlemcCWC7xWTycJjo+FddZO9s4GJDHJxmWDvPDaiWAU31BjV0vcY7noSdHl?=
 =?us-ascii?Q?Cn70FZWEMpanR6EIQjadVagxzaUHijMNFlJujgf29of+uRZJ77SrkbJgBYAq?=
 =?us-ascii?Q?FWLehnJRzjWWUCntpklN7E2hmKi2M904rFggmGmbZOFIEJ5Bg04wArE78YqV?=
 =?us-ascii?Q?OI50eTZEIyfMM98hyZnYMPwWnID+JAvIaswvZuyt4Vr6Hod3PNEi2H3LRT0I?=
 =?us-ascii?Q?2Xc/5pReIch7iuWki2elv9eF3M9GA0c/cym0bSzRivDSPWydEiyoF/Ihyusd?=
 =?us-ascii?Q?ZgQLSnTi47uKEO7z8HgROXBqcisF8jOMYh9UPCg8C9nqi/0CZjT05jMWxZic?=
 =?us-ascii?Q?g9d1ISOnjqq5ErHwLANwByBQl3juCmZDf6RMrskmni2lyY5++oLGx/WKQ/Zp?=
 =?us-ascii?Q?sHCEXQWwQoBJmo3YBGTB5ssMIg9Eoj9ER7ehWTPH+COt5QkZYn541t8AFLRF?=
 =?us-ascii?Q?feNs/iGkVZUft0q3XO9+XJfpqnFrav8jq7XsImlkQWlRyRHITSoQlPjOMrV1?=
 =?us-ascii?Q?W+BRYvrADNm+RhqpyCR/mw+HNgbSpkVsKDZRamV1N5Z/MmWfLXjpqbfVs4OZ?=
 =?us-ascii?Q?3HCl6A7JAxiB8TsDWje3qioz5RV2aj/upJqcttvliCp7MAYFmdZSslSlUCLO?=
 =?us-ascii?Q?CnXseWt+QRO28GNWS7MCehh1KGBnt2kcE7+r2390/wskF9q7UEbWpvJZyTpf?=
 =?us-ascii?Q?U9NGrxrOXsMtdLb3rwDPwG3tTb/U/uwCnjzCOoF/lHbZXRvp6ztMaqTdy4t/?=
 =?us-ascii?Q?gggN3hnYfoQr7e/PQa6IWaC2k5CkEQl21XLZFCJVnQ0KXMaSi8TJvTWoHIO9?=
 =?us-ascii?Q?maOKRrHQkbtNi/3xkTc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fb7773-bead-4b22-f476-08de0a8be303
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:08:26.0609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7v5WHQ3/L1qzj28fqmO2M+aXLNGVUDGhDHNc/mJx0eUJB6Uj2iu460CC+s3XN6lpTgKTvRBGG5NcCdagMQNYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9758

On Sat, Oct 11, 2025 at 06:51:42PM +0200, Marek Vasut wrote:
> Document NXP i.MX95 pixel link bridge support.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../display/bridge/fsl,imx95-pixel-link.yaml  | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-link.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-link.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-link.yaml
> new file mode 100644
> index 0000000000000..b37888adfa45e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-pixel-link.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx95-pixel-link.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX95 Display Pixel Link
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +
> +description: |

use >

> +  The Freescale i.MX95 Display Pixel Link (DPL) forms a standard
> +  asynchronous linkage between pixel sources (display controller
> +  or camera module) and pixel consumers(imaging or displays).
> +  It consists of two distinct functions, a pixel transfer function
> +  and a control interface. Multiple pixel channels can exist per one
> +  control channel. This binding documentation is only for pixel links
> +  whose pixel sources are display controllers.
> +
> +  The i.MX95 Display Pixel Link is accessed via syscon.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-dc-pixel-link
> +
> +  fsl,dc-stream-id:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: |

Needn't |

why need this id

> +      u8 value representing the display controller stream index that the pixel
> +      link connects to.
> +    enum: [0, 1]
> +
> +  fsl,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle which points to Control and Status Registers (CSR) module.

Why not use stardard interface, like reset, clock, phy ...

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port

video-interfaces.yaml?

> +        description: The pixel link input port node from upstream video source.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The pixel link output port node to downstream bridge.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - fsl,dc-stream-id
> +  - fsl,syscon
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dc0-pixel-link0 {
> +        compatible = "fsl,imx95-dc-pixel-link";
> +        fsl,dc-stream-id = /bits/ 8 <0>;
> +        fsl,syscon = <&dispmix_csr>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            /* from DC 0 pixel interleaver channel0 */
> +            port@0 {
> +                reg = <0>;
> +
> +                dc0_pixel_link0_dc0_pixel_interleaver_ch0: endpoint {
> +                    remote-endpoint = <&dc0_pixel_interleaver_ch0_dc0_pixel_link0>;
> +                };
> +            };
> +
> +            /* to MIPI/LVDS combo subsystems */
> +            port@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +
> +                dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {

Needn't label dc0_pixel_link0_mipi_lvds_0_pxl2dpi

> +                    reg = <0>;
> +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
> +                };
> +
> +                dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
> +                    reg = <1>;
> +                    remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
> +                };
> +            };
> +        };
> +    };
> --
> 2.51.0
>
