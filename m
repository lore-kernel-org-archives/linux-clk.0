Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FAE1A2C0B;
	Tue, 24 Feb 2026 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946159; cv=fail; b=G2rtWt+rhY5h9uJmJ0v2TPQ6gD9xGKfdoYxImD1heQgfAmy7oxKc7evtJCU+CTm7L9wZtutF0hMkff4lzYj/WH8frUWREknRsILqTX00LTV7NQwteMtYfFLmranwVssXU/7Wojp+F2LZcXhiHVfWk56u4rYON7kQj1Y/qeV9YSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946159; c=relaxed/simple;
	bh=LSVzQ7osQPc5Z01kwrErhnTfqLRFrEZF7+hQZswyplQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u5reILwfjd7kZGczpnPE8PZR8fODRxlhlARfVwtWjIRk+CjYfAkd8Ot46fCxSmbJyZfM9Zw401dxOLPelAHlE8oT0Dmy6Qinq4AkyMypMHspsMOqJ/rf8izjO8e6tWZ0IXe8FpSqXgDmt0M1rj6KNmGiLuBpECTp1gRpaRJrkj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fvTqCCrK; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fvTqCCrK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBBJJfuTVhslk1cCMifXXaR3i6PuobFzdgqdWLP+jyFdxwlJoZxyO36TwWtW4Qlyl59uExxRVMO4Gi+/r6r17ME5p9hnSrfSkKAd09UJr30Bek6s9FKqdfJZWcAUE8I+otIyvSQwwIMULY4e58haw4bU51/Bl7o8yAYzq+f49guYj45A8Yw7sHVcVXJ0eAXx/XocAFd5ZCd3zYbYDcWMyOGDrJw1Yjx972+MJ6Vi9+SF2nue2LFWRxKZMb70tGqhnq1sWXhbrDLJoGJoX6ThjO4oRqWbdRSchBOFIxYqPpddnCRyuCvEkyHsBxSQNj8wHVEqkbwnBlI0ASpAcl8Ayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkxWiApaUdejSgyPWQRPTTZ4pxfmImMWJtctMxSrLXI=;
 b=oHwShq6YRE8YrXnaMiCpvUwVgBUtgOJOrcBI+z1koHGDYKcCRXfYQanjnTBMkLNAS7+GkjEYdGW1Am1sRVesZe2ef0Gf8ntaqUsuur4Y4yNF2GL2e5oJT4U05MsaqvMK9SGvdG6aVuw8OTX4Yrvv+UZiP8fDEDxQxBZE/7DxaHTbtSMEhwJSbDxcDorfIFFck7VK1xuDaGa66gq3kZfAXwt6Iu2P3JWOnsZjeZIwVrZYfvkK7QwFxIQAZCpNLKzzB2y70r+sRldXAeR31LHmeb0P903gvsm4XMBSnZbUZTvuXoJj80OL5PwEH7NiZaKdG8MRm9qjbly0I/IOGNiBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkxWiApaUdejSgyPWQRPTTZ4pxfmImMWJtctMxSrLXI=;
 b=fvTqCCrKwU5MjQC5f/u0CWg9Nei41NX368wc6A8OW5bB5ayk+mDyR1b223dzSEfIz6y+6Jk2Jn7/m+OscMW5vl+iw+pPYYbr+xdUmsVSP5DnOlapJUGBb1M94DpEMJr7IHsm3knXEYoF+8tgv4dyvZqjnVuW6+74lQ7+MlRJJbG8H6mE26W88y+JsdTU/iPW96kUtmYrgP0neliDwUA4s5xBMpyTTgs5oK6ktyXd0/zyMXvcLFsSorT95d44rRg5385/Q5+O4LXBvjarewS+xoNHOjYon7MaZKJ5u8Ue1Ol5tVGkYAl5+a+iLbE643oJvL6xl135vC93KOwqNE8AAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:15:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 15:15:54 +0000
