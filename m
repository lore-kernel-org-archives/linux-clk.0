Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2088.outbound.protection.outlook.com [40.107.105.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DAA8F6C;
	Mon, 30 Dec 2024 00:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735518790; cv=fail; b=gLcbRv9skKNCEc8oUfQS2Mb4OfCBJyxi/E4KW6+ZfToF7gU4ROv93Uarfjysk/e/g0YGt6zXMIdXNogyf8C9/Nyuf9thDL+ghaI24SWZ9BAjY6p0hLT/gcOYd/5KMWSdacecvlgJw1SlCaYm4YVMjnToQZxIuc3jgVJw6M3ZFek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735518790; c=relaxed/simple;
	bh=ujvQzu64wWmtXrgY+zGeXZMlwXWJYcbiJ7C6TkS3szM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jxkep2bwDQJYVKd9Ecu6DG++bPweziIWwMmsrE2IgrN6xvX8wVQ7caAb/UvEUHMIHHaypAyJJDPvaWKG+i4OOuEP2pVs8HjDdIUo21HsAwgbEEKklXRSC+pW59/T5+4i6VGOSsa2pg47naZvAqZG+dGzsEnTu+RzkmmDa6XQaw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KakzPVlI; arc=fail smtp.client-ip=40.107.105.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KakzPVlI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYdsY3jTlKbG2dAIyzjundslNhgj0xhu2wUl9Qz5sQZZq73sgWUySsrHknkZZNoiZyIepemx3SR4fPpkXlG/o386cOfWXjBNYWTaJZDWqUwFRmsFjAlwfmNezCwD3UQyY1m+xxnFTswqIQTfoCVMuTzIOITYv+TOqegN3OINtGqtG97iK+Siss0Nz0JrukWV8jp8JpnpReE+NjedGwYZQH+F1AETog8dTgw2NclT9pBh7YaGirvTKyXRlSk8wCMNCTRBqC7q9T9GP7oDFXO0tisKpkhOiY4235phDlWiINltttt7epPHr8bgOc+RprSM9eITlXha6tqJ3gPzv5IUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujvQzu64wWmtXrgY+zGeXZMlwXWJYcbiJ7C6TkS3szM=;
 b=t86uSEcarBF3ma3ldKzCuTzTYm7NVYqY92JNIY6wSirBtwzjRs7UcSDxFBYkemGCNp60dK26lqY/mFVB3tVSQlF5+QgvJeR/mQVu/9zQmFZjRC+3HE13rFuw9BhlSFQqSlGCCzJJpn5UsfLylXT0hUljP7M9dkF4Cn5zETJevCyBJ8gLonSyskxku2p+WIU32U2CMZwChCOtXihaxwd7ZQ+B5/QyZ1iJrOLgbBCtE5S/9EAt5QfozkRuYS2Mh7tbxXfzBnls7xy3py3dS/zc6JOVeu7bzkd/9OEAqfqXTGngakGMAPsv/jf4e2spMdWHDqmTfxRRMRTKGNaDDaJP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujvQzu64wWmtXrgY+zGeXZMlwXWJYcbiJ7C6TkS3szM=;
 b=KakzPVlICd0w+tqaMWR7OCLj1zIIxCU7nYPQND+IW3Bb0dHVGkC7SktZy8fUw95AwcG1GqbzJIg3+EoIcXOwnncQ6fevjXPrfaQM1E7IzaO4InTbwvaq71PRQViP1QyvG2Lto3rl6svPKPOaC61QIYpIhzeBS5bVfJc3UpmuUoNF2uJBTyCzWw6uzLONTJxzr+HJFchvFM6vwiuXViMx/51e7TXZAPRktRYHxYxUjYreI3BaLO+GiqFif5GB019lO6uUq5TKv+kssUMj4+RdLm5jflIsPAeMojmV81Yh92zu3kiagbZn42Dv484B9DQkvR4MDCreUrNrmHDfjyh9uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8823.eurprd04.prod.outlook.com (2603:10a6:10:2e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 00:33:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 00:33:01 +0000
Date: Mon, 30 Dec 2024 09:38:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] clk: imx8mp: inform CCF of maximum frequency of
 clocks
Message-ID: <20241230013848.GD28662@localhost.localdomain>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241219-imx8m-clk-v1-6-cfaffa087da6@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-imx8m-clk-v1-6-cfaffa087da6@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db30736-bed6-4910-358f-08dd28698446
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JqWyg/p0porxVVkHXVMHzlzVyRHGwJUJUBSyI2TxIN8eAKlDzvgkizar/yiz?=
 =?us-ascii?Q?l8890QHgSLYcJIzFBuyjTLIH1YyeqljOq5v/U/igTMnRu3e6opjSgWbYYbll?=
 =?us-ascii?Q?/2VZDGEPaNQsxCWGBV4ja/VrZa0PquMXJuE/myx3xs18e/wX2+U9HTDpUSIt?=
 =?us-ascii?Q?gEx245T3JP2h+JfG2cng/txMwPmieqdyUTmZ9C0QzQ8dAgY+RTuzb6EW5kJf?=
 =?us-ascii?Q?OtSX7YpLotNmHWbrvufnTzJX7JEMOK0OPARE5wxXkZhfAxhGB9WjspRsz2qg?=
 =?us-ascii?Q?ueVLv9YkzPsAvgdsCVz4dPyeBuestpxNCTG0/E+vDmS3Gtf/jnPl7/N8jyr+?=
 =?us-ascii?Q?sJIqaTfviXsAZBqRtebSa/h3mVHO4dd3Gk8cPFSPSIQl2fvR4VriuwXmZkjl?=
 =?us-ascii?Q?S/1Ye8cFRJSna4iowqflKlGRygQk8V4HLGJNvdbKgqZeCoxMV6qoxzlXhmKO?=
 =?us-ascii?Q?wiHB2OGNZnGNtUsYzBUN8Y6EqPYwJx4hRS/8Kws8mnd2ZaN2/Nf9GCHWQuNg?=
 =?us-ascii?Q?exqxT0X9IVZxEMS6yDOTVpovd+gt6vJ2wGWCpDT+TrmprR2fjuZFMTGJ1bI+?=
 =?us-ascii?Q?Qw9R3WGDQaVem9qkwWvtUj5lR+xrZUs29IzoDvyXWy0rh6IVQIqnDaoERdKQ?=
 =?us-ascii?Q?AYxGwwQVimw5tpq7NJT5CznPicVdwaKsIFbXmL0UoYZEDkQWrmChO3MRgVVI?=
 =?us-ascii?Q?kQ2gK3P+90DFt+aGSJ948Mf//P7jbXHvdg7E+VXS2DIbp8xq78RIYuk/iNrG?=
 =?us-ascii?Q?lzYNVbT2UMZqdivVRQCG5OvTVkUhjMP83DC+zx/ZmGvC9wFLGNe1Ch0Ur29u?=
 =?us-ascii?Q?QQUkMqU9U/k1dYeSA1ay/d49vEbnxHGJPb3pvKH9ANX5XtrU/UrLwNPB0sdT?=
 =?us-ascii?Q?/3Q83ZZl/QviIs/QZTUgAKAe2kMRoDu2HKwItOUob1QEkIodV2kBHKlSIfNM?=
 =?us-ascii?Q?NV1pBUclxEmMgRrpmMSWZ6M7kSG4EtNSjb/Tq9m414XOyc4NbnOCmw8GQ4YN?=
 =?us-ascii?Q?CAu9OjggHRYzbJBlWl0Mvx5FKUfGo3F14tG8GwFT8k0daiaUKO7/tz3QxVYv?=
 =?us-ascii?Q?LJFwDfxB3dXQeI1ks5fQxk06fEzu6cVfrmk3X3W290QtLBomvBKeytbqsQrM?=
 =?us-ascii?Q?Wio79UXGkyBLt2LT29b3gxRdKy9FF1cWbqhV/7svloUbnpyGkZfMNHHY2fGa?=
 =?us-ascii?Q?olYXv4nBkSsAs8/9LzBKpTDCP9J3vRGMsopWVFij4RayRfb32Gc7psQBENCa?=
 =?us-ascii?Q?9PnCWKEX8Jp06cjwDXsxnZwXKMXrc+tbcBd4icdXxFolhQg8wYecZ5CRYE4v?=
 =?us-ascii?Q?/5xWQ2tdGzzLFsqJJceGqfHJ9cPlyBp/J7oXF8GF5WTvUU/vjTaV7Z5bimjL?=
 =?us-ascii?Q?o2k77SrlXNTrHdYYdYRymigT0tDD5zkhH/ph/uxzlkM86LxwZDm1pqWgiZkA?=
 =?us-ascii?Q?jwjZXUU3mQuB4w4Qyy2Il/JeNNtZoHH2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WopiLneGr/o3aZI2MepY46wjSWnftvbmoAmwhn2/L4yOkzJsRrvJiCCIXXtg?=
 =?us-ascii?Q?8u6n8BHguyT8tu7ojXZnZ1G30wxwEluKIH+maGl39WwzAMh7Kre7WPgD2wwn?=
 =?us-ascii?Q?JkxK2Q5ZGJYvaC/hHXU0VdiOvr92tyonmEUPi9ZLn3/Mexvzq3FBxuU4NUZC?=
 =?us-ascii?Q?9XpzfUFd5fQgyeNIIY/7+rmI8L2VJ6wHITWnbEg+5oosnMMUtgmQu17MLepU?=
 =?us-ascii?Q?BM0Wv5oSm0Qws7bHnGX7dVRCfpfDo2nOl3KdjrzJY3PfGx1mqBOBdJHMJFnZ?=
 =?us-ascii?Q?rzq2FVvV6EbF339Y0p0an1+0sZHoNVUZWOMuwaStYmnU03zd2ko9o4dvP409?=
 =?us-ascii?Q?yE1ky4K+NyLmBVUYJslH+YBJtFJ8xrjWdmCKmcBCtuTP6HoUqUNfWOd+uooc?=
 =?us-ascii?Q?uiSlZw6e1QDvU6yuKwh+uJz157QEmZA9zliAaot/CqOeYE82inQHRYsj7MTO?=
 =?us-ascii?Q?cAWll16m2cKgxY2rosgp+NhYb95hZEMvxkG8wz86fG+3w+TYjeuTmwBvXtnD?=
 =?us-ascii?Q?102OIdYoc4k36y2Bb+rpRVzN5kvvW9kGS0xpD4PXCynj8WedszsjlOf5Zfzb?=
 =?us-ascii?Q?fkVbqqoYRFqnZSeX6h6naw0zF6Lyq2b9rGG0L98h3PbUf+YLSm95JFhsdOBA?=
 =?us-ascii?Q?AF0Mx4ZMNUk9La+EqxyPdMxaj6o/6p1f01k6S6Kbn5VjdOEAd7v2BQ3/nbv+?=
 =?us-ascii?Q?75Ir40HDd63JWeFkoEzOZPTGUPIm2oqqAGMkxw36D+SrSK9F9VJcBFMNYDNY?=
 =?us-ascii?Q?5wMYT/gn+RHGbBY2yQM5g/KMQYFkDDAWLmXBKGzd4NlZJ+tNyQt9cu1mM4Hj?=
 =?us-ascii?Q?pFjpfLMZgjQmhWkMiSmqYm7THXSaM8ETVU8ZoXUh0G2whE6ssl4GeW/oc3Yt?=
 =?us-ascii?Q?5ByaS8hRlV2CYYqau+EC+ZiF0l/j784jfBAGrkJkfTUkphyIVwk3xbIsgPPX?=
 =?us-ascii?Q?bCFPdtgViBhyqWKiITjRKD+btHEe7PgSHWjaR8iy2gWV61cFuOwM0gLZJrJ/?=
 =?us-ascii?Q?7RFUs/U2fZKizIx1c+yZDdSvEMHwfCSYz8PMm0rmCm9tO0lqZWc0TuNHEjJG?=
 =?us-ascii?Q?auMunpF6O3ZchsgUb0F/vJNkueJiCQSjHEFvBeydnP9YquJJ3hMMNr2Zvuq4?=
 =?us-ascii?Q?Pa8X7TydIgtouz8nud2OSgibaCYsVzwU30Ed5bwwFeEDWmB1OCblv1c8PXRA?=
 =?us-ascii?Q?AhVKvn7MTABTGHql9D+ovQuxpqRiEbfvVBaW1bG/Q71d1PtBh/Wjyb4y39KI?=
 =?us-ascii?Q?6P1Yawyb3Cuu/4aTyFC0ZiN6RdVmKjS3LU6pYx+ctsMi24nsdpkvMlFe4kKh?=
 =?us-ascii?Q?LnAMo4PdkhonMqgcX22eSVfZowaj7mj+Ztn6smG0yD0IDgO5NmfP6IKQdmvZ?=
 =?us-ascii?Q?vXp/bUs268ads9xUij/TdtDL3t+akQ7qLXrW9a4pXKwd+EVgob+1437BORuY?=
 =?us-ascii?Q?HUqZ0RXCVRPTgtj+Nv3FPO/7Ut71AHFnIS4PR7yR7Lp505lYpxlY0nos3KQQ?=
 =?us-ascii?Q?TZACjVdf4OEeOJ29+6tN0BnbyatFQGyAAlK63CpvKjV9LG/dVkX26OfVbWgY?=
 =?us-ascii?Q?vOMbWeVaT1jxHXMpGhYsmWp38FyIahjujjXTlyO9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db30736-bed6-4910-358f-08dd28698446
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 00:33:01.4192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6NVPxbo+3fIEb0ZqfIF8y64U+jpfLwu6wjphXlaRpy1vQy2mo000Qb8x/z0YWQDU/DWozyZvlDZ+OTgvZpbpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8823

On Thu, Dec 19, 2024 at 08:27:37AM +0100, Ahmad Fatoum wrote:
>The IMX8MPCEC datasheet lists maximum frequencies allowed for different
>modules. Some of these limits are universal, but some depend on
>whether the SoC is operating in nominal or in overdrive mode.
>
>The imx8mp.dtsi currently assumes overdrive mode and configures some
>clocks in accordance with this. Boards wishing to make use of nominal
>mode will need to override some of the clock rates manually.
>
>As operating the clocks outside of their allowed range can lead to
>difficult to debug issues, it makes sense to register the maximum rates
>allowed in the driver, so the CCF can take them into account.
>
>Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