Date: Tue, 24 Feb 2026 10:15:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, andrej.picej@norik.com,
	primoz.fiser@norik.com, c.hemp@phytec.de,
	s.mueller-klieser@phytec.de, n.wesp@phytec.de, c.stoidner@phytec.de,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx93-phyboard-segin: Add peb-av-02
 overlay
Message-ID: <aZ3AnxbjO8YDTPP7@lizhi-Precision-Tower-5810>
References: <20260113-v6-18-topic-imx93-phyboard-segin-av-02-display-v3-1-fcbb85b0fbe5@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-v6-18-topic-imx93-phyboard-segin-av-02-display-v3-1-fcbb85b0fbe5@pengutronix.de>
X-ClientProxiedBy: PH8PR22CA0006.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB12019:EE_
X-MS-Office365-Filtering-Correlation-Id: a46d4211-6ae2-4d74-dff4-08de73b79a27
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?RhOtjvUVT+sTmnfapdiWKh4eQ5SXkWVPY2iXbu9447I4uzENahfUR6FvcsrS?=
 =?us-ascii?Q?hrs/XOr1iDDskd4G12uggwxaqjJkBAGV04ObjnSMeN3e1+QiWGEzaZFHpKEX?=
 =?us-ascii?Q?iITUFFlQDekb01YMqtke8008SBCGCEPSM9xFyFgcvz/pogZv+sDvML0HQMNq?=
 =?us-ascii?Q?I+ecind6R3beDlIBRdUy51jbVRAFGAQR9W0wV47ewSVDy/0jim4B9wVCk3X8?=
 =?us-ascii?Q?zr8hwZPjQDJu6+3Q4hnyH96yHVlJTyf3SEPCIXPv/MNfSKZcirRcJOmNYn0s?=
 =?us-ascii?Q?YDUypU+jMbrkn9T/57tpUwj2Yfo8aUzSRM/wGp8SL3WUeEZY+RLiboQwrNoi?=
 =?us-ascii?Q?H0KaazfYgalSvOjmEWRxQ+oAZ/KhU7m9sjE3KvpuYZvOXJkX8hMGeD+SOYhr?=
 =?us-ascii?Q?0sqJx6kOermAWGopaSVXAH+Di6zFRtDMBxl/FuvO6ycB7K7LM2nWtwlzH1hQ?=
 =?us-ascii?Q?qDVqRrCS65Q+rnxWZg2PqbzaPhRt481VU6j7Eee4qYlszOzRJxgnMUxET79I?=
 =?us-ascii?Q?OcJKyQn22wTm+CpPeThT9SDvzk6uYpzbQKEwjU64Bu/aX+djR8idFUkU2NSA?=
 =?us-ascii?Q?HaRaiaIXdQsOT/GGquIDEfIjR6Ekvo8hxNgfKG28tT/mJVFaMRGFtFox1LlW?=
 =?us-ascii?Q?YmsiRJe1yzti2QXodHgMIL5eJjpatQOHohJvq30OmP3F56U4yiRHDGQ5+Bds?=
 =?us-ascii?Q?NjD6gETz/Vi3xtrbHuDE+QB6gjTndNkTUija4bt+Y4XocRyMLt8LYjVeiIRp?=
 =?us-ascii?Q?y3nYcVG88Ehwv+Q1o2KjGyx1aNo0Acin6PD1VTZxRBVXiADIdx2rl/O5GH8i?=
 =?us-ascii?Q?KRRukeNg0cKM63Fu0uHqemQREHfm9ycaav/FjiUWmqaXselst4p6scTaLtkn?=
 =?us-ascii?Q?P0x2twMMlPYTDYzZ4ev1NW5ss0poopuob9Ca8kUkURpMn1nRScgqKMRrGgr7?=
 =?us-ascii?Q?eM+lvApligj6ItoVZacCDWhDJ5sfDde/dBj8Wt+g0qZBf+yQen7XaAILjMe5?=
 =?us-ascii?Q?DIfXU/4NXqJlRvtRYmunN85HHePinEe+9VyqqhJR6+xg8nPqJBt8OkrxHvu+?=
 =?us-ascii?Q?wF/G4UAlit7Bk2PC9NjUwa3a59Fpg8GcLPw9uEWsdlWkbeb7EAUwRiOqwsut?=
 =?us-ascii?Q?iFz6/Ql7oY/uUkMzpT6SkOACRqAsknFVwQ0LmMEBamj7QtNmeNja6rfOfpww?=
 =?us-ascii?Q?IYOys1GMwJOU7J1BnVIZTeu8Twc98Os76fJjvTFIgsIhnUyhvv8E7dblPo0O?=
 =?us-ascii?Q?m5qI/C6Y5RqtI3a83ZuFnNBKoWaN1BQ0m1jjy2eJtzU3AjUvYJVvMnRCX4jQ?=
 =?us-ascii?Q?MPCrEDe1x6RPQRVPT10rtW3ywfiSvFqQ5QwgTH1JulglPffHYhaJdI12vXex?=
 =?us-ascii?Q?QGF9U+GmzVg9SlJiTruX8n0qkQRYrpGqqQiDyA9bpj8fzXFajrhRj1eEsquN?=
 =?us-ascii?Q?yYEVQ5/v8vX6Gd6Qz4UQuuMH1519E/AMKsyUlrYjg0uqDQ1eeCRF9pM3DC0M?=
 =?us-ascii?Q?U/A3CH1qc0yOoh5Hr9z2hdfvHIplLiYpieFvzj6+jY1/B+JW0nD9eg8KwENJ?=
 =?us-ascii?Q?e4Pz4R/I7Q6PT+30Q85X+7WeOstBBmbvYBvbf7ZGAkICWdQQRGEyGakw+nwF?=
 =?us-ascii?Q?4GXhrWe2rASbs26z8Z7SYWY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?JGboF6zuSqFuzSi+beNG+JTrGGAoYb0KXNdwbn3lGfSO6LVAbHbUdq8Jx2vm?=
 =?us-ascii?Q?JEy8R0mYvP8Pu/sAl6b61p0D2Y6xDDwOS0ZSVDCaX2An2gFr89AOzAulZ49n?=
 =?us-ascii?Q?H3FAOrsb/7hU2NAVh245wGcIMGoUQPOFxc8ICdUqm/9dPpfQO4sPgPdKaDag?=
 =?us-ascii?Q?vHGtx4MnBZGXzVo0+cloVDgnaR8leVOF23F57hpCjWRDRtWSfJoO0ReHZKj4?=
 =?us-ascii?Q?AQtb0YhNQ6684Ptm4Dpm8h53TunG3LuxOl8wLpug9KEPGKDnEw3XH8vqdmdB?=
 =?us-ascii?Q?SFlB+aPnZeMVVj0Hv4xlhjHUG/jFAR/X6wcH0x2vI/K3n4/i7yXmp/iUEzED?=
 =?us-ascii?Q?Cu5riWCRiKJkyJR6Ijxh3W5CVAODk0H01IUUzvk2vfKsEJZOdSMG/OH7IhbF?=
 =?us-ascii?Q?/Ootemzxdil1EBaHgXlzkIutq5T44CdcFIbL0ADsN3qL0pDkmH60bStKlFsP?=
 =?us-ascii?Q?5ertRk74/fGPV2MC0f77j4jcsWla6iZ/n4VlWZcrmBw78QC4i8U34yMzEW1k?=
 =?us-ascii?Q?fnzEi5uiiWxKUTxnNntKZf+LXErjTwRdkdg50qKp788WFmHx5zC27KwJTixr?=
 =?us-ascii?Q?UkQ0zYdrnFumd0ZKUI/kZprpyft84yWyudiEzJP6GOS0fi0vlsVkXbmJVvX/?=
 =?us-ascii?Q?JJ2IApKTHeQacFcgFl6/pYfkB4M21anl7TnTKK3UoBN2Vf1kQKC0T4E6LQDS?=
 =?us-ascii?Q?KCyy0lAtFGtLw5TTB8J1VgJMZtO+9o8aWO2h/isySUqbUDOhDoZ2Vf0gHruR?=
 =?us-ascii?Q?MxdkHGexyjGuMBPfl38/aABjq8JcByEFlfptmBo8T6YZ7OA5/ZXpBEktba7k?=
 =?us-ascii?Q?LMHixfxZ9HMlMMs1eeUaTImQ2tAy8X9aBcTk/WSkk9Sv4XtHtR/UbvxnabQJ?=
 =?us-ascii?Q?LrFzVKGKE5XijvD/KtDjKSqP8gDPHi7DBG3xyhbaK9rarCCl3KZk/WpipM3I?=
 =?us-ascii?Q?0GfxqM9UbdQWvAek1/hpVbVOBpbDKPpFaabm/44oQgjDOuiTi78zN5PWq7Fx?=
 =?us-ascii?Q?Vp4anCW1OhB+XhGSfdT+WhtS1YCTuku3q4a0US05v1sBn+llWJyq3Ysc69N2?=
 =?us-ascii?Q?51oICw9TaM9xXtEVPpOJcMjmMItBLXWc/1fr2iwnVobi5tJydPodX5u+Iphf?=
 =?us-ascii?Q?aYf0TWHM6jByEPZWEE9afqrfplixinuHGdPEy6T+KsUB3CzemErfis27/OQ/?=
 =?us-ascii?Q?ZIQ1cqN9yi9saJNO+AynaWycoIZ0PPH2Rp2/PCXJZJn3do6J9rgJkhjzdYlx?=
 =?us-ascii?Q?RdolDzlsibYgpB09O1uVyTioPMWuDvedRm0ySJPrtUtejZwDsfRXVudZm8b3?=
 =?us-ascii?Q?uUCqDwqoOEn2r2neqm4SfPAQtQUyoczl4EsH3QYmAhQeQG6sSOjJonkZHp9t?=
 =?us-ascii?Q?7FSKAx4ej8epEp0M/TjLlU07nQvdGqqJFqUn7vsi83kDFESCtuyHlMG9K/2k?=
 =?us-ascii?Q?MohVamboicGX5+EYfOXxcDgGF1I+fMEF8ozPyTw40PfXb5oRuBpToHoRMFBw?=
 =?us-ascii?Q?0a58ZQp1dGKL6gKCSBMs1nyXEtnVXgx1RVct9FhEi9b9PhKIQOYyt5Ns8oFO?=
 =?us-ascii?Q?jMMDAvSHDjyJnoZ2dN2veTl//z5qLs+q671uNv3sMn73ta0yghb9B78lFtO2?=
 =?us-ascii?Q?FI8yh8UtLHVwhbW94We/Gl5x4I5LQBC8SSEL99QQzVDO6Zl2yR/WhxPyqSOU?=
 =?us-ascii?Q?9F3ouKZ9uQSXWxwkyQ7EaR4D1S9Ckqskq1zwWdwxoKOctMr9nirYXHGIPtLS?=
 =?us-ascii?Q?ouR8so2kZQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a46d4211-6ae2-4d74-dff4-08de73b79a27
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:15:54.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2ktYngtKwRJIjtKVQXKjAlQLL398bx6oPqTGqrj2gHD4GtXr41V8rqmQYJ/1bC7T08JKYivEfYGmJTImRKRtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019

On Tue, Jan 13, 2026 at 08:06:08PM +0100, Marco Felsch wrote:
> From: Andrej Picej <andrej.picej@norik.com>
>
> Add overlay for Audio-Video module PEB-AV-02. Add support for panel
> display, capacitive touchscreen and backlight.
>
> The pwm-backlight uses the GPIO based PWM implementation for now. Switch
> to the FlexIO PWM support once available.
>
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> [rework commit message, use local regulator, remove compatible]
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> [m.felsch@pengutronix.de: cleanup downstream commit]
> Tested-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Hi,
>
> this small series add the support for the phyBOARD-Segin DisplayKit
> AV-02 evaluation kit. This patchset depends on the following patchsets:
>
>  - https://lore.kernel.org/linux-arm-kernel/20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de/
>  - https://lore.kernel.org/linux-arm-kernel/20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de/
>  - https://lore.kernel.org/all/20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de/
>
> My test setup was:
> - phyCORE-i.MX93 +
> - phyBOARD-Segin +
> - DisplayKit
>
> and I used 'modeset -r' to validate the display output.
>
> Regards,
>  Marco
> ---
> Changes in v3:
> - Link to v2: https://lore.kernel.org/r/20260113-v6-18-topic-imx93-phyboard-segin-av-02-display-v2-1-39399e4d691d@pengutronix.de
> - adapt commit message accordingly
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/r/20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de
> - Add tested-by and r-b (Primoz)
> - Rebase to v6.19-rc1 (Primoz)
> - Rename power supply name (Primoz)
> - add vcc/iovcc-supply (Primoz)
> - add wakeup-source (Primoz)
> - add pwm-backlight and gpio-pwm
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../freescale/imx93-phyboard-segin-peb-av-02.dtso  | 146 +++++++++++++++++++++
>  2 files changed, 148 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..a850cf5d8c0298c1bcfbff0fe857c39745ac7a6c 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -384,12 +384,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>  imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
>  imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
> +imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
>  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
>  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
>  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb

I get build error

Failed to apply 'arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtbo': FDT_ERR_NOTFOUND

Frank

> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..af330756abfd127f2dd0a7e54c2e141300462889
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtso
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + * Copyright (C) 2025 Pengutronix
> + *
> + * Author: Andrej Picej <andrej.picej@norik.com>
> + * Author: Marco Felsch <kernel@pengutronix.de>
> + */
> +
> +#include <dt-bindings/clock/imx93-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "imx93-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <5>;
> +		power-supply = <&reg_vcc_3v3_con>;
> +		pwms = <&pwm7 0 5000000 0>;
> +	};
> +
> +	panel {
> +		compatible = "edt,etm0700g0edh6";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_panel>;
> +
> +		backlight = <&backlight>;
> +		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&reg_vcc_3v3_con>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dpi_to_panel>;
> +			};
> +		};
> +	};
> +
> +	/* TODO: Convert to FlexIO PWM once supported */
> +	pwm7: pwm-7 {
> +		compatible = "pwm-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pwm7>;
> +		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +		#pwm-cells = <3>;
> +	};
> +
> +	reg_vcc_3v3_con: regulator-vcc-3v3-con {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC3V3_CON";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +	};
> +};
> +
> +&dpi_bridge {
> +	status = "okay";
> +};
> +
> +&dpi_to_panel {
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +&lcdif {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lcdif>;
> +	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>;
> +	assigned-clock-rates = <332600000>;
> +	status = "okay";
> +};
> +
> +&lpi2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5406";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touchscreen>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&reg_vcc_3v3_con>;
> +		iovcc-supply = <&reg_vcc_3v3_con>;
> +		touchscreen-size-x = <1792>;
> +		touchscreen-size-y = <1024>;
> +		wakeup-source;
> +	};
> +};
> +
> +&media_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_lcdif: lcdifgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x50e
> +			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x50e
> +			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x50e
> +			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x50e
> +			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x50e
> +			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x50e
> +			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x50e
> +			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x50e
> +			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x50e
> +			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x51e
> +			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x50e
> +			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x50e
> +			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x50e
> +			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x50e
> +			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x50e
> +			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x50e
> +			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x506
> +			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x506
> +			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x506
> +			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x506
> +			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x506
> +			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x506
> +		>;
> +	};
> +
> +	pinctrl_panel: panelgrp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_pwm7: pwm7grp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_touchscreen: touchscreengrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x11e
> +			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
> +		>;
> +	};
> +};
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-c1687aa1ccf4
>
> Best regards,
> --
> Marco Felsch <m.felsch@pengutronix.de>
>
